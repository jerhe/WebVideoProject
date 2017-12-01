package com.spimax.front.dao;

import java.util.List;

import com.spimax.front.entity.Comment;
import com.spimax.front.util.BaseDao;

/**
 * 视频相关的Dao
 * @author zhuzhen
 *
 */
public class FrontCommentDao {
	
	/**
	 * 获取该视频的评论
	 * @param VIDEOID
	 * @return
	 */
	public List<Comment> getCommentByVIDEOID(int VIDEOID){
		List<Comment> list= null;
		list= (List<Comment>) BaseDao.select("select * from V_COMMENT where VIDEOID=? order by COMMENTTIME desc", Comment.class, VIDEOID);
		if (list.isEmpty()) {
			return null;
		}else {
			return list;
		}
		
	}
	
	/**
	 * 添加视屏评论评论
	 * @param comment
	 * @return
	 */
	public boolean addComment(Comment comment) {
		return BaseDao.execute("insert into V_COMMENT(COMMENTCONTENT,USERNAME,VIDEOID) values(?,?,?)",
				comment.getCOMMENTCONTENT(),comment.getUSERNAME(),comment.getVIDEOID())>0;
	}
}
