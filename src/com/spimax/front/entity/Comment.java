package com.spimax.front.entity;

public class Comment {
	private int COMMENTID; 
	private String COMMENTCONTENT;
	private String USERNAME;
	private int PARENTID;
	private String VIDEOID;
	private String COMMENTTIME;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public int getCOMMENTID() {
		return COMMENTID;
	}

	public void setCOMMENTID(int cOMMENTID) {
		COMMENTID = cOMMENTID;
	}

	public String getCOMMENTCONTENT() {
		return COMMENTCONTENT;
	}

	public void setCOMMENTCONTENT(String cOMMENTCONTENT) {
		COMMENTCONTENT = cOMMENTCONTENT;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public int getPARENTID() {
		return PARENTID;
	}

	public void setPARENTID(int pARENTID) {
		PARENTID = pARENTID;
	}

	public String getVIDEOID() {
		return VIDEOID;
	}

	public void setVIDEOID(String vIDEOID) {
		VIDEOID = vIDEOID;
	}

	public String getCOMMENTTIME() {
		return COMMENTTIME;
	}

	public void setCOMMENTTIME(String cOMMENTTIME) {
		COMMENTTIME = cOMMENTTIME;
	}

	@Override
	public String toString() {
		return "Comment [COMMENTID=" + COMMENTID + ", COMMENTCONTENT=" + COMMENTCONTENT + ", USERNAME=" + USERNAME
				+ ", PARENTID=" + PARENTID + ", VIDEOID=" + VIDEOID + ", COMMENTTIME=" + COMMENTTIME + "]";
	}

	public Comment(int cOMMENTID, String cOMMENTCONTENT, String uSERNAME, int pARENTID, String vIDEOID,
			String cOMMENTTIME) {
		super();
		COMMENTID = cOMMENTID;
		COMMENTCONTENT = cOMMENTCONTENT;
		USERNAME = uSERNAME;
		PARENTID = pARENTID;
		VIDEOID = vIDEOID;
		COMMENTTIME = cOMMENTTIME;
	}
	
    	
	
}
