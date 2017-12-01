package com.spimax.front.service;

import java.util.List;

import com.spimax.front.dao.FrontVideosDao;
import com.spimax.front.entity.Videos;
import com.spimax.front.util.BaseDao;
import com.spimax.front.util.PageData;

/**
 * ��Ƶ��ص�service
 * @author zhuzhen
 *
 */
public class FrontVideosService {
	FrontVideosDao fvd = new FrontVideosDao();
	/**
	 * ��ȡ��ҳ��ĳһ��������ݵ�����
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoHot(int VIDEOTYPEID,int num){
		return fvd.getHomeVideoHot(VIDEOTYPEID,num);
	}
	
	/**
	 * ��ȡ��ҳ��ĳһ��������ݵ���������
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoNew(int VIDEOTYPEID,int num){
		return fvd.getHomeVideoNew(VIDEOTYPEID,num);
	}
	
	
	/**
	 * ��ȡVIDEOTYPEID:
	 * 0����ȡȫվ���о��ǰ�������
	 * -1�����·���������
	 * ��������ȡ��Ӧ���͵�����
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getPaiHangVideo(int VIDEOTYPEID){
		
		return fvd.getPaiHangVideo(VIDEOTYPEID);
	}
	
	/**
	 * ͨ��VIDEOID��ȡ��VIDEO
	 * @param VIDEOID
	 * @return
	 */
	public Videos getVideosById(int VIDEOID) {
		return fvd.getVideosById(VIDEOID);
	}
	
	
	
	/**
	 * orcle�ķ�ҳ��ѯ
	 * @param VIDEOTYPEID ���ͱ��
	 * @param page ҳ��
	 * @param pageSize ����
	 * @return
	 */
	public PageData<Videos> getPageData(String paihang,int VIDEOTYPEID,int page,int pageSize){
		return fvd.getPageData(paihang,VIDEOTYPEID, page, pageSize);
	}
	
	
	/**
	 * ��ȡ�����ĳһ��������ݵ����а�
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoHot(int VIDEOTYPEID, int num){
		return fvd.getLeibieVideoHot(VIDEOTYPEID, num);
	}
	
	/**
	 * ��ȡ��ҳĳһ�������������
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoNew(int VIDEOTYPEID,int num){
		return fvd.getLeibieVideoNew(VIDEOTYPEID, num);
	}
	
	

	/**
	 * �����Ʒ
	 * @param videos
	 * @return
	 */
	public boolean addVideo(Videos videos) {
		return fvd.addVideo(videos);
	}
	
	/**
	 * orcle�ķ�ҳ��ѯ
	 * @param VIDEOTITLE ģ����ѯ����
	 * @param page ��ǰҳ
	 * @param pageSize ÿҳ��ʾ�Ĵ�С
	 * @return
	 */
	public PageData<Videos> getPageData(String VIDEOTITLE,int page,int pageSize){
		return fvd.getPageData(VIDEOTITLE, page, pageSize);	
	}
	
	
	/**
	 * �����Ƶ������
	 * @param VIDEOID
	 * @return
	 */
	public boolean addPlayercount(int VIDEOID) {
		return fvd.addPlayercount(VIDEOID);
	}
}
