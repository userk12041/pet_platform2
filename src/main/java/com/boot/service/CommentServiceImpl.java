package com.boot.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CommentDAO;
import com.boot.dto.CommentDTO;

@Service("/CommentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertComment(CommentDTO comment) {
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		dao.insertComment(comment);
		
	}


	@Override
	public void deleteComment(int id) {
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		dao.deleteComment(id);
		
	}

	@Override
	public List<CommentDTO> getCommentsByBoardId(int boardId) {
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		return dao.getCommentByBoardId(boardId);
	}


}
