package com.spimax.front.service;

import java.util.List;
import com.spimax.back.entity.Users;
import com.spimax.back.util.BaseDao;
import com.spimax.front.dao.FrontUsersDao;

/**
 * �û���ص�service
 * @author zhuzhen
 *
 */
public class FrontUsersService {
	FrontUsersDao fud= new FrontUsersDao();
	/**
	 * ͨ��UserName��ȡ��User����
	 * @param userName
	 * @return
	 */
	public Users getUsersByUserName(String userName) {	
		return fud.getUsersByUserName(userName);
	}
	
	
	/**
	 * �ù��û���userID��ȡ��User����
	 * @param userID
	 * @return
	 */
	public Users getUsersByUserID(int USERID) {
		return fud.getUsersByUserID(USERID);
	}
	
	/**
	 * �����û������ϣ�����ֻ�����û��������գ����
	 * @param u
	 * @return
	 */
	public boolean upUsers(Users u) {
		return fud.upUsers(u);
	}
	
	/**
	 * ����û�
	 * @param u
	 * @return
	 */
	public boolean addUsers(Users u) {
		return fud.addUsers(u);
	}
	/**
	 * �����û���ͷ��
	 * @param userid
	 * @param path
	 * @return
	 */
	public boolean upHeadimg(int userid,String path) {
		return fud.upHeadimg(userid, path);
	}
	
	/**
	 * ͨ���ֻ�����������
	 * @param USERPWD
	 * @param USERTEL
	 * @return
	 */
	public boolean upUserPwdByUserTel(String USERPWD,String USERTEL) {
		return fud.upUserPwdByUserTel(USERPWD, USERTEL);
	}
	
	/**
	 * �ù��û���usertel��ȡ��User����
	 * @param usertel
	 * @return
	 */
	public Users getUsersByUserTel(String USERTEL) {
		return fud.getUsersByUserTel(USERTEL);
	}
}
