package com.or.petspital.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.or.petspital.shopping.DAO.ShoppingDAO;
import com.or.petspital.shopping.service.ShoppingService;
import com.or.petspital.shopping.vo.DetailVO;
import com.or.petspital.shopping.vo.ShoppingVO;

@Controller

@RequestMapping("/shopping")
public class ShoppingController {

	@Autowired
	ShoppingService shoppingservice;

	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}

	@RequestMapping("/ShoppingList")
	public String ShoppingList(Model mod) {

		List<ShoppingVO> list = shoppingservice.selectall();
		mod.addAttribute("list", list);

		return "/shopping/ShoppingList";
	}

	@RequestMapping("/Shop")
	public String goToShopjsp(Model mod, ShoppingVO ShoppingVO) {

		List<DetailVO> list1 = shoppingservice.Detail(String.valueOf(ShoppingVO.getProduct_num()));
		mod.addAttribute("shoppingVo", ShoppingVO);
		mod.addAttribute("list1", list1);
		return "/shopping/Shop";
	}

}
