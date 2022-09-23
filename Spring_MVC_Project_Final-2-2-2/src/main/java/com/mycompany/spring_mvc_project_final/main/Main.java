/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.main;


import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import static java.sql.Types.NULL;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


public class Main {

    public static void main(String[] args) {
        List<ProductEntity> list = new ArrayList<>();
        
        ProductEntity entity = new ProductEntity();
        
        entity.setId(1);
        System.out.println(entity.getId());
        System.out.println(entity.getName());
        entity.setId(NULL);
        System.out.println(entity.getId());
        System.out.println(entity.getName());
        

        
        
        System.out.println("password===>" + encrytePassword("123456"));

    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
}
