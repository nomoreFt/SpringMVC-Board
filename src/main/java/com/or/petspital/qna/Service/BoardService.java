package com.or.petspital.qna.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.or.petspital.qna.Dao.IBoardDao;
import com.or.petspital.qna.Vo.BoardVo;
import com.or.petspital.qna.Vo.CommentVo;

@Service
public class BoardService {

	@Autowired
	IBoardDao dao;
	
	public List<BoardVo> selectAllBoard(){
		List<BoardVo> list = dao.selectAllBoard();
		return list;
	}
	
	public int insertBoard(BoardVo vo) {
		int result = 0;
		result = dao.insertBoard(vo);
		return result;
	}
	
	public BoardVo selectOneBoard(String bId) {
		BoardVo vo = dao.selectOneBoard(bId);
		return vo;
	}
	
	public int modifyBoard(BoardVo vo) {
		int result = dao.modifyBoard(vo);
		return result;
	}
	
	public int deleteBoard(String bId) {
		int result = dao.deleteBoard(bId);
		return result;
		
	}
	public void replyBoard(BoardVo vo) {
		dao.replyBoard(vo);
	}

	public List<BoardVo> testList(String startRow,String endRow) {
		List<BoardVo> list = dao.getPage(startRow, endRow);
		return list;
	}
	public int getCount() {
		int cnt = dao.getCount();
		return cnt;
	}

	public List<CommentVo> getAllComment(String bId){
		List<CommentVo> list = dao.selectAllComment(bId);
		return list;
	}
	
	public void insertComment(CommentVo vo) {
		dao.insertComment(vo);
	}

	public void deleteComment(String cId) {
		dao.deleteComment(cId);
	}
	public void updateComment(CommentVo vo) {
		dao.updateComment(vo);
	}


}
