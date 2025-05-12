package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ReservationBeautyDAO;
import com.boot.dto.BeautyDTO;

@Service("ReservationBeautyService")
public class ReservationBeautyServiceImpl implements ReservationBeautyService {

    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public void beautyReservation(BeautyDTO reservation) {
        ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
        dao.beautyReservation(reservation);
    }

	@Override
	public ArrayList<BeautyDTO> getReservationBeautyList() {
		ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
		return dao.getReservationBeautyList();
	}
    
}
