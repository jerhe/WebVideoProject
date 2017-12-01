package com.spimax.back.dao;


import java.util.ArrayList;
import java.util.List;

import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class VideosDao {
	public PageData<Videos> getAllVideos()
	{String sql="select videotime,videotypeid,videoplaycount,videoflag,username,videotitle,videocoverurl,videourl,videoremark,videoid from V_VIDEOS";
	return (PageData<Videos>) BaseDao.getPageByOracle(sql,1,12,Videos.class, null);	
	}
	public PageData<Videos> getAllVideosBySearch(String sql,int page,int pageSize)
	{
	return (PageData<Videos>) BaseDao.getPageByOracle(sql,page,pageSize,Videos.class, null);	
	}
	public List<Videos> getAllVideosList()
	{String sql="select videotime,videotypeid,videoflag,videoplaycount,username,videotitle,videocoverurl,videourl,videoremark,videoid from V_VIDEOS";
		return (List<Videos>) BaseDao.select(sql,Videos.class, null);
	}
	public boolean updatVideoPass(int flag,int vid)
	{
		String sql= "update V_VIDEOS set videoflag=? where videoid=?";
		return BaseDao.execute(sql,flag,vid)>0;
	}
	public List<Integer> getTypeId(String typeName)
	{
		
	String sql="select * from V_VIDEOS where videotitle  like ?";
	List<Videos> videotype=	(List<Videos>) BaseDao.select(sql,Videos.class,"%"+typeName+"%");
	List<Integer> list = new ArrayList();

	for (Videos vt : videotype) {
		
		list.add(vt.getVIDEOID());
	
	}
		return list;
	}
	public List<Integer> getTypeIdByUsername(String userName)
	{
		
	String sql="select * from V_VIDEOS where username  like ?";
	List<Videos> videotype=	(List<Videos>) BaseDao.select(sql,Videos.class,"%"+userName+"%");
	List<Integer> list = new ArrayList();

	for (Videos vt : videotype) {
		
		list.add(vt.getVIDEOID());
	
	}
		return list;
	}
	public boolean updateVideos(Videos v)
	{
		String sql= "update V_VIDEOS set videotypeid = ?,username = ?,videotitle = ?,videocoverurl=?,videourl=?,videoremark=? where videoid= ?";
		 //  return  BaseDao.execute(sql,u.getUSERNAME(),u.getEMAIL(),u.getHEADIMG(),new java.sql.Date(date.getTime()),u.getUSERID())>0;  
	   return BaseDao.execute(sql,v.getVIDEOTYPEID(),v.getUSERNAME(),v.getVIDEOTITLE(),v.getVIDEOCOVERURL(),v.getVIDEOURL(),v.getVIDEOREMARK(),v.getVIDEOID())>0;
	}
public boolean insertVideos(Videos v)
	{/*SimpleDateFormat sfd=	 new  SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	try {
		date = sfd.parse(u.getUSERBRITH());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}*/
		String sql= "INSERT INTO V_VIDEOS(videoid, videotypeid, username, videotitle, videocoverurl, videourl,videoremark,videoflag) VALUES(SEQUENCE_VIDEOID.NEXTVAL,?,?,?,?,?,?,1)";
		 return  BaseDao.execute(sql,v.getVIDEOTYPEID(),v.getUSERNAME(),v.getVIDEOTITLE(),v.getVIDEOCOVERURL(),v.getVIDEOURL(),v.getVIDEOREMARK())>0;  
	}
	public int getVideosCount()
	{String sql="select count(1) from V_VIDEOS";
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public boolean delectVideos(int id)
	{
	String sql="delete from V_VIDEOS where VIDEOID=?";
	return  BaseDao.execute(sql,id)>0;
	}
	public int getVideosCountBySearch(String sql)
	{
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
}
