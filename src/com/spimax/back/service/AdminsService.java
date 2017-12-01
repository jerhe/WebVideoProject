package com.spimax.back.service;

import java.util.List;

import com.spimax.back.dao.AdminDao;
import com.spimax.back.entity.Admins;
import com.spimax.back.util.BaseDao;

public class AdminsService {
	AdminDao ad = new AdminDao();

	public List<Admins> getAdminByNameAndPwd(String name, String pwd) {

		return ad.getAdminByNameAndPwd(name, pwd);

	}

	public boolean updatePwd(int id, String pwd) {
		return ad.updatePwd(id, pwd);
	}
}
