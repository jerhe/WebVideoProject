package com.spimax.front.service;

import java.util.List;

import com.spimax.front.dao.FrontVideosDao;
import com.spimax.front.entity.Videos;
import com.spimax.front.util.BaseDao;
import com.spimax.front.util.PageData;

/**
 * 视频相关的service
 * @author zhuzhen
 *
 */
public class FrontVideosService {
	FrontVideosDao fvd = new FrontVideosDao();
	/**
	 * 获取首页的某一个类的数据的排行
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoHot(int VIDEOTYPEID,int num){
		return fvd.getHomeVideoHot(VIDEOTYPEID,num);
	}
	
	/**
	 * 获取首页的某一个类的数据的最新内容
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoNew(int VIDEOTYPEID,int num){
		return fvd.getHomeVideoNew(VIDEOTYPEID,num);
	}
	
	
	/**
	 * 获取VIDEOTYPEID:
	 * 0：获取全站排行就是按播放数
	 * -1：最新发布的排行
	 * 其他：获取对应类型的排行
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getPaiHangVideo(int VIDEOTYPEID){
		
		return fvd.getPaiHangVideo(VIDEOTYPEID);
	}
	
	/**
	 * 通过VIDEOID获取到VIDEO
	 * @param VIDEOID
	 * @return
	 */
	public Videos getVideosById(int VIDEOID) {
		return fvd.getVideosById(VIDEOID);
	}
	
	
	
	/**
	 * orcle的分页查询
	 * @param VIDEOTYPEID 类型编号
	 * @param page 页号
	 * @param pageSize 数量
	 * @return
	 */
	public PageData<Videos> getPageData(String paihang,int VIDEOTYPEID,int page,int pageSize){
		return fvd.getPageData(paihang,VIDEOTYPEID, page, pageSize);
	}
	
	
	/**
	 * 获取主题的某一个类的数据的排行榜
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoHot(int VIDEOTYPEID, int num){
		return fvd.getLeibieVideoHot(VIDEOTYPEID, num);
	}
	
	/**
	 * 获取主页某一个类的最新内容
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoNew(int VIDEOTYPEID,int num){
		return fvd.getLeibieVideoNew(VIDEOTYPEID, num);
	}
	
	

	/**
	 * 添加商品
	 * @param videos
	 * @return
	 */
	public boolean addVideo(Videos videos) {
		return fvd.addVideo(videos);
	}
	
	/**
	 * orcle的分页查询
	 * @param VIDEOTITLE 模糊查询标题
	 * @param page 当前页
	 * @param pageSize 每页显示的大小
	 * @return
	 */
	public PageData<Videos> getPageData(String VIDEOTITLE,int page,int pageSize){
		return fvd.getPageData(VIDEOTITLE, page, pageSize);	
	}
	
	
	/**
	 * 添加视频播放量
	 * @param VIDEOID
	 * @return
	 */
	public boolean addPlayercount(int VIDEOID) {
		return fvd.addPlayercount(VIDEOID);
	}
}
