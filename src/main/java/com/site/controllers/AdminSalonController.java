package com.site.controllers;

import com.site.models.Image;
import com.site.models.Salon;
import com.site.models.Status;
import com.site.repositories.ContactRepository;
import com.site.repositories.SalonRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-26
 * Time: 16:10
 */
@Controller
public class AdminSalonController {

    @Autowired
    SalonRepository salonRepository;

    @Autowired
    ContactRepository contactRepository;

    /* LIST */
    @RequestMapping(value = "/admin/salon", method = RequestMethod.GET)
    public String list(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", salonRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/salon/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/salon/new", method = RequestMethod.GET)
    public ModelAndView create(){
        ModelAndView mv = new ModelAndView("admin/salon/edit", "salon", new Salon());
        mv.getModel().put("contacts", contactRepository.findByStatusNot(Status.ARCHIVED));
        return mv;
    }

    @RequestMapping(value = "/admin/salon/new", method = RequestMethod.POST)
    public String postCreate(@ModelAttribute("salon") Salon salon){
        for(MultipartFile f: salon.getFiles()){
            salon.getImages().add(FileUtils.createImage(f));
        }
        salonRepository.save(salon);
        return "redirect:/admin/salon";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/salon/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id){
        Salon salon = salonRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/salon/edit", "salon", salon);
        mv.getModel().put("contacts", contactRepository.findByStatusNot(Status.ARCHIVED));
        return mv;
    }

    @RequestMapping(value = "/admin/salon/{id}/edit", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("salon") Salon salon,
                               @PathVariable("id") Long id){
        Salon old = salonRepository.findOne(id);
        List<Image> toRemove = new ArrayList<>();
        for(Image i: old.getImages()){
            if(!salon.getOldImages().contains(i.getId())){
                toRemove.add(i);
            }
        }
        old.getImages().removeAll(toRemove);
        for(MultipartFile f: salon.getFiles()){
            old.getImages().add(FileUtils.createImage(f));
        }
        old.copy(salon);
        salonRepository.save(old);
        return "redirect:/admin/salon";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/salon/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Salon salon = salonRepository.findOne(id);
        salon.setStatus(status);
        salonRepository.save(salon);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
