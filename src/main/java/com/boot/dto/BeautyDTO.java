package com.boot.dto;


import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BeautyDTO {
	private int id;
    private int petId;
    private String name;
    private String type;
    private String gender;
    private int age;
    private double weight;
    private String style;
    private String note;
    private Timestamp reservedAt;
    private Date reservationDay;
    private String reservationTime;
    private String userName;
    private String userPhone;
}

