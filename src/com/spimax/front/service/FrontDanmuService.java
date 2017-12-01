package com.spimax.front.service;

import java.util.List;

import com.spimax.front.dao.FrontDanmuDao;
import com.spimax.front.entity.Danmu;

/**
 * ��Ļ��صķ���
 * @author zhuzhen
 *
 */
public class FrontDanmuService {
	FrontDanmuDao fdd = new FrontDanmuDao();
	
	/**
	 * ͨ����Ƶ��Ż�ȡ����Ƶ�����е�Ļ
	 * @param VIDEOID
	 * @return
	 */
	public List<Danmu> getDanmuByVIDEOID(int VIDEOID){
		
		return fdd.getDanmuByVIDEOID(VIDEOID);
	}
	
	/**
	 * ��ӵ�Ļ
	 * @param danmu
	 * @return
	 */
	public boolean addDanmu(Danmu danmu) {
		return fdd.addDanmu(danmu);
	}
}
