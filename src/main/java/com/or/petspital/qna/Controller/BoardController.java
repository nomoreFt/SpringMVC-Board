package com.or.petspital.qna.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.or.petspital.qna.Dao.PageMaker;
import com.or.petspital.qna.Service.BoardService;
import com.or.petspital.qna.Vo.BoardVo;
import com.or.petspital.qna.Vo.CommentVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;
	
	@ModelAttribute("cp")
	public String getCp(HttpServletRequest req) {
		return req.getContextPath();
	}
	

	@RequestMapping("/showList")
	public ModelAndView testPaging(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
			PageMaker pagemaker = new PageMaker();
		String pagenum = req.getParameter("pagenum");
		String contentnum = req.getParameter("contentnum");
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		
		pagemaker.setTotalcount(service.getCount());
		pagemaker.setPagenum(cpagenum-1);
		pagemaker.setContentnum(ccontentnum);
		pagemaker.setCurrentblock(cpagenum);
		pagemaker.setLastblock(pagemaker.getTotalcount());
		
		pagemaker.prevnext(cpagenum);
		pagemaker.setStartPage(pagemaker.getCurrentblock());//(1) 2 3 4 5 , (6) 7 8 
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		
		mav.addObject("page", pagemaker);
		//1 - 61 -52 / 2 - 51 - 42/ 3 - 
		// 1 - 1, 2 - 11, 3- 21, 4- 31, 5- 41 6 - 51   pagenum* 10 - 9
		String endRow= String.valueOf(10*Integer.parseInt(pagenum));
		System.out.println(endRow);
		String startRow = String.valueOf((Integer.parseInt(pagenum)*10)- 9);
		System.out.println(startRow);
		mav.setViewName("/board/showList");
		List<BoardVo> list = service.testList(startRow, endRow);
		int cnt = service.getCount();
		mav.addObject("cnt", cnt);
		mav.addObject("list", list);
		return mav;
		
	}
	
	@RequestMapping("/writeView")
	public String goWriteView(Model model) {
		System.out.println("writeViewController");
		return "/board/writeView";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST )
	public ModelAndView write(BoardVo board) {
		ModelAndView mav = new ModelAndView();
		System.out.println(board.getbContent() + board.getbName()+ board.getbTitle());
		service.insertBoard(board);
		mav.setViewName("redirect:/board/showList?pagenum=1&contentnum=10");
		return mav;
	}
	@RequestMapping("/contentView")
	public ModelAndView contentView(BoardVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/contentView");
		BoardVo v1 = service.selectOneBoard(String.valueOf(vo.getbId()));
		mav.addObject("contentOne",v1);
		return mav;
	}
	@RequestMapping("/modify")
	public ModelAndView modify(BoardVo vo) {
		ModelAndView mav = new ModelAndView();
		service.modifyBoard(vo);
		mav.setViewName("redirect:/board/showList?pagenum=1&contentnum=10");
		return mav;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(String bId) {
		ModelAndView mav = new ModelAndView();
		service.deleteBoard(bId);
		mav.setViewName("redirect:/board/showList?pagenum=1&contentnum=10");
		return mav;
	}
	
	@RequestMapping("/replyView")
	public ModelAndView replyView(String bId) {
		ModelAndView mav = new ModelAndView();
		BoardVo vo = service.selectOneBoard(bId);
		mav.addObject("reply_view", vo);
		mav.setViewName("/board/replyView");
		return mav;
	}
	
	@RequestMapping(value= "/reply", method = RequestMethod.POST)
	public ModelAndView reply(BoardVo vo) {
		ModelAndView mav = new ModelAndView();
		service.replyBoard(vo);
		mav.setViewName("redirect:/board/showList?pagenum=1&contentnum=10");
		return mav;
	}
	
	@RequestMapping(value = "/commentList/{bId}", method = RequestMethod.GET)
	@ResponseBody
	public Map getCommentList(@PathVariable String bId) {
		List<CommentVo> commentList = service.getAllComment(bId);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		result.put("data", commentList);
		return result;
	}
	
	@RequestMapping(value = "/commentList", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public Map insertComment(@RequestBody CommentVo comment) {
		if (comment != null)
			service.insertComment(comment);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}
	@RequestMapping(value = "/comment/{cId}", method = RequestMethod.DELETE)
	@ResponseBody
	public Map deleteComment(@PathVariable String cId) {
		service.deleteComment(cId);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}
	@RequestMapping(value = "/commentModify", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public Map updateComment(@RequestBody CommentVo comment) {
		if (comment != null)
			service.updateComment(comment);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}

	
}
