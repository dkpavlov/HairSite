package com.site.controllers;

import com.site.models.Status;
import com.site.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:48
 */

@Controller
public class ProductsController {

    @Autowired
    ProductRepository productRepository;

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String index(@PageableDefault(size = 1) Pageable pageable, ModelMap model){
        model.put("page", productRepository.findByStatus(Status.ACTIVE, pageable));
        return "public/products";
    }

    @RequestMapping(value = "/cms/products/preview/{id}", method = RequestMethod.GET)
    public String preview(@PageableDefault Pageable pageable, @PathVariable("id") Long id, ModelMap model){
        model.put("page", productRepository.findById(id, pageable));
        return "public/products";
    }

}
