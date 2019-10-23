package com.or.petspital.reserve.controller;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.spi.RepositorySelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.or.petspital.reserve.service.ReserveService;
import com.or.petspital.reserve.vo.Reservation;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService service;
	
	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}
	
	@RequestMapping("/reserveDateForm")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/reserve/reserveDateForm");
		return mav;
	}

	
	@RequestMapping("/reserveDateOk")
	public ModelAndView resDate(HttpSession session, Reservation reserveVO) {
		
		ModelAndView mav = new ModelAndView();
		session.setAttribute("res_date", reserveVO.getRes_date());
	
		mav.setViewName("/reserve/reserveTimeForm");
		
		return mav;
	}
	
	@RequestMapping("/reserveTimeOk")
	public ModelAndView resSelectTime(HttpSession session, Reservation reserveVO) {
		
		ModelAndView mav = new ModelAndView();

		boolean result = service.resSelectTime(reserveVO);
		
		if(result == true) {
			reserveVO.setRes_id((String) session.getAttribute("memLoginOk"));
			service.resInsert(reserveVO);
			
			mav.setViewName("/reserve/reserveList");
			
		} else {
			mav.setViewName("/reserve/reserveFail");
		}
		return mav;
	}
	
	
	@RequestMapping("/reserveList")
	public ModelAndView resSelectList(HttpSession session, Reservation reserveVO) {
		
		ModelAndView mav = new ModelAndView();
		
		reserveVO.setRes_id((String) session.getAttribute("memLoginOk"));
		List<Reservation> reserveList = service.resSelectList(reserveVO);
		
		mav.addObject("reserveList", reserveList);
		mav.setViewName("/reserve/reserveList");
		
		return mav;
	}
	
	@RequestMapping("/reserveMemo")
	public ModelAndView resSelectMemo(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		String res_num = request.getParameter("res_num");
		
		Reservation res = service.resSelectMemo(res_num);
		mav.addObject("reserveMemo", res);
		mav.setViewName("/reserve/reserveMemo");
		
		return mav;
	}
	

	
	@RequestMapping("/memoUpdate")
	public ModelAndView resUpdateMemo(Reservation reserveVO) {
		
		ModelAndView mav = new ModelAndView();
		
		service.resUpdateMemo(reserveVO);
		
		mav.addObject("reserveMemo", reserveVO);
		mav.setViewName("redirect:reserveList");
		
		return mav;
	}
	
	@RequestMapping(value = "/time_check")
	@ResponseBody
	public int time_check(@RequestParam("time") String time, @RequestParam("date") String date) {
		int result = service.time_check(date, time);
		return result;
	}
	
	
	@RequestMapping(value = "/delete_check")
	@ResponseBody
	public int delete_check(@RequestParam("res_num") int res_num, @RequestParam("res_date") String res_date, Reservation reserveVO) {

		
		System.out.println("res_num : "+res_num);
		System.out.println("res_date : "+res_date);
		
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		int today = cal.get(cal.DATE);
		int date = Integer.parseInt(res_date.substring(8, 10));
		
		System.out.println("today : "+today);
		System.out.println("res_date : "+date);
		
		int result = 0;
		
	if(date > today) { //예약날짜가 오늘 이후이면 예약취소 가능
			
			result = service.resDelete(res_num); //예약이 성공적으로 취소됐으면 1 반환
			
			System.out.println("return : " +result);
			return result; //1
			
		} else { //예약날짜가 오늘이거나 오늘 이전이면 예약취소 불가능
			
			System.out.println("return : " +result);
			return result; //예약 취소가 불가하면 취소된것이 없으니 그대로 0 반환
		}
	}
	

	
}
