package com.site.controllers;

import com.site.models.Gallery;
import com.site.models.Image;
import com.site.models.Status;
import com.site.repositories.GalleryRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-21
 * Time: 16:29
 */

@Controller
public class AdminGalleryController {

    @Autowired
    GalleryRepository galleryRepository;

    /* LIST */
    @RequestMapping(value = "/admin/gallery", method = RequestMethod.GET)
    public String list(@PageableDefault Pageable pageable,
                       ModelMap model){
        model.put("page", galleryRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/gallery/list";
    }

    /* CREATE */
    @RequestMapping(value = "/admin/gallery/new", method = RequestMethod.GET)
    public ModelAndView create() throws IOException {
        ModelAndView mv = new ModelAndView("admin/gallery/edit", "gallery", new Gallery());
        return mv;
    }

    @RequestMapping(value = "/admin/gallery/new", method = RequestMethod.POST)
    public String createPost(@ModelAttribute("gallery") Gallery gallery){
        for(MultipartFile f: gallery.getFiles()){
            gallery.getImages().add(FileUtils.createImage(f));
        }
        gallery.setMainImage(FileUtils.createImage(gallery.getFile()));
        galleryRepository.save(gallery);
        return "redirect:/admin/gallery";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/gallery/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id){
        Gallery gallery = galleryRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/gallery/edit", "gallery", gallery);
        return mv;
    }

    @RequestMapping(value = "/admin/gallery/{id}/edit", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("gallery") Gallery gallery,
                           @PathVariable("id") Long id){
        Gallery old = galleryRepository.findOne(id);
        if(!gallery.getFile().isEmpty()){
            old.setMainImage(FileUtils.createImage(gallery.getFile()));
        }
        List<Image> toRemove = new ArrayList<>();
        for(Image i: old.getImages()){
            if(!gallery.getOldImages().contains(i.getId())){
                toRemove.add(i);
            }
        }
        old.getImages().removeAll(toRemove);
        for(MultipartFile f: gallery.getFiles()){
            old.getImages().add(FileUtils.createImage(f));
        }
        old.copy(gallery);
        galleryRepository.save(old);
        return "redirect:/admin/gallery";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/gallery/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Gallery gallery = galleryRepository.findOne(id);
        gallery.setStatus(status);
        galleryRepository.save(gallery);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
