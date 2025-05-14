package com.boot.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.AnnounceDAO;
import com.boot.dao.FreeboardDAO;
import com.boot.dto.FreeboardDTO;

@Service("/FreeboardService")
public class FreeboardServiceImpl implements FreeboardService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertFreeboard(FreeboardDTO freeboard) {
		FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
		dao.insertFreeboard(freeboard);
	}

	@Override
	public List<FreeboardDTO> getAllFreeboardDTO() {
		FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
		return dao.getAllFreeboardDTO();
	}


	@Override
	public FreeboardDTO getFreeboardDTOById(int id) {
		FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
		return dao.getFreeboardDTOById(id);
	}

	@Override
	public void deleteFreeboard(int id) {
		FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
		dao.deleteFreeboard(id);
		
	}

	@Override
	public void updateFreeboard(FreeboardDTO freeboard) {
		FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
		dao.updateFreeboard(freeboard);
		
	}

}
