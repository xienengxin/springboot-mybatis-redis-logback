package com.example.controller;

import io.lettuce.core.RedisFuture;
import io.lettuce.core.api.async.RedisAsyncCommands;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lettuce.RedisCli;
import com.example.mapper.OrdersMapper;
import com.example.mapper.ShoesMapper;
import com.example.mapper.UserMapper;
import com.example.model.Cart;
import com.example.model.Orders;
import com.example.model.Shoes;
import com.example.model.User;

@Controller
public class ShopController {
	
	@Autowired
	ShoesMapper shoesMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	Logger logger=LoggerFactory.getLogger(ShopController.class);
	
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
	
	@GetMapping("/shop/index")
	public String shopIndex(Model model) throws Exception{
		List<Shoes> shoes=getAllShoes();
		if(shoes.size()!=0){
			for(int i=0;i<shoes.size()-3;i++){
				shoes.remove(i);
			}
		}else{
			shoes=shoesMapper.findLimitShoes(3);
		}
		model.addAttribute("goods", shoes);
		return "index";
	}
	
	@GetMapping("/shop/checkout")
	public String shopcheckout(){
		return "checkout";
	}
	@GetMapping("/shop/products")
	public String shopproducts(){
		return "products";
	}
	@GetMapping("/shop/register")
	public String shopregister(){
		return "register";
	}
	@GetMapping("/shop/signup")
	public String shopsignup(){
		return "signup";
	}
	
	@GetMapping("/shop/single")
	public String shopsingle(Model model){
		return "single";
	}
	
	@GetMapping(value="/shop/product")
	public String findAllgoods(Model model) throws Exception{
		List<Shoes> shoes=getAllShoes();
		if(shoes.size()==0){
			shoes=shoesMapper.findAllShoes();
			writeShoesToRedis(shoes);
		}
		model.addAttribute("goods", shoes);
		return "products";
	}
	
