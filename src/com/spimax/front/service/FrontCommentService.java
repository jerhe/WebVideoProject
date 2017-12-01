package com.spimax.front.service;

import java.util.List;

import com.spimax.front.dao.FrontCommentDao;
import com.spimax.front.entity.Comment;
import com.spimax.front.util.BaseDao;

public class FrontCommentService {
	FrontCommentDao fcd = new FrontCommentDao();
	
	/**
	 * ��ȡ����Ƶ������
	 * @param VIDEOID
	 * @return
	 */
	public List<Comment> getCommentByVIDEOID(int VIDEOID){
		return fcd.getCommentByVIDEOID(VIDEOID);
	}
	
	
	/**
	 * ���������������
	 * @param comment
	 * @return
	 */
	public boolean addComment(Comment comment) {
		return fcd.addComment(comment);
	}
}
