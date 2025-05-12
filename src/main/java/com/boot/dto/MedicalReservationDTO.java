package com.boot.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MedicalReservationDTO {
    private int id;
    private int pet_id;
    private String user_id;          // FK 참조용 유저 아이디
    private String user_name;        // 예약 당시 유저 이름
    private String phone_number;     // 예약 당시 전화번호
    private String name;            // 펫 이름
    private String type;            // 펫 종(견종)
    private String gender;          // 펫 성별
    private int age;                // 펫 나이
    private String note;            // 특이사항
    private Date reservation_date;   // 예약 날짜
    private String reservation_time; // 예약 시간
    private Date created_at;         // 생성일시 (예약 신청 시각)
    private String state;
}