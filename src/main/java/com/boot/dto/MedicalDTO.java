package com.boot.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MedicalDTO {
    private Long id;
    private String pet_name;
    private Date treatment_date;
    private String doctor_id;
    private String content;
    private String prescription;
    private String notes;
    private String user_id;
    private Date created_at;
    private Date updated_at;
}
