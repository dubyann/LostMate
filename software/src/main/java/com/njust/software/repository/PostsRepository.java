package com.njust.software.repository;

import com.njust.software.entity.Posts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/10 17:16
 * @注释
 */
public interface PostsRepository extends JpaRepository<Posts,Integer> {
    List<Posts> findByTitleContainingAndCategory(String title, String category);

    List<Posts> findByUserId(Integer userId);
    // 使用 @Query 注解自定义查询方法
    @Query("SELECT p FROM Posts p WHERE p.title LIKE %:title% AND p.category = :category AND p.status NOT IN :excludedStatuses")
    List<Posts> findByTitleContainingAndCategoryAndStatusNot(
            @Param("title") String title,
            @Param("category") String category,
            String... excludedStatuses // 表示可变参数
    );
}
