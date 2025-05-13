package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.UserDTO;

public interface MedicalReservationService {
    void insertMedicalReservation(MedicalReservationDTO reservation);
    ArrayList<MedicalReservationDTO> getReservationMedicalList();
	void updateState(Long id, String state);
	void deleteById(Long id);
	List<MedicalReservationDTO> getReservationsByUserId(String userId);
	
	// paging
	public int getSearchCount(String field, String keyword);
	public List<MedicalReservationDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize);
	public int getTotalCount();
	public List<MedicalReservationDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize);
}