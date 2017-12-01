package com.spimax.front.data;

import com.spimax.back.entity.Users;

/**
 * µÇÂ¼µÄÊý¾Ý
 * @author zhuzhen
 *
 */
public class LoginData {
	private int flag;
	private Users user;
	public LoginData() {
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "LoginData [flag=" + flag + ", user=" + user + "]";
	}
	public LoginData(int flag, Users user) {
		super();
		this.flag = flag;
		this.user = user;
	}
	
}
