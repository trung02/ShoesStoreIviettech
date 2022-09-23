/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.enums.OrderStatus;
import com.mycompany.spring_mvc_project_final.model.Chart;
import com.mycompany.spring_mvc_project_final.repository.OrderRepository;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;
    
    public List<OrderEntity> getOrders (){
        List<OrderEntity> list = (List<OrderEntity>) orderRepository.findAllByOrderByCreateDateDesc();
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();
    }
    
    public OrderEntity findOrderById (Long id){
        Optional<OrderEntity> optOrder = orderRepository.findById(id);
        if(optOrder.isPresent()){
            return optOrder.get();
        }
        return new OrderEntity();
    }
    public void save(OrderEntity orderEntity){
        orderRepository.save(orderEntity);
    }   
    
    public List<OrderEntity> searchPhoneOrStatusOrDate(OrderEntity orderEntity){
        String status =  orderEntity.getStatus().name();
        String date = convertDateToString(orderEntity.getCreateDate());
        List<OrderEntity> list = orderRepository.searchPhoneOrStatusOrDate(orderEntity.getPhone(), status, date);
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();
    }
    public List<OrderEntity> searchALL(OrderEntity orderEntity){
        String status =  orderEntity.getStatus().name();
        String date = convertDateToString(orderEntity.getCreateDate());
        String date2 = convertDateToString(orderEntity.getCreateDate2());
        List<OrderEntity> list = orderRepository.findByALL(status,orderEntity.getPhone(), date, date2);
        if(!CollectionUtils.isEmpty(list)){
            return list;
        }
        return new ArrayList<>();
    }
    
    public String convertDateToString(Date date){
        String pattern = "yyyy/MM/dd";
// Create an instance of SimpleDateFormat used for formatting 
// the string representation of date according to the chosen pattern
        DateFormat df = new SimpleDateFormat(pattern);
// Get the today date using Calendar object.
        Date createDate = date;
// Using DateFormat format method we can create a string 
// representation of a date with the defined format.
        String dayAsString = df.format(createDate);
        return dayAsString;
    }
    
    public List<Chart> recordMonth(){
        List<String> month = new ArrayList<>();
        month.add("January");
        month.add("February");
        month.add("March");
        month.add("April");
        month.add("May");
        month.add("June");
        month.add("July");
        month.add("August");
        month.add("September");
        month.add("October");
        month.add("November");
        month.add("December");
        List<String> color = new ArrayList<>();
        color.add("Red");
        color.add("Blue");
        color.add("Green");
        color.add("Pink");
        color.add("Purple");
        color.add("yellow");
        color.add("gray");
        color.add("orange");
        color.add("Purple");
        color.add("Red");
        color.add("Pink");
        color.add("Green");
        NumberFormat formatter = new DecimalFormat("#0.00");     
        List<Integer> list = new ArrayList<>();
        int total = 0;
        for(int i = 1; i <= 12; i++){
            int a = orderRepository.recordMonth(i);
            total += a;
            list.add(a);
        }
        List<Chart> listRecord = new ArrayList<>();
        int j = 0;
        for(int i: list){
            Chart chart = new Chart();
            chart.setRecord(formatter.format((i*100.0)/total));
            chart.setMonth(month.get(j));
            chart.setColor(color.get(j));
            listRecord.add(chart);
            j++;
        }
        return listRecord;
    }
     
}
