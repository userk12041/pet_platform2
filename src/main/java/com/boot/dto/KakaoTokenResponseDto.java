package com.boot.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KakaoTokenResponseDto {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("refresh_token")
    private String refreshToken;

    @JsonProperty("token_type")
    private String tokenType;

    @JsonProperty("expires_in")
    private int expiresIn;

    private String scope;

    @JsonProperty("id_token")
    private String idToken;
}
