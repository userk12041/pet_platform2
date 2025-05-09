package com.boot.service;

import com.boot.dto.KakaoTokenResponseDto;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Slf4j
@Service
public class KakaoService {

    @Value("${kakao.client_id}")
    private String clientId;

    @Value("${kakao.redirect_uri}")
    private String redirectUri;

    private static final String KAUTH_TOKEN_URL = "https://kauth.kakao.com";
    private static final String KAPI_USER_URL = "https://kapi.kakao.com";

    // 1. 액세스 토큰 발급
    public String getAccessToken(String code) {
        KakaoTokenResponseDto tokenResponse = WebClient.create(KAUTH_TOKEN_URL)
                .post()
                .uri(uriBuilder -> uriBuilder
                        .path("/oauth/token")
                        .queryParam("grant_type", "authorization_code")
                        .queryParam("client_id", clientId)
                        .queryParam("redirect_uri", redirectUri)
                        .queryParam("code", code)
                        .build())
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_FORM_URLENCODED_VALUE)
                .retrieve()
                .bodyToMono(KakaoTokenResponseDto.class)
                .block();

        if (tokenResponse == null || tokenResponse.getAccessToken() == null) {
            throw new RuntimeException("카카오 토큰 발급 실패");
        }

        log.info("🟢 카카오 액세스 토큰: {}", tokenResponse.getAccessToken());
        return tokenResponse.getAccessToken();
    }

    // 2. 사용자 이메일 가져오기
    public String getUserEmail(String accessToken) {
        String response = WebClient.create(KAPI_USER_URL)
                .get()
                .uri("/v2/user/me")
                .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                .retrieve()
                .bodyToMono(String.class)
                .block();

        JsonObject json = JsonParser.parseString(response).getAsJsonObject();
        JsonObject kakaoAccount = json.getAsJsonObject("kakao_account");
        String email = kakaoAccount.get("email").getAsString();

        log.info("📩 카카오 이메일: {}", email);
        return email;
    }
}
