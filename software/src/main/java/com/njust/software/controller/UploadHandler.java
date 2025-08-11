package com.njust.software.controller;

import com.njust.software.entity.Users;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

/**
 * @version 1.0
 * @Author Imak
 * @Date 2024/7/11 12:38
 * @注释
 */
@RestController
@CrossOrigin
@RequestMapping("/upload")
public class UploadHandler {


    @PostMapping("/image")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file) throws Exception {
        // 判断文件类型
        String pType = file.getContentType();
        if (pType == null) {
            return new ResponseEntity<>("", HttpStatus.BAD_REQUEST);
        }

        pType = pType.substring(pType.indexOf("/") + 1);
        if ("jpeg".equals(pType)) {
            pType = "jpg";
        }

        // 生成文件路径
        long time = System.currentTimeMillis();
        String fileName = "img" + time + "." + pType;
        String filePath = "E:/桌面/learn_springboot/software/src/main/resources/static/uploads/img" + time + "." + pType;
        File destFile = new File(filePath);

        // 确保上传目录存在
        if (!destFile.getParentFile().exists()) {
            destFile.getParentFile().mkdirs();
        }

        try {
            // 保存文件
            file.transferTo(destFile);

            // 构建文件的 URL 路径
            String fileUrl = "http://localhost:8182/static/uploads/" + fileName;

            // 返回成功响应
            return new ResponseEntity<>(fileUrl, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            // 返回错误响应
            return new ResponseEntity<>("", HttpStatus.INTERNAL_SERVER_ERROR);
        }



    }
}
