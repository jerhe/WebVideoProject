package com.spimax.back.service;

import java.util.List;

import com.spimax.back.dao.UsersDao;
import com.spimax.back.entity.Users;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class UsersService {

	UsersDao ud=new UsersDao();
	public PageData<Users> getAllUsers() {

		return ud.getAllUsers();
	}
	public List<Users> getAllUsersList() {
		return ud.getAllUsersList();
	}
	public int getUsersCount() {
		return ud.getUsersCount();
	}
	public PageData<Users> getAllUsersBySearch(String sql,int page,int pageSize)
	{
	return ud.getAllUsersBySearch(sql, page, pageSize);
	}
	public int getUsersCountBySearch(String sql)
	{
	return ud.getUsersCountBySearch(sql);
		
	}
	public boolean updateUsers(Users u)
	{
		   return   ud.updateUsers(u);
	}
	public boolean insertUsers(Users u)
	{
		return ud.insertUsers(u);
	}
	public boolean delectUsers(int id)
	{
		return ud.delectUsers(id);
	}
	public boolean updateUsersPwd(int id)
	{
		return ud.updateUsersPwd(id);
	}
}
