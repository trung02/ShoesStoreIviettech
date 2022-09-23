/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author trunghuynh
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private ImageService imageService;
    public void save(AccountEntity accountEntity) {
        if (accountEntity.getFileData().getSize()>0) {
            String uploadRootPath = "/Users/trunghuynh/Downloads/PR41_Spring_MVC_Product-3/src/main/webapp/resources/image";
            File uploadRootDir = new File(uploadRootPath);
            // Tạo thư mục gốc upload nếu nó không tồn tại.
            if (!uploadRootDir.exists()) {
                uploadRootDir.mkdirs();
            }
            CommonsMultipartFile fileData = accountEntity.getFileData();
            // Tên file gốc tại Client.

            String fileName = fileData.getOriginalFilename();
            System.out.println("Client File Name = " + fileName);
            if (fileName != null && fileName.length() > 0) {
                try {
                    // Tạo file tại Server.
                    File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + fileName);

                    // Luồng ghi dữ liệu vào file trên Server.
                    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                    stream.write(fileData.getBytes());
                    stream.close();
                    System.out.println("Write file: " + serverFile);
                } catch (Exception e) {
                    System.out.println("Error Write file: " + fileName);
                }
            }
            accountEntity.setPath(fileName);
        }
        accountRepository.save(accountEntity);
    }

    public String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    public AccountEntity findByEmail(String email, UserStatus status) {
        AccountEntity acc = accountRepository.findByEmailLikeAndStatusLike(email, status);
        return acc;
    }

}
