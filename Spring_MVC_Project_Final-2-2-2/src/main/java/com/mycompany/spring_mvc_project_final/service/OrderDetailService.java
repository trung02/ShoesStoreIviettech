/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.repository.OrderDetailRepository;
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
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    public List<OrderDetailEntity> getOrderDetailsByOderId(Long id){
        List<OrderDetailEntity> list = orderDetailRepository.findByOrderId(id);
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();
    }
    public List<OrderDetailEntity> getOrderDetailsByProductId(Long id){
        List<OrderDetailEntity> list = orderDetailRepository.findByProductId(id);
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();
    }
//    public void save(OrderDetailEntity orderDetailEntity){
//        orderDetailRepository.save(orderDetailEntity);
//    }
    
    public double totalPrice(Long id){
        return orderDetailRepository.totalPrice(id);
    }
}
