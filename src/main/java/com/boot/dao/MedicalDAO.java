package com.boot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.boot.dto.MedicalDTO;

public interface MedicalDAO {
	ArrayList<MedicalDTO> getMedicalList();
	MedicalDTO getMedicalInfo(Long id);
	void insertMedical(MedicalDTO dto);
	void updateMedicalInfo(MedicalDTO dto);
	void deleteMedical(Long id);
	
	// paging
    int getSearchCount(Map<String, Object> params);
    List<MedicalDTO> getPagedSearchResults(Map<String, Object> params);
    int getTotalCount();
    List<MedicalDTO> getPagedUsersSorted(Map<String, Object> params);
}
