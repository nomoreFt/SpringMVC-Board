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
	
	
	@RequestMapping("/logincheck")
	public ModelAndView logincheck(HttpServletRequest request, MemberVO member) {
		
		ModelAndView mav = new ModelAndView();
		
		boolean result = service.logincheck(request, member);
		
		if(result == true) {
			mav.setViewName("index");
		} else {
			mav.setViewName("member/memberloginfalse");
		}
		
		return mav;
	}

	@RequestMapping(value = "/insertUser")
	public String insertUser(MemberVO vo) {
		
		service.insertUser(vo);
		
		return "member/memberjoinok";
	}
	
	

	// id 중복 체크 컨트롤러
		@RequestMapping(value = "/id_Check")
		@ResponseBody
		public int id_Check(@RequestParam("user_id") String user_id) {
				System.out.println(user_id);
			int a = service.id_Check(user_id);
			return a;
		}
}
