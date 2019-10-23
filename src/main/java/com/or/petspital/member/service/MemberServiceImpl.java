package com.or.petspital.member.service;

import java.sql.SQLException;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Override
	public boolean logincheck(HttpServletRequest request, MemberVO member) {
		
		MemberVO mem = memDao.logincheck(member); 
		
		if(mem != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memLoginOk", mem.getUser_id());
			return true;
		}else {
			
			return false;
		}
	}

	public MemberVO what_id(MemberVO vo) {
		// TODO Auto-generated method stub
		return memDao.what_id(vo);
		
	}

	public MemberVO what_pw(MemberVO vo) {
		// TODO Auto-generated method stub
		return memDao.what_pw(vo);
	}
	

	@Override
	public void insertUser(MemberVO vo) {
		memDao.insertUser(vo);
	}


	public int id_Check(String user_id) {
		// TODO Auto-generated method stub
		return memDao.id_Check(user_id);
		}

	public void updateUser(MemberVO vo) {
		// TODO Auto-generated method stub
		memDao.updateUser(vo);
	}

/*	public MemberVO myPage(MemberVO vo) {
		// TODO Auto-generated method stub
		return memDao.myPage(vo);
	}*/






	
}