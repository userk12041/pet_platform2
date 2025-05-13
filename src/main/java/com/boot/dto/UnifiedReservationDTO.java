package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnifiedReservationDTO {
    private String category; // "진료" 또는 "미용"
    private String name;
    private String type;
    private Date reservationDay;
    private String reservationTime;
    private String note;
    private String state;
}