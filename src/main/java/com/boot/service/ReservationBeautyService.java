package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalReservationDTO;

public interface ReservationBeautyService {
	void beautyReservation(BeautyDTO reservation);
	ArrayList<BeautyDTO> getReservationBeautyList();
	void updateState(Long id, String state);
	void deleteById(Long id);
	List<BeautyDTO> getBeautyReservationsByUserId(String userId);
	
	// paging
	public int getSearchCount(String field, String keyword);
	public List<BeautyDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize);
	public int getTotalCount();
	public List<BeautyDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize);
}