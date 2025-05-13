package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.dto.MedicalDTO;

public interface MedicalService {
	public ArrayList<MedicalDTO> getMedicalList();
	public MedicalDTO getMedicalInfo(Long id);
	void insertMedical(MedicalDTO dto);
	void updateMedicalInfo(MedicalDTO dto);
	void deleteMedical(Long id);
	
	//paging
	public int getSearchCount(String field, String keyword);
	public List<MedicalDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize);
	public int getTotalCount();
	public List<MedicalDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize);
}
