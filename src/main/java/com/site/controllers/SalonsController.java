package com.site.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:46
 */

@Controller(value = "/salons")
public class SalonsController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) throws IOException {
        return "public/salons";

    }

}
