/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import static java.sql.Types.NULL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author trunghuynh
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ImageService imageService;

    public List<ProductEntity> getProducts() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public ProductEntity findByProductId(long id) {
        Optional<ProductEntity> proOpt = productRepository.findById(id);
        if (proOpt.isPresent()) {
            return proOpt.get();
        }
        return new ProductEntity();
    }


    public void save(ProductEntity productEntity) {
        boolean empty = true;
        for (MultipartFile i : productEntity.getFiles()) {
            if(i.getSize() > 0){
                empty = false;
                break;
            }
        }
        if (empty == false) {
            
            MultipartFile[] multipartFile = productEntity.getFiles();
            List<ImageEntity> images = new ArrayList<>();
            for (MultipartFile i : multipartFile) {
                ImageEntity imageEntity = new ImageEntity();
                CommonsMultipartFile file = (CommonsMultipartFile) i;
                String fileName = imageService.uploadImage((CommonsMultipartFile) i);
                imageEntity.setPath(fileName);
                imageEntity.setProduct(productEntity);
                images.add(imageEntity);
            }
            productEntity.getImages().addAll(images);
        }
        productRepository.save(productEntity);
    }

    public void saveP(ProductEntity productEntity) {
        productRepository.save(productEntity);
    }

    public void delete(long id) {
        productRepository.deleteById(id);
    }

    public List<ProductEntity> findByCategoryId(long id) {
        List<ProductEntity> list = productRepository.findByCategoryId(id);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }

    public List<ProductEntity> findByName(String name) {
        List<ProductEntity> list = productRepository.findByNameContaining(name);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }

    public List<ProductEntity> findByCategoryIdAndName(long id, String name) {
        List<ProductEntity> list = productRepository.findByCategoryIdAndNameContaining(id, name);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }

    public List<ProductEntity> findByPrice(double price) {
        List<ProductEntity> list = productRepository.findByPrice(price);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }
    public List<ProductEntity> findByPriceToPrice(double price1,double price2) {
        List<ProductEntity> list = productRepository.findByPriceToPrice(price1, price2);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }
    public List<ProductEntity> findByCategoryIdAndNameContainingAndPrice(long id,String name,double price) {
        List<ProductEntity> list = productRepository.findByCategoryIdAndNameContainingAndPrice(id, name, price);
        if (!CollectionUtils.isEmpty(list)) {
            return list;
        }
        return new ArrayList<>();
    }
    public List<ProductEntity> searchProduct(ProductEntity entity){
        List<ProductEntity> list;
        if ("".equals(entity.getName()) & entity.getPrice() == NULL & entity.getToPrice() == NULL) {
            list = findByCategoryId(entity.getCategory().getId());
        } else if (entity.getCategory().getId() == 0 & entity.getPrice() == NULL & entity.getToPrice() == NULL) {
            list = findByName(entity.getName());
        } else if (entity.getCategory().getId() == 0 & "".equals(entity.getName())) {
            if (entity.getToPrice() == NULL) {
                list = findByPrice(entity.getPrice());
            } else {
                list = findByPriceToPrice(entity.getPrice(), entity.getToPrice());
            }
        } else if(entity.getPrice() == NULL & entity.getToPrice() == NULL){
            list = findByCategoryIdAndName(entity.getCategory().getId(), entity.getName());
        }else{
            list = findByCategoryIdAndNameContainingAndPrice(entity.getId(),entity.getName(),entity.getPrice());
        }
        entity.setToPrice(NULL);
        entity.setPrice(NULL);
        return list;
    }
   
}
