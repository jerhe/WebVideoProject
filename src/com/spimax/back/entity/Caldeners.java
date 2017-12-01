package com.spimax.back.entity;

public class Caldeners {
private int CALENDERID;
private String CALENDERTITLE;
private String CALENDERCONTENT;
private int CYEAR;
private int CDAY;
private int CMONTH;
private int ADMINID;
private Admins ad;
public int getCALENDERID() {
	return CALENDERID;
}
public void setCALENDERID(int cALENDERID) {
	CALENDERID = cALENDERID;
}
public String getCALENDERTITLE() {
	return CALENDERTITLE;
}
public void setCALENDERTITLE(String cALENDERTITLE) {
	CALENDERTITLE = cALENDERTITLE;
}

public String getCALENDERCONTENT() {
	return CALENDERCONTENT;
}
public void setCALENDERCONTENT(String cALENDERCONTENT) {
	CALENDERCONTENT = cALENDERCONTENT;
}
public int getCYEAR() {
	return CYEAR;
}
public void setCYEAR(int cYEAR) {
	CYEAR = cYEAR;
}
public int getCDAY() {
	return CDAY;
}
public void setCDAY(int cDAY) {
	CDAY = cDAY;
}
public int getCMONTH() {
	return CMONTH;
}
public void setCMONTH(int cMONTH) {
	CMONTH = cMONTH;
}
public int getADMINID() {
	return ADMINID;
}
public void setADMINID(int aDMINID) {
	ADMINID = aDMINID;
}
public Admins getAd() {
	return ad;
}
public void setAd(Admins ad) {
	this.ad = ad;
}
public Caldeners(int cALENDERID, String cALENDERTITLE, String cALENDERCONENT, int cYEAR, int cDAY, int cMONTH,
		int aDMINID, Admins ad) {
	super();
	CALENDERID = cALENDERID;
	CALENDERTITLE = cALENDERTITLE;
	CALENDERCONTENT = cALENDERCONENT;
	CYEAR = cYEAR;
	CDAY = cDAY;
	CMONTH = cMONTH;
	ADMINID = aDMINID;
	this.ad = ad;
}
@Override
public String toString() {
	return "Caldeners [CALENDERID=" + CALENDERID + ", CALENDERTITLE=" + CALENDERTITLE + ", CALENDERCONENT="
			+ CALENDERCONTENT + ", CYEAR=" + CYEAR + ", CDAY=" + CDAY + ", CMONTH=" + CMONTH + ", ADMINID=" + ADMINID
			+ ", ad=" + ad + "]";
}
public Caldeners() {
	// TODO Auto-generated constructor stub
}
}
