package com.site.controllers;

import com.site.models.Salon;
import com.site.models.Status;
import com.site.repositories.GalleryRepository;
import com.site.repositories.SalonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:46
 */

@Controller
public class GalleryController {

    @Autowired
    GalleryRepository galleryRepository;

    @Autowired
    SalonRepository salonRepository;

    @RequestMapping(value = "/gallery", method = RequestMethod.GET)
    public String index(ModelMap model){
        model.put("list", galleryRepository.findByStatus(Status.ACTIVE));
        return "public/gallery";
    }

    @RequestMapping(value = "/gallery/{id}", method = RequestMethod.GET)
    public String preview(@PathVariable("id") Long id, ModelMap model){
        model.put("gallery", galleryRepository.findOne(id));
        return "public/single_gallery";
    }

    @RequestMapping(value = "/cms/preview/gallery/{id}", method = RequestMethod.GET)
    public String previewAdmin(@PathVariable("id") Long id, ModelMap model){
        model.put("list", galleryRepository.findById(id));
        return "public/gallery";
    }

    /* SALONS */
    @ModelAttribute("salons")
    public List<Salon> getSalons(){
        return salonRepository.findByStatus(Status.ACTIVE);
    }
}
