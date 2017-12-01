package com.spimax.back.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.spimax.back.entity.Danmu;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;


public class DanmuDao {
	
	
	/**
	 * ��ҳ
	 * @return
	 */
	public PageData<Danmu> getAllDanmuBySearch(String sql,int page,int pageSize)
	{
	   return (PageData<Danmu>) BaseDao.getPageByOracle(sql,page,pageSize,Danmu.class, null);	
	}
	/**
	 * ��ȡ��Ļ��������Ϣ
	 * @return
	 */
	public List<Danmu> getAllDanmuList()
	{
		String sql="select * from V_DANMU";
	
		return (List<Danmu>) BaseDao.select(sql,Danmu.class, null);
	}
	/**
	 * ��ȡ��Ƶ��������Ϣ
	 * @param id
	 * @return
	 */
	public List<Videos> getAllVIDEOSList(int id)
	{	
		String sql="select * from V_VIDEOS where videoid=?";
		return (List<Videos>) BaseDao.select(sql,Videos.class,id);
	}

	public int getDanmuCount()
	{
		String sql="select count(1) from  V_DANMU";
	    return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	
	public int getDanmuCountBySearch(String sql)
	{
	  return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	
	/**
	 * ɾ����Ļ
	 * @param id
	 * @return
	 */
	
	public boolean delectDanmu(int id)
	{
	   String sql="delete from V_DANMU where DANMUID=?";
	   return  BaseDao.execute(sql,id)>0;
	}
	
	
	
}
