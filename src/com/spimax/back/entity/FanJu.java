package com.spimax.back.entity;

public class FanJu {
	private int FANJUID;
	private String VIDEOID;
	private String FANJUNAME;
	private String FANJUTIME;
	private String FANJUIMGURL;
	private String FANJUREMARK;
	
	public String getFANJUIMGURL() {
		return FANJUIMGURL;
	}

	public void setFANJUIMGURL(String fANJUIMGURL) {
		FANJUIMGURL = fANJUIMGURL;
	}

	public String getFANJUREMARK() {
		return FANJUREMARK;
	}

	public void setFANJUREMARK(String fANJUREMARK) {
		FANJUREMARK = fANJUREMARK;
	}

	public FanJu() {
		// TODO Auto-generated constructor stub
	}
	
	public int getFANJUID() {
		return FANJUID;
	}

	public void setFANJUID(int fANJUID) {
		FANJUID = fANJUID;
	}

	public String getVIDEOID() {
		return VIDEOID;
	}

	public void setVIDEOID(String VIDEOID) {
		this.VIDEOID = VIDEOID;
	}

	public String getFANJUNAME() {
		return FANJUNAME;
	}

	public void setFANJUNAME(String fANJUNAME) {
		FANJUNAME = fANJUNAME;
	}

	@Override
	public String toString() {
		return "FanJu [FANJUID=" + FANJUID + ", VIDEOID=" + VIDEOID + ", FANJUNAME=" + FANJUNAME + ", FANJUTIME="
				+ FANJUTIME + "]";
	}

	public String getFANJUTIME() {
		return FANJUTIME;
	}

	public void setFANJUTIME(String fANJUTIME) {
		FANJUTIME = fANJUTIME;
	}

	public FanJu(int fANJUID, String VIDEOID, String fANJUNAME, String fANJUTIME) {
		super();
		FANJUID = fANJUID;
		this.VIDEOID = VIDEOID;
		FANJUNAME = fANJUNAME;
		FANJUTIME = fANJUTIME;
	}

	public FanJu(int fANJUID, String vIDEOID, String fANJUNAME, String fANJUTIME, String fANJUIMGURL,
			String fANJUREMARK) {
		super();
		FANJUID = fANJUID;
		VIDEOID = vIDEOID;
		FANJUNAME = fANJUNAME;
		FANJUTIME = fANJUTIME;
		FANJUIMGURL = fANJUIMGURL;
		FANJUREMARK = fANJUREMARK;
	}
	
	
}
