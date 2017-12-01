package com.spimax.back.service;

import java.util.ArrayList;
import java.util.List;

import com.spimax.back.dao.VideosDao;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class VideosService {
	VideosDao ud=new VideosDao();
	public PageData<Videos> getAllVideos() {

		return ud.getAllVideos();
	}
	public List<Videos> getAllVideosList() {
		return ud.getAllVideosList();
	}
	public int getVideosCount() {
		return ud.getVideosCount();
	}
	public PageData<Videos> getAllVideosBySearch(String sql,int page,int pageSize)
	{
	return ud.getAllVideosBySearch(sql, page, pageSize);
	}
	public int getVideosCountBySearch(String sql)
	{
	return ud.getVideosCountBySearch(sql);
		
	}
	public boolean updatVideoPass(int flag,int vid)
	{
		return ud.updatVideoPass(flag, vid);
	}
	public boolean updateVideos(Videos u)
	{
		   return   ud.updateVideos(u);
	}
	public boolean insertVideos(Videos u)
	{
		return ud.insertVideos(u);
	}
	public boolean delectVideos(int id)
	{
		return ud.delectVideos(id);
	}
	public List<Integer> getTypeId(String typeName)
	{
		return ud.getTypeId(typeName);
	}
	public List<Integer> getTypeIdByUsername(String userName)
	{
		return ud.getTypeIdByUsername(userName);
	}
}
