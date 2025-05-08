package com.boot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class NaverController {
	@GetMapping("/oauth/naver")
	public void redirectToNaver(HttpServletResponse response) throws IOException {
	    String clientId = "NF0hZBlTWl9kYWjK_E6X";
	    String redirectUri = URLEncoder.encode("http://localhost:8282/naver/callback", "UTF-8");
	    String state = UUID.randomUUID().toString();

	    String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
	            + "&client_id=" + clientId
	            + "&redirect_uri=" + redirectUri
	            + "&state=" + state;

	    response.sendRedirect(naverAuthUrl);
	}

	@GetMapping("/naver/callback")
	public String naverCallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
	    String clientId = "NF0hZBlTWl9kYWjK_E6X";
	    String clientSecret = "OEsNoiv3Vb";
	    String redirectUrl = URLEncoder.encode("http://localhost:8282/naver/callback", "UTF-8");

	    // 🔸 Access Token 요청
	    String tokenRequestUrl = "https://nid.naver.com/oauth2.0/token"
	    	    + "?grant_type=authorization_code"
	    	    + "&client_id=" + clientId
	    	    + "&client_secret=" + clientSecret
	    	    + "&code=" + code
	    	    + "&state=" + state;

	    	URL url = new URL(tokenRequestUrl); // 
	    	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    	conn.setRequestMethod("GET");


	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    StringBuilder sb = new StringBuilder();
	    String line;
	    while ((line = br.readLine()) != null) {
	        sb.append(line);
	    }

	    JsonObject json = JsonParser.parseString(sb.toString()).getAsJsonObject();
	    String accessToken = json.get("access_token").getAsString();

	    // 🔸 사용자 정보 요청
	    URL userUrl = new URL("https://openapi.naver.com/v1/nid/me");
	    HttpURLConnection userConn = (HttpURLConnection) userUrl.openConnection();
	    userConn.setRequestProperty("Authorization", "Bearer " + accessToken);

	    BufferedReader userBr = new BufferedReader(new InputStreamReader(userConn.getInputStream()));
	    StringBuilder userInfoSb = new StringBuilder();
	    while ((line = userBr.readLine()) != null) {
	        userInfoSb.append(line);
	    }

	    JsonObject userJson = JsonParser.parseString(userInfoSb.toString()).getAsJsonObject();
	    JsonObject responseObj = userJson.getAsJsonObject("response");
	    String email = responseObj.get("email").getAsString();

	    session.setAttribute("id", email); // 세션 저장
	    return "redirect:/main";
	}



}
