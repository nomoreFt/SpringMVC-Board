package com.or.petspital.coupon.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.or.petspital.coupon.service.CouponService;
import com.or.petspital.coupon.vo.CouponVO;


@Controller
@RequestMapping("/coupon")
public class CouponController {
	@Autowired
	CouponService service;
	
	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}
	@RequestMapping("/couponNum")
	 public ModelAndView couponNum(HttpSession session){
	  
		ModelAndView mav = new ModelAndView();	
	
		/*String mem_num = (String)session.getAttribute("memLoginOk");*/
		
		
	   List<CouponVO> list = service.couponNum("dd");
	   mav.addObject("list", list);
	   mav.setViewName("/coupon/couponList");
	  
	   return mav;
	 }
	
	@RequestMapping("/insertCoupon")
	public String insertCoupon(HttpSession session, CouponVO couponVO){
	  
	ModelAndView mav = new ModelAndView();	
		
	int couponSize = 1;

	final char[] possibleCharacters =
	    {'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F',
	     'G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V',
	     'W','X','Y','Z'};
	  
	final int possibleCharacterCount = possibleCharacters.length;
	
	Random rnd = new Random();
	int i = 0;
	String coupon_code = null;
	
	   StringBuffer buf = new StringBuffer(16);
	   
	   for (i= 8; i > 0; i--) {
	    buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
	   }
	   
	   coupon_code = buf.toString();
	   
	   couponVO.setCoupon_code(coupon_code);
	   couponVO.setMem_num((String) session.getAttribute("memJoinOk"));
	   
	   service.insertCoupon(couponVO);
	   session.invalidate();
	   
	  return "redirect:/member/memberLogin";
	}

}

