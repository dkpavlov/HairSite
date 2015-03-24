package com.site.controllers;

import com.site.models.Service;
import com.site.models.Status;
import com.site.repositories.ServiceRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-21
 * Time: 9:49
 */
@Controller
public class AdminServiceController {

    @Autowired
    ServiceRepository serviceRepository;

    /* LIST */
    @RequestMapping(value = "/admin/service", method = RequestMethod.GET)
    public String adminIndex(ModelMap model) throws IOException {
        model.put("services", serviceRepository.findAll());
        return "admin/services/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/service/new", method = RequestMethod.GET)
    public ModelAndView adminNew() throws IOException {
        ModelAndView mv = new ModelAndView("admin/services/edit", "service", new Service());
        return mv;
    }

    @RequestMapping(value = "/admin/service/new", method = RequestMethod.POST)
    public String adminNewSave(@ModelAttribute("service") Service service){
        service.setMainImage(FileUtils.createImage(service.getFile()));
        serviceRepository.save(service);
        return "redirect:/admin/services";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/service/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable("id") Long id){
        Service service = serviceRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/services/edit", "service", service);
        return mv;
    }

    @RequestMapping(value = "/admin/service/{id}/edit", method = RequestMethod.POST)
    public String postEditNews(@ModelAttribute("service") Service service,
                               @PathVariable("id") Long id){
        Service old = serviceRepository.findOne(id);
        old.copy(service);
        if(!service.getFile().isEmpty()){
            old.setMainImage(FileUtils.createImage(service.getFile()));
        };
        serviceRepository.save(old);
        return "redirect:/admin/service";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/service/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Service service = serviceRepository.findOne(id);
        service.setStatus(status);
        serviceRepository.save(service);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }

}
