package com.spimax.front.dao;

import java.util.List;

import com.spimax.front.entity.Videos;
import com.spimax.front.util.BaseDao;
import com.spimax.front.util.PageData;

public class FrontVideosDao {
	
	
	/**
	 * 获取主题的某一个类的数据的排行榜
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoHot(int VIDEOTYPEID, int num){
		return (List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOTYPEID in "
				+ "(select VIDEOTYPEID from V_VIDEOTYPE where VIDEOTYPEPARENT=? and VIDEOFLAG=1) order by VIDEOPLAYCOUNT desc)"
				+ " where rownum<=? order by rownum asc",
				Videos.class, VIDEOTYPEID,num);
		
		/*SELECT * FROM 
		(SELECT * FROM CUSTOMER ORDER BY NAME) 
		WHERE ROWNUM <= 3 
		ORDER BY ROWNUM ASC*/
	}
	
	/**
	 * 获取主页某一个类的最新内容
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getHomeVideoNew(int VIDEOTYPEID,int num){
		return (List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOTYPEID in "
				+ "(select VIDEOTYPEID from V_VIDEOTYPE where VIDEOTYPEPARENT=? and VIDEOFLAG=1) order by VIDEOTIME desc)"
				+ " where rownum<=? order by rownum asc",
				Videos.class, VIDEOTYPEID,num);
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
		List<Videos> list=null;
		if(VIDEOTYPEID==-1) {
			list=(List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS  where VIDEOFLAG=1 order by VIDEOTIME desc)"
					+ " where rownum<=20  order by rownum asc",
					Videos.class, null);
		}else if(VIDEOTYPEID==0){
			list=(List<Videos>)BaseDao.select("select * from (select * from V_VIDEOS  where VIDEOFLAG=1 order by VIDEOPLAYCOUNT desc)"
					+ " where rownum<=20 order by rownum asc",
					Videos.class, null);
		}else {
			list=(List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOFLAG=1 and VIDEOTYPEID in "
					+ "(select VIDEOTYPEID from V_VIDEOTYPE where VIDEOTYPEPARENT=?) order by VIDEOPLAYCOUNT desc)"
					+ " where rownum<=20 order by rownum asc",
					Videos.class, VIDEOTYPEID);
		}
		return list;
	}
	
	/**
	 * 通过用户VIDEOID获取到编号
	 * @param VIDEOID
	 * @return
	 */
	public Videos getVideosById(int VIDEOID) {
		List<Videos> list=null;
		list = (List<Videos>)BaseDao.select("select * from V_VIDEOS where VIDEOID=? ", Videos.class, VIDEOID);
		if(list.isEmpty()) {
			return null;
		}else {
			return list.get(0);
		}
	}
	
	/**
	 * orcle的分页查询
	 * @param paihang 排序类型
	 * @param VIDEOTYPEID 分类类型
	 * @param page 当前页
	 * @param pageSize 每页显示的大小
	 * @return
	 */
	public PageData<Videos> getPageData(String paihang,int VIDEOTYPEID,int page,int pageSize){
		if(paihang.equals("1")) {
			return BaseDao.getPageByOracle("select * from V_VIDEOS where VIDEOTYPEID=? order by VIDEOPLAYCOUNT desc",page,pageSize,Videos.class,VIDEOTYPEID);
		}else {
			return BaseDao.getPageByOracle("select * from V_VIDEOS where VIDEOTYPEID=? order by VIDEOTIME desc",page,pageSize,Videos.class,VIDEOTYPEID);
		}
		
	}
	/**
	 * orcle的分页查询
	 * @param VIDEOTITLE 模糊查询标题
	 * @param page 当前页
	 * @param pageSize 每页显示的大小
	 * @return
	 */
	public PageData<Videos> getPageData(String VIDEOTITLE,int page,int pageSize){
		return BaseDao.getPageByOracle("select * from V_VIDEOS where VIDEOTITLE like ? order by VIDEOPLAYCOUNT desc",page,pageSize,Videos.class,"%"+VIDEOTITLE+"%");	
	}
	
	/**
	 * 获取主题的某一个类的数据的排行榜
	 * @param VIDEOTYPEID
	 * @return
	 */
	
	public List<Videos> getLeibieVideoHot(int VIDEOTYPEID, int num){
		return (List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOTYPEID =? order by VIDEOPLAYCOUNT desc)"
				+ " where rownum<=? order by rownum asc",
				Videos.class, VIDEOTYPEID,num);
		
		/*SELECT * FROM 
		(SELECT * FROM CUSTOMER ORDER BY NAME) 
		WHERE ROWNUM <= 3 
		ORDER BY ROWNUM ASC*/
	}
	
	/**
	 * 获取主页某一个类的最新内容
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoNew(int VIDEOTYPEID,int num){
		return (List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOTYPEID = ? order by VIDEOTIME desc)"
				+ " where rownum<=? order by rownum asc",
				Videos.class, VIDEOTYPEID,num);
	}
	
	/**
	 * 添加商品
	 * @param videos
	 * @return
	 */
	public boolean addVideo(Videos videos) {
		return BaseDao.execute("insert into V_VIDEOS(VIDEOTYPEID,VIDEOPLAYCOUNT,USERNAME,"
				+ "VIDEOTITLE,VIDEOCOVERURL,VIDEOURL,VIDEOFLAG,VIDEOREMARK) values (?,?,?,?,?,?,?,?)"
				,videos.getVIDEOTYPEID(),0,videos.getUSERNAME(),videos.getVIDEOTITLE(),videos.getVIDEOCOVERURL()
				,videos.getVIDEOURL(),0,videos.getVIDEOREMARK())>0;
	}
	
	/**
	 * 添加视频播放量
	 * @param VIDEOID
	 * @return
	 */
	public boolean addPlayercount(int VIDEOID) {
		
		return BaseDao.execute("update V_VIDEOS set VIDEOPLAYCOUNT=VIDEOPLAYCOUNT+1 where VIDEOID=?", VIDEOID)>0;
	}
}
