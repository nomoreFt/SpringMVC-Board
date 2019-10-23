package com.or.petspital.shopping.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mchange.v2.c3p0.stmt.GooGooStatementCache;
import com.or.petspital.shopping.controller.ShoppingController;
import com.or.petspital.shopping.service.ShoppingService;
import com.or.petspital.shopping.vo.DetailVO;
import com.or.petspital.shopping.vo.ReplyVO;
import com.or.petspital.shopping.vo.ShoppingVO;

@Repository
public class ShoppingDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.or.petspital.shopping.shopping-Mapper";

	public List<ShoppingVO> selectAll() {
		List<ShoppingVO> list = sqlSession.selectList(namespace + ".selectAll");
		return list;
	}

	public List<DetailVO> Detail(String d_Num) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("D_NUM", d_Num);
		List<DetailVO> list = sqlSession.selectList("Detail", map);
		return list;

	}
	
	public ReplyVO InsertReply(String gdsNum){
		
		
		return null;

		
		
	}
	

}
