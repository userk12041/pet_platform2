package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.MedicalReservationDAO;
import com.boot.dto.MedicalReservationDTO;

@Service("MedicalReservationService")
public class MedicalReservationServiceImpl implements MedicalReservationService {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertMedicalReservation(MedicalReservationDTO reservation) {
        MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
        dao.insertMedicalReservation(reservation);
    }

	@Override
	public ArrayList<MedicalReservationDTO> getReservationMedicalList() {
		MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
		return dao.getReservationMedicalList();
	}
	
	@Override
	public void updateState(Long id, String state) {
		MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("state", state);
		dao.updateState(map);
	}

	@Override
	public void deleteById(Long id) {
		MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
		dao.deleteById(id);
	}
	
	@Override
	public List<MedicalReservationDTO> getReservationsByUserId(String userId) {
	    MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
	    return dao.getReservationsByUserId(userId);
	}
}