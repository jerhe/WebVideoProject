package com.spimax.front.service;

import java.util.List;

import com.spimax.back.entity.VideoType;
import com.spimax.front.dao.FrontVideoTypeDao;
import com.spimax.front.util.BaseDao;

/**
 * 视频类型相关的服务类
 * @author zhuzhen
 *
 */
public class FrontVideoTypeService {
	FrontVideoTypeDao fvtd = new FrontVideoTypeDao();
	/**
	 * 通过VIDEOTYPEID获取到VideoType
	 * @param VIDEOTYPEID
	 * @return
	 */
	public VideoType getTypeByVIDEOID(int VIDEOTYPEID) {
		return fvtd.getTypeByVIDEOID(VIDEOTYPEID);
	}
	
	
	/**
	 * 获取该大类的子类
	 * @param VIDEOTYPEID
	 * @return
	 */
	public List<VideoType> getChildType(int VIDEOTYPEID){
		return fvtd.getChildType(VIDEOTYPEID);
	}
	
	public int getTypeIdByTypeName(String typeName) {
		return fvtd.getTypeIdByTypeName(typeName);
	}
}
