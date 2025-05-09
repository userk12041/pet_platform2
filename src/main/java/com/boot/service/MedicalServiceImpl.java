package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.MedicalDAO;
import com.boot.dto.MedicalDTO;

@Service("MedicalService")
public class MedicalServiceImpl implements MedicalService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MedicalDTO> getMedicalList() {
		MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
		return dao.getMedicalList();
	}

	@Override
	public MedicalDTO getMedicalInfo(Long id) {
		MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
		return dao.getMedicalInfo(id);
	}

	@Override
	public void insertMedical(MedicalDTO dto) {
		MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
		dao.insertMedical(dto);
	}
	@Override
	public void updateMedicalInfo(MedicalDTO dto) {
	    MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
	    dao.updateMedicalInfo(dto);
	}

	@Override
	public void deleteMedical(Long id) {
		MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
		dao.deleteMedical(id);
	}
}
