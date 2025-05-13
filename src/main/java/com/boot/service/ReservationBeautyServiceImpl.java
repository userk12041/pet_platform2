package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.MedicalReservationDAO;
import com.boot.dao.ReservationBeautyDAO;
import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalReservationDTO;

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
	
    // paging
    @Override
    public int getSearchCount(String field, String keyword) {
    	ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
        Map<String, Object> params = new HashMap<>();
        params.put("field", field);
        params.put("keyword", keyword);
        return dao.getSearchCount(params);
    }
    @Override
    public List<BeautyDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize) {
    	ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
        int startRow = (page - 1) * pageSize;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
        params.put("field", field);
        params.put("keyword", keyword);
        params.put("sortField", sortField);
        params.put("order", order);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        return dao.getPagedSearchResults(params);
    }

    @Override
    public int getTotalCount() {
    	MedicalReservationDAO dao = sqlSession.getMapper(MedicalReservationDAO.class);
        return dao.getTotalCount();
    }

    @Override
    public List<BeautyDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize) {
    	ReservationBeautyDAO dao = sqlSession.getMapper(ReservationBeautyDAO.class);
        int startRow = (page - 1) * pageSize;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
        params.put("sortField", sortField);
        params.put("order", order);
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        return dao.getPagedUsersSorted(params);
    }
}
