package com.spimax.front.entity;

public class Danmu {
private int DANMID;
private String DANMUCONTENT;
private long DANMUTIME;
private int VIDEOID;
private int DMSIZE;
private int DMPOSITION;
private String DMCOLOR;

public Danmu() {
}

public Danmu(int dANMID, String dANMUCONTENT, long dANMUTIME, int vIDEOID, int dMSIZE, int dMPOSITION,
		String dMCOLOR) {
	super();
	DANMID = dANMID;
	DANMUCONTENT = dANMUCONTENT;
	DANMUTIME = dANMUTIME;
	VIDEOID = vIDEOID;
	DMSIZE = dMSIZE;
	DMPOSITION = dMPOSITION;
	DMCOLOR = dMCOLOR;
}


public Danmu(String dANMUCONTENT, long dANMUTIME, int vIDEOID, int dMSIZE, int dMPOSITION, String dMCOLOR) {
	super();
	DANMUCONTENT = dANMUCONTENT;
	DANMUTIME = dANMUTIME;
	VIDEOID = vIDEOID;
	DMSIZE = dMSIZE;
	DMPOSITION = dMPOSITION;
	DMCOLOR = dMCOLOR;
}

@Override
public String toString() {
	return "Danmu [DANMID=" + DANMID + ", DANMUCONTENT=" + DANMUCONTENT + ", DANMUTIME=" + DANMUTIME + ", VIDEOID="
			+ VIDEOID + ", DMSIZE=" + DMSIZE + ", DMPOSITION=" + DMPOSITION + ", DMCOLOR=" + DMCOLOR + "]";
}

public int getDANMID() {
	return DANMID;
}

public void setDANMID(int dANMID) {
	DANMID = dANMID;
}

public String getDANMUCONTENT() {
	return DANMUCONTENT;
}

public void setDANMUCONTENT(String dANMUCONTENT) {
	DANMUCONTENT = dANMUCONTENT;
}

public long getDANMUTIME() {
	return DANMUTIME;
}

public void setDANMUTIME(long dANMUTIME) {
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

public String getDMCOLOR() {
	return DMCOLOR;
}

public void setDMCOLOR(String dMCOLOR) {
	DMCOLOR = dMCOLOR;
}



}
