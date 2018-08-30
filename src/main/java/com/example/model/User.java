package com.example.model;

public class User {
	private int id;
	private String name;
	private String phone;
	private int level;
	private String address;
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(int id, String name, String phone, int level, String address) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.level = level;
		this.address = address;
	}
	public User() {}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", phone=" + phone
				+ ", level=" + level + ", address=" + address + "]";
	}
	
	
}
