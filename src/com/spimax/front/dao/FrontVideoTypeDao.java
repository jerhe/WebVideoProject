package com.spimax.front.dao;

import java.util.List;

import com.spimax.back.entity.VideoType;
import com.spimax.front.util.BaseDao;

/**
 * ��Ƶ��ص�Dao
 * @author zhuzhen
 *
 */
public class FrontVideoTypeDao {
	
	/**
	 * ͨ��VIDEOTYPEID��ȡ��VideoType
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
	 * ��ȡ�ô��������
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
