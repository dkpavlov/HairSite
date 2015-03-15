package com.site.controllers;


import com.site.models.Message;
import com.site.repositories.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:49
 */

@Controller
public class ContactsController {

    @Autowired
    MessageRepository messageRepository;

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public ModelAndView index() {
        //TODO add salons to model
        ModelAndView mv = new ModelAndView("public/contacts", "message", new Message());
        return mv;
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.POST)
    public String postMessage(@ModelAttribute("message") Message message) {
        messageRepository.save(message);
        return "redirect:/contacts";
    }

}
