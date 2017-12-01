package com.spimax.back.dao;

import java.util.List;

import com.spimax.back.entity.Caldeners;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;

public class CaldenersDao {

	public List<Caldeners> getAllNewsList(int id)
	{String sql="select calenderid,calendertitle,calendercontent,cyear,cmonth,cday from V_CALENDER where adminid=?";
		return (List<Caldeners>) BaseDao.select(sql,Caldeners.class, id);
	}
	public int getAllNewsBydate(int year,int month,int day,int id)
	{String sql="select calenderid  from V_CALENDER where cyear=? and cmonth=? and cday=? and adminid=?";
		List<Caldeners> list=(List<Caldeners>) BaseDao.select(sql,Caldeners.class, year,month,day,id);
		int i=0;
		if(list.size()>0)
		{   
			for (Caldeners object : list) {
				i= object.getCALENDERID();
			}
			return i;
		}
		else
		{
			return i;
		}
	}
	
	public boolean updateNews(Caldeners c)
	{
		String sql= "update  V_CALENDER  set  calendertitle=?, calendercontent=? where calenderid=? and  cyear=? cmonth=? and cday=? and adminid=?";
		return BaseDao.execute(sql,c.getCALENDERTITLE(),c.getCALENDERCONTENT(),c.getCALENDERID(),c.getCYEAR(),c.getCMONTH(),c.getCDAY(),c.getADMINID())>0;
	}
	public boolean insertNews(Caldeners c)
	{
		String sql= "INSERT INTO V_CALENDER(calenderid, calendertitle, calendercontent, cyear, cmonth,cday,adminid) VALUES(SEQUENCE_CALDENERID.NEXTVAL,?,?,?,?,?,?)";
		 return  BaseDao.execute(sql,c.getCALENDERTITLE(),c.getCALENDERCONTENT(),c.getCYEAR(),c.getCMONTH(),c.getCDAY(),c.getADMINID())>0;  
	}
}
