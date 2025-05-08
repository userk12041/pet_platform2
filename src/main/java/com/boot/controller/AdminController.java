package com.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.dto.UserDTO;
import com.boot.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
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
	
	@PostMapping("/users/delByAdmin/{user_id}")
	public String delUserByAdmin(String user_id) {
		userService.deleteUser(user_id);
		log.info("@# del_user_id =>"+user_id);
		return "삭제 완료";
	}
}
