package com.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.MedicalDTO;
import com.boot.dto.UserDTO;
import com.boot.service.MedicalService;
import com.boot.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MedicalService medicalService;
	
	@GetMapping("/main")
	public String adminHome() {
		return "admin/adminMain";
	}
	
	@GetMapping("/users")
	public String userList(Model model) {
		List<UserDTO> users = userService.getAllUsers();
		log.info("@# UserList=>"+users);
		model.addAttribute("userList",users);
		return "admin/adminUser";
	}
	@ResponseBody // 반환하는 문자열 View 가 아닌 HTTP 응답 본문에 쓰여 프론트엔드로 전송됨
	@DeleteMapping("/users/delByAdmin/{user_id}")
	public String delUserByAdmin(@PathVariable String user_id) {
		userService.deleteUser(user_id);
		log.info("@# del_user_id =>"+user_id);
		return "삭제 완료";
	}
	
	@GetMapping("/medical")
	public String adminMedical(Model model) {
		List<MedicalDTO> mediList = medicalService.getAllMedical();
		log.info("@# MedicalList=>"+mediList);
		
		model.addAttribute("mediList", mediList);
		return "admin/adminMedical";
	}
}
