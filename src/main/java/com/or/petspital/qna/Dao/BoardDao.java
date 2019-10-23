package com.or.petspital.qna.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.or.petspital.qna.Vo.BoardVo;
import com.or.petspital.qna.Vo.CommentVo;

@Repository
public class BoardDao implements IBoardDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String boardNamespace = "com.or.kr.boardMapper";
	
	
	@Override
	public List<BoardVo> selectAllBoard() {
		List<BoardVo> list = sqlSession.selectList(boardNamespace+".selectAllBoard");
		return list;
	}

	@Override
	public int insertBoard(BoardVo vo) {
		Map<String, String> map = new HashMap<String, String>();
	/*	map.put("bName", vo.getbName());
		map.put("bTitle", vo.getbTitle());
		map.put("bContent", vo.getbContent());*/
		int result = 0;
		result = sqlSession.insert(boardNamespace+ ".insertBoard",vo);
		return result;
	}

	@Override
	public BoardVo selectOneBoard(String bId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bId", bId);
		sqlSession.update(boardNamespace+".updateHitBoard",map);
		BoardVo vo = sqlSession.selectOne(boardNamespace+".selectOneBoard", map);
		return vo;
	}

	@Override
	public int upHit(String bId) {
		int result = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("bId", bId);
		result = sqlSession.update(boardNamespace + ".updateHitBoard", map);
		return result;
	}

	@Override
	public int modifyBoard(BoardVo vo) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("bName", vo.getbName());
		map.put("bTitle", vo.getbTitle());
		map.put("bContent", vo.getbContent());
		map.put("bId", String.valueOf(vo.getbId()));
		int result = sqlSession.update(boardNamespace +".modifyBoard", map);
		return result;
	} 
	@Override
	public int deleteBoard(String bId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bId", bId);
		int result =sqlSession.delete(boardNamespace + ".deleteBoard", map);
		return result;
	}

	@Override
	public void replyBoard(BoardVo vo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bGroup", String.valueOf(vo.getbGroup()));
		map.put("bStep", String.valueOf(vo.getbStep()));
		sqlSession.update(boardNamespace+".replyShape", map);
		sqlSession.insert(boardNamespace+".insertReply", vo);
		
	}

	
	public List<BoardVo> getPage(String startRow,String endRow) {
	Map<String,String> map = new HashMap<String, String>();	
	
	map.put("endRow", endRow);
	map.put("startRow", startRow);
	List<BoardVo> list = sqlSession.selectList(boardNamespace+".testlist", map);
	return list;
	}

	@Override
	public int getCount() {
		int cnt = sqlSession.selectOne(boardNamespace +".testcount");
		return cnt;
	}

	@Override
	public List<CommentVo> selectAllComment(String bId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bId", bId);
		List<CommentVo> list = sqlSession.selectList(boardNamespace+".selectAllComment", map);
		return list;
	}

	@Override
	public void insertComment(CommentVo vo) {
		sqlSession.insert(boardNamespace+".insertComment", vo);
	}

	@Override
	public void deleteComment(String cId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cId", cId);
		sqlSession.delete(boardNamespace+".deleteComment", map);
		
	}
	
	@Override
	public void updateComment(CommentVo vo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cId", String.valueOf(vo.getcId()));
		map.put("content", vo.getContent());
		sqlSession.update(boardNamespace+".updateComment", map);
	}

	

	
}
