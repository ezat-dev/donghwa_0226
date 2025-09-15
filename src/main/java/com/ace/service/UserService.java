package com.ace.service;

import java.util.List;

import com.ace.domain.Permission;
import com.ace.domain.Users;

public interface UserService {
   
	

	Users userLoginCheck(Users users);

	Permission userLoginPermission(Users loginUser);
	
	List<Users> userInsertSelect(Users users);
	
	void userInsertDel(Users users);
	
	Users userDuplicateCheck(Users users);
	
	void userInsertInsert(Users users);

	void userPermissionUpdate(Permission permission);

	List<Users> userPermissionUserSelect();
}
