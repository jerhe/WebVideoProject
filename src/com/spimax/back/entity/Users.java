package com.spimax.back.entity;

public class Users {

private int USERID;
private String USERNAME;
private String USERPWD;
private String USERTEL;
private String HEADIMG;
private String USERBRITH;
private String USERREMARK;

public Users(int uSERID, String uSERNAME, String uSERPWD, String uSERTEL, String hEADIMG, String uSERBRITH,
		String uSERREMARK) {
	super();
	USERID = uSERID;
	USERNAME = uSERNAME;
	USERPWD = uSERPWD;
	USERTEL = uSERTEL;
	HEADIMG = hEADIMG;
	USERBRITH = uSERBRITH;
	USERREMARK = uSERREMARK;
}
@Override
public String toString() {
	return "Users [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + ", USERTEL=" + USERTEL
			+ ", HEADIMG=" + HEADIMG + ", USERBRITH=" + USERBRITH + ", USERREMARK=" + USERREMARK + "]";
}
public String getUSERTEL() {
	return USERTEL;
}
public void setUSERTEL(String uSERTEL) {
	USERTEL = uSERTEL;
}
public String getUSERREMARK() {
	return USERREMARK;
}
public void setUSERREMARK(String uSERREMARK) {
	USERREMARK = uSERREMARK;
}
public String getUSERBRITH() {
	return USERBRITH;
}
public void setUSERBRITH(String uSERBRITH) {
	USERBRITH = uSERBRITH;
}
public int getUSERID() {
	return USERID;
}
public void setUSERID(int uSERID) {
	USERID = uSERID;
}
public String getUSERNAME() {
	return USERNAME;
}
public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}
public String getUSERPWD() {
	return USERPWD;
}
public void setUSERPWD(String uSERPWD) {
	USERPWD = uSERPWD;
}

public String getHEADIMG() {
	return HEADIMG;
}
public void setHEADIMG(String hEADIMG) {
	HEADIMG = hEADIMG;
}
public Users() {
	// TODO Auto-generated constructor stub
}


}
