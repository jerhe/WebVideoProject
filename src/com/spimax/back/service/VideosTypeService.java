package com.spimax.back.service;

import java.util.ArrayList;
import java.util.List;

import com.spimax.back.dao.VideoTypeDao;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;


public class VideosTypeService {
	VideoTypeDao vtd=new VideoTypeDao();
	public List<VideoType> getAllVideosTypeList(int videotypeid)
	{
		return vtd.getAllVideosTypeList(videotypeid);
	}
	public List<VideoType> getAllVideos()
	{
		return  vtd.getAllVideos();
	}
	public PageData<VideoType> getAllVideosType()
	{
	return vtd.getAllVideosType();	
	}
	public List<Integer> getTypeId(String typeName)
	{
		

		return vtd.getTypeId(typeName);
	}
	public PageData<VideoType> getAllVideostypeBySearch(String sql,int page,int pageSize)
	{
	return vtd.getAllVideostypeBySearch(sql, page, pageSize);
	}
	public boolean updateUsers(VideoType u)
	{
		   return  vtd.updateVideoType(u);  
	}
	public int getVideotypeCount()
	{
	return vtd.getVideosCount();
		
	}
	public boolean delectVideotype(int id)
	{

	return  vtd.delectVideos(id);
	}
	public int getVideotypeCountBySearch(String sql)
	{
	return vtd.getVideotypeCountBySearch(sql);
		
	}
	public List<Integer> getTypeOneId(String typeName)
	{
		

		return vtd.getTypeOneId(typeName);
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
		
		   return vtd.insertVideoType(u);  
	}
}
