package com.example.controller;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lettuce.RedisCli;
import com.example.mapper.OrdersMapper;
import com.example.mapper.ShoesMapper;
import com.example.mapper.UserMapper;
import com.example.model.Orders;
import com.example.model.Shoes;
import com.example.model.User;

@Controller
public class HelloController {
	@Autowired
	ShoesMapper shoesMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	Logger logger=LoggerFactory.getLogger(HelloController.class);
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
	
	@GetMapping(value="/shoes")
	@ResponseBody
	public String getShoes(){
		List<Shoes> shoes=shoesMapper.findAllShoes();
		writeShoesToRedis(shoes);
		return "";
	}
	
	@GetMapping(value="/orders")
	@ResponseBody
	public String getOrders(){
		List<Orders> orders=ordersMapper.findAllOrders();
		writeOrdersToRedis(orders);
		return "";
	}
}
