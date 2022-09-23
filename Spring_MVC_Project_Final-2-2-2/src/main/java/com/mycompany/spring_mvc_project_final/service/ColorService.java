/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.repository.ColorRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author trunghuynh
 */
@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepositoty;
    
    public List<ColorEntity> getColors(){
        List<ColorEntity> list = (List<ColorEntity>) colorRepositoty.findAll();
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();    
    }
}
