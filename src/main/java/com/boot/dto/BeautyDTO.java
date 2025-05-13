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
    private int pet_id;
    private String name;
    private String type;
    private String gender;
    private int age;
    private double weight;
    private String style;
    private String note;
    private Timestamp reserved_at;
    private Date reservation_day;
    private String reservation_time;
    private String user_name;
    private String user_phone;
    private String state;
    private String status;
}

