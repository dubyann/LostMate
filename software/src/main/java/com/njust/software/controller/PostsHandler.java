package com.njust.software.controller;

import com.njust.software.entity.Posts;
import com.njust.software.entity.Users;
import com.njust.software.repository.PostsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/10 17:26
 * @注释
 */
@RestController
@RequestMapping("/post")
@CrossOrigin
public class PostsHandler {
    @Autowired
    private PostsRepository postsRepository;

    @GetMapping("/search")
    public ResponseEntity<List<Posts>> searchPosts(@RequestParam String title, @RequestParam String category) {
        List<Posts> posts = postsRepository.findByTitleContainingAndCategoryAndStatusNot(title, category,"待审核", "审核未通过");
        return ResponseEntity.ok(posts);
    }

    @PostMapping("/addPost")
    public Posts addPost(@RequestBody Posts post){
        // 设置帖子状态
        post.setStatus("待审核");

        // 保存
        Posts result = postsRepository.save(post);
        if (result != null) {
            return result;
        } else {
            return null;
        }

    }
    @CrossOrigin
    @GetMapping("/findByUserId")
    public List<Posts> findByUserId(@RequestParam Integer userId){
        if (userId == null) {
            // 处理 userId 为 null 的情况，例如返回空列表或抛出异常
            return Collections.emptyList();
        }
        return postsRepository.findByUserId(userId);
    }

}
