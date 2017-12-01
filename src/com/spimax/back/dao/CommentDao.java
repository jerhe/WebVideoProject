package com.spimax.back.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.spimax.back.entity.Comment;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.util.BaseDao;
import com.spimax.back.util.PageData;

public class CommentDao {
	public List<Comment> getAllCommentList(int commentid)
	{String sql="select * from V_COMMENT where commentid=?";
		return (List<Comment>) BaseDao.select(sql,Comment.class, commentid);
	}
	public PageData<Comment> getAllComment()
	{String sql="select * from V_COMMENT";
	return (PageData<Comment>) BaseDao.getPageByOracle(sql,1,12,Comment.class, null);	
	}
	public PageData<Comment> getAllCommentBySearch(String sql,int page,int pageSize)
	{
	return (PageData<Comment>) BaseDao.getPageByOracle(sql,page,pageSize,Comment.class, null);	
	}

	public int getCommentCount()
	{String sql="select count(1) from V_COMMENT";
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}

	public boolean delectComment(int id)
	{
	String sql="delete from V_Comment where COMMENTID=?";
	return  BaseDao.execute(sql,id)>0;
	}
	public int getCommentCountBySearch(String sql)
	{
	return Integer.parseInt(BaseDao.getFirst(sql, null).toString());
		
	}
	public List<Comment> getAllVideos()
	{
		String sql="select * from V_COMMENT";
		return  (List<Comment>) BaseDao.select(sql,Comment.class, null);
	}
	public List<Videos> getAllVideosByVideoid(int videoid)
	{
		String sql="select * from V_VIDEOS where VIDEOID=?";
	
		return  (List<Videos>) BaseDao.select(sql,Videos.class, videoid);
	}
	public List<Integer> getTypeId(String typeName)
	{
		
	String sql="select * from V_VIDEOS where videotypename  like ?";
	List<VideoType> videotype=	(List<VideoType>) BaseDao.select(sql,VideoType.class,"%"+typeName+"%");
	List<Integer> list = new ArrayList();

	for (VideoType vt : videotype) {
		
		list.add(vt.getVIDEOTYPEID());
	
	}
		return list;
	}
}
