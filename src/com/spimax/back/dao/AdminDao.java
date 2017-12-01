package com.spimax.back.dao;

import java.util.List;

import com.spimax.back.entity.Admins;
import com.spimax.back.util.BaseDao;

public class AdminDao {
public List<Admins> getAdminByNameAndPwd(String name,String pwd)
{
	String sql="select * from V_ADMIN where ADMINNAME=? and ADMINPWD=?";
	return (List<Admins>) BaseDao.select(sql, Admins.class, name,pwd);
}
public boolean updatePwd(int id,String pwd)
{
	String sql="update V_ADMIN set ADMINPWD=? where ADMINID=?";
	return BaseDao.execute(sql, pwd,id)>0;
	}
}
