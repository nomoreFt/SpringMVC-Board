package com.or.petspital.member.service;

import java.sql.SQLException;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.or.petspital.member.vo.MemberVO;


public interface MemberService {

	public boolean logincheck(HttpServletRequest request,MemberVO member);
	
	public int id_Check(String user_id);
	

	public void insertUser(MemberVO vo);
	public void updateUser(MemberVO vo);
	
	
	public MemberVO what_id(MemberVO vo);
	public MemberVO what_pw(MemberVO vo);
}
