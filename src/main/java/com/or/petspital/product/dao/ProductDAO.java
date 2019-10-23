package com.or.petspital.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.or.petspital.product.vo.ProductVO;

@Repository
public class ProductDAO {
	
@Autowired
SqlSession sqlSession;

String namespace = "com.or.petspital.product.productMapper";

	public List<ProductVO> productList() {
		return sqlSession.selectList(namespace+".productList");
		
	}

	

	

}
