package com.ace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.UserDao;
import com.ace.domain.Users;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao loginDao;

    @Override
    public Users loginCheck(Users login) {
       
        Users result = loginDao.loginCheck(login);

        if (result != null) {

            if (result.getPassword().equals(login.getPassword())) {
                return result; 
            }
        }
        return null;
    }
}
