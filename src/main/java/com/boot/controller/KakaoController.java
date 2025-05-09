package com.boot.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boot.dto.UserDTO;
import com.boot.service.UserService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class KakaoController {

    private final String CLIENT_ID = "2b5e5d8cc69008191627a44e138e6f4e";
    private final String REDIRECT_URI = "http://localhost:8485/kakao/callback";

    @Autowired
    private UserService userService;

    @GetMapping("/oauth/kakao")
    public void redirectToKakao(HttpServletResponse response) throws IOException {
        String redirectUri = URLEncoder.encode(REDIRECT_URI, "UTF-8");
        String state = UUID.randomUUID().toString();

        String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize"
                + "?response_type=code"
                + "&client_id=" + CLIENT_ID
                + "&redirect_uri=" + redirectUri
                + "&state=" + state;

        response.sendRedirect(kakaoAuthUrl);
    }

    @GetMapping("/kakao/callback")
    public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
        try {
            String accessToken = getAccessToken(code);
            String userId = getUserInfoAndInsertIfNeeded(accessToken);
            session.setAttribute("id", userId);
            return "redirect:/main";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error";
        }
    }

    private String getAccessToken(String code) throws IOException {
        String reqUrl = "https://kauth.kakao.com/oauth/token";

        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        String params = "grant_type=authorization_code"
                + "&client_id=" + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&code=" + code;

        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {
            bw.write(params);
            bw.flush();
        }

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            throw new IOException("토큰 요청 실패: HTTP " + responseCode);
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        JsonObject json = JsonParser.parseString(sb.toString()).getAsJsonObject();
        return json.get("access_token").getAsString();
    }

    private String getUserInfoAndInsertIfNeeded(String accessToken) throws IOException {
        String reqUrl = "https://kapi.kakao.com/v2/user/me";

        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            throw new IOException("사용자 정보 요청 실패: HTTP " + responseCode);
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        JsonObject json = JsonParser.parseString(sb.toString()).getAsJsonObject();
        JsonObject kakaoAccount = json.getAsJsonObject("kakao_account");
        JsonObject properties = json.getAsJsonObject("properties");

        // 사용자 ID = 이메일 (우선), 없으면 UUID로 대체
        String userId;
        if (kakaoAccount.has("email") && !kakaoAccount.get("email").isJsonNull()) {
            userId = kakaoAccount.get("email").getAsString();
        } else {
            userId = UUID.randomUUID().toString() + "@kakao.local";
        }

        String nickname = properties.has("nickname") ? properties.get("nickname").getAsString() : "카카오사용자";

        // DB에 존재하는지 확인
        UserDTO existing = userService.getUserInfo(userId);
        if (existing == null) {
            UserDTO user = new UserDTO();
            user.setUser_id(userId);
            user.setPassword("kakao"); // OAuth라 사용 안함
            user.setNickname(nickname);
            user.setUser_name(nickname);
            user.setEmail(userId);

            try {
                userService.insertKakaoUser(user);
            } catch (DuplicateKeyException e) {
                System.out.println("이미 존재하는 카카오 사용자입니다: " + userId);
            }
        }

        return userId;
    }
}
