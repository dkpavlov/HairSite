package com.site.controllers;

import com.site.models.ServiceItem;
import com.site.models.Status;
import com.site.repositories.ServiceRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
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
public class AdminServiceItemController {

    /* LIST */
    @RequestMapping(value = "/admin/serviceItem", method = RequestMethod.GET)
    public String adminIndex(@PageableDefault(size = 150) Pageable pageable, ModelMap model) throws IOException {
        return "admin/serviceItem/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/service/new", method = RequestMethod.GET)
    public ModelAndView adminNew() throws IOException {
        ModelAndView mv = new ModelAndView("admin/serviceItem/edit", "serviceItem", new ServiceItem());
        return mv;
    }

    @RequestMapping(value = "/admin/serviceItem/new", method = RequestMethod.POST)
    public String adminNewSave(@ModelAttribute("serviceItem") ServiceItem serviceItem){
        return "redirect:/admin/serviceItem/list";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/serviceItem/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable("id") Long id){
        Service service = serviceRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/serviceItem/edit", "serviceItem", service);
        return mv;
    }

    @RequestMapping(value = "/admin/serviceItem/{id}/edit", method = RequestMethod.POST)
    public String postEditNews(@ModelAttribute("serviceItem") Service service,
                               @PathVariable("id") Long id){
        Service old = serviceRepository.findOne(id);
        old.copy(service);
        if(!service.getFile().isEmpty()){
            old.setMainImage(FileUtils.createImage(service.getFile()));
        };
        serviceRepository.save(old);
        return "redirect:/admin/serviceItem/list";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/serviceItem/{id}/status", method = RequestMethod.PUT)
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
