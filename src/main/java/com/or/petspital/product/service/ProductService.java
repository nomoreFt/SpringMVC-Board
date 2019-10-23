package com.or.petspital.product.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.or.petspital.product.dao.ProductDAO;
import com.or.petspital.product.vo.ProductVO;

@Service("ProductService")
public class ProductService implements IProductService{
	
	@Autowired
	ProductDAO proDao;
	
	@Override
	public List<ProductVO> productList(){
		return proDao.productList();
	}






}
