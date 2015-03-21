package com.site.controllers;

import com.site.repositories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

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

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String index(ModelMap model) throws IOException {
        return "public/services";
    }
}
