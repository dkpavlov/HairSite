package com.site.controllers;

import com.site.repositories.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 3/15/15
 * Time: 20:04
 */

@Controller
public class MessagesController {

    @Autowired
    MessageRepository messageRepository;

    @RequestMapping(value = "/admin/messages", method = RequestMethod.GET)
    public String list(@PageableDefault(page = 0, size = 25) Pageable pageable, ModelMap model){
        model.put("messagesPage", messageRepository.findAll(pageable));
        return "admin/messages/list";
    }

    @RequestMapping(value = "/admin/messages/{id}", method = RequestMethod.GET)
    public String preview(@PathVariable("id") Long id, ModelMap model){
        model.put("message", messageRepository.findOne(id));
        return "admin/messages/preview";
    }
}
