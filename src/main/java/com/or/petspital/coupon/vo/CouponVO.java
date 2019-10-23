package com.or.petspital.coupon.vo;

public class CouponVO {
	int coupon_num;
	String coupon_code;
	String mem_num;
	public CouponVO(int coupon_num, String coupon_code, String mem_num) {

		this.coupon_num = coupon_num;
		this.coupon_code = coupon_code;
		this.mem_num = mem_num;
	}
	public CouponVO() {

	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public String getMem_num() {
		return mem_num;
	}
	public void setMem_num(String mem_num) {
		this.mem_num = mem_num;
	}

}