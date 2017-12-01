package com.spimax.back.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class VideoTypeDao {
	public List<VideoType> getAllVideosTypeList(int videotypeid)
	{String sql="select * from V_VIDEOTYPE where videotypeid=?";
		return (List<VideoType>) BaseDao.select(sql,VideoType.class, videotypeid);
	}
	public PageData<VideoType> getAllVideosType()
	{String sql="select * from V_VIDEOTYPE";
	return (PageData<VideoType>) BaseDao.getPageByOracle(sql,1,12,VideoType.class, null);	
	}
	public PageData<VideoType> getAllVideostypeBySearch(String sql,int page,int pageSize)
	{
	return (PageData<VideoType>) BaseDao.getPageByOracle(sql,page,pageSize,VideoType.class, null);	
	}
	public boolean insertVideoType(VideoType u)
	{/*SimpleDateFormat sfd=	 new  SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	try {
		date = sfd.parse(u.getUSERBRITH());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}*/
		String sql= "INSERT INTO V_USERS(videotypeid, videotypename, videotypeparent) VALUES(SEQUENCE1.NEXTVAL,?,?)";
		   return  BaseDao.execute(sql,u.getVIDEOTYPENAME(),u.getVIDEOTYPEPARENT())>0;  
	}

	public int getVideosCount()
	{String sql="select count(1) from V_VIDEOTYPE";
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public boolean updateVideoType(VideoType u)
	{/*SimpleDateFormat sfd=	 new  SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	try {
		date = sfd.parse(u.getUSERBRITH());
	} catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}*/
		String sql= "update V_VIDEOTYPE set videotypename = ? where videotypeid = ?";
		   return  BaseDao.execute(sql,u.getVIDEOTYPENAME(),u.getVIDEOTYPEID())>0;  
	}
	public boolean delectVideos(int id)
	{
	String sql="delete from V_VIDEOTYPE where VIDEOTYPEID=?";
	return  BaseDao.execute(sql,id)>0;
	}
	public int getVideotypeCountBySearch(String sql)
	{
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public List<VideoType> getAllVideos()
	{
		String sql="select * from V_VIDEOTYPE";
		return  (List<VideoType>) BaseDao.select(sql,VideoType.class, null);
	}
	public List<Integer> getTypeId(String typeName)
	{
		
	String sql="select * from V_VIDEOTYPE where videotypename  like ?";
	List<VideoType> videotype=	(List<VideoType>) BaseDao.select(sql,VideoType.class,"%"+typeName+"%");
	List<Integer> list = new ArrayList();

	for (VideoType vt : videotype) {
		
		list.add(vt.getVIDEOTYPEID());
	
	}
		return list;
	}
	public List<Integer> getTypeOneId(String typeName)
	{
		
	String sql="select * from V_VIDEOTYPE where videotypename  = ?";
	List<VideoType> videotype=	(List<VideoType>) BaseDao.select(sql,VideoType.class,typeName);
	List<Integer> list = new ArrayList();

	for (VideoType vt : videotype) {
		
		list.add(vt.getVIDEOTYPEID());
	
	}
		return list;
	}
}
