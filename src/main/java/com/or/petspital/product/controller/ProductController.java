package com.or.petspital.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.or.petspital.product.service.ProductService;
import com.or.petspital.product.vo.ProductVO;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}

		@RequestMapping("/productList")
		public ModelAndView productList() {
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("productList", service.productList());
			mav.setViewName("/product/productList");
			
			return mav;
		}
		
	

		@RequestMapping("/cartList")
		public ModelAndView cartList(HttpServletRequest req1,ProductVO vo1) {
			HttpSession sess = req1.getSession();
			ModelAndView mav2 = new ModelAndView();
			Map<String, ProductVO> map;
			if(sess.getAttribute("map")==null) {
				map = new HashMap<String,ProductVO>();
			}else {
				map = (HashMap)sess.getAttribute("map");
			}
		
			if(map.containsKey(vo1.getProduct_name())) {
				ProductVO productVO = map.get(vo1.getProduct_name());
				int totalCount = Integer.parseInt(productVO.getProduct_count()) + Integer.parseInt(vo1.getProduct_count());
				productVO.setProduct_count(String.valueOf(totalCount));	
				map.put(vo1.getProduct_name(), productVO);
			}else {
				if(vo1.getProduct_num()!=null)
				map.put(vo1.getProduct_name(), vo1);
			}
			
			sess.setAttribute("map", map);
			
			mav2.addObject("vo1", vo1);
			mav2.setViewName("/product/cartList");
			return mav2;
			
		}
		@RequestMapping(value = "/cartRemove")
		public String cartRemove(ProductVO vo1, HttpServletRequest request) {

		        HttpSession session = request.getSession();
		        session.invalidate();

		        return "redirect:cartList";
		}



		}
