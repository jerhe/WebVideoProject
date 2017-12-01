package com.spimax.back.service;

import java.util.List;

import com.spimax.back.dao.CommentDao;
import com.spimax.back.dao.VideoTypeDao;
import com.spimax.back.entity.Comment;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;


public class CommentService {
	CommentDao vtd=new CommentDao();
	public List<Comment> getAllCommentList(int commentid)
	{
		return vtd.getAllCommentList(commentid);
	}
	public List<Comment> getAllVideos()
	{
		return  vtd.getAllVideos();
	}
	public PageData<Comment> getAllComment()
	{
	return vtd.getAllComment();	
	}
	public List<Integer> getTypeId(String typeName)
	{
		

		return vtd.getTypeId(typeName);
	}
	public PageData<Comment> getAllCommentBySearch(String sql,int page,int pageSize)
	{
	return vtd.getAllCommentBySearch(sql, page, pageSize);
	}

	public int getCommentCount()
	{
	return vtd.getCommentCount();
		
	}
	public boolean delectComment(int id)
	{

	return  vtd.delectComment(id);
	}
	
	public int getCommentCountBySearch(String sql)
	{
	return vtd.getCommentCountBySearch(sql);
		
	}
	public List<Videos> getAllVideosByVideoid(int videoid){
		return vtd.getAllVideosByVideoid(videoid);
		
	}
	

}
