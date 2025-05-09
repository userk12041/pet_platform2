package com.boot.service;

import java.util.ArrayList;

import com.boot.dto.MedicalDTO;

public interface MedicalService {
	public ArrayList<MedicalDTO> getMedicalList();
	public MedicalDTO getMedicalInfo(Long id);
	void insertMedical(MedicalDTO dto);
	void updateMedicalInfo(MedicalDTO dto);
	void deleteMedical(Long id);
}
