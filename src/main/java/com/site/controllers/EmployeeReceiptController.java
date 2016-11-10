package com.site.controllers;

import com.site.models.*;
import com.site.repositories.*;
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

import javax.servlet.http.HttpServletRequest;
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
    ServiceProductRepository serviceProductRepository;

    @Autowired
    UserServiceItemPriceRepository userServiceItemPriceRepository;

    @Autowired
    ServiceMaterialRepository serviceMaterialRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/employee/receipts", method = RequestMethod.GET)
    public String getEmployeeReceiptsPage(@PageableDefault(size = 50) Pageable pageable,
                                          ModelMap model, HttpServletRequest request){
        model.put("page", receiptRepository.findBySellerUsernameOrderByCreatedAtDesc(getCurrentUserUsername(), pageable));
        model.put("url", (request.getRequestURL()+"?"+request.getQueryString()).replaceAll("&page=\\d*", ""));
        return "employee/receipt/list";
    }

    @RequestMapping(value = "/employee/receipts/new", method = RequestMethod.GET)
    public ModelAndView newRecipt(ModelMap model){
        ModelAndView mv = new ModelAndView("employee/receipt/edit", "receipt", new Receipt());
        System.out.println(getCurrentUserUsername() + "  " + userServiceItemPriceRepository.findByUserUsername(getCurrentUserUsername()).size());
        mv.getModel().put("serviceItemPrice", getCurrentUser().getPrices());
        mv.getModel().put("serviceItemList", serviceItemRepository.findAll());
        mv.getModel().put("serviceProductList", serviceProductRepository.findAll());
        mv.getModel().put("materialList", serviceMaterialRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/employee/receipts/new", method = RequestMethod.POST)
    public String saveNewReceipt(@ModelAttribute("receipt") Receipt receipt){
        User currentUser = getCurrentUser();
        HashMap<Long, Double> userPrices = getUserPrices(currentUser);
        HashMap<Long, Double> salonPrices = getSalonPrices();
        HashMap<Long, Double> salonPriceProducts = getSalonPricesProducts();

        List<ReceiptItem> itemsToRemove = new ArrayList<>();
        List<CustomReceiptItem> customItemsToRemove = new ArrayList<>();
        List<ProductItem> serviceProductToRemove = new ArrayList<>();
        Double userPart = 0.0;
        Double totalPrice = 0.0;

        if(receipt != null){

            //Work with items
            if(receipt.getItems() != null && receipt.getItems().size() > 0){
                for(ReceiptItem item: receipt.getItems()){
                    System.out.println("Item: " + item.getItem().getId());
                    if(item.getQuantity().equals(0)){
                        itemsToRemove.add(item);
                    } else {
                        if(item.getMaterial() != null && (item.getMaterial().getId() == null || item.getMaterial().getId().equals(0L))){
                            item.setMaterial(null);
                        }
                        userPart += item.getQuantity() * userPrices.get(item.getItem().getId());
                        totalPrice += item.getQuantity() * salonPrices.get(item.getItem().getId());
                    }
                }
                receipt.getItems().removeAll(itemsToRemove);
            }

            //Work with customItems
            if(receipt.getCustomItems() != null){
                for(CustomReceiptItem cItem: receipt.getCustomItems()){
                    if(cItem.getQuantity().equals(0)){
                        customItemsToRemove.add(cItem);
                    } else {
                        cItem.setTotalPrice(cItem.getQuantity() * cItem.getSinglePrice());
                        totalPrice += cItem.getTotalPrice();
                    }
                }
                receipt.getCustomItems().removeAll(customItemsToRemove);
            }

            //Work with customItems
            if(receipt.getProducts() != null){
                for(ProductItem product: receipt.getProducts()){
                    if(product.getQuantity().equals(0)){
                        serviceProductToRemove.add(product);
                    } else {
                        Double salonPrice = salonPriceProducts.get(product.getItem().getId());
                        if(salonPrice == null){
                            salonPrice = 0d;
                        }
                        totalPrice += product.getQuantity() * salonPrice;
                    }
                }
                receipt.getProducts().removeAll(serviceProductToRemove);
            }

        }

        receipt.setSellerAmount(userPart);
        receipt.setTotalAmount(totalPrice);
        receipt.setSeller(currentUser);
        receipt.setCreatedAt(new Date());
        receipt = receiptRepository.save(receipt);
        return "redirect:/employee/receipts/" + receipt.getId() + "/confirm";
    }

    @RequestMapping(value = "/employee/receipts/{id}/confirm", method = RequestMethod.GET)
    public String getConfirmReceipt(@PathVariable("id") Long id, ModelMap model){
        Receipt receipt = receiptRepository.findByIdAndSellerUsername(id, getCurrentUserUsername());
        model.put("receipt", receipt);
        return "employee/receipt/confirm";
    }

    @RequestMapping(value = "/employee/receipts/{id}/confirm", method = RequestMethod.POST)
    public String confirmReceipt(@PathVariable("id") Long id){
        Receipt receipt = receiptRepository.findOne(id);
        receipt.setReceiptStatus(Receipt.ReceiptStatus.CONFIRMED);
        receiptRepository.save(receipt);
        return "redirect:/employee/receipts";
    }

    @RequestMapping(value = "/employee/receipts/{id}/preview", method = RequestMethod.GET)
    public String previewReceipt(@PathVariable("id") Long id, ModelMap model){
        model.put("receipt", receiptRepository.findByIdAndSellerUsername(id, getCurrentUserUsername()));
        return "admin/report/preview";
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

    private HashMap<Long, Double> getSalonPricesProducts(){
        HashMap<Long, Double> returnMap = new HashMap<>();
        List<ServiceProduct> serviceProductList = (List<ServiceProduct>) serviceProductRepository.findAll();
        for(ServiceProduct product: serviceProductList){
            returnMap.put(product.getId(), product.getSalonPrice());
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
