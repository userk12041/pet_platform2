package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.UserDTO;


public interface UserService {
	public ArrayList<UserDTO> loginYn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
//	HashMap<String, String> getUserInfo(String user_id);
    UserDTO getUserInfo(String user_id);
    void updateUserInfo(UserDTO user);
    public int idCheck(String user_id);
    public int nickCheck(String nick);
	void deleteUser(String userId);

}
