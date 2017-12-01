package com.spimax.back.entity;

/**
 * 视频类型的实体类
 * @author zhuzhen
 *
 */
public class VideoType {
	private int VIDEOTYPEID;
	private String VIDEOTYPENAME;
	private int VIDEOTYPEPARENT;
	public VideoType() {
		// TODO Auto-generated constructor stub
	}
	public int getVIDEOTYPEID() {
		return VIDEOTYPEID;
	}
	public void setVIDEOTYPEID(int vIDEOTYPEID) {
		VIDEOTYPEID = vIDEOTYPEID;
	}
	public String getVIDEOTYPENAME() {
		return VIDEOTYPENAME;
	}
	public void setVIDEOTYPENAME(String vIDEOTYPENAME) {
		VIDEOTYPENAME = vIDEOTYPENAME;
	}
	public int getVIDEOTYPEPARENT() {
		return VIDEOTYPEPARENT;
	}
	public void setVIDEOTYPEPARENT(int vIDEOTYPEPARENT) {
		VIDEOTYPEPARENT = vIDEOTYPEPARENT;
	}
	@Override
	public String toString() {
		return "VideoType [VIDEOTYPEID=" + VIDEOTYPEID + ", VIDEOTYPENAME=" + VIDEOTYPENAME + ", VIDEOTYPEPARENT="
				+ VIDEOTYPEPARENT + "]";
	}
	public VideoType(int vIDEOTYPEID, String vIDEOTYPENAME, int vIDEOTYPEPARENT) {
		super();
		VIDEOTYPEID = vIDEOTYPEID;
		VIDEOTYPENAME = vIDEOTYPENAME;
		VIDEOTYPEPARENT = vIDEOTYPEPARENT;
	}
	
}
