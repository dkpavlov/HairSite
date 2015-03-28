package com.site.controllers;

import com.site.models.Status;
import com.site.repositories.OfferRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:49
 */

@Controller
@RequestMapping("")
public class OffersController {

    @Autowired
    OfferRepository offerRepository;

    @RequestMapping(value = "/offers", method = RequestMethod.GET)
    public String index(@PageableDefault(page = 1, size = 5) Pageable pageable, ModelMap model){
        model.put("page", offerRepository.findByStatus(Status.ACTIVE, pageable));
        return "public/offers";
    }

    @RequestMapping(value = "/cms/preview/offers/{id}", method = RequestMethod.GET)
    public String previewAdmin(@PageableDefault Pageable pageable, @PathVariable("id") Long id, ModelMap model){
        model.put("page", offerRepository.findById(id, pageable));
        return "public/offers";
    }

}
