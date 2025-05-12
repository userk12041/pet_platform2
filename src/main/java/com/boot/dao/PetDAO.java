package com.boot.dao;

import java.util.List;

import com.boot.dto.PetDTO;

public interface PetDAO {
    void insertPet(PetDTO pet);
    List<PetDTO> getAllPets();
    PetDTO getPetById(int id);
    void updatePet(PetDTO pet);
    void deletePet(int id);
    List<PetDTO> getPetsByUserId(String user_id);
}
