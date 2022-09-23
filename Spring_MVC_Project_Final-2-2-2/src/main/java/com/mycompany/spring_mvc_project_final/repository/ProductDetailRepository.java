/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author trunghuynh
 */
@Repository
public interface ProductDetailRepository extends CrudRepository<ProductDetailEntity, Long>{
    List<ProductDetailEntity> findByProductId(long id);
    
    
}
