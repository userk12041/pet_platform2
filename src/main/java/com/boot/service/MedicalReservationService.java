package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.dto.MedicalReservationDTO;

public interface MedicalReservationService {
    void insertMedicalReservation(MedicalReservationDTO reservation);
    ArrayList<MedicalReservationDTO> getReservationMedicalList();
	void updateState(Long id, String state);
	void deleteById(Long id);
	List<MedicalReservationDTO> getReservationsByUserId(String userId);
}