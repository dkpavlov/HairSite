package com.site.controllers;

import com.site.models.Status;
import com.site.repositories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:48
 */

@Controller
public class ServicesController {

    @Autowired
    ServiceRepository serviceRepository;

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public String index(@PageableDefault Pageable pageable, ModelMap model){
        model.put("services", serviceRepository.findByStatus(Status.ACTIVE, pageable));
        return "public/services";
    }
}
