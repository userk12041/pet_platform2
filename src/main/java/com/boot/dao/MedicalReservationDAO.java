package com.boot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.boot.dto.MedicalReservationDTO;

public interface MedicalReservationDAO {
    void insertMedicalReservation(MedicalReservationDTO reservation);
    ArrayList<MedicalReservationDTO> getReservationMedicalList();
	void updateState(Map<String, Object> map);
	void deleteById(Long id);
	List<MedicalReservationDTO> getReservationsByUserId(String userId);
	
	// paging
    int getSearchCount(Map<String, Object> params);
    List<MedicalReservationDTO> getPagedSearchResults(Map<String, Object> params);
    int getTotalCount();
    List<MedicalReservationDTO> getPagedUsersSorted(Map<String, Object> params);
}