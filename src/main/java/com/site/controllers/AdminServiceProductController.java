package com.site.controllers;

import com.site.models.*;
import com.site.repositories.ServiceProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by dkpavlov on 8/20/16.
 */
@Controller
public class AdminServiceProductController {

    @Autowired
    ServiceProductRepository serviceProductRepository;

    /* LIST */
    @RequestMapping(value = "/admin/serviceProducts", method = RequestMethod.GET)
    public String adminIndex(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", serviceProductRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/serviceProduct/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/serviceProducts/new", method = RequestMethod.GET)
    public ModelAndView adminNew(){
        ModelAndView mv = new ModelAndView("admin/serviceProduct/edit", "serviceProduct", new ServiceProduct());
        return mv;
    }

    @RequestMapping(value = "/admin/serviceProducts/new", method = RequestMethod.POST)
    public String adminNewSave(@ModelAttribute("serviceProduct") ServiceProduct serviceProduct){
        serviceProductRepository.save(serviceProduct);
        return "redirect:/admin/serviceProducts";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/serviceProducts/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable("id") Long id){
        ServiceProduct serviceProduct = serviceProductRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/serviceProduct/edit", "serviceProduct", serviceProduct);
        return mv;
    }

    @RequestMapping(value = "/admin/serviceProducts/{id}/edit", method = RequestMethod.POST)
    public String postEditNews(@ModelAttribute("serviceProduct") ServiceProduct serviceProduct,
                               @PathVariable("id") Long id){
        serviceProduct.setId(id);
        if(serviceProduct.getSalonPrice() == null){
            serviceProduct.setSalonPrice(0d);
        }
        serviceProductRepository.save(serviceProduct);
        return "redirect:/admin/serviceProducts";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/serviceProducts/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id){
        ServiceProduct item = serviceProductRepository.findOne(id);
        if(item != null){
            item.setStatus(Status.ARCHIVED);
            serviceProductRepository.save(item);
        }
        return "SUCCESS";
    }
}
