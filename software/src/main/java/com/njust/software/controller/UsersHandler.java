package com.njust.software.controller;

import com.njust.software.entity.Users;
import com.njust.software.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/8 15:19
 * @注释
 */
@RestController
@RequestMapping("/user")
@CrossOrigin
public class UsersHandler {
    @Autowired
    private UsersRepository usersRepository;



    @GetMapping("/findAll")
    public List<Users> findAll(){
        return usersRepository.findAll();
    }

    @PostMapping("/insertUser")
    public String insertUser(@RequestBody Users user){
        // 检查用户名是否存在
        Users existingUser = usersRepository.findByUsername(user.getUsername());
        if (existingUser != null) {
            return "exists";
        }

        // 设置用户状态
        user.setStatus("正常");
        user.setRole("用户");
        // 保存用户
        Users result = usersRepository.save(user);
        if (result != null) {
            return "success";
        } else {
            return "error";
        }
    }

    @PostMapping("/login")
    public Users login(@RequestBody Users user){
        // 检查用户名是否存在
        Users existingUser = usersRepository.findByUsername(user.getUsername());
        if (existingUser != null) {
            //校验密码
            if(user.getPassword().equals(existingUser.getPassword())){
                //验证身份role，用户则跳转到系统首页，管理员跳转到后台
                return existingUser;

            }else return null;
        }else{
            //用户不存在
            return null;
        }
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestBody Users user){
        // 根据邮箱查找用户是否存在
        Users existingUser = usersRepository.findByEmail(user.getEmail());
        if (existingUser != null) {
            //重置密码
            existingUser.setPassword(user.getPassword());
            //更新用户
            usersRepository.save(existingUser);
            return "success";
        }else{
            //用户不存在
            return "error";
        }
    }

}
