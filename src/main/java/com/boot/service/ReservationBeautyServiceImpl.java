package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ReservationBeautyDAO;
import com.boot.dto.BeautyDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	@Override
	public void updateState(Long id, String state) {
		ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("state", state);
		dao.updateState(map);
	}

	@Override
	public void deleteById(Long id) {
		ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
		dao.deleteById(id);
	}
    
    @Override
    public List<BeautyDTO> getBeautyReservationsByUserId(String userId) {
        return sqlSession.getMapper(ReservationBeautyDAO.class).getBeautyReservationsByUserId(userId);
    }
	
}
