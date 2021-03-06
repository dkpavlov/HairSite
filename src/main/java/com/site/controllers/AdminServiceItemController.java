package com.site.controllers;

import com.site.models.ServiceItem;
import com.site.models.Status;
import com.site.models.User;
import com.site.models.UserServiceItemPrice;
import com.site.repositories.ServiceItemRepository;
import com.site.repositories.ServiceRepository;
import com.site.repositories.UserRepository;
import com.site.repositories.UserServiceItemPriceRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserServiceItemPriceRepository userServiceItemPriceRepository;

    /* LIST */
    @RequestMapping(value = "/admin/serviceItems", method = RequestMethod.GET)
    public String adminIndex(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", serviceItemRepository.findByStatusNot(Status.ARCHIVED, pageable));
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
        serviceItem = serviceItemRepository.save(serviceItem);
        List<User> userList = (List<User>) userRepository.findAll();
        List<UserServiceItemPrice> prices = new ArrayList<>();
        for(User user: userList){
            UserServiceItemPrice price = new UserServiceItemPrice();
            price.setUser(user);
            price.setPrice(0.0);
            price.setServiceItem(serviceItem);
            if(user.getPrices() == null){
                user.setPrices(new ArrayList<UserServiceItemPrice>());
            }
            user.getPrices().add(price);
        }
        userRepository.save(userList);
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
    @RequestMapping(value = "/admin/serviceItems/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id){
        ServiceItem item = serviceItemRepository.findOne(id);
        if(item != null){
            item.setStatus(Status.ARCHIVED);
            serviceItemRepository.save(item);
        }
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
