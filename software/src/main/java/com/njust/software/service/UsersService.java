package com.njust.software.service;

import com.njust.software.entity.Users;
import com.njust.software.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/9 15:40
 * @注释
 */
@Service
public class UsersService {
    @Autowired
    private UsersRepository userRepository;


}
