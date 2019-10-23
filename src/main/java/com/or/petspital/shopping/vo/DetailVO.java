package com.or.petspital.shopping.vo;

public class DetailVO {
	private int PD_Num;
	private int D_Num;
	private String D_img;

	public DetailVO() {

	}

	public DetailVO(int pD_Num, int d_Num, String d_img) {

		this.PD_Num = pD_Num;
		this.D_Num = d_Num;
		this.D_img = d_img;
	}

	public int getPD_Num() {
		return PD_Num;
	}

	public void setPD_Num(int pD_Num) {
		this.PD_Num = pD_Num;
	}

	public int getD_Num() {
		return D_Num;
	}

	public void setD_Num(int d_Num) {
		this.D_Num = d_Num;
	}

	public String getD_img() {
		return D_img;
	}

	public void setD_img(String d_img) {
		this.D_img = d_img;
	}

}
