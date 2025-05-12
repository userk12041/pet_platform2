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

import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.PetDTO;
import com.boot.dto.UserDTO;
import com.boot.service.MedicalReservationService;
import com.boot.service.PetService;
import com.boot.service.UserService;

@Controller
@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private MedicalReservationService medicalReservationService;

    // 등록 폼 보기
    @GetMapping("/register")
    public String showRegisterForm() {
        return "pet/pet_register";
    }

    // 등록 처리
    @PostMapping("/register")
    public String registerPet(PetDTO pet, HttpSession session) {
        String userId = (String) session.getAttribute("id");
        if (userId == null) {
            return "redirect:/login";
        }

        pet.setUser_id(userId); // 세션에서 유저 ID 주입
        petService.insertPet(pet);

        return "redirect:/mypage_info";
    }

//    // 전체 펫 목록 보기 - 관리자 2
//    @GetMapping("/list")
//    public String listPets(Model model) {
//        List<PetDTO> pets = petService.getAllPets();
//        model.addAttribute("pets", pets);
//        return "pet_list";
//    }
    
    // 유저의 펫 목록 보기
//    @GetMapping("/list")
//    public String listPets(HttpSession session, Model model) {
//        String userId = (String) session.getAttribute("id");
//        if (userId == null) return "redirect:/login";
//
//        List<PetDTO> pets = petService.getPetsByUserId(userId);
//        model.addAttribute("pets", pets);
//        return "pet/pet_list";
//    }


    // 펫 상세 보기
    @GetMapping("/detail/{id}")
    public String viewPet(@PathVariable int id, Model model) {
        PetDTO pet = petService.getPetById(id);
        model.addAttribute("pet", pet);
        return "pet/pet_detail"; 
    }

    // 수정 폼 보기
    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable int id, Model model) {
        PetDTO pet = petService.getPetById(id);
        model.addAttribute("pet", pet);
        return "pet/pet_update";
    }

    // 수정 처리
    @PostMapping("/update")
    public String updatePet(
            @RequestParam("id") int id,
            @RequestParam("name") String name,
            @RequestParam("gender") String gender,
            @RequestParam("type") String type,
            @RequestParam("age") int age,
            @RequestParam("description") String description
    ) {
        PetDTO pet = new PetDTO();
        pet.setId(id);
        pet.setName(name);
        pet.setGender(gender);
        pet.setType(type);
        pet.setAge(age);
        pet.setDescription(description);

        petService.updatePet(pet);

        return "redirect:/pet/detail/" + id;
    }

    // 삭제 처리
    @PostMapping("/delete/{id}")
    public String deletePet(@PathVariable int id) {
        petService.deletePet(id);
        return "redirect:/mypage_info";
    }
    
    @GetMapping("/pet_beauty/{petId}")
    public String beautyReservationPage(@PathVariable int petId, HttpSession session, Model model) {
        PetDTO pet = petService.getPetById(petId);
        model.addAttribute("pet", pet);

        // 유저 정보도 가져오기
        String userId = (String) session.getAttribute("id");
        if (userId != null) {
            UserDTO myInfo = userService.getUserInfo(userId);  // 💥 요거 userService로!
            model.addAttribute("my_info", myInfo);
        }

        return "pet/pet_beauty";
    }
    
    @PostMapping("/beautyReservation")
    public String beautyReservation(@RequestParam int petId,
                                    @RequestParam String weight,
                                    @RequestParam String style,
                                    @RequestParam String note,
                                    @RequestParam String reservationDay,
                                    @RequestParam String reservationTime,
                                    @RequestParam String userName,
                                    @RequestParam String userPhone) {

        PetDTO pet = petService.getPetById(petId);

        BeautyDTO reservation = new BeautyDTO();
        reservation.setPet_id(petId);
        reservation.setName(pet.getName());
        reservation.setType(pet.getType());
        reservation.setGender(pet.getGender());
        reservation.setAge(pet.getAge());
        reservation.setWeight(Double.parseDouble(weight));
        reservation.setStyle(style);
        reservation.setNote(note);

        // 예약자 정보 추가
        reservation.setUser_name(userName);
        reservation.setUser_phone(userPhone);

        // String -> Date 변환 (예약 날짜)
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date resDay = (Date) dateFormat.parse(reservationDay);
            reservation.setReservation_day(resDay);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        reservation.setReservation_time(reservationTime);

        // 신청일시 (날짜 + 시간)
        reservation.setReserved_at(new java.sql.Timestamp(System.currentTimeMillis()));

        petService.beautyReservation(reservation);

        return "redirect:/main";
    }

}
