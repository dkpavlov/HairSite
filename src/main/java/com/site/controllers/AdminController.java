package com.site.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-20
 * Time: 11:09
 */

@Controller
public class AdminController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminRedirect(){
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
    public String adminPage(){
        return "admin/home";
    }

}
