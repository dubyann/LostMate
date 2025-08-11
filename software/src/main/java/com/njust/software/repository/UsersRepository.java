package com.njust.software.repository;

import com.njust.software.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/8 15:12
 * @注释
 */
public interface UsersRepository extends JpaRepository<Users, Integer> {
    Users findByUsername(String username);
    Users findByEmail(String email);
}
