package com.site.controllers;

import com.site.models.Carousel;
import com.site.models.GalleryLink;
import com.site.models.Status;
import com.site.repositories.GalleryLinkRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 5/30/15
 * Time: 14:05
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AdminGalleryLinkController {

    @Autowired
    GalleryLinkRepository galleryLinkRepository;

    /* LIST */
    @RequestMapping(value = "/admin/galleryLink", method = RequestMethod.GET)
    public String getAll(ModelMap model){
        model.put("list", galleryLinkRepository.findByStatusNot(Status.ARCHIVED));
        return "admin/galleryLink/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/galleryLink/new", method = RequestMethod.GET)
    public ModelAndView create(){
        ModelAndView mv = new ModelAndView("admin/galleryLink/edit", "galleryLink", new GalleryLink());
        return mv;
    }

    @RequestMapping(value = "/admin/galleryLink/new", method = RequestMethod.POST)
    public String postNew(@ModelAttribute("galleryLink") GalleryLink galleryLink,
                                 MultipartFile file){
        galleryLink.setImage(FileUtils.createImage(file));
        galleryLink.setHref(StringUtils.isEmpty(galleryLink.getHref()) ? null : galleryLink.getHref());
        galleryLinkRepository.save(galleryLink);
        return "redirect:/admin/galleryLink";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/galleryLink/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id){
        GalleryLink galleryLink = galleryLinkRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/galleryLink/edit", "galleryLink", galleryLink);
        return mv;
    }

    @RequestMapping(value = "/admin/galleryLink/{id}/edit", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("galleryLink") GalleryLink galleryLink,
                           @PathVariable("id") Long id,
                           MultipartFile file){
        GalleryLink old = galleryLinkRepository.findOne(id);
        old.copy(galleryLink);
        if(!file.isEmpty()){
            old.setImage(FileUtils.createImage(file));
        }
        old.setHref(StringUtils.isEmpty(galleryLink.getHref()) ? null : galleryLink.getHref());
        galleryLinkRepository.save(old);
        return "redirect:/admin/galleryLink";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/galleryLink/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        GalleryLink galleryLink = galleryLinkRepository.findOne(id);
        galleryLink.setStatus(status);
        galleryLinkRepository.save(galleryLink);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }


}
