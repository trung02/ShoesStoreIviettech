/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.repository.ImageRepository;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author trunghuynh
 */
@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;
    
    public List<ImageEntity> getImages(long id){
        List<ImageEntity> list = imageRepository.findByProductId(id);
        return list;
    }
    
    public void delete(long id){
        imageRepository.deleteById(id);
    }
    public void delete(ImageEntity entity){
        imageRepository.delete(entity);
    }
    
    
    public String uploadImage(CommonsMultipartFile file) {
        String uploadRootPath = "/Users/trunghuynh/Downloads/Spring_MVC_Project_Final-2-2/src/main/webapp/resources/image"
                ;
        File uploadRootDir = new File(uploadRootPath);
        // Tạo thư mục gốc upload nếu nó không tồn tại.
        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }
        CommonsMultipartFile fileData = file;
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
        return fileName;
    }
    
    public void save(ImageEntity imageEntity){
        imageRepository.save(imageEntity);
    }
              
        
}
