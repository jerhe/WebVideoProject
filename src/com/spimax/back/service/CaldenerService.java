package com.spimax.back.service;

import java.util.List;

import com.spimax.back.dao.CaldenersDao;
import com.spimax.back.entity.Caldeners;

public class CaldenerService {
	
	CaldenersDao ds=new CaldenersDao();
	public List<Caldeners> getAllNewsList(int id)
	{
		return ds.getAllNewsList(id);
	}
	public int getAllNewsBydate(int year,int month,int day,int id)
	{
		return ds.getAllNewsBydate(year, month, day, id);
	}
	public boolean insertNews(Caldeners c)
	{
		return ds.insertNews(c);
	}
	
	public boolean updateNews(Caldeners c)
	{
		return ds.updateNews(c);
	}
}
