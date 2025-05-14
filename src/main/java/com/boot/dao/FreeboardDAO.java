package com.boot.dao;

import java.util.List;

import com.boot.dto.FreeboardDTO;

public interface FreeboardDAO {
	void insertFreeboard(FreeboardDTO freeboard);
	List<FreeboardDTO> getAllFreeboardDTO();
	FreeboardDTO getFreeboardDTOById(int id);
	void updateFreeboard(FreeboardDTO freeboard);
	void deleteFreeboard(int id);
}
