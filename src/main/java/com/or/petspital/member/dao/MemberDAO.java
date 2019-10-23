package com.or.petspital.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.or.petspital.member.vo.MemberVO;


@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.or.petspital.member.memberMapper";

	public MemberVO logincheck(MemberVO member) {
		System.out.println("===> Mybatis로 LOGIN");
		String user_id = member.getUser_id();
		String user_pw = member.getUser_pw();
		
		HashMap hm = new HashMap();
		hm.put("user_id", user_id);
		hm.put("user_pw", user_pw);
		
		return sqlSession.selectOne(namespace+".logincheck", hm);
	}
	

	public void insertUser(MemberVO vo) {
		System.out.println("===> Mybatis로 insert");
		MemberVO vo1 = vo;
		sqlSession.insert(namespace+".insertUser",vo1);
	}
	
	public void updateUser(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("===> Mybatis로 update");
		MemberVO vo1 = vo;
		sqlSession.update(namespace+".updateUser",vo1);
	}

	public int id_Check(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne(namespace+".idCheck",user_id);
		System.out.println(result + "개 있음");
		return result;
	}

	public MemberVO what_id(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("===> Mybatis로 아이디 찾기");
		String user_name = vo.getUser_name();
		String user_phone = vo.getUser_phone();
		
		HashMap hm2 = new HashMap();
		hm2.put("user_name", user_name);
		hm2.put("user_phone", user_phone);
		
		return sqlSession.selectOne(namespace+".what_id", hm2);
	}

	public MemberVO what_pw(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("===> Mybatis로 비밀번호 찾기");
		String user_id = vo.getUser_id();
		String user_name = vo.getUser_name();
		String user_phone = vo.getUser_phone();
		
		HashMap hm3 = new HashMap();
		hm3.put("user_id", user_id);
		hm3.put("user_name", user_name);
		hm3.put("user_phone", user_phone);
		
		return sqlSession.selectOne(namespace+".what_pw", hm3);
		
	}

/*
	public MemberVO myPage(MemberVO vo) {
		// TODO Auto-generated method stub
		System.out.println("==> Mybatis로 마이페이지에 정보 불러오깅");
		String id = memLoginOk.get
		return sqlSession.selectOne(namespace+".myPage",id);
	}
*/



	}
