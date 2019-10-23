package com.or.petspital.member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MaximizeAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.or.petspital.member.service.MemberService;
import com.or.petspital.member.service.MemberServiceImpl;
import com.or.petspital.member.vo.MemberVO;
import com.or.petspital.reserve.service.ReserveService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}

	@RequestMapping("/memberlogin")
	public String memberlogin() {
		return "member/memberlogin";
	}
	
	@RequestMapping("/join")
	public String memberjoin() {
		return "member/memberjoin";
	}
	
	@RequestMapping("/whatid")
	public String memberwhatid() {
		return "member/whatid";
	}
	
	@RequestMapping("/whatpw")
	public String memberwhatpw() {
		return "member/whatpw";
	}
	
	
	@RequestMapping("/delete")
	public String memberdeletego() {
		return "member/memberDelete";
	}
	
	
	@RequestMapping("/mypage")
	public ModelAndView membermypage(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		//MemberVO mem = service.myPage(vo);
		
		//mav.addObject("mem",mem);
		mav.setViewName("member/mypage");
		return mav;
	}

	@RequestMapping("/logincheck")
	public ModelAndView logincheck(HttpServletRequest request, MemberVO member) {
		
		ModelAndView mav = new ModelAndView();
		
		boolean result = service.logincheck(request, member);
		
		if(result == true) {
			mav.setViewName("index");
		} else {
			mav.setViewName("member/memberloginFail");
		}
		
		return mav;
	}

	@RequestMapping(value = "/insertUser")
	public String insertUser(HttpSession session, MemberVO vo) {
		
		service.insertUser(vo);
		session.setAttribute("memJoinOk", vo.getUser_id());
		session.setAttribute("coupon", "coupon");
		
		return "coupon/insertCoupon";
	}
	
	@RequestMapping(value = "/updateUser")
	public String updateUser(MemberVO vo) {
		
		service.updateUser(vo);
		
		return "index";
	}
	
	@RequestMapping(value = "/what_id", method=RequestMethod.POST)
	public ModelAndView what_id(MemberVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO mem = service.what_id(vo);
		
		if(mem == null) {
			mav.setViewName("member/result_fail");
		} else {
			mav.addObject("mem", mem);
			mav.setViewName("member/result_id");
		}
		return mav;
	}
	
	@RequestMapping(value = "/what_pw")
	public ModelAndView what_pw(MemberVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO mem = service.what_pw(vo);
		
		if(mem == null) {
			mav.setViewName("member/result_fail");
		}else {
			mav.addObject("mem", mem);
			mav.setViewName("member/result_pw");
		}
			return mav;
	}	
	
	

		@RequestMapping(value = "/id_Check")
		@ResponseBody
		public int id_Check(@RequestParam("user_id") String user_id) {
				System.out.println(user_id);
			int a = service.id_Check(user_id);
			return a;
		}
}
