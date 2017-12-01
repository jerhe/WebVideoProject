package com.spimax.front.data;

import java.util.List;

import com.spimax.front.entity.Videos;

/**
 * 排行榜数据类
 * @author zhuzhen
 *
 */
public class PaiHangData {
	private int VIDEOTYPEID;
	private List<Videos> phData;
	@Override
	public String toString() {
		return "PaiHangData [VIDEOTYPEID=" + VIDEOTYPEID + ", phData=" + phData + "]";
	}
	public int getVIDEOTYPEID() {
		return VIDEOTYPEID;
	}
	public void setVIDEOTYPEID(int vIDEOTYPEID) {
		VIDEOTYPEID = vIDEOTYPEID;
	}
	public List<Videos> getPhData() {
		return phData;
	}
	public void setPhData(List<Videos> phData) {
		this.phData = phData;
	}
	public PaiHangData(int vIDEOTYPEID, List<Videos> phData) {
		VIDEOTYPEID = vIDEOTYPEID;
		this.phData = phData;
	}
	
	public PaiHangData() {
	}
	
}
