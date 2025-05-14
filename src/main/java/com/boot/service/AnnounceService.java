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
	
	// paging
	public int getSearchCount(String field, String keyword);
	public List<AnnounceDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize);
	public int getTotalCount();
	public List<AnnounceDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize);
}
