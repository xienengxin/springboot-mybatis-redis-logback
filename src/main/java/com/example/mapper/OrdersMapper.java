package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.Orders;

public interface OrdersMapper {
	public int insertOrders(Orders order);
	public List<Orders> searchOrders(int user_id);
	
	public List<Orders> findUserOrders(@Param("user_id") int user_id,@Param("ordertime") String ordertime);
	
	public int deleteOrders(int id);
	public List<Orders> findAllOrders();
}
