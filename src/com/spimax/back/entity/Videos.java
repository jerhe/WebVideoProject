package com.spimax.back.entity;

public class Videos {
private int VIDEOID;
private int VIDEOTYPEID;
private int VIDEOPLAYCOUNT;
private String USERNAME;
private String VIDEOTITLE;
private String VIDEOTIME;
private String VIDEOCOVERURL;
private String VIDEOURL;
private int  VIDEOFLAG;
private String VIDEOREMARK;
private VideoType videoType;

public VideoType getVideoType() {
	return videoType;
}

public void setVideoType(VideoType videoType) {
	this.videoType = videoType;
}

public Videos(int vIDEOID, int vIDEOTYPEID, int vIDEOPLAYCOUNT, String uSERNAME, String vIDEOTITLE,
		String vIDEOTIME, String vIDEOCOVERURL, String vIDEOURL, int vIDEOFLAG, String vIDEOREMARK) {
	super();
	VIDEOID = vIDEOID;
	VIDEOTYPEID = vIDEOTYPEID;
	VIDEOPLAYCOUNT = vIDEOPLAYCOUNT;
	USERNAME = uSERNAME;
	VIDEOTITLE = vIDEOTITLE;
	VIDEOTIME = vIDEOTIME;
	VIDEOCOVERURL = vIDEOCOVERURL;
	VIDEOURL = vIDEOURL;
	VIDEOFLAG = vIDEOFLAG;
	VIDEOREMARK = vIDEOREMARK;
}

public String getVIDEOREMARK() {
	return VIDEOREMARK;
}

public void setVIDEOREMARK(String vIDEOREMARK) {
	VIDEOREMARK = vIDEOREMARK;
}



public void setVIDEOTIME(String vIDEOTIME) {
	VIDEOTIME = vIDEOTIME;
}

public int getVIDEOFLAG() {
	return VIDEOFLAG;
}



@Override
public String toString() {
	return "Videos [VIDEOID=" + VIDEOID + ", VIDEOTYPEID=" + VIDEOTYPEID + ", VIDEOPLAYCOUNT=" + VIDEOPLAYCOUNT
			+ ", USERNAME=" + USERNAME + ", VIDEOTITLE=" + VIDEOTITLE + ", VIDEOTIME=" + VIDEOTIME + ", VIDEOCOVERURL="
			+ VIDEOCOVERURL + ", VIDEOURL=" + VIDEOURL + ", VIDEOFLAG=" + VIDEOFLAG + ", VIDEOREMARK=" + VIDEOREMARK
			+ ", videoType=" + videoType + "]";
}

public void setVIDEOFLAG(int vIDEOFLAG) {
	VIDEOFLAG = vIDEOFLAG;
}

public String getUSERNAME() {
	return USERNAME;
}

public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}

public String getVIDEOCOVERURL() {
	return VIDEOCOVERURL;
}

public void setVIDEOCOVERURL(String VIDEOCOVERURL) {
	this.VIDEOCOVERURL = VIDEOCOVERURL;
}

public String getVIDEOURL() {
	return VIDEOURL;
}

public void setVIDEOURL(String VIDEOURL) {
	this.VIDEOURL = VIDEOURL;
}





public String getVIDEOTITLE() {
	return VIDEOTITLE;
}
public void setVIDEOTITLE(String VIDEOTITLE) {
	this.VIDEOTITLE = VIDEOTITLE;
}
public String getVIDEOTIME() {
	return VIDEOTIME;
}

public Videos() {
	// TODO Auto-generated constructor stub
}

public int getVIDEOID() {
	return VIDEOID;
}

public void setVIDEOID(int vIDEOID) {
	VIDEOID = vIDEOID;
}

public int getVIDEOTYPEID() {
	return VIDEOTYPEID;
}

public void setVIDEOTYPEID(int vIDEOTYPEID) {
	VIDEOTYPEID = vIDEOTYPEID;
}

public int getVIDEOPLAYCOUNT() {
	return VIDEOPLAYCOUNT;
}

public void setVIDEOPLAYCOUNT(int vIDEOPLAYCOUNT) {
	VIDEOPLAYCOUNT = vIDEOPLAYCOUNT;
}

public Videos(int vIDEOID, int vIDEOTYPEID, int vIDEOPLAYCOUNT, String uSERNAME, String vIDEOTITLE,
		String vIDEOTIME, String vIDEOCOVERURL, String vIDEOURL, int vIDEOFLAG) {
	super();
	VIDEOID = vIDEOID;
	VIDEOTYPEID = vIDEOTYPEID;
	VIDEOPLAYCOUNT = vIDEOPLAYCOUNT;
	USERNAME = uSERNAME;
	VIDEOTITLE = vIDEOTITLE;
	VIDEOTIME = vIDEOTIME;
	VIDEOCOVERURL = vIDEOCOVERURL;
	VIDEOURL = vIDEOURL;
	VIDEOFLAG = vIDEOFLAG;
}

public Videos(int vIDEOID, int vIDEOTYPEID, int vIDEOPLAYCOUNT, String uSERNAME, String vIDEOTITLE, String vIDEOTIME,
		String vIDEOCOVERURL, String vIDEOURL, int vIDEOFLAG, String vIDEOREMARK, VideoType videoType) {
	super();
	VIDEOID = vIDEOID;
	VIDEOTYPEID = vIDEOTYPEID;
	VIDEOPLAYCOUNT = vIDEOPLAYCOUNT;
	USERNAME = uSERNAME;
	VIDEOTITLE = vIDEOTITLE;
	VIDEOTIME = vIDEOTIME;
	VIDEOCOVERURL = vIDEOCOVERURL;
	VIDEOURL = vIDEOURL;
	VIDEOFLAG = vIDEOFLAG;
	VIDEOREMARK = vIDEOREMARK;
	this.videoType = videoType;
}




}
