package com.boot.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.PetDTO;
import com.boot.dto.UnifiedReservationDTO;
import com.boot.dto.UserDTO;
import com.boot.service.MedicalReservationService;
import com.boot.service.PetService;
import com.boot.service.ReservationBeautyService;
import com.boot.service.UserService;
import com.boot.utils.ReservationUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MedicalReservationController {

    @Autowired
    private MedicalReservationService medicalReservationService;

    @Autowired
    private PetService petService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private ReservationBeautyService reservationBeautyService;

    // 진료 예약 페이지
    @GetMapping("/pet/pet_medical/{petId}")
    public String medicalReservationPage(@PathVariable int petId, HttpSession session, Model model) {
        PetDTO pet = petService.getPetById(petId);
        model.addAttribute("pet", pet);

        String userId = (String) session.getAttribute("id");
        if (userId != null) {
            UserDTO myInfo = userService.getUserInfo(userId);
            model.addAttribute("my_info", myInfo);
        }

        return "pet/pet_medical";
    }

    // 예약 등록
    @PostMapping("/pet/medicalReservation")
    public String insertMedicalReservation(
            @RequestParam int petId,
            @RequestParam String reservationDay,
            @RequestParam String reservationTime,
            @RequestParam String note,
            HttpSession session) {

        String userId = (String) session.getAttribute("id");
        UserDTO user = userService.getUserInfo(userId);
        PetDTO pet = petService.getPetById(petId);

        MedicalReservationDTO reservation = new MedicalReservationDTO();
        reservation.setPet_id(petId);
        reservation.setUser_id(userId);
        reservation.setUser_name(user.getUser_name());
        reservation.setPhone_number(user.getPhone_number());
        reservation.setName(pet.getName());
        reservation.setType(pet.getType());
        reservation.setGender(pet.getGender());
        reservation.setAge(pet.getAge());
        reservation.setNote(note);

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date resDate = sdf.parse(reservationDay);
            reservation.setReservation_day(new java.sql.Date(resDate.getTime()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        reservation.setReservation_time(reservationTime);
        reservation.setCreated_at(new java.sql.Date(System.currentTimeMillis()));

        medicalReservationService.insertMedicalReservation(reservation);

        return "redirect:/main";
    }

    //미용,진료 예약 리스트
    @GetMapping("/reservation")
    public String viewAllReservations(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("id");
        if (userId == null) return "redirect:/login";

        List<MedicalReservationDTO> medicalList = medicalReservationService.getReservationsByUserId(userId);
        List<BeautyDTO> beautyList = reservationBeautyService.getBeautyReservationsByUserId(userId);

        // ✅ 여기서 진료/미용을 합치고 정렬
        List<UnifiedReservationDTO> mergedList = ReservationUtils.mergeAndSort(medicalList, beautyList);

        model.addAttribute("allReservations", mergedList);
        log.info(mergedList.toString());
        return "user/reservation_list";
    }
       
}
