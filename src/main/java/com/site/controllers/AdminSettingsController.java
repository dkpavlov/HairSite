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

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 5/9/15
 * Time: 14:50
 */

@Controller
public class AdminSettingsController {

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/admin/settings", method = RequestMethod.GET)
    public String getSettingsPage(
            @RequestParam(value = "status", required = false) Integer status,
            ModelMap model){
        if(status != null){
            model.put("status", status);
        }
        return "admin/settings";
    }

    @RequestMapping(value = "/admin/settings", method = RequestMethod.POST)
    public @ResponseBody String updateSettings(
            @RequestParam(value = "oldPassword", required = true) String oldPassword,
            @RequestParam(value = "newPassword", required = true) String newPassword,
            @RequestParam(value = "validatePassword", required = true) String validatePassword){

        if(newPassword.equals(validatePassword)){
            User user = userRepository.findByUsername("admin");
            try{
                String digestedOldPassword = HomeController.sha256(oldPassword);
                if(user.getPassword().equals(digestedOldPassword)){
                    user.setPassword(HomeController.sha256(newPassword));
                    userRepository.save(user);
                    return "SUCCESS";
                }
            } catch (Exception e){
                e.printStackTrace();
            }
        }

        return "ERROR";
    }

}
