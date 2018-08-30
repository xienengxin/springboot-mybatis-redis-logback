package com.example.controller;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.lettuce.RedisCli;
import com.example.mapper.OrdersMapper;
import com.example.mapper.ShoesMapper;
import com.example.mapper.UserMapper;
import com.example.model.Orders;
import com.example.model.Shoes;
import com.example.model.User;

@Controller
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	ShoesMapper shoesMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	private List<User> getAllUsers() throws Exception{
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
	
	private void writeUsersToRedis(List<User> users){
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
	
	private List<Orders> getAllOrders() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		List<Orders> orders=new ArrayList();
		RedisFuture<List<String>> futureKeys=asyncCommands.keys("orders*");
		List<String> keys=futureKeys.get();
		if(keys.size() == 0) return orders;
		for(String key:keys){
			RedisFuture<Map<String,String>> futureMap=asyncCommands.hgetall(key);
			Map<String, String> map = futureMap.get();
			Orders order=new Orders();
			order.setId(Integer.valueOf(map.get("id").toString()));
			order.setNum(Integer.valueOf(map.get("num").toString()));
			order.setOrdertime(map.get("ordertime"));
			order.setArrivetime(map.get("arrivetime"));
			order.setPrice(Float.valueOf(map.get("price").toString()));
			order.setShoes_id(Integer.valueOf(map.get("shoes_id").toString()));
			order.setSize(map.get("size").toString());
			order.setState(Integer.valueOf(map.get("state")));
			order.setUser_id(Integer.valueOf(map.get("user_id").toString()));
			orders.add(order);
		}
		logger.debug("----------read from redis-------------------");
		return orders;
	}
	
	private void writeOrdersToRedis(List<Orders> orders){
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		for(Orders order:orders){
			Map<String,String> map=new HashMap();
			map.put("id", String.valueOf(order.getId()));
			map.put("ordertime", order.getOrdertime());
			map.put("arrivetime", order.getArrivetime());
			map.put("size", order.getSize());
			map.put("num", String.valueOf(order.getNum()));
			map.put("price", String.valueOf(order.getPrice()));
			map.put("shoes_id", String.valueOf(order.getShoes_id()));
			map.put("state", String.valueOf(order.getState()));
			map.put("user_id", String.valueOf(order.getUser_id()));
			asyncCommands.hmset("order:"+order.getId(), map);
			System.out.println(order);
		}
		System.out.println("write to redis success.");
	}
	
	private List<Shoes> getAllShoes() throws Exception{
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		List<Shoes> shoes=new ArrayList();
		RedisFuture<List<String>> futureKeys=asyncCommands.keys("shoes*");
		List<String> keys=futureKeys.get();
		if(keys.size() == 0) return shoes;
		for(String key:keys){
			RedisFuture<Map<String,String>> futureMap=asyncCommands.hgetall(key);
			Map<String, String> map = futureMap.get();
			Shoes shoe=new Shoes();
			shoe.setId(Integer.valueOf(map.get("id").toString()));
			shoe.setPic(map.get("pic"));
			shoe.setBrand(map.get("brand"));
			shoe.setDetails(map.get("details"));
			shoe.setPrice(Float.valueOf(map.get("price")));
			shoe.setStock(Integer.valueOf(map.get("stock")));
			shoe.setSubtitle(map.get("subtitle"));
			shoe.setSubtype(map.get("subtype"));
			shoe.setTitle(map.get("title"));
			shoe.setType(map.get("type"));
			shoes.add(shoe);
		}
		logger.debug("----------read from redis-------------------");
		return shoes;
	}
	
	private void writeShoesToRedis(List<Shoes> shoes){
		RedisAsyncCommands<String, String> asyncCommands=RedisCli.connection.async();
		for(Shoes shoe:shoes){
			Map<String,String> map=new HashMap();
			map.put("id",String.valueOf(shoe.getId()));
			map.put("brand", shoe.getBrand());
			map.put("details", shoe.getDetails());
			map.put("pic", shoe.getPic());
			map.put("price", String.valueOf(shoe.getPrice()));
			map.put("stock", String.valueOf(shoe.getStock()));
			map.put("subtitle", shoe.getSubtitle());
			map.put("subtype", shoe.getSubtype());
			map.put("title", shoe.getTitle());
			map.put("type", shoe.getType());
			asyncCommands.hmset("shoe:"+shoe.getId(), map);
			System.out.println(shoe);
		}
		System.out.println("write to redis success.");
	}
	
	@GetMapping(value="/shop/admin/index")
	public String toLogin(HttpSession session,Model model) throws Exception{
		List<Shoes> shoes=getAllShoes();
		List<Orders> orders=getAllOrders();
		List<Shoes> list1=new ArrayList();
		List<Orders> list2=new ArrayList();
		if(session.getAttribute("username")==null){
			session.setAttribute("logintips","请以管理身份登录，再进入后台系统");
			return "redirect:/shop/login";
		}else{
			if(shoes.size()!=0 && orders.size()!=0){
				list1=shoes;
				list2=orders;
			}else{
				list1=shoesMapper.findAllShoes();
				list2=ordersMapper.findAllOrders();
				writeShoesToRedis(list1);
				writeOrdersToRedis(list2);
			}
			model.addAttribute("goods",list1);
			model.addAttribute("orders", list2);
			return "/admin/index";
		}
	}
	
	@GetMapping(value="/shop/admin/login")
	public String Login(){
		return "redirect:/shop/login";
	}
	
	@PostMapping(value="/shop/admin/addGoods")
	public String addGoods(@Valid @ModelAttribute("entity") Shoes entity,
			Model model ) throws Exception{
		List<Shoes> shoes=getAllShoes();
		shoes.add(entity);
		writeShoesToRedis(shoes);
		shoesMapper.insertShoes(entity);
		return "redirect:/shop/admin/index";
	}
	
	@GetMapping(value="/shop/admin/deleteGoods/{id}")
	public String deleteGoods(@PathVariable("id") int id) throws Exception{
		List<Shoes> shoes=getAllShoes();
		shoes.remove(id);
		writeShoesToRedis(shoes);
		shoesMapper.deleteShoes(id);
		return "redirect:/shop/admin/index";
	}
	
	@PostMapping(value="/shop/admin/updateGoods")
	public String updateGoods(@Valid @ModelAttribute("entity") Shoes entity,
			Model model) throws Exception{
		shoesMapper.updateShoes(entity);
		List<Shoes> shoes=getAllShoes();
		shoes.remove(entity.getId());
		shoes.add(entity);
		writeShoesToRedis(shoes);
		return "redirect:/shop/admin/index";
	}
	@GetMapping(value="/shop/admin/deleteOrders/{id}")
	public String deleteOrders(@PathVariable("id") int id) throws Exception{
		ordersMapper.deleteOrders(id);
		List<Orders> orders=getAllOrders();
		orders.remove(id);
		writeOrdersToRedis(orders);
		return "redirect:/shop/admin/index";
	}
	
	@GetMapping(value="/shop/admin/logout")
	public String doLogOut(HttpSession session){
		String username=(String)session.getAttribute("username");
		session.removeAttribute("username");
		return "redirect:/shop/signup";
	}

	@PostMapping(value="/shop/admin/updatepwd")
	public String doUpdatepwd(HttpSession session,Model model,@RequestParam String checkpwd
			,@RequestParam String oldpwd,@RequestParam String newpwd) throws Exception{
		String ctips="";
		String url="<a href='../signup'>点此进行登录</a>";
		String username=(String)session.getAttribute("username");
		String password=oldpwd;
		User user=userMapper.getOneUser(username, password);
		List<User> users=getAllUsers();
		//System.out.println(oldpwd);
		if(checkpwd=="" || oldpwd=="" || newpwd==""){
			ctips="请将页面补充完整再进行操作！";
		}else if(checkpwd!="" ){
			if(checkpwd==newpwd || checkpwd.equals(newpwd)){
				if(user!=null){
					password=checkpwd;
					userMapper.updateUser(username, password);
						ctips="修改成功";
						session.removeAttribute("username");
						user=userMapper.getOneUser(username, password);
						users.remove(user.getId());
						users.add(user);
						writeUsersToRedis(users);
						model.addAttribute("ctips",ctips+url);
				}else{
					ctips="原密码输入错误，请重新输入";
				}
			}else{
				ctips="确认密码与新密码不一致，请重新输入";
			}
		}
		model.addAttribute("tips", ctips);
		return "redirect:/shop/admin/index";
	}
	
}
