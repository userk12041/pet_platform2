package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.boot.dto.UserDTO;

public interface UserDAO {
    ArrayList<UserDTO> loginYn(HashMap<String, String> param);
    void write(HashMap<String, String> param);
    UserDTO getUserInfo(String user_id);
    void updateUserInfo(UserDTO user);
    int idCheck(String user_id);
    int nickCheck(String nick);

    // 🔥 회원탈퇴 메서드 추가
    void deleteUser(String userId);
    void insertKakaoUser(UserDTO user);
    
    //test
    public ArrayList<UserDTO> getUserList();
    int getSearchCount(Map<String, Object> params);
    List<UserDTO> getPagedSearchResults(Map<String, Object> params);
    int getTotalCount();
    List<UserDTO> getPagedUsersSorted(Map<String, Object> params);
}