	@GetMapping(value="/shop/{id}")
	public String searchShoes(@PathVariable(value="id")Integer id,Model model) 
			throws Exception{
		List<Shoes> shoes=getAllShoes();
		if(shoes.size()==0) {
			shoes=shoesMapper.findAllShoes();
			writeShoesToRedis(shoes);
		}
		List<Shoes> list=new ArrayList();
		switch(id){
		case 1:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) && "篮球鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 2:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) && "足球鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 3:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) && "跑步鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 4:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) && "网球鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 5:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) && "休闲鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 6:
			for(int i=0;i<shoes.size();i++){
				if("女士".equals(shoes.get(i).getType()) && "网球鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 7:
			for(int i=0;i<shoes.size();i++){
				if("女士".equals(shoes.get(i).getType()) && "跑步鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 8:
			for(int i=0;i<shoes.size();i++){
				if("女士".equals(shoes.get(i).getType()) && "休闲鞋".equals(shoes.get(i).getSubtype())){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 9:
			for(int i=0;i<shoes.size();i++){
				if("男士".equals(shoes.get(i).getType()) ){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 10:
			for(int i=0;i<shoes.size();i++){
				if("女士".equals(shoes.get(i).getType()) ){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 11:
			for(int i=0;i<shoes.size();i++){
				if("休闲鞋".equals(shoes.get(i).getType()) ){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		case 12:
			for(int i=0;i<shoes.size();i++){
				if("运动鞋".equals(shoes.get(i).getType()) ){
					list.add(shoes.get(i));
					break;
				}
			}
			model.addAttribute("goods",list);
			break;
		}
		return "products";
	}
	
	@GetMapping(value="/shop/shoe/{id}")
	public String getDetails(@PathVariable(value="id")Integer id,Model model)
			throws Exception{
		List<Shoes> shoes=getAllShoes();
		if(shoes.size()==0){
			shoes=shoesMapper.findAllShoes();
			writeShoesToRedis(shoes);
		}
		Shoes shoe=new Shoes();
		for(int i=0;i<shoes.size();i++){
			if(id.equals(shoes.get(i).getId()) || shoes.get(i).getId()==id){
				shoe=shoes.get(i);
				break;
			}if(i==shoes.size()-1){
				shoe=shoesMapper.findOneShoes(id);
			}
		}
		model.addAttribute("goods",shoe);
		return "single";
	}

	@GetMapping(value="/shop/login")
	public String toLogin(){
		return "signup";
	}
	
	@GetMapping(value="/shop/loginout")
	public String doLoginOut(HttpSession session){
		session.removeAttribute("username");
		return "redirect:/shop/index";
	}
	
	@GetMapping(value="/shop/cart")
	@ResponseBody
	public String getCart(@RequestParam int id,@RequestParam int price,@RequestParam int num,
			@RequestParam String size,HttpSession session){
		Cart c=new Cart();
		List<Cart> list=(List)session.getAttribute("data");
		if(list!=null){
			//判断返回的数据是否为空
			//遍历list
			for(int i=0;i<list.size();i++){
				if(list.get(i).getId()==id){
					//判断这件商品是否已存在购物车中，是则将这件商品的数量加上用户选择的商品数量
					list.get(i).setId(id);
					list.get(i).setMoney(list.get(i).getMoney()+price*num);
					list.get(i).setNum(list.get(i).getNum()+num);
					break;
				}
				//如果这件商品不在购物车中，则创建一个新的cart对象
				if(i==list.size()-1){
					c=new Cart(id,price*num,num,size);
					list.add(c);
					break;
				}
			}
			
		}else{
			//如果这个list为空，则实例化一个ArrayList
			c=new Cart(id,price*num,num,size);
			list=new ArrayList();
			list.add(c);
		}
		session.setAttribute("data",list);
		return "";
	}
	
	
	@GetMapping(value="/shop/viewcart")
	public String viewChart(HttpSession session,Model model) throws Exception{
		List<Cart> list=(List)session.getAttribute("data");
		List<Shoes> shoes=new ArrayList();
		List<Shoes> shoes1=getAllShoes();
		
		if(shoes.size()==0){
			shoes=shoesMapper.findAllShoes();
			writeShoesToRedis(shoes);
		}
		
		for(int i=0;i<list.size();i++){
			for(int j=0;j<shoes1.size();j++){
				if(shoes1.get(j).getId()==list.get(i).getId()){
					shoes.add(shoes1.get(j));
					break;
				}
			}
		}
		
		if(list!=null){
			for(int i=0;i<list.size();i++){
				if(list.get(i).getId()!=0){
					for(int j=0;j<shoes1.size();j++){
						if(list.get(i).getId() == shoes1.get(j).getId()){
							shoes.add(shoes1.get(j));
							break;
						}
					}
				}
			}
		}
		session.setAttribute("data", list);
		session.setAttribute("goods",shoes);
		return "checkout";
		
		/*List<Cart> list=(List)session.getAttribute("data");
		List<Shoes> shoes=new ArrayList();
		int id=0;
		if(list != null && list.size()!=0){
			for(int i=0;i<list.size();i++){
				if(list.get(i).getId()!=0 ){
					id=list.get(i).getId();
					shoes.add(shoesMapper.findOneShoes(id));
					System.out.println(shoesMapper.findOneShoes(id));
				}
			}
		}
		session.setAttribute("data", list);
		session.setAttribute("goods",shoes);
		System.out.println(shoes==null);
		return "checkout";*/
	}
	
	@GetMapping(value="/shop/cartdel")
	public String cartDel(@RequestParam int id,HttpSession session){
		List<Cart> list=(List)session.getAttribute("data");
		if(list!=null){
			
			for(int i=0;i<list.size();i++){
				if(list.get(i).getId()==id){
					list.set(i, new Cart());
					break;
				}
			}
		}
		session.removeAttribute("data");
		session.setAttribute("data",list);
		return "";
	}
	
	@PostMapping("/shop/search")
	public String searchShoesByBrand(@RequestParam("checkbox") String[] chk,
			Model model) throws Exception{
		String a=Arrays.toString(chk);
		List<Shoes> shoes=getAllShoes();
		if(shoes.size()==0){
			shoes=shoesMapper.findAllShoes();
			writeShoesToRedis(shoes);
		}
		List<Shoes> list = new ArrayList();
		if (chk != null) {
			for (int i = 0; i < chk.length; i++) {
				if (!chk[i].equals("false")) {
					for(int j=0;j<shoes.size();j++){
						if(chk[i].equals(shoes.get(j).getBrand())){
							list.add(shoes.get(j));
						}
					}
				}else if(chk.length==1 && chk[i].equals("false")){
					list.addAll(shoes);
				}
			}
		}
		model.addAttribute("goods", list);
		return "products";
	}
	
	@GetMapping(value="/shop/payorder",produces="text/html;charset=UTF-8;")
	public String doOrderPay(HttpSession session,Model model) throws Exception{
		List<Cart> list=new ArrayList();
		List<Orders> orders=getAllOrders();
		if(orders.size()==0){
			orders=ordersMapper.findAllOrders();
			writeOrdersToRedis(orders);
		}
		String username=(String)session.getAttribute("username");
		String paytips="";
		String url="<br/><ul><h4><a href='product'>点此返回商城</a></h4></ul>";
		int user_id=0;
		
		Orders order=new Orders();
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr=sdf.format(date);
		
		if(username != null){
			user_id=userMapper.getUserId(username).getId();
			order.setUser_id(user_id);
			list =(List<Cart>)session.getAttribute("data");
			
		}else{
			
			paytips="付款失败，请先登录再进行付款操作";
		}
		
		if(list!=null){
			if(list.size()!=0){
				for(int i=0;i<list.size();i++){
					if(list.get(i).getSize()!=null){
						order.setNum(list.get(i).getNum());
						order.setPrice(list.get(i).getMoney());
						order.setSize(list.get(i).getSize());
						order.setState(0);
						order.setShoes_id(list.get(i).getId());
						order.setOrdertime(dateStr);
						order.setArrivetime(null);
						ordersMapper.insertOrders(order);
						shoesMapper.updateStock(list.get(i).getId(),list.get(i).getNum());
						orders.add(order);
						writeOrdersToRedis(orders);
						paytips="付款成功";
					}
					
				}
			}else{
				paytips="付款失败,请先添加商品再进行付款操作";
			}
		}
		session.removeAttribute("data");
		session.setAttribute("paytips", paytips);
		model.addAttribute("paytips",paytips);
		return "checkout";
	}
	
	@GetMapping(value="/shop/buy",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String doBuy(@RequestParam int id,@RequestParam int price,
			@RequestParam int num,@RequestParam String size,HttpSession session,
			Model model) throws Exception{
		List<Cart> list=new ArrayList();
		List<Orders> orders=getAllOrders();
		if(orders.size()==0){
			orders=ordersMapper.findAllOrders();
			writeOrdersToRedis(orders);
		}
		String username=(String)session.getAttribute("username");
		String paytips="";
		String url="<br/><ul><h4><a href='../product'>点此返回商城</a></h4></ul>";
		int user_id=0;
		Orders order=new Orders();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr=sdf.format(date);
		if(username != null){
			user_id=userMapper.getUserId(username).getId();
			order.setUser_id(user_id);
			order.setNum(num);
			order.setPrice(price*num);
			order.setSize(size);
			order.setState(0);
			order.setShoes_id(id);
			order.setOrdertime(dateStr);
			order.setArrivetime(null);
			ordersMapper.insertOrders(order);
			orders.add(order);
			writeOrdersToRedis(orders);
			shoesMapper.updateStock(id, num);
			paytips="付款成功";
		}else{
			paytips="付款失败，请先登录再进行付款操作";
		}
		session.removeAttribute("data");
		session.setAttribute("paytips", paytips+url);
		model.addAttribute("paytips",paytips);
		return "";
	}
}

