package com.ace.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.domain.Users;

@Repository
public class UserDaoImpl implements UserDao {

	@Resource(name="session")
    private SqlSession sqlSession;

  

    @Override
    public Users loginCheck(Users login) {
        return sqlSession.selectOne("login.loginCheck", login);
    }
}
