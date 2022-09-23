/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.OrderStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.data.annotation.Transient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author trunghuynh
 */
@Entity
@Table(name = "orders")
public class OrderEntity extends CustomerEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;
    
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderDetailEntity> orderDeatails;
    
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<PaymentEntity> payments;
    
    @ManyToOne
    @JoinColumn(name = "account_id")
    private AccountEntity account;
    
    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotion;
    
    @Column(name = "create_Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;
    
    @Transient
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate2;
    
    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    
    @Column(name = "price")
    private double price;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreateDate2() {
        return createDate2;
    }

    public void setCreateDate2(Date createDate2) {
        this.createDate2 = createDate2;
    }
      
    
    public List<PaymentEntity> getPayments() {
        return payments;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }
    
    public void setPayments(List<PaymentEntity> payments) {
        this.payments = payments;
    }

    
    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

    public List<OrderDetailEntity> getOrderDeatails() {
        return orderDeatails;
    }

    public void setOrderDeatails(List<OrderDetailEntity> orderDeatails) {
        this.orderDeatails = orderDeatails;
    }
    
    
    
    
   

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

}
