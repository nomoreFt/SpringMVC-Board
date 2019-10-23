package com.or.petspital.coupon.service;

import java.util.List;

import com.or.petspital.coupon.vo.CouponVO;

public interface ICouponService {

	List<CouponVO> couponNum(String mem_num);


	void insertCoupon(CouponVO couponVO);

}
