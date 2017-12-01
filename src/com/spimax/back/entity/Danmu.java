package com.spimax.back.entity;

public class Danmu {
private int DANMUID;
private String DANMUCONTENT;
private double DANMUTIME;
private int VIDEOID;
private int DMSIZE;
private int DMPOSITION;

private Videos videos;

public int getDANMUID() {
	return DANMUID;
}

public void setDANMUID(int dANMUID) {
	DANMUID = dANMUID;
}

public String getDANMUCONTENT() {
	return DANMUCONTENT;
}

public void setDANMUCONTENT(String dANMUCONTENT) {
	DANMUCONTENT = dANMUCONTENT;
}

public double getDANMUTIME() {
	return DANMUTIME;
}

public void setDANMUTIME(double dANMUTIME) {
	DANMUTIME = dANMUTIME;
}

public int getVIDEOID() {
	return VIDEOID;
}

public void setVIDEOID(int vIDEOID) {
	VIDEOID = vIDEOID;
}

public int getDMSIZE() {
	return DMSIZE;
}

public void setDMSIZE(int dMSIZE) {
	DMSIZE = dMSIZE;
}

public int getDMPOSITION() {
	return DMPOSITION;
}

public void setDMPOSITION(int dMPOSITION) {
	DMPOSITION = dMPOSITION;
}

public Videos getVideos() {
	return videos;
}

public void setVideos(Videos videos) {
	this.videos = videos;
}

@Override
public String toString() {
	return "Danmu [DANMUID=" + DANMUID + ", DANMUCONTENT=" + DANMUCONTENT + ", DANMUTIME=" + DANMUTIME + ", VIDEOID="
			+ VIDEOID + ", DMSIZE=" + DMSIZE + ", DMPOSITION=" + DMPOSITION + ", videos=" + videos + "]";
}

public Danmu(int dANMUID, String dANMUCONTENT, double dANMUTIME, int vIDEOID, int dMSIZE, int dMPOSITION,
		Videos videos) {
	super();
	DANMUID = dANMUID;
	DANMUCONTENT = dANMUCONTENT;
	DANMUTIME = dANMUTIME;
	VIDEOID = vIDEOID;
	DMSIZE = dMSIZE;
	DMPOSITION = dMPOSITION;
	this.videos = videos;
}

public Danmu() {
	// TODO Auto-generated constructor stub
}

}