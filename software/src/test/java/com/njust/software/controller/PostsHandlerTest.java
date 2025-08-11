package com.njust.software.controller;

import com.njust.software.entity.Posts;
import com.njust.software.entity.Users;
import com.njust.software.repository.PostsRepository;
import com.njust.software.repository.UsersRepository;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/10 17:35
 * @注释
 */
@SpringBootTest
class PostsHandlerTest {
    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private UsersRepository usersRepository;
    @Test
    void testAddPost(){
        Posts p=new Posts();
        p.setCategory("交友组局");
        p.setTitle("测试");
        p.setUserId(21);
        // 设置帖子状态
        p.setStatus("待审核");
        System.out.println(p.getUserId());

        Users user = usersRepository.findById(p.getUserId())
                    .orElseThrow(() -> new RuntimeException("User not found"));

            // 保存
        Posts result = postsRepository.save(p);

        System.out.println(result.getPost_id());
    }

}