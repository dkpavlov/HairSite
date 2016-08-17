package com.site.controllers;

import com.site.models.ServiceItem;
import com.site.models.Status;
import com.site.repositories.ServiceItemRepository;
import com.site.repositories.ServiceRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-21
 * Time: 9:49
 */
@Controller
public class AdminServiceItemController {

    @Autowired
    ServiceItemRepository serviceItemRepository;

    /* LIST */
    @RequestMapping(value = "/admin/serviceItems", method = RequestMethod.GET)
    public String adminIndex(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", serviceItemRepository.findAll(pageable));
        return "admin/serviceItem/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/serviceItems/new", method = RequestMethod.GET)
    public ModelAndView adminNew(){
        ModelAndView mv = new ModelAndView("admin/serviceItem/edit", "serviceItem", new ServiceItem());
        return mv;
    }

    @RequestMapping(value = "/admin/serviceItems/new", method = RequestMethod.POST)
    public String adminNewSave(@ModelAttribute("serviceItem") ServiceItem serviceItem){
        serviceItemRepository.save(serviceItem);
        //TODO save to all users
        return "redirect:/admin/serviceItems";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/serviceItems/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable("id") Long id){
        ServiceItem serviceItem = serviceItemRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/serviceItem/edit", "serviceItem", serviceItem);
        return mv;
    }

    @RequestMapping(value = "/admin/serviceItems/{id}/edit", method = RequestMethod.POST)
    public String postEditNews(@ModelAttribute("serviceItem") ServiceItem serviceItem,
                               @PathVariable("id") Long id){
        serviceItem.setId(id);
        serviceItemRepository.save(serviceItem);
        return "redirect:/admin/serviceItems";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/serviceItems/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        ServiceItem serviceItem = serviceItemRepository.findOne(id);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
