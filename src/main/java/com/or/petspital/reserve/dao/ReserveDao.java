package com.or.petspital.reserve.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.or.petspital.reserve.vo.Reservation;

@Repository
public class ReserveDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace="com.or.petspital.reserve.reserveMapper";
	
	public void resInsert(Reservation reserveVO) {
		sqlSession.insert(namespace+".resInsert", reserveVO);
	}
	
	public List<Reservation> resSelectDate(String res_date) {
		
		HashMap hm = new HashMap();
		hm.put("res_date", res_date);
		List<Reservation> list = sqlSession.selectList(namespace+".resSelectDate", hm);
		
		return list;
	}
	
	public Reservation resSelectTime(Reservation reserveVO) {
		
		String res_date = reserveVO.getRes_date();
		String res_time = reserveVO.getRes_time();
		
		HashMap hm = new HashMap();
		hm.put("res_date", res_date);
		hm.put("res_time", res_time);
		
		return sqlSession.selectOne(namespace+".resSelectTime", hm);
	}

	public List<Reservation> resSelectList(Reservation reserveVO) {
		
		String res_id = reserveVO.getRes_id();
		HashMap hm = new HashMap();
		hm.put("res_id", res_id);
		
		return sqlSession.selectList(namespace+".resSelectList", hm);
	}

	public Reservation resSelectMemo(String res_num) {
		
		HashMap hm = new HashMap();
		hm.put("res_num", res_num);
		
		return sqlSession.selectOne(namespace+".resSelectMemo", hm);
	}

	public void resUpdateMemo(Reservation reserveVO) {
		HashMap hm = new HashMap();
		hm.put("res_num", reserveVO.getRes_num());
		hm.put("res_memo", reserveVO.getRes_memo());
		sqlSession.update(namespace+".resUpdateMemo", hm);
	}
	
	
	public int time_check(String date, String time) {
		
		HashMap hm = new HashMap();
		hm.put("res_date", date);
		hm.put("res_time", time);
		
		int result = sqlSession.selectOne(namespace+".time_check", hm);
		return result;
	}

	public int resDelete(int res_num) {
		
		HashMap hm = new HashMap();
		hm.put("res_num", res_num);
		return sqlSession.delete(namespace+".resDelete", hm);
	}



}
