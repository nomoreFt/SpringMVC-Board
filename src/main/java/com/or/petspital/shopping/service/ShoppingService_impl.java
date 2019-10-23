package com.or.petspital.shopping.service;

import java.util.List;

import com.or.petspital.shopping.vo.DetailVO;
import com.or.petspital.shopping.vo.ShoppingVO;

public interface ShoppingService_impl {

	List<ShoppingVO> selectall();

	List<DetailVO> Detail(String d_Num);
	
}
