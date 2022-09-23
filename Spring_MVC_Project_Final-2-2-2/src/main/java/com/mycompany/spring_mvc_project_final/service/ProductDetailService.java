/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.repository.ProductDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author trunghuynh
 */
@Service
public class ProductDetailService {

    @Autowired
    private ProductDetailRepository productDetailRepository;

    public List<ProductDetailEntity> findByProdutId(long id) {
        List<ProductDetailEntity> productDetails = productDetailRepository.findByProductId(id);
        return productDetails;
    }

    public void deleteByProductId(long id) {
        List<ProductDetailEntity> productDetails = productDetailRepository.findByProductId(id);
        if (!productDetails.isEmpty()) {
            for (ProductDetailEntity p : productDetails) {
                productDetailRepository.deleteById(p.getId());
            }
        }
    }
    
    public void delete(long id){
        productDetailRepository.deleteById(id);
    }

    public List<ProductDetailEntity> getProductDetails() {
        List<ProductDetailEntity> productDetails = (List<ProductDetailEntity>) productDetailRepository.findAll();
        return productDetails;
    }

    public void save(ProductDetailEntity productDetailEntity) {
        productDetailRepository.save(productDetailEntity);
    }
}
