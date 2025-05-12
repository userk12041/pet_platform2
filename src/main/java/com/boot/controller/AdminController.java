package com.boot.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.BeautyDTO;
import com.boot.dto.MedicalDTO;
import com.boot.dto.MedicalReservationDTO;
import com.boot.dto.UserDTO;
import com.boot.service.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	@Autowired
	private MedicalService medicalService;
	@Autowired
	private ReservationBeautyService reservationBeautyService;
	@Autowired
	private MedicalReservationService medicalReservationService;
	
	@GetMapping("/user/list")
	public String userList(Model model) {
		ArrayList<UserDTO> userList = userService.getUserList();
		model.addAttribute("userList", userList);
		return "admin/user_list";
	}
	
	@GetMapping("/user/edit")
	public String userEdit(@RequestParam("id") String userId, Model model) {
		UserDTO user = userService.getUserInfo(userId);
		model.addAttribute("user", user);
		return "admin/user_edit";
	}
	
	@PostMapping("/user/update")
	public String userUpdate(UserDTO user) {
		userService.updateUserInfo(user);
		return "redirect:/admin/user/list";
	}
	
	@GetMapping("/user/delete")
	public String userDelete(@RequestParam("id") String userId) {
		userService.deleteUser(userId);
		return "redirect:/admin/user/list";
	}

	@GetMapping("/medical/list")
	public String medicalList(Model model) {
		ArrayList<MedicalDTO> MedicalList = medicalService.getMedicalList();
		model.addAttribute("medicalList", MedicalList);
		return "admin/medical_list";
	}
	
	@GetMapping("/medical/write")
	public String writeForm() {
	    return "admin/medical_write";
	}

	@PostMapping("/medical/write")
	public String writeSubmit(MedicalDTO dto) {
	    medicalService.insertMedical(dto);
	    return "redirect:/admin/medical/list";
	}
	@GetMapping("/medical/edit")
	public String editMedical(@RequestParam("id") Long id, Model model) {
	    MedicalDTO medical = medicalService.getMedicalInfo(id);
	    model.addAttribute("medical", medical);
	    return "admin/medical_edit";
	}

	@PostMapping("/medical/update")
	public String updateMedical(MedicalDTO dto) {
	    medicalService.updateMedicalInfo(dto);
	    return "redirect:/admin/medical/list";
	}

	@GetMapping("/medical/delete")
	public String medicalDeleteById(@RequestParam("id") Long id) {
		medicalService.deleteMedical(id);
		return "redirect:/admin/medical/list";
	}
	
	@GetMapping("/reservation/beauty")
	public String reservataionBeauty(Model model) {
		ArrayList<BeautyDTO> beautyList = reservationBeautyService.getReservationBeautyList();
		model.addAttribute("reservationBeauty", beautyList);
		return "admin/reservation_beauty";
	}

	@PostMapping("/reservation/beauty/approve")
	public String beautyApprove(@RequestParam("id") Long id) {
		reservationBeautyService.updateState(id,"승인");
	    return "redirect:/admin/reservation/beauty";
	}
	@PostMapping("/reservation/beauty/reject")
	public String beautyReject(@RequestParam("id") Long id) {
		reservationBeautyService.updateState(id,"거절");
	    return "redirect:/admin/reservation/beauty";
	}
	@PostMapping("/reservation/beauty/delete")
	public String beautyDelete(@RequestParam("id") Long id) {
		reservationBeautyService.deleteById(id);
	    return "redirect:/admin/reservation/beauty";
	}
	
	@GetMapping("/reservation/medical")
	public String reservataionMedical(Model model) {
		ArrayList<MedicalReservationDTO> medicalList = medicalReservationService.getReservationMedicalList();
		model.addAttribute("reservationMedical", medicalList);
		return "admin/reservation_medical";
	}
	@PostMapping("/reservation/medical/approve")
	public String medicalApprove(@RequestParam("id") Long id) {
		medicalReservationService.updateState(id,"승인");
	    return "redirect:/admin/reservation/medical";
	}
	@PostMapping("/reservation/medical/reject")
	public String medicalReject(@RequestParam("id") Long id) {
		medicalReservationService.updateState(id,"거절");
	    return "redirect:/admin/reservation/medical";
	}
	@PostMapping("/reservation/medical/delete")
	public String medicalDelete(@RequestParam("id") Long id) {
		medicalReservationService.deleteById(id);
	    return "redirect:/admin/reservation/medical";
	}
}
