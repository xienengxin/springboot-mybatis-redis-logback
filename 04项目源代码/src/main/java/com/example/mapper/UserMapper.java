package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.User;

public interface UserMapper {
	public List<User> getAllUsers();
	public User getOneUser(@Param("username")String username,@Param("password")String password);
	public int insertUser(User user);
	public int deleteUser(int id);
	public User selectAdminUser(@Param("username")String username,@Param("password")String password);
	
	public int updateUser(@Param("username")String username,@Param("password")String password);
	public User getUserId(String username);
}
