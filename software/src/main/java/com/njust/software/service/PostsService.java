package com.njust.software.service;

import com.njust.software.entity.Posts;
import com.njust.software.repository.PostsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/10 17:23
 * @注释
 */
@Service
public class PostsService {
    @Autowired
    private PostsRepository postsRepository;

    public List<Posts> findPosts(String title, String category) {
        return postsRepository.findByTitleContainingAndCategory(title, category);
    }
}
