package com.boot.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.PetDAO;
import com.boot.dto.BeautyDTO;
import com.boot.dto.PetDTO;

@Service("PetService")
public class PetServiceImpl implements PetService {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertPet(PetDTO pet) {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        dao.insertPet(pet);
    }

    @Override
    public List<PetDTO> getAllPets() {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        return dao.getAllPets();
    }

    @Override
    public PetDTO getPetById(int id) {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        return dao.getPetById(id);
    }

    @Override
    public void updatePet(PetDTO pet) {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        dao.updatePet(pet);
    }

    @Override
    public void deletePet(int id) {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        dao.deletePet(id);
    }
    
    @Override
    public List<PetDTO> getPetsByUserId(String user_id) {
        return sqlSession.getMapper(PetDAO.class).getPetsByUserId(user_id);
    }
    
    @Override
    public void beautyReservation(BeautyDTO reservation) {
        PetDAO dao = sqlSession.getMapper(PetDAO.class);
        dao.beautyReservation(reservation);
    }
    
}
