package com.njust.software.repository;

import com.njust.software.entity.Posts;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/10 17:36
 * @注释
 */
@SpringBootTest
class PostsRepositoryTest {
    @Autowired
    private PostsRepository postsRepository;

    @Test
    void findPost(){
        String title="球";
        String category="交友组局";
        List<Posts> posts=postsRepository.findByTitleContainingAndCategoryAndStatusNot(title,category,"待审核", "审核未通过");
        for(Posts post:posts){
            System.out.println(post.getTitle());
        }
    }


    @Test
    void findByid(){
        int userId=21;
        List<Posts> res=postsRepository.findByUserId(userId);
        for(Posts p:res){
            System.out.println(p.getTitle());
        }
    }

}