package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.UserDAO;
import com.boot.dto.UserDTO;

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

//	@Override
//	public HashMap<String, String> getUserInfo(String user_id) {
//		UserDAO dao = sqlSession.getMapper(UserDAO.class);
//		return dao.getUserInfo(user_id);
//	}
	
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
    public List<UserDTO> getAllUsers() {
    	UserDAO dao = sqlSession.getMapper(UserDAO.class);
        return dao.getAllUsers();
    }
}
