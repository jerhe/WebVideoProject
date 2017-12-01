package com.spimax.back.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.spimax.back.entity.Users;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;


public class UsersDao {
	public PageData<Users> getAllUsers()
	{String sql="select userid,username,usertel,headimg,userbrith,userremark from V_USERS";
	return (PageData<Users>) BaseDao.getPageByOracle(sql,1,12,Users.class, null);	
	}
	public PageData<Users> getAllUsersBySearch(String sql,int page,int pageSize)
	{
	return (PageData<Users>) BaseDao.getPageByOracle(sql,page,pageSize,Users.class, null);	
	}
	public List<Users> getAllUsersList()
	{String sql="select userid,username,usertel,headimg,userbrith,userremark from V_USERS";
		return (List<Users>) BaseDao.select(sql,Users.class, null);
	}
	
	public boolean updateUsers(Users u)
	{SimpleDateFormat sfd=	 new  SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	try {
		date = sfd.parse(u.getUSERBRITH());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		String sql= "update V_USERS set username = ?,usertel = ?,headimg = ?,userbrith = ?,userremark=? where userid = ?";
		   return  BaseDao.execute(sql,u.getUSERNAME(),u.getUSERTEL(),u.getHEADIMG(),new java.sql.Date(date.getTime()),u.getUSERREMARK(),u.getUSERID())>0;  
	}
	public boolean insertUsers(Users u)
	{SimpleDateFormat sfd=	 new  SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	try {
		date = sfd.parse(u.getUSERBRITH());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		String sql= "INSERT INTO V_USERS(USERID, USERNAME, USERPWD, usertel, HEADIMG, USERBRITH,userremark) VALUES(SEQUENCE1.NEXTVAL,?,?,?,?,?,?)";
		   return  BaseDao.execute(sql,u.getUSERNAME(),u.getUSERPWD(),u.getUSERTEL(),u.getHEADIMG(),new java.sql.Date(date.getTime()),u.getUSERREMARK())>0;  
	}
	public int getUsersCount()
	{String sql="select count(1) from V_USERS";
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public boolean delectUsers(int id)
	{
	String sql="delete from V_USERS where userid=?";
	return  BaseDao.execute(sql,id)>0;
	}
	public int getUsersCountBySearch(String sql)
	{
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public boolean updateUsersPwd(int id)
	{
		String sql= "update V_USERS set userpwd =? where userid = ?";
		   return  BaseDao.execute(sql,"888888",id)>0;  
	}
}
