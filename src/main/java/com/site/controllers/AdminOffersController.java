package com.site.controllers;

import com.site.models.Offer;
import com.site.models.Status;
import com.site.repositories.OfferRepository;
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
    OfferRepository offerRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ServiceRepository serviceRepository;

    /* LIST */
    @RequestMapping(value = "/admin/offers", method = RequestMethod.GET)
    public String getList(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", offerRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/offer/list";
    }

    /* CREATE - PRODUCT */
    @RequestMapping(value = "/admin/offers/product/{pId}", method = RequestMethod.GET)
    public ModelAndView createWithProduct(@PathVariable("pId") Long pId){
        Offer offer = new Offer();
        offer.setProduct( productRepository.findOne(pId));
        ModelAndView mv = new ModelAndView("admin/offer/edit", "offer", offer);
        return mv;
    }

    @RequestMapping(value = "/admin/offers/product/{pId}", method = RequestMethod.POST)
    public String postCreateWithProduct(@ModelAttribute("offer") Offer offer,
                                        @PathVariable("pId") Long pId){
        offer.setProduct(productRepository.findOne(pId));
        offerRepository.save(offer);
        return "redirect:/admin/offers";
    }

    /* CREATE - SERVICE */
    @RequestMapping(value = "/admin/offers/service/{sId}", method = RequestMethod.GET)
    public ModelAndView createWithService(@PathVariable("sId") Long sId){
        Offer offer = new Offer();
        offer.setService(serviceRepository.findOne(sId));
        ModelAndView mv = new ModelAndView("admin/offer/edit", "offer", offer);
        return mv;
    }

    @RequestMapping(value = "/admin/offers/service/{sId}", method = RequestMethod.POST)
    public String postCreateWithService(@ModelAttribute("offer") Offer offer,
                                        @PathVariable("sId") Long sId){
        offer.setService(serviceRepository.findOne(sId));
        offerRepository.save(offer);
        return "redirect:/admin/offers";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/offer/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id){
        Offer offer = offerRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/offer/edit", "offer", offer);
        return mv;
    }

    @RequestMapping(value = "/admin/offer/{id}/edit", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("offer") Offer offer,
                           @PathVariable("id") Long id){
        Offer old = offerRepository.findOne(id);
        old.copy(offer);
        offerRepository.save(offer);
        return "redirect:/admin/offers";
    }

    @RequestMapping(value = "/admin/offers/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Offer offer = offerRepository.findOne(id);
        offer.setStatus(status);
        offerRepository.save(offer);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
