package com.site.controllers;

import com.site.models.User;
import com.site.repositories.ServiceItemRepository;
import com.site.repositories.UserRepository;
import com.site.utils.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminUserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ServiceItemRepository serviceItemRepository;

    @Autowired
    UserValidator userValidator;
    
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String getUsersPage(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", userRepository.findAll(pageable));
        return "admin/user/list";
    }
    
    @RequestMapping(value = "/admin/user/new", method = RequestMethod.GET)
    public ModelAndView getNewUserPage(){
        ModelAndView mv = new ModelAndView("admin/user/edit", "user", new User());
        mv.getModel().put("serviceItemList", serviceItemRepository.findAll());
        return mv;
    }
    
    @RequestMapping(value = "/admin/user/new", method = RequestMethod.POST)
    public String getSaveNewUser(@ModelAttribute("user") User user, BindingResult result){
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "admin/user/edit";
        }
        userRepository.save(user);
        return "redirect:/admin/user";
    }
    
    @RequestMapping(value = "/admin/users/{id}/edit", method = RequestMethod.GET)
    public ModelAndView getEditUserPage(@PathVariable("id") Long id){
        User user = userRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/user/edit", "user", user);
        return mv;
    }
    
    @RequestMapping(value = "/admin/users/{id}/edit", method = RequestMethod.POST)
    public String getSaveEditUser(@ModelAttribute("user") User user,
                                  @PathVariable("id") Long id){
        user.setId(id);
        userRepository.save(user);
        return "redirect:/admin/user";
    }

    //TODO change password

}