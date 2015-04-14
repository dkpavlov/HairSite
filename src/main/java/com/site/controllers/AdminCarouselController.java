package com.site.controllers;

import com.site.models.Carousel;
import com.site.models.Contact;
import com.site.models.Status;
import com.site.repositories.CarouselRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 4/3/15
 * Time: 12:34
 */

@Controller
public class AdminCarouselController {

    @Autowired
    CarouselRepository carouselRepository;

    /* LIST */
    @RequestMapping(value = "/admin/carousel", method = RequestMethod.GET)
    public String getAll(ModelMap model){
        model.put("list", carouselRepository.findByStatusNot(Status.ARCHIVED));
        return "admin/carousel/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/carousel/new", method = RequestMethod.GET)
    public ModelAndView create(){
        ModelAndView mv = new ModelAndView("admin/carousel/edit", "carousel", new Carousel());
        return mv;
    }

    @RequestMapping(value = "/admin/carousel/new", method = RequestMethod.POST)
    public String postNewContact(@ModelAttribute("carousel") Carousel carousel,
                                 MultipartFile file){
        carousel.setImage(FileUtils.createImage(file));
        carousel.setHref(StringUtils.isEmpty(carousel.getHref()) ? null : carousel.getHref());
        carouselRepository.save(carousel);
        return "redirect:/admin/carousel";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/carousel/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editEmployee(@PathVariable("id") Long id){
        Carousel carousel = carouselRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/carousel/edit", "carousel", carousel);
        return mv;
    }

    @RequestMapping(value = "/admin/carousel/{id}/edit", method = RequestMethod.POST)
    public String postEditEmployee(@ModelAttribute("carousel") Carousel carousel,
                                   @PathVariable("id") Long id,
                                   MultipartFile file){
        Carousel old = carouselRepository.findOne(id);
        old.copy(carousel);
        if(!file.isEmpty()){
            old.setImage(FileUtils.createImage(file));
        }
        old.setHref(StringUtils.isEmpty(carousel.getHref()) ? null : carousel.getHref());
        carouselRepository.save(old);
        return "redirect:/admin/carousel";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/carousel/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Carousel carousel = carouselRepository.findOne(id);
        carousel.setStatus(status);
        carouselRepository.save(carousel);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }


}
