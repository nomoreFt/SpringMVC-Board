package com.or.petspital.coupon.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.or.petspital.coupon.vo.CouponVO;


@Repository
public class CouponDAO {
	@Autowired
	SqlSession sqlSession;

	String namespace = "com.or.petspital.coupon.couponMapper";

		public List<CouponVO> couponNum(String mem_num) {
			return sqlSession.selectList(namespace+".couponNum", mem_num);
			
		}

		public void insertCoupon(CouponVO couponVO) {
			
			HashMap hm = new HashMap();
			hm.put("mem_num", couponVO.getMem_num());
			hm.put("coupon_code", couponVO.getCoupon_code());
			
			sqlSession.insert(namespace+".insertCoupon", hm);
		}
}
