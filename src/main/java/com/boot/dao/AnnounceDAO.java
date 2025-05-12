package com.boot.dao;

import java.util.List;

import com.boot.dto.AnnounceDTO;


public interface AnnounceDAO {
	void insertAnnounce(AnnounceDTO announce);
	List<AnnounceDTO> getAllAnnounce();
	void updateAnnounce(AnnounceDTO announce);
	void deleteAnnounce(int id);
	AnnounceDTO getAnnounceById(int id);
	
}
