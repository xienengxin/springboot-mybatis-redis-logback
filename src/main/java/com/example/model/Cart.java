package com.example.model;

public class Cart {
	private int id;
	private int money;
	private int num;
	private String size;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
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
	public Cart(int id, int money, int num, String size) {
		super();
		this.id = id;
		this.money = money;
		this.num = num;
		this.size = size;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", money=" + money + ", num=" + num
				+ ", size=" + size + "]";
	}
}
