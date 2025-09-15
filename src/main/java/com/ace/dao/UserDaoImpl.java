package com.ace.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.domain.Permission;
import com.ace.domain.Users;

@Repository
public class UserDaoImpl implements UserDao {


	 @Resource(name="session")
	    private SqlSession sqlSession;
	
	@Override
	public Users userLoginCheck(Users users) {
		return sqlSession.selectOne("users.userLoginCheck", users);
	}

	@Override
	public Permission userLoginPermission(Users loginUser) {
		return sqlSession.selectOne("users.userLoginPermission", loginUser);
	}
	@Override
	public List<Users> userInsertSelect(Users users) {
		return sqlSession.selectList("users.userInsertSelect",users);
	}
    @Override
    public void userInsertDel(Users users) {
        sqlSession.update("users.userInsertDel", users);
    }
	@Override
	public Users userDuplicateCheck(Users users) {
		return sqlSession.selectOne("users.userDuplicateCheck",users);
	}

	@Override
	public void userInsertInsert(Users users) {
		sqlSession.insert("users.userInsertInsert",users);
	}
	@Override
	public void userPermissionUpdate(Permission permission) {
		sqlSession.update("users.userPermissionUpdate",permission);
	}
	@Override
	public List<Users> userPermissionUserSelect() {
		return sqlSession.selectList("users.userPermissionUserSelect");
	}

}
