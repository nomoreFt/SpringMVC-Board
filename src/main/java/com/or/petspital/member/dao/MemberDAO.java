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
		
		String user_id = member.getUser_id();
		String user_pw = member.getUser_pw();
		
		HashMap hm = new HashMap();
		hm.put("user_id", user_id);
		hm.put("user_pw", user_pw);
		
		return sqlSession.selectOne(namespace+".logincheck", hm);
	}
	
	public String loginIdCheck(MemberVO member) {
		
		String user_id = member.getUser_id();
		return sqlSession.selectOne(namespace+".loginIdCheck", user_id);
	}

	public void insertUser(MemberVO vo) {
		System.out.println("===> Mybatis로 회원가입");
		MemberVO vo1 = vo;
		sqlSession.insert(namespace+".insertUser",vo1);
	}

	public int id_Check(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne(namespace+".idCheck",user_id);
		System.out.println(result + "결과값");
		return result;
	}







	}
