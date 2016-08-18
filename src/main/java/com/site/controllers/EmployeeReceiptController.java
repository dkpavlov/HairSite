package com.site.controllers;

import com.site.models.*;
import com.site.repositories.ReceiptRepository;
import com.site.repositories.ServiceItemRepository;
import com.site.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 16.08.2016.
 */
@Controller
public class EmployeeReceiptController {

    @Autowired
    ReceiptRepository receiptRepository;

    @Autowired
    ServiceItemRepository serviceItemRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/employee/receipts", method = RequestMethod.GET)
    public String getEmployeeReceiptsPage(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", receiptRepository.findBySellerUsernameOrderByCreatedAtDesc(getCurrentUserUsername(), pageable));
        return "employee/receipt/list";
    }

    @RequestMapping(value = "/employee/receipts/new", method = RequestMethod.GET)
    public ModelAndView newRecipt(ModelMap model){
        ModelAndView mv = new ModelAndView("employee/receipt/edit", "receipt", new Receipt());
        mv.getModel().put("serviceItemList", serviceItemRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/employee/receipts/new", method = RequestMethod.POST)
    public String saveNewReceipt(@ModelAttribute("receipt") Receipt receipt){
        User currentUser = getCurrentUser();
        HashMap<Long, Double> userPrices = getUserPrices(currentUser);
        HashMap<Long, Double> salonPrices = getSalonPrices();
        List<ReceiptItem> itemsToRemove  = new ArrayList<>();
        Double userPart = 0.0;
        Double totalPrice = 0.0;
        if(receipt != null && receipt.getItems() != null){
            for(ReceiptItem item: receipt.getItems()){
                if(item.getQuantity().equals(0)){
                    itemsToRemove.add(item);
                } else {
                    userPart += item.getQuantity() * userPrices.get(item.getItem().getId());
                    totalPrice += item.getQuantity() * salonPrices.get(item.getItem().getId());
                }
            }
            receipt.getItems().removeAll(itemsToRemove);
        }
        receipt.setSellerAmount(userPart);
        receipt.setTotalAmount(totalPrice);
        receipt.setSeller(currentUser);
        receipt.setCreatedAt(new Date());
        System.err.println(receipt.getTotalAmount() + " " + receipt.getSellerAmount());
        receipt = receiptRepository.save(receipt);
        return "redirect:/employee/receipts/" + receipt.getId() + "/confirm";
    }

    //TODO
    @RequestMapping(value = "/employee/receipts/{id}/confirm", method = RequestMethod.GET)
    public String getConfirmReceipt(@PathVariable("id") Long id, ModelMap model){
        Receipt receipt = receiptRepository.findOne(id);
        model.put("receipt", receipt);
        //model.put("receipt", receiptRepository.findByIdAndSellerUsername(id, getCurrentUserUsername()));
        return "employee/receipt/confirm";
    }

    @RequestMapping(value = "/employee/receipts/{id}/confirm", method = RequestMethod.POST)
    public String confirmReceipt(@PathVariable("id") Long id){
        Receipt receipt = receiptRepository.findOne(id);
        receipt.setReceiptStatus(Receipt.ReceiptStatus.CONFIRMED);
        receiptRepository.save(receipt);
        return "redirect:/employee/receipts";
    }

    private HashMap<Long, Double> getUserPrices(User user){
        HashMap<Long, Double> returnMap = new HashMap<>();
        for(UserServiceItemPrice price: user.getPrices()){
            returnMap.put(price.getServiceItem().getId(), price.getUserPrice());
        }
        return returnMap;
    }

    private HashMap<Long, Double> getSalonPrices(){
        HashMap<Long, Double> returnMap = new HashMap<>();
        List<ServiceItem> serviceItemList = (List<ServiceItem>) serviceItemRepository.findAll();
        for(ServiceItem si: serviceItemList){
            returnMap.put(si.getId(), si.getSalonPrice());
        }
        return returnMap;
    }


    private String getCurrentUserUsername(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

    private User getCurrentUser(){
        return userRepository.findByUsername(getCurrentUserUsername());
    }

}
