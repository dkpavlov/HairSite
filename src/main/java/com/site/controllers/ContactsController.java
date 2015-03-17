package com.site.controllers;


import com.site.repositories.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:49
 */

@Controller
public class ContactsController {

    @Autowired
    ContactRepository contactRepository;

    @Deprecated
    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String index(ModelMap model){
        model.put("contacts", contactRepository.findAll());
        return "public/contacts";

    }

}
