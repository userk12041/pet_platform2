package com.boot.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
	
//	@GetMapping("/user/list")
//	public String userList(Model model) {
//		ArrayList<UserDTO> userList = userService.getUserList();
//		model.addAttribute("userList", userList);
//		return "admin/user_list";
//	}
	@GetMapping("/user/list")
	public String userList(
	    @RequestParam(value = "page", defaultValue = "1") int page,
	    @RequestParam(value = "sortField", defaultValue = "user_id") String sortField,
	    @RequestParam(value = "order", defaultValue = "asc") String order,
	    @RequestParam(value = "searchField", required = false) String searchField,
	    @RequestParam(value = "keyword", required = false) String keyword,
	    Model model
	) {
	    int pageSize = 10;

	    // 검색과 정렬에 따른 데이터 조회
	    int totalCount = (keyword != null && !keyword.isEmpty())
	        ? userService.getSearchCount(searchField, keyword)
	        : userService.getTotalCount();

	    List<UserDTO> userList = (keyword != null && !keyword.isEmpty())
	        ? userService.getPagedSearchResults(searchField, keyword, sortField, order, page, pageSize)
	        : userService.getPagedUsersSorted(sortField, order, page, pageSize);

	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);
	    int pageBlock = 10;
	    int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
	    int endPage = Math.min(startPage + pageBlock - 1, totalPage);

	    model.addAttribute("userList", userList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("hasPrev", startPage > 1);
	    model.addAttribute("hasNext", endPage < totalPage);
	    model.addAttribute("sortField", sortField);
	    model.addAttribute("order", order);
	    model.addAttribute("searchField", searchField);
	    model.addAttribute("keyword", keyword);

	    
	    // 검색 필드/정렬 필드 목록 전달
	    Map<String, String> searchFields = new LinkedHashMap<>();
	    searchFields.put("user_id", "아이디");
	    searchFields.put("user_name", "이름");

	    Map<String, String> sortFields = new LinkedHashMap<>();
	    sortFields.put("user_id", "ID");
	    sortFields.put("user_name", "이름");
	    sortFields.put("email", "이메일");

	    model.addAttribute("searchFields", searchFields);
	    model.addAttribute("sortFields", sortFields);
	    
	    log.info("@#searchFields=>"+searchFields);
	    log.info("@#sortFields=>"+sortFields);
	    
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
	public String medicalList(
		    @RequestParam(value = "page", defaultValue = "1") int page,
		    @RequestParam(value = "sortField", defaultValue = "user_id") String sortField,
		    @RequestParam(value = "order", defaultValue = "asc") String order,
		    @RequestParam(value = "searchField", required = false) String searchField,
		    @RequestParam(value = "keyword", required = false) String keyword,
		    Model model
		) {
		int pageSize = 10;

	    // 검색과 정렬에 따른 데이터 조회
	    int totalCount = (keyword != null && !keyword.isEmpty())
	        ? medicalService.getSearchCount(searchField, keyword)
	        : medicalService.getTotalCount();
	    List<MedicalDTO> MedicalList = (keyword != null && !keyword.isEmpty())
		        ? medicalService.getPagedSearchResults(searchField, keyword, sortField, order, page, pageSize)
		        : medicalService.getPagedUsersSorted(sortField, order, page, pageSize);
	    
	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);
	    int pageBlock = 10;
	    int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
	    int endPage = Math.min(startPage + pageBlock - 1, totalPage);

	    model.addAttribute("medicalList", MedicalList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("hasPrev", startPage > 1);
	    model.addAttribute("hasNext", endPage < totalPage);
	    model.addAttribute("sortField", sortField);
	    model.addAttribute("order", order);
	    model.addAttribute("searchField", searchField);
	    model.addAttribute("keyword", keyword);

	    
	    // 검색 필드/정렬 필드 목록 전달
	    Map<String, String> searchFields = new LinkedHashMap<>();
	    searchFields.put("id", "번호");
	    searchFields.put("pet_name", "펫 이름");

	    Map<String, String> sortFields = new LinkedHashMap<>();
	    sortFields.put("id", "번호");
	    sortFields.put("pet_name", "펫 이름");
	    sortFields.put("treatment_date", "진료일");

	    model.addAttribute("searchFields", searchFields);
	    model.addAttribute("sortFields", sortFields);
	    
	    log.info("@#searchFields=>"+searchFields);
	    log.info("@#sortFields=>"+sortFields);
	    
//		ArrayList<MedicalDTO> MedicalList = medicalService.getMedicalList();
//		model.addAttribute("medicalList", MedicalList);
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
