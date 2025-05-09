package com.boot.dao;

import java.util.ArrayList;

import com.boot.dto.MedicalDTO;

public interface MedicalDAO {
	ArrayList<MedicalDTO> getMedicalList();
	MedicalDTO getMedicalInfo(Long id);
	void insertMedical(MedicalDTO dto);
	void updateMedicalInfo(MedicalDTO dto);
	void deleteMedical(Long id);
}
