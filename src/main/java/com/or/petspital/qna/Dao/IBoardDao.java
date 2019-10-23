package com.or.petspital.qna.Dao;

import java.util.List;

import com.or.petspital.qna.Vo.BoardVo;
import com.or.petspital.qna.Vo.CommentVo;

public interface IBoardDao {

	public BoardVo selectOneBoard(String bId);
	public List<BoardVo> selectAllBoard();
	public int insertBoard(BoardVo vo);
	public int upHit(String bId);
	public int modifyBoard(BoardVo vo);
	public int deleteBoard(String bId);
	public void replyBoard(BoardVo vo);
	public List<BoardVo> getPage(String startRow,String endRow);
	public int getCount();
	
	public List<CommentVo> selectAllComment(String bId);
	public void insertComment(CommentVo vo);
	public void deleteComment(String cId);
	public void updateComment(CommentVo vo);
}
