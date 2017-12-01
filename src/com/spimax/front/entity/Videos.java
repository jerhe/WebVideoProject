package com.spimax.front.entity;

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

public String getUSERNAME() {
	return USERNAME;
}

public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}

public String getVIDEOTITLE() {
	return VIDEOTITLE;
}

public void setVIDEOTITLE(String vIDEOTITLE) {
	VIDEOTITLE = vIDEOTITLE;
}

public String getVIDEOTIME() {
	return VIDEOTIME;
}

public void setVIDEOTIME(String vIDEOTIME) {
	VIDEOTIME = vIDEOTIME;
}

public String getVIDEOCOVERURL() {
	return VIDEOCOVERURL;
}

public void setVIDEOCOVERURL(String vIDEOCOVERURL) {
	VIDEOCOVERURL = vIDEOCOVERURL;
}

public String getVIDEOURL() {
	return VIDEOURL;
}

public void setVIDEOURL(String vIDEOURL) {
	VIDEOURL = vIDEOURL;
}

public int getVIDEOFLAG() {
	return VIDEOFLAG;
}

public void setVIDEOFLAG(int vIDEOFLAG) {
	VIDEOFLAG = vIDEOFLAG;
}

public String getVIDEOREMARK() {
	return VIDEOREMARK;
}

public void setVIDEOREMARK(String vIDEOREMARK) {
	VIDEOREMARK = vIDEOREMARK;
}

@Override
public String toString() {
	return "Videos [VIDEOID=" + VIDEOID + ", VIDEOTYPEID=" + VIDEOTYPEID + ", VIDEOPLAYCOUNT=" + VIDEOPLAYCOUNT
			+ ", USERNAME=" + USERNAME + ", VIDEOTITLE=" + VIDEOTITLE + ", VIDEOTIME=" + VIDEOTIME + ", VIDEOCOVERURL="
			+ VIDEOCOVERURL + ", VIDEOURL=" + VIDEOURL + ", VIDEOFLAG=" + VIDEOFLAG + ", VIDEOREMARK=" + VIDEOREMARK
			+ "]";
}

public Videos(int vIDEOID, int vIDEOTYPEID, int vIDEOPLAYCOUNT, String uSERNAME, String vIDEOTITLE, String vIDEOTIME,
		String vIDEOCOVERURL, String vIDEOURL, int vIDEOFLAG, String vIDEOREMARK) {
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




}
