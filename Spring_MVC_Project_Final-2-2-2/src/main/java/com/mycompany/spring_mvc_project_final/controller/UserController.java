/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private ProductDetailService productDetailService;
    
    @Autowired
    private ImageService imageService;

    @RequestMapping("/home")
    public String viewHome(Model model) {
        model.addAttribute("product", productService.getProducts());
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("username", username);
        return "user/index";
    }
    
    @RequestMapping("/viewDetail/{id}")
    public String viewDetail(@PathVariable("id") long id, Model model){
        List<ProductDetailEntity> listDetail = productDetailService.findByProdutId(id);
        model.addAttribute("details", listDetail);
        List<ImageEntity> listImage = imageService.getImages(id);
        model.addAttribute("images", listImage);
        model.addAttribute("product", productService.findByProductId(id));
        return "user/detail";
    }
}
