/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author trunghuynh
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Long>{
    @Query(value = "select count(product_id) from project_final.product_detail where product_id = ?1",nativeQuery = true)
    public int countProduct(int idP);
    @Query(value = "SELECT * FROM project_final.product where price >= ?1 and price <= ?2",nativeQuery = true)
    public List<ProductEntity> findByPriceToPrice(double price1, double price2);
    
    
    
    
    List<ProductEntity> findByCategoryId(long id);
    List<ProductEntity> findByNameContaining(String name);
    List<ProductEntity> findByPrice(double price);
    List<ProductEntity> findByCategoryIdAndNameContaining(long id,String name);
    List<ProductEntity> findByCategoryIdAndNameContainingAndPrice(long id,String name,double price);
    
    
}
