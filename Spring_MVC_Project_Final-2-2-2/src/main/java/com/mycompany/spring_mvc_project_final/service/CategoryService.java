/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.repository.CategoryRepository;
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
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    
    public List<CategoryEntity> getCategories (){
        List<CategoryEntity> categories = (List<CategoryEntity>) categoryRepository.findAll();
         if (!CollectionUtils.isEmpty(categories)) {
            return categories;
        }
        return new ArrayList<>();
    }
    
    public void save(CategoryEntity categoryEntity){
        categoryRepository.save(categoryEntity);   
    }
    
    public void delete(Long id){
        categoryRepository.deleteById(id);   
    }
    
    public List<CategoryEntity> search(String name){
        List<CategoryEntity> categories = categoryRepository.findByNameContaining(name);
        if (!CollectionUtils.isEmpty(categories)) {
            return categories;
        }
        return new ArrayList<>();    
    }
    
    public CategoryEntity findCategoryById(long id) {
        Optional<CategoryEntity> cateOpt = categoryRepository.findById(id);
        if (cateOpt.isPresent()) {
            return cateOpt.get();
        }
        return new CategoryEntity();
    }
}
