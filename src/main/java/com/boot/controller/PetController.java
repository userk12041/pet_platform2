package com.boot.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.BeautyDTO;
import com.boot.dto.PetDTO;
import com.boot.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    // 등록 폼 보기
    @GetMapping("/register")
    public String showRegisterForm() {
        return "pet/pet_register";
    }

    // 등록 처리
    @PostMapping("/register")
    public String registerPet(PetDTO pet) {
        petService.insertPet(pet);
        return "redirect:/pet/list";
    }

//    // 전체 펫 목록 보기 - 관리자 2
//    @GetMapping("/list")
//    public String listPets(Model model) {
//        List<PetDTO> pets = petService.getAllPets();
//        model.addAttribute("pets", pets);
//        return "pet_list";
//    }
    
    // 유저의 펫 목록 보기
    @GetMapping("/list")
    public String listPets(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("id");
        if (userId == null) return "redirect:/login";

        List<PetDTO> pets = petService.getPetsByUserId(userId);
        model.addAttribute("pets", pets);
        return "pet/pet_list";
    }


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
        return "redirect:/pet/list";
    }
    
    @GetMapping("/beautyReservation/{petId}")
    public String groomingReservation(@PathVariable int petId, Model model) {
        PetDTO pet = petService.getPetById(petId);
        model.addAttribute("pet", pet);
        return "pet/pet_beauty";
    }
    
    @PostMapping("/beautyReservation")
    public String beautyReservation(@RequestParam int petId,
                                    @RequestParam String weight,
                                    @RequestParam String style,
                                    @RequestParam String note,
                                    @RequestParam String reservationDay,
                                    @RequestParam String reservationTime) {

        PetDTO pet = petService.getPetById(petId);

        BeautyDTO reservation = new BeautyDTO();
        reservation.setPetId(petId);
        reservation.setName(pet.getName());
        reservation.setType(pet.getType());
        reservation.setGender(pet.getGender());
        reservation.setAge(pet.getAge());
        reservation.setWeight(Double.parseDouble(weight));  // ← 숫자형이면 변환
        reservation.setStyle(style);
        reservation.setNote(note);
        
     // String -> Date 변환 (예약 날짜만)
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date resDay = (Date) dateFormat.parse(reservationDay);
            reservation.setReservationDay(resDay);
        } catch (ParseException e) {
            e.printStackTrace();  // 에러 처리
        }

        // 시간은 문자열 그대로
        reservation.setReservationTime(reservationTime);

//        reservation.setReservedAt(new java.sql.Date(System.currentTimeMillis())); //날짜
        reservation.setReservedAt(new java.sql.Timestamp(System.currentTimeMillis())); //날짜+시간
        
        petService.beautyReservation(reservation);
        

        return "redirect:/main";
    }

}
