package com.spimax.back.entity;

public class Admins {
private int	ADMINID;
	private String ADMINNAME; 
	private String ADMINPWD;
	public Admins() {
		// TODO Auto-generated constructor stub
	}
	
	public int getADMINID() {
		return ADMINID;
	}

	public void setADMINID(int aDMINID) {
		ADMINID = aDMINID;
	}

	public String getADMINNAME() {
		return ADMINNAME;
	}

	public void setADMINNAME(String aDMINNAME) {
		ADMINNAME = aDMINNAME;
	}

	public String getADMINPWD() {
		return ADMINPWD;
	}

	public void setADMINPWD(String aDMINPWD) {
		ADMINPWD = aDMINPWD;
	}

	public Admins(int aDMINID, String aDMINNAME, String aDMINPWD) {
		super();
		ADMINID = aDMINID;
		ADMINNAME = aDMINNAME;
		ADMINPWD = aDMINPWD;
	}

	@Override
	public String toString() {
		return "Admins [ADMINID=" + ADMINID + ", ADMINNAME=" + ADMINNAME + ", ADMINPWD=" + ADMINPWD + "]";
	}
	
}
