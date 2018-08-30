package com.example.model;

import java.util.List;

public class Orders {
	private int id;
	private int user_id;
	private int state;
	private String ordertime;
	private String arrivetime;
	private int shoes_id;
	private float price;
	private int num;
	private String size;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getArrivetime() {
		return arrivetime;
	}
	public void setArrivetime(String arrivetime) {
		this.arrivetime = arrivetime;
	}
	public int getShoes_id() {
		return shoes_id;
	}
	public void setShoes_id(int shoes_id) {
		this.shoes_id = shoes_id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Orders(int id, int user_id, int state, String ordertime,
			String arrivetime, int shoes_id, float price, int num, String size) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.state = state;
		this.ordertime = ordertime;
		this.arrivetime = arrivetime;
		this.shoes_id = shoes_id;
		this.price = price;
		this.num = num;
		this.size = size;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", user_id=" + user_id + ", state=" + state
				+ ", ordertime=" + ordertime + ", arrivetime=" + arrivetime
				+ ", shoes_id=" + shoes_id + ", price=" + price + ", num="
				+ num + ", size=" + size + "]";
	}
	
	
	
	
	
	
	
}
