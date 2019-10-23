package com.or.petspital.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.or.petspital.shopping.DAO.ShoppingDAO;
import com.or.petspital.shopping.vo.DetailVO;
import com.or.petspital.shopping.vo.ShoppingVO;

@Service(value = "ShoppingService")
public class ShoppingService implements ShoppingService_impl {

	@Autowired
	ShoppingDAO dao;

	@Override
	public List<ShoppingVO> selectall() {
		List<ShoppingVO> list = dao.selectAll();
		return list;

	}

	@Override
	public List<DetailVO> Detail(String d_Num) {
		List<DetailVO> list = dao.Detail(d_Num);
		return list;
	}

}
