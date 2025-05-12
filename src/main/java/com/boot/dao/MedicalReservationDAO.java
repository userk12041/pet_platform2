package com.boot.dao;

import java.util.ArrayList;
import java.util.Map;

import com.boot.dto.MedicalReservationDTO;

public interface MedicalReservationDAO {
    void insertMedicalReservation(MedicalReservationDTO reservation);
    ArrayList<MedicalReservationDTO> getReservationMedicalList();
	void updateState(Map<String, Object> map);
	void deleteById(Long id);
}