package com.site.controllers;

import com.site.models.Offering;
import com.site.models.Status;
import com.site.repositories.OfferingRepository;
import com.site.repositories.ProductRepository;
import com.site.repositories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-23
 * Time: 13:24
 */

@Controller
public class AdminOffersController {

    @Autowired
    OfferingRepository offeringRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ServiceRepository serviceRepository;

    /* LIST */
    @RequestMapping(value = "/admin/offers", method = RequestMethod.GET)
    public String getList(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", offeringRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/offering/list";
    }

    /* CREATE - PRODUCT */
    @RequestMapping(value = "/admin/offers/product/{pId}", method = RequestMethod.GET)
    public ModelAndView createWithProduct(@PathVariable("pId") Long pId){
        Offering offering = new Offering();
        offering.setProduct( productRepository.findOne(pId));
        ModelAndView mv = new ModelAndView("admin/offering/edit", "offering", offering);
        return mv;
    }

    @RequestMapping(value = "/admin/offers/product/{pId}", method = RequestMethod.POST)
    public String postCreateWithProduct(@ModelAttribute("offering") Offering offering,
                                        @PathVariable("pId") Long pId){
        offering.setProduct(productRepository.findOne(pId));
        return "redirect:/admin/offers";
    }

    /* CREATE - SERVICE */
    @RequestMapping(value = "/admin/offers/service/{sId}", method = RequestMethod.GET)
    public ModelAndView createWithService(@PathVariable("sId") Long sId){
        Offering offering = new Offering();
        offering.setService(serviceRepository.findOne(sId));
        ModelAndView mv = new ModelAndView("admin/offering/edit", "offering", offering);
        return mv;
    }

    @RequestMapping(value = "/admin/offers/service/{sId}", method = RequestMethod.POST)
    public String postCreateWithService(@ModelAttribute("offering") Offering offering,
                                        @PathVariable("sId") Long sId){
        offering.setService(serviceRepository.findOne(sId));
        return "redirect:/admin/offers";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/offers/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id){
        Offering offering = offeringRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/offering/edit", "offering", offering);
        return mv;
    }

    @RequestMapping(value = "/admin/offers/{id}/edit", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("offering") Offering offering,
                           @PathVariable("id") Long id){
        Offering old = offeringRepository.findOne(id);
        old.copy(offering);
        offeringRepository.save(offering);
        return "redirect:/admin/offers";
    }

    @RequestMapping(value = "/admin/offers/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Offering offering = offeringRepository.findOne(id);
        offering.setStatus(status);
        offeringRepository.save(offering);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
