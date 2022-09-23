/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author trunghuynh
 */
@Entity
@Table(name = "size")
public class SizeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    
    @OneToMany(mappedBy = "size", cascade = CascadeType.ALL)
    List<ProductDetailEntity> productDetails;

    public List<ProductDetailEntity> getProductDetails() {
        return productDetails;
    }

    public void setProductDetail(List<ProductDetailEntity> productDetails) {
        this.productDetails = productDetails;
    }
    
    
    
    @Column
    private int name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getName() {
        return name;
    }

    public void setName(int name) {
        this.name = name;
    }


    
    
}
