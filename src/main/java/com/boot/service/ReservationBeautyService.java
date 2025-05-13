package com.boot.service;

import java.util.ArrayList;
import java.util.List;

import com.boot.dto.BeautyDTO;

public interface ReservationBeautyService {
	void beautyReservation(BeautyDTO reservation);
	ArrayList<BeautyDTO> getReservationBeautyList();
	void updateState(Long id, String state);
	void deleteById(Long id);
	List<BeautyDTO> getBeautyReservationsByUserId(String userId);
}