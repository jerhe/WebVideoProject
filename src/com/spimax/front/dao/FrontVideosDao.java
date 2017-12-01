package com.spimax.front.dao;

import java.util.List;

import com.spimax.front.entity.Videos;
import com.spimax.front.util.BaseDao;
import com.spimax.front.util.PageData;

public class FrontVideosDao {
	
	
	/**
	 * ��ȡ�����ĳһ��������ݵ����а�
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
	 * ��ȡ��ҳĳһ�������������
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
	 * ��ȡVIDEOTYPEID:
	 * 0����ȡȫվ���о��ǰ�������
	 * -1�����·���������
	 * ��������ȡ��Ӧ���͵�����
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
	 * ͨ���û�VIDEOID��ȡ�����
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
	 * orcle�ķ�ҳ��ѯ
	 * @param paihang ��������
	 * @param VIDEOTYPEID ��������
	 * @param page ��ǰҳ
	 * @param pageSize ÿҳ��ʾ�Ĵ�С
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
	 * orcle�ķ�ҳ��ѯ
	 * @param VIDEOTITLE ģ����ѯ����
	 * @param page ��ǰҳ
	 * @param pageSize ÿҳ��ʾ�Ĵ�С
	 * @return
	 */
	public PageData<Videos> getPageData(String VIDEOTITLE,int page,int pageSize){
		return BaseDao.getPageByOracle("select * from V_VIDEOS where VIDEOTITLE like ? order by VIDEOPLAYCOUNT desc",page,pageSize,Videos.class,"%"+VIDEOTITLE+"%");	
	}
	
	/**
	 * ��ȡ�����ĳһ��������ݵ����а�
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
	 * ��ȡ��ҳĳһ�������������
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<Videos> getLeibieVideoNew(int VIDEOTYPEID,int num){
		return (List<Videos>) BaseDao.select("select * from (select * from V_VIDEOS where VIDEOTYPEID = ? order by VIDEOTIME desc)"
				+ " where rownum<=? order by rownum asc",
				Videos.class, VIDEOTYPEID,num);
	}
	
	/**
	 * �����Ʒ
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
	 * �����Ƶ������
	 * @param VIDEOID
	 * @return
	 */
	public boolean addPlayercount(int VIDEOID) {
		
		return BaseDao.execute("update V_VIDEOS set VIDEOPLAYCOUNT=VIDEOPLAYCOUNT+1 where VIDEOID=?", VIDEOID)>0;
	}
}
