package com.spimax.front.dao;

import java.util.List;

import com.spimax.front.entity.Danmu;
import com.spimax.front.util.BaseDao;

/**
 * 弹幕相关的Dao
 * @author zhuzhen
 *
 */
public class FrontDanmuDao {
	
	
	/**
	 * 通过视频编号获取该视频的所有弹幕
	 * @param VIDEOID
	 * @return
	 */
	public List<Danmu> getDanmuByVIDEOID(int VIDEOID){
		List<Danmu> list= null;
		list= (List<Danmu>) BaseDao.select("select * from V_DANMU where VIDEOID=?", Danmu.class,VIDEOID);
		if (list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	
	/**
	 * 添加弹幕
	 * @param danmu
	 * @return
	 */
	public boolean addDanmu(Danmu danmu) {
		return BaseDao.execute("insert into V_DANMU(DANMUCONTENT,DANMUTIME,VIDEOID,DMSIZE,DMPOSITION,DMCOLOR) values(?,?,?,?,?,?)"
				,danmu.getDANMUCONTENT(),danmu.getDANMUTIME(),danmu.getVIDEOID(),danmu.getDMSIZE()
				,danmu.getDMPOSITION(),danmu.getDMCOLOR())>0;
	}
}
