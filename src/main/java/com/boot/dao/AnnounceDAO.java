package com.boot.dao;

import java.util.List;
import java.util.Map;

import com.boot.dto.AnnounceDTO;


public interface AnnounceDAO {
	void insertAnnounce(AnnounceDTO announce);
	List<AnnounceDTO> getAllAnnounce();
	void updateAnnounce(AnnounceDTO announce);
	void deleteAnnounce(int id);
	AnnounceDTO getAnnounceById(int id);
	
	//paging
    int getSearchCount(Map<String, Object> params);
    List<AnnounceDTO> getPagedSearchResults(Map<String, Object> params);
    int getTotalCount();
    List<AnnounceDTO> getPagedUsersSorted(Map<String, Object> params);
}
