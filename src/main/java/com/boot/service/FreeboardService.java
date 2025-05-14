package com.boot.service;

import java.util.List;

import com.boot.dto.FreeboardDTO;

public interface FreeboardService {
	void insertFreeboard(FreeboardDTO freeboard);
	List<FreeboardDTO> getAllFreeboardDTO();
	FreeboardDTO getFreeboardDTOById(int id);
	void deleteFreeboard(int id);
	void updateFreeboard(FreeboardDTO freeboard);
}
