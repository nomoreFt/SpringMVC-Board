package com.or.petspital.member.service;

import java.sql.SQLException;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.or.petspital.member.vo.MemberVO;


public interface MemberService {

	public boolean logincheck(HttpServletRequest request,MemberVO member);
	
	public String loginIdCheck(MemberVO member);

	//회원가입
	public void insertUser(MemberVO vo);
	//회원가입시 아이디 중복체크
	public int id_Check(String user_id);
}
