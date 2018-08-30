package com.example.controller;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.lettuce.RedisCli;
import com.example.mapper.UserMapper;
import com.example.model.User;

@Controller
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserMapper userMapper;
	
	@PostMapping(value="shop/doLogin", produces="text/html;charset=UTF-8;")
	public String doLogin(@RequestParam String username,@RequestParam String password,
			HttpSession session) throws Exception{
		List<User> list=ReadFromRedis();
		User us=new User();
		for(int i=0;i<list.size();i++){
			if(username.equals(list.get(i).getName()) && password.equals(list.get(i).getPassword())){
				us=list.get(i);
				break;
			}if(i == list.size()-1){
				us=userMapper.getOneUser(username, password);
			}
		}
		String logintips="";
		String shopurl="<br/><a href='/shop/admin/index'>点此进入后台管理系统</a>";
		String adminurl="<br/><a href='index'>点此进入运动鞋商城</a>";
		if(username == ""){
			logintips="用户名不能为空!";
		}else if(password == ""){
			logintips="密码不能为空!";
		}
		if(username != "" && password != "" && us != null){
			if(us.getLevel() == 0 && us.getId() != 0){
				session.setAttribute("username", username);
				return "redirect:/shop/index";
			}else if(us.getLevel() == 1){
				session.setAttribute("username", username);
				logintips="欢迎管理员"+username+"登录系统"+shopurl+adminurl;
			}
		}else{
			logintips="登录失败，用户名与密码不匹配!";
		}
		session.setAttribute("logintips", logintips);
		return "signup";	
	}
	
	@GetMapping(value="shop/users")
	public List<User> getAllUsers() throws Exception{
		logger.debug("----------runing.........-------------------");
		List<User> users=null;
		users=ReadFromRedis();
		if(users.size()==0){
			logger.debug("----------read from database-------------------");
			users=userMapper.getAllUsers();
			writeToRedis(users);
		}
		return users;
	}
	
	private List<User> ReadFromRedis() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		List<User> users=new ArrayList();
		RedisFuture<List<String>> futureKeys=asyncCommands.keys("user*");
		List<String> keys=futureKeys.get();
		if(keys.size()==0) return users;
		
		for(String key:keys){
			RedisFuture<Map<String,String>> futureMap=asyncCommands.hgetall(key);
			Map<String, String> map = futureMap.get();
			User user=new User();
			user.setId(Integer.valueOf(map.get("id").toString()));
			user.setName(map.get("name"));
			user.setPassword(map.get("password"));
			user.setLevel(Integer.valueOf(map.get("level").toString()));
			user.setPhone(map.get("phone"));
			user.setAddress(map.get("address"));
			users.add(user);
		}
		logger.debug("----------read from redis-------------------");
 		return users;
	}
	
	private void writeToRedis(List<User> users){
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		for(User user:users){
			Map<String,String> map=new HashMap();
			map.put("id", String.valueOf(user.getId()));
			map.put("name", user.getName());
			map.put("password", user.getPassword());
			map.put("level", String.valueOf(user.getLevel()));
			map.put("phone", user.getPhone());
			map.put("address", user.getAddress());
			asyncCommands.hmset("user:"+user.getId(), map);
			System.out.println(user);
		}
		System.out.println("write to redis success.");
	}
	
	
	
	@PostMapping(value="shop/doReg", produces="text/html;charset=UTF-8;")
	public String doReg(@RequestParam String checkpwd,@RequestParam String password,
			@RequestParam String name,@RequestParam String phone,HttpSession session){
		
		List<User> list=userMapper.getAllUsers();
		User user=new User();
		String regtips="";
		if(name == "" || password=="" || checkpwd=="" || phone==""){
			regtips="注册失败，请将信息补充完整再进行注册";
		}else if(name != ""){
			for(int i=0;i<list.size();i++){
				if(list.get(i).getName().equals(name)){
					regtips="该用户名已存在，请重新输入";
					session.setAttribute("regtips", regtips);
					return "register";
				}
			}
			System.out.println(2);
			System.out.println(password==checkpwd);
			if(password==checkpwd || password.equals(checkpwd)){
				user.setName(name);
				user.setPassword(password);
				user.setPhone(phone);
				user.setLevel(0);
				userMapper.insertUser(user);
				list.add(user);
				writeToRedis(list);
				regtips="注册成功！"+"<a href='signup'>点此进行登录</a>";
			}else if(password!=checkpwd){
				regtips="两次密码输入不一致，请重新输入";
			}
		}
		session.setAttribute("regtips", regtips);
		return "register";
	}
	
}
