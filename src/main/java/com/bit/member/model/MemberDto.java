package com.bit.member.model;

import java.util.Date;

public class MemberDto {
	private String id;
	private String name;
	private String pw;
	private String addr;
	private String gender; // 1 남자 2 여자
	private String pnum; // 하이픈인경우가 있어 String
	private String zcode; // 앞자리 0인경우가 있어 String
	private String bdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getZcode() {
		return zcode;
	}

	public void setZcode(String zcode) {
		this.zcode = zcode;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", name=" + name + ", pw=" + pw + ", addr=" + addr
				+ ", gender=" + gender + ", pnum=" + pnum + ", zcode=" + zcode + ", bdate=" + bdate + "]";
	}
	
	
}