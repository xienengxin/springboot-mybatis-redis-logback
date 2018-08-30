package com.example.model;

import java.util.List;

public class Shoes {
	private int id;
	private String title;
	private String subtitle;
	private String type;
	private String subtype;
	private float price;
	private String brand;
	private String details;
	private String pic;
	private int stock;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Shoes(int id, String title, String subtitle, String type,
			String subtype, float price, String brand, String details,
			String pic, int stock) {
		super();
		this.id = id;
		this.title = title;
		this.subtitle = subtitle;
		this.type = type;
		this.subtype = subtype;
		this.price = price;
		this.brand = brand;
		this.details = details;
		this.pic = pic;
		this.stock = stock;
	}
	public Shoes() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Shoes [id=" + id + ", title=" + title + ", subtitle="
				+ subtitle + ", type=" + type + ", subtype=" + subtype
				+ ", price=" + price + ", brand=" + brand + ", details="
				+ details + ", pic=" + pic + ", stock=" + stock + "]";
	}
	
	
	
	
}
