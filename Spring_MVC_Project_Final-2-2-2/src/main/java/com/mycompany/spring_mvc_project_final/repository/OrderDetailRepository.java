/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author trunghuynh
 */
@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Long>{
    List<OrderDetailEntity> findByOrderId(long id);
    List<OrderDetailEntity> findByProductId(long id);
    
    @Query(value = "SELECT SUM(price) AS TotalItemsOrdered FROM project_final.order_detail where order_id = ?1",nativeQuery = true)
    public double totalPrice(Long idP);
}
