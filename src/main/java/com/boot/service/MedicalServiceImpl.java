package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// paging
    @Override
    public int getSearchCount(String field, String keyword) {
    	MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
        Map<String, Object> params = new HashMap<>();
        params.put("field", field);
        params.put("keyword", keyword);
        return dao.getSearchCount(params);
    }

    @Override
    public List<MedicalDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize) {
    	MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
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
    	MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
        return dao.getTotalCount();
    }

    @Override
    public List<MedicalDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize) {
    	MedicalDAO dao = sqlSession.getMapper(MedicalDAO.class);
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
