package com.site.controllers;

import com.site.models.User;
import com.site.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminUserController {

    @Autowired
    UserRepository userRepository;
    
    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getUsersPage(){
        return "admin/user/list";
    }
    
    @RequestMapping(value = "/admin/users/new", method = RequestMethod.GET)
    public String getNewUserPage(){
        return "admin/user/new";
    }
    
    @RequestMapping(value = "/admin/users/new", method = RequestMethod.POST)
    public String getSaveNewUser(){
        //TODO redirect to list
        return "admin/user/new";
    }
    
    @RequestMapping(value = "/admin/users/{id}/edit", method = RequestMethod.GET)
    public String getEditUserPage(){
        return "admin/user/edit";
    }
    
    @RequestMapping(value = "/admin/users/{id}/edit", method = RequestMethod.POST)
    public String getSaveEditUser(){
        //TODO redirect to list
        return "admin/user/edit";
    }

}