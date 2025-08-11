package com.njust.software.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/11 13:50
 * @注释
 */
@Configuration
public class FileUploadConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/**").
                addResourceLocations("file:///E:/桌面/learn_springboot/software/src/main/resources/static/uploads/");
        //如果不知道如何以file开头就用浏览器打开该图片
    }
}
