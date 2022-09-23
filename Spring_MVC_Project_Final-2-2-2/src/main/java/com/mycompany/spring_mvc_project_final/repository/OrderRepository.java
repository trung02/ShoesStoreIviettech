/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author trunghuynh
 */
@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Long>{
    public List<OrderEntity> findAllByOrderByCreateDateDesc();
    
    @Query(value = "SELECT * FROM project_final.orders where phone = ?1 and status =?2 and create_Date =?3",nativeQuery = true)
    public List<OrderEntity> searchPhoneStatusDate(String phone,String orderStatus, String date);
    
    @Query(value = "SELECT * FROM project_final.orders where phone = ?1 and status =?2",nativeQuery = true)
    public List<OrderEntity> searchPhoneStatus(String phone,String orderStatus);
    
    @Query(value = "SELECT * FROM project_final.orders where status =?2 and create_Date =?3",nativeQuery = true)
    public List<OrderEntity> searchStatusDate(String orderStatus, String date);
    
    @Query(value = "SELECT * FROM project_final.orders where phone = ?1 and create_Date =?3",nativeQuery = true)
    public List<OrderEntity> searchPhoneStatusDate(String phone, String date);
    
    @Query(value = "SELECT * FROM project_final.orders where phone = ?1 or status =?2 or create_Date =?3",nativeQuery = true)
    public List<OrderEntity> searchPhoneOrStatusOrDate(String phone, String status,String date);
    
    
    @Query(value = "Select count(create_Date) FROM project_final.orders where month(create_Date) = ?1",nativeQuery = true)
    public int recordMonth(int month);
    
    @Query(value = "SELECT * FROM project_final.orders where status like ?1 and phone like %?2% and (create_Date BETWEEN ?3 AND ?4)",nativeQuery = true)
    public List<OrderEntity> findByALL(String orderStatus,String phone, String date , String date2);
    

}
