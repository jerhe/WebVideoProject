package com.spimax.front.dao;

import java.io.File;
import java.util.List;

import com.spimax.back.entity.Users;
import com.spimax.back.util.BaseDao;

public class FrontUsersDao {

	/**
	 * 通过UserName获取到User对象
	 * @param userName
	 * @return
	 */
	public Users getUsersByUserName(String USERNAME) {	
		List<Users> list=null;
		list = (List<Users>) BaseDao.select("select * from V_USERS where USERNAME=?", Users.class,USERNAME);
		if(list.isEmpty()) {
			return null;
		}else{
			return list.get(0);
		}
		
	}
	
	/**
	 * 用过用户的userID获取到User对象
	 * @param userID
	 * @return
	 */
	public Users getUsersByUserID(int USERID) {
		List<Users> list=null;
		list = (List<Users>) BaseDao.select("select * from V_USERS where USERID=?", Users.class,USERID);
		if(list.isEmpty()) {
			return null;
		}else{
			return list.get(0);
		}
	}
	
	/**
	 * 用过用户的usertel获取到User对象
	 * @param usertel
	 * @return
	 */
	public Users getUsersByUserTel(String USERTEL) {
		List<Users> list=null;
		list = (List<Users>) BaseDao.select("select * from V_USERS where USERTEL=?", Users.class,USERTEL);
		if(list.isEmpty()) {
			return null;
		}else{
			return list.get(0);
		}
	}
	/**
	 * 更新用户的资料，这里只更新用户名，生日，简介
	 * @param u
	 * @return
	 */
	public boolean upUsers(Users u) {
		return BaseDao.execute("update V_USERS set USERNAME=?,USERBRITH=to_date('?','yyyy-mm-dd hh24:mi:ss'),USERREMARK=? where USERID=?"
				, u.getUSERNAME(),u.getUSERBRITH(),u.getUSERREMARK(),u.getUSERID())>0;
	}
	
	/**
	 * 添加用户
	 * @param u
	 * @return
	 */
	public boolean addUsers(Users u) {
		if(getUsersByUserTel(u.getUSERTEL())!=null || getUsersByUserName(u.getUSERNAME())!=null) {
			return false;
		}
		return BaseDao.execute("insert into V_USERS(USERNAME,USERPWD,USERTEL,HEADIMG) values(?,?,?,?)", u.getUSERNAME(),u.getUSERPWD(),u.getUSERTEL()
				,"http://localhost:8080/WebVideoProject/front/img/akari.jpg")>0;
	}
	
	/**
	 * 更新用户的头像
	 * @param userid
	 * @param path
	 * @return
	 */
	public boolean upHeadimg(int userid,String path) {
		//删除旧文件
		Users user=getUsersByUserID(userid);
		String oldpath= user.getHEADIMG();
		String[] str= oldpath.split("WebContent/");
		String str1="C:/Users/zhuzhen/git/WebVideoProject/WebContent/"+str[1];
		String str2="D:/JAVA/tomcat/apache-tomcat-9.0.0.M26/webapps/wtpwebapps/WebVideoProject/"+str[1];
		File file1=new File(str1);
		File file2=new File(str2);
		file1.delete();
		file2.delete();
		/*添加新文件*/
		return BaseDao.execute("update V_USERS set HEADIMG=? where USERID=?",path,userid)>0;
	}
	
	/**
	 * 通过手机号重置密码
	 * @param USERPWD
	 * @param USERTEL
	 * @return
	 */
	public boolean upUserPwdByUserTel(String USERPWD,String USERTEL) {
		return BaseDao.execute("update V_USERS set USERPWD=? where USERTEL=?", USERPWD,USERTEL)>0;
	}
	
}
