package com.spimax.front.service;

import java.util.List;

import com.spimax.front.dao.FrontDanmuDao;
import com.spimax.front.entity.Danmu;

/**
 * 弹幕相关的服务
 * @author zhuzhen
 *
 */
public class FrontDanmuService {
	FrontDanmuDao fdd = new FrontDanmuDao();
	
	/**
	 * 通过视频编号获取该视频的所有弹幕
	 * @param VIDEOID
	 * @return
	 */
	public List<Danmu> getDanmuByVIDEOID(int VIDEOID){
		
		return fdd.getDanmuByVIDEOID(VIDEOID);
	}
	
	/**
	 * 添加弹幕
	 * @param danmu
	 * @return
	 */
	public boolean addDanmu(Danmu danmu) {
		return fdd.addDanmu(danmu);
	}
}
