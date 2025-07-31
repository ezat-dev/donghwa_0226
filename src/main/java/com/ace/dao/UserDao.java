package com.ace.dao;

import com.ace.domain.Users;

public interface UserDao {
    Users loginCheck(Users login);
}
