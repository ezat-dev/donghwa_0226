package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.UserDao;
import com.ace.domain.Permission;
import com.ace.domain.Users;

@Service
public class UserServiceImpl implements UserService {
	 
	
	@Autowired
	    private UserDao userDao;

	    @Override
	    public Users userLoginCheck(Users users) {
	        return userDao.userLoginCheck(users);
	    }

	    @Override
	    public Permission userLoginPermission(Users loginUser) {
	        return userDao.userLoginPermission(loginUser);
	    }
	    
	    
	    @Override
	    public List<Users> userInsertSelect(Users users) {
	        return userDao.userInsertSelect(users);
	    }

	    @Override
	    public void userInsertDel(Users users) {
	        userDao.userInsertInsert(users);
	    }

	    @Override
	    public Users userDuplicateCheck(Users users) {
	        return userDao.userDuplicateCheck(users);
	    }

	    
	    @Override
	    public void userInsertInsert(Users users) {
	        userDao.userInsertInsert(users);
	    }

	    @Override
	    public void userPermissionUpdate(Permission permission) {
	        userDao.userPermissionUpdate(permission);
	    }

	    @Override
	    public List<Users> userPermissionUserSelect() {
	        return userDao.userPermissionUserSelect();
	    }


}
