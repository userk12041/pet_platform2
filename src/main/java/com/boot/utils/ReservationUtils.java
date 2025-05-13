package com.boot.utils;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.UnifiedReservationDTO;

public class ReservationUtils {

    public static List<UnifiedReservationDTO> mergeAndSort(List<MedicalReservationDTO> medicalList, List<BeautyDTO> beautyList) {
        List<UnifiedReservationDTO> merged = new ArrayList<>();

        for (MedicalReservationDTO med : medicalList) {
            String calculatedStatus = calculateStatus(med.getState(), med.getReservation_day(), med.getReservation_time());
            merged.add(new UnifiedReservationDTO("진료", med.getName(), med.getType(),
                    med.getReservation_day(), med.getReservation_time(), med.getNote(), calculatedStatus));
        }

        for (BeautyDTO beauty : beautyList) {
            String calculatedStatus = calculateStatus(beauty.getState(), new Date(beauty.getReservation_day().getTime()), beauty.getReservation_time());
            merged.add(new UnifiedReservationDTO("미용", beauty.getName(), beauty.getType(),
                    new Date(beauty.getReservation_day().getTime()), beauty.getReservation_time(), beauty.getNote(), calculatedStatus));
        }

        merged.sort(new Comparator<UnifiedReservationDTO>() {
            @Override
            public int compare(UnifiedReservationDTO r1, UnifiedReservationDTO r2) {
                int stateCompare = Integer.compare(statusOrder(r1.getState()), statusOrder(r2.getState()));
                if (stateCompare != 0) return stateCompare;

                int dateCompare = r1.getReservationDay().compareTo(r2.getReservationDay());
                if (dateCompare != 0) return dateCompare;

                return r1.getReservationTime().compareTo(r2.getReservationTime());
            }
        });

        return merged;
    }

    private static int statusOrder(String state) {
        switch (state) {
            case "예약 확정": return 0;  // ✔ 변경
            case "예약 대기": return 1;  // ✔ 변경
            default: return 2;           // 지난 예약
        }
    }

    // ✅ 현재 시간 기준으로 지난 예약 판단
    private static String calculateStatus(String rawState, Date day, String time) {
        try {
            LocalDateTime now = LocalDateTime.now();

            String dateTimeStr = new SimpleDateFormat("yyyy-MM-dd").format(day) + " " + time;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime reservationDateTime = LocalDateTime.parse(dateTimeStr, formatter);

            if (reservationDateTime.isBefore(now)) {
                return "지난 예약";
            }

            String cleanState = rawState != null ? rawState.trim() : "";
            
            if (cleanState.equals("승인")) return "예약 확정";  // ✅ 여기!
            return "예약 대기";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "지난 예약"; // fallback
    }
}