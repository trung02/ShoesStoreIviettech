/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author trunghuynh
 */
@Service
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<PromotionEntity> getPromotions(){
        List<PromotionEntity> promotionEntitys = (List<PromotionEntity>) promotionRepository.findAll();
         if (!CollectionUtils.isEmpty(promotionEntitys)) {
            return promotionEntitys;
        }
        return new ArrayList<>();
    }
    
    public void save(PromotionEntity promotionEntity){
        promotionRepository.save(promotionEntity);
    }
    
    public void delete(Long id){
        promotionRepository.deleteById(id);
    }
    
    public PromotionEntity findPromotionById(long id) {
        Optional<PromotionEntity> promoOpt = promotionRepository.findById(id);
        if (promoOpt.isPresent()) {
            return promoOpt.get();
        }
        return new PromotionEntity();
    }
}
