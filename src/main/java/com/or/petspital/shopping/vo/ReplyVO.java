package com.or.petspital.shopping.vo;

import java.sql.Date;

public class ReplyVO {

	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;

	public ReplyVO() {

		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int gdsNum, String userId, int repNum, String repCon, Date repDate) {

		this.gdsNum = gdsNum;
		this.userId = userId;
		this.repNum = repNum;
		this.repCon = repCon;
		this.repDate = repDate;
	}

	public int getGdsNum() {
		return gdsNum;
	}

	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getRepCon() {
		return repCon;
	}

	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

}
