package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.PetDTO;
import com.boot.dto.UserDTO;
import com.boot.service.PetService;
import com.boot.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserService service;

    @Autowired
    private PetService petService;

    // 로그인
    @RequestMapping("/login")
    public String login(Model model) {
        log.info("@# login()");
        return "user/login";
    }

    // 로그인 처리
    @RequestMapping("/login_yn")
    public String loginYn(@RequestParam HashMap<String, String> param, HttpSession session) {
        log.info("@# loginYn()");

        ArrayList<UserDTO> dtos = service.loginYn(param);

        if (dtos.isEmpty()) {
            return "redirect:login";
        } else {
            if (param.get("password").equals(dtos.get(0).getPassword())) {
                String loginID = param.get("user_id");
                session.setAttribute("id", loginID);
                return "redirect:main";
            }
            return "redirect:login";
        }
    }

    // 메인
    @RequestMapping("/main")
    public String main() {
        log.info("@# main()");
        return "main";
    }

    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("id");
        return "redirect:main";
    }

    // 등록 폼
    @RequestMapping("/register")
    public String register() {
        log.info("@# register()");
        return "user/register";
    }

    // 등록 처리
    @RequestMapping("/registerOk")
    public String registerOk(@RequestParam HashMap<String, String> param) {
        log.info("@# registerOk()");
        service.write(param);
        return "redirect:login";
    }

    // 마이페이지
    @RequestMapping("/mypage_info")
    public String myPage(HttpSession session, Model model) {
        log.info("@# myPage()");
        String userId = (String) session.getAttribute("id");
        log.info("@# session id=>"+userId);
        if (userId == null || userId.equals("")) {
            return "redirect:login";
        }

        UserDTO myInfo = service.getUserInfo(userId);
        List<PetDTO> pets = petService.getPetsByUserId(userId); // ✅ 펫 리스트 가져오기

        model.addAttribute("my_info", myInfo);
        log.info("@# myinfo=>"+myInfo);
        model.addAttribute("pets", pets); // ✅ JSP에 전달
        log.info("@# pets=>"+pets);

        return "user/mypage";
    }

    // 정보 수정 폼
    @RequestMapping("/user_info_modify")
    public String user_info_modify(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("id");
        if (user_id == null) {
            return "redirect:login";
        }

        UserDTO user = service.getUserInfo(user_id);
        model.addAttribute("user", user);

        return "user/user_info_modify";
    }

    // 정보 수정 처리
    @RequestMapping("/user_info_modify_pro")
    public String user_info_modify_pro(UserDTO user, HttpSession session) {
        log.info("@# user_info_modify_pro: {}", user);
        String user_id = (String) session.getAttribute("id");
        if (user_id == null) return "redirect:/login";

        service.updateUserInfo(user);
        return "redirect:/mypage_info";
    }

    // 아이디 중복 체크
    @RequestMapping(value = "idCheck", method = RequestMethod.GET)
    @ResponseBody
    public String idCheck(@RequestParam("user_id") String user_id) {
        user_id = user_id.trim();
        int count = service.idCheck(user_id);
        return (count == 0) ? "usable" : "duplicate";
    }

    // 닉네임 중복 체크
    @RequestMapping(value = "nickCheck", method = RequestMethod.GET)
    @ResponseBody
    public String nickCheck(@RequestParam("nickname") String nick) {
        nick = nick.trim();
        int count = service.nickCheck(nick);
        return (count == 0) ? "usable" : "duplicate";
    }

    // 회원 탈퇴
    @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
    public String deleteUser(HttpSession session) {
        String userId = (String) session.getAttribute("id");
        if (userId == null) return "redirect:/login";

        service.deleteUser(userId);
        session.invalidate();

        return "redirect:/main";
    }

    // 미용 예약 임시 접근
    @GetMapping("/pet_beauty")
    public String beautyPet() {
        return "pet/pet_beauty";
    }
}
