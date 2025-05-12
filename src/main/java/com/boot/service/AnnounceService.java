package com.boot.service;

import java.util.List;

import com.boot.dto.AnnounceDTO;
import com.boot.dto.PetDTO;

public interface AnnounceService {
	void insertAnnounce(AnnounceDTO announce);
	List<AnnounceDTO> getAllAnnounce();
	void updatePet(PetDTO pet);
	void deleteAnnounce(int id);
	AnnounceDTO getAnnounceById(int id);
	void updateAnnounce(AnnounceDTO announce);
}
