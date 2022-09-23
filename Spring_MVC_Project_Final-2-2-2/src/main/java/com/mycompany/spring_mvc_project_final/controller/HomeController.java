/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.RoleEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.RoleRepository;
import com.mycompany.spring_mvc_project_final.service.AccountService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private AccountService accountService;
    
    @Autowired
    private RoleRepository userRoleRepository;
    
    
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("product", productService.getProducts());
        
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN"))) {
            return "redirect:/admin/home";
        }
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_MANAGER"))) {
            return "redirect:/management/home";
        }
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_USER"))) {
            return "redirect:/user/home";
        }
        return "index";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }
    @RequestMapping("/viewRegister")
    public String viewRegister(){
        return "register";
    }
    
    @RequestMapping("/register")
    public String register(@ModelAttribute(name = "account") AccountEntity accountEntity){
        accountEntity.setPassword(accountService.encrytePassword(accountEntity.getPassword()));
        accountEntity.setStatus(UserStatus.ACTIVE);
        Set<RoleEntity> roleNames = userRoleRepository.findById(1);
      	
        accountService.save(accountEntity);
        return "login";
    }
}
