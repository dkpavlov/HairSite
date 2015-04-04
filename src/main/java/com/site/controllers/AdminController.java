package com.site.controllers;

import org.apache.commons.codec.binary.Hex;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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
        if(SecurityContextHolder.getContext().getAuthentication() != null &&
           SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
            return "redirect:/admin/home";
        }
        return "redirect:/login";

    }

    @RequestMapping(value = "/login")
    public String login(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(!(auth instanceof AnonymousAuthenticationToken)) {
            return "redirect:/admin/home";
        }
        return "login";
    }

    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
    public String adminPage(){
        return "admin/home";
    }

}
