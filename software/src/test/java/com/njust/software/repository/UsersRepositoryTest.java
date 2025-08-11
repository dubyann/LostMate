package com.njust.software.repository;

import com.njust.software.entity.Users;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/8 15:14
 * @注释
 */
@SpringBootTest
class UsersRepositoryTest {
    @Autowired
    private UsersRepository usersRepository;
    @Test
    void findAll(){
        System.out.println(usersRepository.findAll());
    }

    @Test
    void save(){
        Users user=new Users();
        user.setUsername("99999");
        user.setEmail("imak63344@gmail.com");
        user.setPassword("1121313");
        user.setRole("用户");
        user.setStatus("正常");
        Users u=usersRepository.save(user);
        System.out.println(u);
    }

    @Test
    void findUser(){
        Users user = usersRepository.findById(21)
                .orElseThrow(() -> new RuntimeException("User not found"));
        System.out.println(user.getUsername());
    }




}