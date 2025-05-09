package com.boot.dao;

import java.util.List;

import com.boot.dto.MedicalDTO;

public interface MedicalDAO {
	List<MedicalDTO> getAllMedical();
	MedicalDTO selectMedicalById(Long id);
}
