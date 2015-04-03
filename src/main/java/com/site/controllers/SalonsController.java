package com.site.controllers;

import com.site.models.Salon;
import com.site.models.Status;
import com.site.repositories.SalonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
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
public class SalonsController {

    @Autowired
    SalonRepository salonRepository;

    @RequestMapping(value = "/salons", method = RequestMethod.GET)
    public String index(@PageableDefault(size = 5) Pageable pageable, ModelMap model){
        model.put("page", salonRepository.findByStatus(Status.ACTIVE, pageable));
        return "public/salons";
    }

    @RequestMapping(value = "/salons/{id}", method = RequestMethod.GET)
    public String preview(@PathVariable("id") Long id, ModelMap model){
        model.put("salon", salonRepository.findOne(id));
        return "public/salons";
    }

    @RequestMapping(value = "/cms/salons/preview/{id}", method = RequestMethod.GET)
    public String adminPreview(@PageableDefault Pageable pageable, @PathVariable("id") Long id, ModelMap model){
        model.put("salon", salonRepository.findOne(id));
        return "public/salons";
    }

    /* SALONS */
    @ModelAttribute("salons")
    public List<Salon> getSalons(){
        return salonRepository.findByStatus(Status.ACTIVE);
    }

}
