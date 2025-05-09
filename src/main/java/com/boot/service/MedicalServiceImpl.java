package com.boot.service;

import java.util.List;

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
	public List<MedicalDTO> getAllMedical() {
		MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
		return dao.getAllMedical();
	}
    @Override
    public MedicalDTO getMedicalById(Long id) {
    	MedicalDAO dao = sqlSession.getMapper(com.boot.dao.MedicalDAO.class);
        return dao.selectMedicalById(id);
    }
}
