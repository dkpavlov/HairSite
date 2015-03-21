package com.site.controllers;

import com.site.models.Product;
import com.site.models.Status;
import com.site.repositories.ProductRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 13:34
 */

@Controller
public class AdminProductController {

    @Autowired
    ProductRepository productRepository;

    /* LIST */
    @RequestMapping(value = "/admin/product", method = RequestMethod.GET)
    public String getAll(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", productRepository.findAll(pageable));
        return "admin/employee/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/product/new", method = RequestMethod.GET)
    public ModelAndView newEmployee(){
        ModelAndView mv = new ModelAndView("admin/product/edit", "product", new Product());
        return mv;
    }

    @RequestMapping(value = "/admin/product/new", method = RequestMethod.POST)
    public String postNewEmployee(@ModelAttribute("product") Product product,
                                  MultipartFile file){
        product.setImage(FileUtils.createImage(file));
        productRepository.save(product);
        return "redirect:/admin/product";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/product/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editEmployee(@PathVariable("id") Long id){
        Product product = productRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/product/edit", "product", product);
        return mv;
    }

    @RequestMapping(value = "/admin/product/{id}/edit", method = RequestMethod.POST)
    public String postEditEmployee(@ModelAttribute("product") Product product,
                                   @PathVariable("id") Long id,
                                   MultipartFile file){
        Product old = productRepository.findOne(id);
        old.copy(product);
        if(!file.isEmpty()){
            old.setImage(FileUtils.createImage(file));
        }
        productRepository.save(old);
        return "redirect:/admin/product";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/product/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Product product = productRepository.findOne(id);
        product.setStatus(status);
        productRepository.save(product);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
