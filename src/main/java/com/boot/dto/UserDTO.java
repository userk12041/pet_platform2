package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	private String user_id;
	private String user_name;
	private String password;
	private String email;
	private String phone_number;
	private String address;
	private String nickname;
}
