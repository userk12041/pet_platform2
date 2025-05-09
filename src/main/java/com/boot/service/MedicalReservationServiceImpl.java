package com.boot.service;

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
}