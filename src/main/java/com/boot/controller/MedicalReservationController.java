package com.boot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.PetDTO;
import com.boot.dto.UserDTO;
import com.boot.service.MedicalReservationService;
import com.boot.service.PetService;
import com.boot.service.UserService;

@Controller
@RequestMapping("/pet")
public class MedicalReservationController {

    @Autowired
    private MedicalReservationService medicalReservationService;

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;
    
    @GetMapping("/pet_medical/{petId}")
    public String medicalReservationPage(@PathVariable int petId, HttpSession session, Model model) {
        // 펫 정보 가져오기
        PetDTO pet = petService.getPetById(petId);
        model.addAttribute("pet", pet);

        // 유저 정보 가져오기
        String userId = (String) session.getAttribute("id");
        if (userId != null) {
            UserDTO myInfo = userService.getUserInfo(userId);
            model.addAttribute("my_info", myInfo);
        }

        return "pet/pet_medical";  // JSP 파일 위치
    }

    @PostMapping("/medicalReservation")
    public String insertMedicalReservation(
            @RequestParam int petId,
            @RequestParam String reservationDate,
            @RequestParam String reservationTime,
            @RequestParam String note,
            HttpSession session) {

        String userId = (String) session.getAttribute("id");

        // 유저 정보 가져오기
        UserDTO user = userService.getUserInfo(userId);

        // 펫 정보 가져오기
        PetDTO pet = petService.getPetById(petId);

        // 예약 DTO 세팅
        MedicalReservationDTO reservation = new MedicalReservationDTO();
        reservation.setPetId(petId);
        reservation.setUserId(userId);
        reservation.setUserName(user.getUser_name());
        reservation.setPhoneNumber(user.getPhone_number());

        reservation.setName(pet.getName());
        reservation.setType(pet.getType());
        reservation.setGender(pet.getGender());
        reservation.setAge(pet.getAge());

        reservation.setNote(note);

        // 예약 날짜 변환
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date resDate = sdf.parse(reservationDate);
            reservation.setReservationDate(new java.sql.Date(resDate.getTime())); // ← Oracle에 맞게
        } catch (Exception e) {
            e.printStackTrace();
        }

        reservation.setReservationTime(reservationTime);
        reservation.setCreatedAt(new java.sql.Date(System.currentTimeMillis())); // 신청일시


        // 저장
        medicalReservationService.insertMedicalReservation(reservation);

        return "redirect:/main";
    }
}
