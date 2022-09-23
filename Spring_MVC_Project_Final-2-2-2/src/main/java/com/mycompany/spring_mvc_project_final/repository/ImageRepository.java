/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author trunghuynh
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Long>{
    List<ImageEntity> findByProductId(Long id);
    @Query(value = "delete from project_final.image where id = ?1",nativeQuery = true)
    public void deleteImage(long id);
}
