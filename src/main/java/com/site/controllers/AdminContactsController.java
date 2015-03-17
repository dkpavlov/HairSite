package com.site.controllers;

import com.site.models.Contact;
import com.site.models.Status;
import com.site.repositories.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 14:21
 */

@Controller
public class AdminContactsController {

    @Autowired
    ContactRepository contactRepository;

    /* LIST */
    @RequestMapping(value = "/admin/contact", method = RequestMethod.GET)
    public String getAll(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", contactRepository.findAll(pageable));
        return "admin/contact/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/contact/new", method = RequestMethod.GET)
    public ModelAndView newContact(){
        ModelAndView mv = new ModelAndView("admin/contact/edit", "contact", new Contact());
        return mv;
    }

    @RequestMapping(value = "/admin/contact/new", method = RequestMethod.POST)
    public String postNewContact(@ModelAttribute("contact") Contact contact){
        contactRepository.save(contact);
        return "redirect:/admin/contact";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/contact/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editEmployee(@PathVariable("id") Long id){
        Contact contact = contactRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/contact/edit", "contact", contact);
        return mv;
    }

    @RequestMapping(value = "/admin/contact/{id}/edit", method = RequestMethod.POST)
    public String postEditEmployee(@ModelAttribute("contact") Contact contact,
                                   @PathVariable("id") Long id){
        //TODO check if necessary
        contact.setId(id);
        contactRepository.save(contact);
        return "redirect:/admin/contact";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/contact/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Contact contact = contactRepository.findOne(id);
        //TODO
        //contact.setStatus(status);
        contactRepository.save(contact);
        return "SUCCESS";
    }
}
