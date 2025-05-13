package com.boot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.boot.dto.BeautyDTO;

public interface ReservationBeautyDAO {
    void beautyReservation(BeautyDTO reservation);
    ArrayList<BeautyDTO> getReservationBeautyList();
	void updateState(Map<String, Object> map);
	void deleteById(Long id);
	List<BeautyDTO> getBeautyReservationsByUserId(String userId);
}
