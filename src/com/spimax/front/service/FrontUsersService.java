package com.spimax.front.service;

import java.util.List;
import com.spimax.back.entity.Users;
import com.spimax.back.util.BaseDao;
import com.spimax.front.dao.FrontUsersDao;

/**
 * 用户相关的service
 * @author zhuzhen
 *
 */
public class FrontUsersService {
	FrontUsersDao fud= new FrontUsersDao();
	/**
	 * 通过UserName获取到User对象
	 * @param userName
	 * @return
	 */
	public Users getUsersByUserName(String userName) {	
		return fud.getUsersByUserName(userName);
	}
	
	
	/**
	 * 用过用户的userID获取到User对象
	 * @param userID
	 * @return
	 */
	public Users getUsersByUserID(int USERID) {
		return fud.getUsersByUserID(USERID);
	}
	
	/**
	 * 更新用户的资料，这里只更新用户名，生日，简介
	 * @param u
	 * @return
	 */
	public boolean upUsers(Users u) {
		return fud.upUsers(u);
	}
	
	/**
	 * 添加用户
	 * @param u
	 * @return
	 */
	public boolean addUsers(Users u) {
		return fud.addUsers(u);
	}
	/**
	 * 更新用户的头像
	 * @param userid
	 * @param path
	 * @return
	 */
	public boolean upHeadimg(int userid,String path) {
		return fud.upHeadimg(userid, path);
	}
	
	/**
	 * 通过手机号重置密码
	 * @param USERPWD
	 * @param USERTEL
	 * @return
	 */
	public boolean upUserPwdByUserTel(String USERPWD,String USERTEL) {
		return fud.upUserPwdByUserTel(USERPWD, USERTEL);
	}
	
	/**
	 * 用过用户的usertel获取到User对象
	 * @param usertel
	 * @return
	 */
	public Users getUsersByUserTel(String USERTEL) {
		return fud.getUsersByUserTel(USERTEL);
	}
}
