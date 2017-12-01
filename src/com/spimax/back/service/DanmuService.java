package com.spimax.back.service;

import java.util.List;

import com.spimax.back.dao.DanmuDao;
import com.spimax.back.dao.UsersDao;
import com.spimax.back.entity.Danmu;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class DanmuService {

	DanmuDao dd=new DanmuDao();
	

	
	public PageData<Danmu> getAllDanmuBySearch(String sql,int page,int pageSize)
	{
	  return dd.getAllDanmuBySearch(sql, page, pageSize);
	}
	
	public List<Videos> getAllVIDEOSList(int id)
	{
		
		return dd.getAllVIDEOSList(id);
	}
	public List<Danmu> getAllDanmuList()
	{
	
		return dd.getAllDanmuList();
	}
	
	public int getDanmuCount()
	{
	
	    return dd.getDanmuCount();
		
	}
	
	public int getDanmuCountBySearch(String sql)
	{
	  return dd.getDanmuCountBySearch(sql);
		
	}
	
	public boolean delectDanmu(int id)
	{
	   
	   return  dd.delectDanmu(id);
	}
	
}
