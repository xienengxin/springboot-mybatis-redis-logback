package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.Shoes;

public interface ShoesMapper {
	public List<Shoes> findAllShoes();
	public List<Shoes> searchShoes(@Param("type") String type,@Param("subtype") String subtype);
	public int updateStock(@Param("id")int id,@Param("num")int num);
	public Shoes findOneShoes(int id);
	public List<Shoes> searchLimitShoes(String txt);
	public List<Shoes> searchShoesByBrand(String txt);
	public List<Shoes> findLimitShoes(int limitnum);
	
	
	public int insertShoes(Shoes shoes);
	public int updateShoes(Shoes shoes);
	public int deleteShoes(int id);
}
