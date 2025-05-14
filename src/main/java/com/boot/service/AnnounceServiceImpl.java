package com.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.AnnounceDAO;
import com.boot.dto.AnnounceDTO;
import com.boot.dto.PetDTO;

@Service("AnnounceService")
public class AnnounceServiceImpl implements AnnounceService{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void insertAnnounce(AnnounceDTO announce) {
		AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
		dao.insertAnnounce(announce);
	}

	@Override
	public List<AnnounceDTO> getAllAnnounce() {
		AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
		return dao.getAllAnnounce();
	}

	/*
	 * @Override public List<AnnounceDTO> getAnnounceByTitle(String title) {
	 * AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class); return
	 * dao.getAnnounceByTitle(title); }
	 */

	public void updateAnnounce(AnnounceDTO announce) {
		AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
		dao.updateAnnounce(announce);
		
	}

	@Override
	public void deleteAnnounce(int id) {
		AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
		dao.deleteAnnounce(id);
		
	}

	@Override
	public AnnounceDTO getAnnounceById(int id) {
		AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
        return dao.getAnnounceById(id);
	}

	@Override
	public void updatePet(PetDTO pet) {
		// TODO Auto-generated method stub
		
	}
	
    // paging
    @Override
    public int getSearchCount(String field, String keyword) {
    	AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
        Map<String, Object> params = new HashMap<>();
        params.put("field", field);
        params.put("keyword", keyword);
        return dao.getSearchCount(params);
    }

    @Override
    public List<AnnounceDTO> getPagedSearchResults(String field, String keyword, String sortField, String order, int page, int pageSize) {
    	AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
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
    	AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
        return dao.getTotalCount();
    }

    @Override
    public List<AnnounceDTO> getPagedUsersSorted(String sortField, String order, int page, int pageSize) {
    	AnnounceDAO dao = sqlsession.getMapper(AnnounceDAO.class);
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
