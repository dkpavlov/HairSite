package com.site.controllers;

import com.site.models.ServiceMaterial;
import com.site.repositories.ServiceMaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by dimitar.pavlov.mus on 22.08.2016.
 */
@Controller
public class AdminServiceMaterialController {

    @Autowired
    ServiceMaterialRepository serviceMaterialRepository;

    @RequestMapping(value = "/admin/serviceMaterials", method = RequestMethod.GET)
    public String list(ModelMap model){
        model.put("serviceMaterialList", serviceMaterialRepository.findAll());
        return "admin/serviceMaterial/list";
    }

    @RequestMapping(value = "/admin/serviceMaterials/new", method = RequestMethod.GET)
    public ModelAndView getNew(ModelMap model){
        ModelAndView mv = new ModelAndView("admin/serviceMaterial/edit", "serviceMaterial", new ServiceMaterial());
        return mv;
    }

    @RequestMapping(value = "/admin/serviceMaterials/new", method = RequestMethod.POST)
    public String saveNew(@ModelAttribute("serviceMaterial") ServiceMaterial serviceMaterial){
        serviceMaterialRepository.save(serviceMaterial);
        return "redirect:/admin/serviceMaterials";
    }

}
