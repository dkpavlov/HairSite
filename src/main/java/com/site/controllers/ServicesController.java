package com.site.controllers;

import com.site.models.Service;
import com.site.repositories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:48
 */

@Controller
public class ServicesController {

    @Autowired
    ServiceRepository serviceRepository;

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String index(ModelMap model) throws IOException {
        return "public/services";
    }

    @RequestMapping(value = "/admin/services", method = RequestMethod.GET)
    public String adminIndex(ModelMap model) throws IOException {
        model.put("services", serviceRepository.findAll());
        return "admin/services/index";
    }

    @RequestMapping(value = "/admin/service/new", method = RequestMethod.GET)
    public ModelAndView adminNew() throws IOException {
        ModelAndView mv = new ModelAndView("admin/services/form", "service", new Service());
        return mv;
    }

    @RequestMapping(value = "/admin/service/new", method = RequestMethod.POST)
    public String adminNewSave(@ModelAttribute("service") Service service) throws IOException {
        //TODO add images
        serviceRepository.save(service);
        return "redirect:/admin/services";
    }

}
