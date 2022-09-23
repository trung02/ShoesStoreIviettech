/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.api;

import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author trunghuynh
 */
@Controller
@RequestMapping("/management/api")
public class ApiController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public List<CategoryEntity> searchCategory(
            @RequestParam("txt") String txt) {
        List<CategoryEntity> list = categoryService.search(txt);
        return list;
    }
}
