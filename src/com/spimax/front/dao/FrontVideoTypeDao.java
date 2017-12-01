package com.spimax.front.dao;

import java.util.List;

import com.spimax.back.entity.VideoType;
import com.spimax.front.util.BaseDao;

/**
 * 视频相关的Dao
 * @author zhuzhen
 *
 */
public class FrontVideoTypeDao {
	
	/**
	 * 通过VIDEOTYPEID获取到VideoType
	 * @param VIDEOTYPEID
	 * @return
	 */
	public VideoType getTypeByVIDEOID(int VIDEOTYPEID) {
		List<VideoType> list= null;
		list= (List<VideoType>) BaseDao.select("select * from V_VIDEOTYPE where VIDEOTYPEID=?", VideoType.class,VIDEOTYPEID);
		if(list.isEmpty()) {
			return null;
		}else {
			return list.get(0);
		}

	}
	
	/**
	 * 获取该大类的子类
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<VideoType> getChildType(int VIDEOTYPEID){
		return (List<VideoType>) BaseDao.select("select * from V_VIDEOTYPE where VIDEOTYPEPARENT=?",VideoType.class, VIDEOTYPEID);
	}
	
	public int getTypeIdByTypeName(String typeName) {
		List<VideoType> list= (List<VideoType>) BaseDao.select("select * from V_VIDEOTYPE where VIDEOTYPENAME=?",VideoType.class, typeName);
		if (list.isEmpty()) {
			return -1;
		}else {
			return list.get(0).getVIDEOTYPEID();
		}
	}
}
