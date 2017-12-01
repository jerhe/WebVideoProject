package com.spimax.front.service;

import java.util.List;

import com.spimax.back.entity.VideoType;
import com.spimax.front.dao.FrontVideoTypeDao;
import com.spimax.front.util.BaseDao;

/**
 * ��Ƶ������صķ�����
 * @author zhuzhen
 *
 */
public class FrontVideoTypeService {
	FrontVideoTypeDao fvtd = new FrontVideoTypeDao();
	/**
	 * ͨ��VIDEOTYPEID��ȡ��VideoType
	 * @param VIDEOTYPEID
	 * @return
	 */
	public VideoType getTypeByVIDEOID(int VIDEOTYPEID) {
		return fvtd.getTypeByVIDEOID(VIDEOTYPEID);
	}
	
	
	/**
	 * ��ȡ�ô��������
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
