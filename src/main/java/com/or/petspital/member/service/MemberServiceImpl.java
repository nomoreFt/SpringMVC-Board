package com.or.petspital.member.service;

import java.sql.SQLException;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.*;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.or.petspital.member.dao.MemberDAO;
import com.or.petspital.member.vo.MemberVO;


@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memDao;
	private SqlSessionTemplate SqlSessin;
	
	@Override
	public boolean logincheck(HttpServletRequest request, MemberVO member) {
		
		MemberVO mem = memDao.logincheck(member);
		
		if(mem != null) {
			//로그인성ㄱ동
			HttpSession session = request.getSession();
			session.setAttribute("memLoginOk", mem.getUser_id());
			return true;
			
		}else {
			
			return false;
		}
	}


	@Override
	public String loginIdCheck(MemberVO member) {
		
		String id = memDao.loginIdCheck(member);
		
		if(member.getUser_id().equals(id)) {
			//중복
			return "중복";
			
		} else {
			//중복없음
			return "없음";

		}
		
	}

	@Override
	public void insertUser(MemberVO vo) {
		memDao.insertUser(vo);
	}


	public int id_Check(String user_id) {
		// TODO Auto-generated method stub
		return memDao.id_Check(user_id);
		}



	
}