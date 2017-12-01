package com.spimax.back.entity;

public class Comment {
	private int COMMENTID; 
	private String COMMENTCONTENT;
	private String USERNAME;
	private int PARENTID;
	private int VIDEOID;
	private Videos VIDEOTITLE;
	
	public Comment(int cOMMENTID, String cOMMENTCONTENT, String uSERNAME, int pARENTID, int vIDEOID,
			Videos vIDEOTITLE, String cOMMENTTIME) {
		super();
		COMMENTID = cOMMENTID;
		COMMENTCONTENT = cOMMENTCONTENT;
		USERNAME = uSERNAME;
		PARENTID = pARENTID;
		VIDEOID = vIDEOID;
		VIDEOTITLE = vIDEOTITLE;
		COMMENTTIME = cOMMENTTIME;
	}
	public Videos getVIDEOTITLE() {
		return VIDEOTITLE;
	}
	public void setVIDEOTITLE(Videos vIDEOTITLE) {
		VIDEOTITLE = vIDEOTITLE;
	}
	@Override
	public String toString() {
		return "Comment [COMMENTID=" + COMMENTID + ", COMMENTCONTENT=" + COMMENTCONTENT + ", USERNAME=" + USERNAME
				+ ", PARENTID=" + PARENTID + ", VIDEOID=" + VIDEOID + ", VIDEOTITLE=" + VIDEOTITLE + ", COMMENTTIME="
				+ COMMENTTIME + "]";
	}
	private String COMMENTTIME;
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
	public int getVIDEOID() {
		return VIDEOID;
	}
	public void setVIDEOID(int VIDEOID) {
		this.VIDEOID = VIDEOID;
	}
	public String getCOMMENTTIME() {
		return COMMENTTIME;
	}
	public void setCOMMENTTIME(String cOMMENTTIME) {
		COMMENTTIME = cOMMENTTIME;
	}
    	public Comment() {
			// TODO Auto-generated constructor stub
		}
		public Comment(int cOMMENTID, String cOMMENTCONTENT, String uSERNAME, int pARENTID, int VIDEOID,
				String cOMMENTTIME) {
			super();
			COMMENTID = cOMMENTID;
			COMMENTCONTENT = cOMMENTCONTENT;
			USERNAME = uSERNAME;
			PARENTID = pARENTID;
			this.VIDEOID = VIDEOID;
			COMMENTTIME = cOMMENTTIME;
		}
    	
	
}
