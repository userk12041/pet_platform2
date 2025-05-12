package com.boot.dao;

import java.util.ArrayList;

import com.boot.dto.BeautyDTO;


public interface ReservationBeautyDAO {
    void beautyReservation(BeautyDTO reservation);
    ArrayList<BeautyDTO> getReservationBeautyList();
}
