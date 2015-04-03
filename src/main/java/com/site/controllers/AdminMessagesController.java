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
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 3/15/15
 * Time: 20:04
 */

@Controller
public class AdminMessagesController {

    @Autowired
    MessageRepository messageRepository;

    /* LIST */
    @RequestMapping(value = "/admin/messages", method = RequestMethod.GET)
    public String list(@PageableDefault(page = 0, size = 500) Pageable pageable, ModelMap model){
        model.put("page", messageRepository.findAll(pageable));
        return "admin/messages/list";
    }

    /* PREVIEW */
    @RequestMapping(value = "/admin/messages/{id}", method = RequestMethod.GET)
    public String preview(@PathVariable("id") Long id, ModelMap model){
        model.put("message", messageRepository.findOne(id));
        return "admin/messages/preview";
    }

    /* DELETE */
    @RequestMapping(value = "/admin/messages/{id}/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id){
        messageRepository.delete(id);
        return "SUCCESS";
    }

    @RequestMapping(value = "/admin/messages/{id}/delete", method = RequestMethod.GET)
    @ResponseBody
    public String deleteAndRedirect(@PathVariable("id") Long id){
        messageRepository.delete(id);
        return "redirect:/admin/messages";
    }
}
