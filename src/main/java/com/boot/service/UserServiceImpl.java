package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.UserDAO;
import com.boot.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<UserDTO> loginYn(HashMap<String, String> param) {
		UserDAO dao=sqlSession.getMapper(UserDAO.class);
		ArrayList<UserDTO> list = dao.loginYn(param);
		
		return list;
	}

	@Override
	public void write(HashMap<String, String> param) {
		UserDAO dao=sqlSession.getMapper(UserDAO.class);
		dao.write(param);
	}
	
	@Override
    public UserDTO getUserInfo(String user_id) {
        UserDAO dao = sqlSession.getMapper(UserDAO.class);
        return dao.getUserInfo(user_id);
    }

    @Override
    public void updateUserInfo(UserDTO user) {
        UserDAO dao = sqlSession.getMapper(UserDAO.class);
        dao.updateUserInfo(user);
    }

	@Override
	public int idCheck(String user_id) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    return dao.idCheck(user_id);
	}

	@Override
	public int nickCheck(String nick) {
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		return dao.nickCheck(nick);
	}
	@Override
	public void deleteUser(String userId) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    dao.deleteUser(userId);
	}

	//test
    @Override
    public ArrayList<UserDTO> getUserList() {
    	UserDAO dao = sqlSession.getMapper(UserDAO.class);
        return dao.getUserList();
    }
    
    @Override
    public void insertKakaoUser(UserDTO user) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    dao.insertKakaoUser(user);
	}

}
