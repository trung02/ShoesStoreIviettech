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
@Table(name = "color")
public class ColorEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    
    @OneToMany(mappedBy = "color", cascade = CascadeType.ALL)
    List<ProductDetailEntity> productDetail;

    public List<ProductDetailEntity> getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(List<ProductDetailEntity> productDetail) {
        this.productDetail = productDetail;
    }

    @Column(length = 20)
    private String name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    
    
}
