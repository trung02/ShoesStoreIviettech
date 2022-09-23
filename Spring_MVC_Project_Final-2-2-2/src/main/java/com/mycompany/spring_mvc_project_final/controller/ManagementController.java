/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.enums.OrderStatus;
import com.mycompany.spring_mvc_project_final.enums.ProductStatus;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.model.Chart;
import com.mycompany.spring_mvc_project_final.service.AccountService;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.ColorService;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.OrderDetailService;
import com.mycompany.spring_mvc_project_final.service.OrderService;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import com.mycompany.spring_mvc_project_final.service.SizeService;
import static java.sql.Types.NULL;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author trunghuynh
 */
@Controller
@RequestMapping("/management")
public class ManagementController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private AccountService accountService;

    @RequestMapping("/home")
    public String viewHome(Model model, HttpSession session) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } 
        session.setAttribute("email", username);
        return "management/home";
    }

    @RequestMapping("/viewProfile")
    public String viewProfile(Model model, HttpSession session) {
        AccountEntity acc = accountService.findByEmail((String) session.getAttribute("email"), UserStatus.ACTIVE);
        model.addAttribute("account", acc);
        return "management/profile";
    }

    @RequestMapping("/submitProfile")
    public String submitProfile(Model model,HttpSession session, @ModelAttribute(name = "account") AccountEntity accountEntity) {
        AccountEntity accSession = accountService.findByEmail((String) session.getAttribute("email"), UserStatus.ACTIVE);
        accountEntity.setStatus(accSession.getStatus());
        accountEntity.setPassword(accSession.getPassword());
        accountEntity.setUserRoles(accSession.getUserRoles());
        accountEntity.setPath(accSession.getPath());
        accountService.save(accountEntity);
        return "redirect:/management/viewProfile";
    }

    @RequestMapping("/addProduct")
    public String viewAddProduct(Model model) {
        model.addAttribute("status", ProductStatus.values());
        model.addAttribute("category", categoryService.getCategories());
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("action", "add");
        return "management/addProduct";
    }

    @RequestMapping("/addCategory")
    public String viewAddCategory(Model model) {
        model.addAttribute("action", "add");
        return "management/addCategory";
    }

    @RequestMapping("/addDiscount")
    public String viewAddDiscount(Model model) {
        model.addAttribute("action", "add");
        return "management/addDiscount";
    }

    @RequestMapping("/handleAddDetail")
    public String handleAddDetail(Model model, HttpSession session, @ModelAttribute("productDetail") ProductDetailEntity detailEntity) {
        List<ProductDetailEntity> list = (List<ProductDetailEntity>) session.getAttribute("listDetail");
        if (detailEntity != null) {
            detailEntity.setId(list.size());
            list.add(detailEntity);
        }
        return "redirect:/management/addProductDetail";
    }

    @RequestMapping("/deleteDetailSession/{id}")
    public String deleteDetailSession(Model model, HttpSession session, @PathVariable(name = "id") int id) {
        List<ProductDetailEntity> list = (List<ProductDetailEntity>) session.getAttribute("listDetail");
        for (ProductDetailEntity p : list) {
            if (p.getId() == id) {
                list.remove(p);
                break;
            }
        }
        return "redirect:/management/addProductDetail";
    }

    @RequestMapping("/submitP")
    public String submitP(HttpSession session) {
        ProductEntity productEntity = (ProductEntity) session.getAttribute("product");
        List<ProductDetailEntity> list = (List<ProductDetailEntity>) session.getAttribute("listDetail");

        productDetailService.deleteByProductId(productEntity.getId());
        productEntity.setProductDetails(list);
        productService.saveP(productEntity);
        return "redirect:/management/viewProduct";
    }

    @RequestMapping(value = "/resultProduct", method = RequestMethod.POST)
    public String resultProduct(Model model, @ModelAttribute("product") ProductEntity productEntity,
            HttpSession session) {
        if (productEntity.getId() > 0) {
            List<ImageEntity> list = imageService.getImages(productEntity.getId());
            productEntity.setImages(list);
            productService.save(productEntity);
            return "redirect:/management/viewProduct";
        } else {
            productService.save(productEntity);
            ProductDetailEntity pd = new ProductDetailEntity();
            pd.setProduct(productEntity);
            session.setAttribute("productDetail", pd);
            List<ProductDetailEntity> list = new ArrayList<>();
            session.setAttribute("product", productEntity);
            session.setAttribute("listDetail", list);
            return "redirect:/management/addProductDetail";
        }
    }

    @RequestMapping("/addProductDetail")
    public String viewAddProductDetail(Model model, HttpSession session) {
        model.addAttribute("action", "add");
        model.addAttribute("gender", Gender.values());
        model.addAttribute("color", colorService.getColors());
        model.addAttribute("size", sizeService.getSizes());
        ProductDetailEntity detailEntity = (ProductDetailEntity) session.getAttribute("productDetail");
        List<ProductDetailEntity> list = (List<ProductDetailEntity>) session.getAttribute("listDetail");
        ProductEntity productEntity = (ProductEntity) session.getAttribute("product");
        model.addAttribute("productDetail", detailEntity);
        model.addAttribute("listDetail", list);
        model.addAttribute("product", productEntity);

        return "/management/addProductDetail";
    }

    @RequestMapping(value = "/resultUpdateProduct/{id}")
    public String resultUpdateProduct(Model model, @PathVariable(name = "id") long id, HttpSession session) {
        ProductEntity productEntity = productService.findByProductId(id);
        ProductDetailEntity pd = new ProductDetailEntity();
        pd.setProduct(productEntity);
        session.setAttribute("productDetail", pd);
        List<ProductDetailEntity> list = productDetailService.findByProdutId(id);
        session.setAttribute("product", productEntity);
        session.setAttribute("listDetail", list);
        model.addAttribute("action", "update");
        return "redirect:/management/addProductDetail";
    }

    @RequestMapping(value = "/deleteProductDetail/{idP}/{idD}")
    public String deleteProductDetail(@PathVariable(name = "idD") long idD, @PathVariable(name = "idP") long idP) {
        productDetailService.delete(idD);
        return "redirect:/management/viewImage/" + idP;
    }

    @RequestMapping(value = "/resultPromotion", method = RequestMethod.POST)
    public String result(@ModelAttribute("promotion") PromotionEntity promotionEntity) {
        promotionService.save(promotionEntity);
        return "redirect:/management/viewDiscount";
    }

    @RequestMapping(value = "/resultDetail", method = RequestMethod.POST)
    public String resultDetail(Model model, @ModelAttribute("detail") ProductDetailEntity productDetailEntity) {
        productDetailService.save(productDetailEntity);
        return "redirect:/management/addProductDetail";
    }

    @RequestMapping("/viewProduct")
    public String viewListProduct(Model model) {
        ProductEntity entity = new ProductEntity();
        entity.setPrice(NULL);
        entity.setToPrice(NULL);
        model.addAttribute("product", productService.getProducts());
        model.addAttribute("productS", entity);
        model.addAttribute("category", categoryService.getCategories());
        return "management/productList";
    }

    @RequestMapping("/viewCategory")
    public String viewListCategory(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "management/categoryList";
    }

    @RequestMapping("/viewDiscount")
    public String viewListDiscount(Model model) {
        model.addAttribute("promotions", promotionService.getPromotions());
        return "management/discountList";
    }

    @RequestMapping("/viewOrder")
    public String viewOrder(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        OrderEntity entity = new OrderEntity();

        model.addAttribute("order", entity);
        model.addAttribute("status", OrderStatus.values());

        return "management/orderList";
    }

    @RequestMapping("/viewOrderDetail/{id}")
    public String viewOrderDetail(Model model, @PathVariable("id") Long id) {
        model.addAttribute("order", orderService.findOrderById(id));
        model.addAttribute("status", OrderStatus.values());
        model.addAttribute("orderDetails", orderDetailService.getOrderDetailsByOderId(id));
        model.addAttribute("totalPrice", orderDetailService.totalPrice(id));
        return "management/orderDetail";
    }

    @RequestMapping(value = "/resultCategory", method = RequestMethod.POST)
    public String resultCategory(@ModelAttribute("category") CategoryEntity categoryEntity) {
        categoryService.save(categoryEntity);
        return "redirect:/management/viewCategory";
    }

    @RequestMapping(value = "/resultOrder", method = RequestMethod.POST)
    public String resultOrder(@ModelAttribute("order") OrderEntity orderEntity) {
        orderService.save(orderEntity);
        return "redirect:/management/viewOrderDetail/" + orderEntity.getId();
    }

    @RequestMapping("/deleteCategory/{id}")
    public String deleteCatefory(@PathVariable("id") Long id) {
        categoryService.delete(id);
        return "redirect:/management/viewCategory";
    }

    @RequestMapping("/deleteProduct/{id}")
    public String deleteProduct(Model model, @PathVariable("id") Long id) {
        List<OrderDetailEntity> list = orderDetailService.getOrderDetailsByProductId(id);
        if (CollectionUtils.isEmpty(list)) {
            productService.delete(id);
        } else {
            model.addAttribute("message", "block");
        }
        model.addAttribute("product", productService.getProducts());
        model.addAttribute("category", categoryService.getCategories());
        return "management/productList";
    }

    @RequestMapping("/deleteImage/{idI}/{idP}")
    public String deleteImage(Model model, @PathVariable("idI") Long idI, @PathVariable("idP") Long idP) {
        ProductEntity entity = productService.findByProductId(idP);
        if (entity != null && entity.getImages().size() > 0) {
            for (ImageEntity img : entity.getImages()) {
                if (img.getId() == idI) {
                    entity.getImages().remove(img);
                    break;
                }
            }
        }
        productService.saveP(entity);

        //imageService.delete(idI);
        model.addAttribute("product", entity);
        model.addAttribute("status", ProductStatus.values());
        model.addAttribute("category", categoryService.getCategories());

        return "redirect:/management/updateProduct/" + idP;
    }

    @RequestMapping("/deletePromotion/{id}")
    public String deletePromotion(@PathVariable("id") Long id) {
        promotionService.delete(id);
        return "redirect:/management/viewDiscount";
    }

    @RequestMapping("/updateCatefory/{id}")
    public String updateCatefory(@PathVariable("id") Long id, Model model) {
        CategoryEntity category = categoryService.findCategoryById(id);
        if (category.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("category", category);
        return "management/addCategory";
    }

    @RequestMapping("/updateProduct/{id}")
    public String updateProduct(@PathVariable("id") Long id, Model model) {
        ProductEntity productEntity = productService.findByProductId(id);
        if (productEntity.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("product", productEntity);
        model.addAttribute("status", ProductStatus.values());
        model.addAttribute("category", categoryService.getCategories());
        return "management/addProduct";
    }

    @RequestMapping("/updatePromotion/{id}")
    public String updatePromotion(@PathVariable("id") Long id, Model model) {
        PromotionEntity promotionEntity = promotionService.findPromotionById(id);
        if (promotionEntity.getId() > 0) {
            model.addAttribute("action", "update");
        } else {
            model.addAttribute("action", "add");
        }
        model.addAttribute("promotion", promotionEntity);
        return "management/addDiscount";
    }

    @RequestMapping("/viewImage/{id}")
    public String viewImage(@PathVariable("id") Long id, Model model) {
        model.addAttribute("images", imageService.getImages(id));
        model.addAttribute("details", productDetailService.findByProdutId(id));
        model.addAttribute("product", productService.findByProductId(id));
        return "management/viewImage";
    }
    //-------------------SEARCH-------------------

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchCategory(Model model, @ModelAttribute("searchValue") String searchValue) {
        model.addAttribute("categories", categoryService.search(searchValue));
        return "management/categoryList";
    }

    @RequestMapping(value = "/searchOrder", method = RequestMethod.POST)
    public String searchOrder(Model model, @ModelAttribute("order") OrderEntity orderEntity) {
        List<OrderEntity> list = orderService.searchALL(orderEntity);
        model.addAttribute("orders", list);
        model.addAttribute("status", OrderStatus.values());
        return "management/orderList";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    public String searchProduct(Model model, @ModelAttribute("product") ProductEntity entity) {
        List<ProductEntity> list = productService.searchProduct(entity);
        model.addAttribute("productS", entity);
        model.addAttribute("product", list);
        model.addAttribute("category", categoryService.getCategories());
        return "management/productList";
    }

    @RequestMapping("/viewChart")
    public String viewChart(Model model) {
        List<Chart> list = orderService.recordMonth();
        model.addAttribute("listRecord", list);
        return "management/chart";
    }
}
