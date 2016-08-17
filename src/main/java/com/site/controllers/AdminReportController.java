package com.site.controllers;

import com.site.repositories.ReceiptRepository;
import com.site.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by dimitar.pavlov.mus on 17.08.2016.
 */

@Controller
public class AdminReportController {

    @Autowired
    ReceiptRepository receiptRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/admin/report", method = RequestMethod.GET)
    private String getReportPage(@RequestParam(value = "userId", required = false) Long userId,
                                 @RequestParam(value = "fromDate", required = false) String fromDate,
                                 @RequestParam(value = "toDate", required = false) String toDate,
                                 @PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", receiptRepository.selectForReport(userId, pageable));
        model.put("userList", userRepository.findByRole("EMPLOYEE"));
        return "admin/report/list";
    }

    @RequestMapping(value = "/admin/receipt/{id}", method = RequestMethod.GET)
    private String previewReceipt(@PathVariable("id") Long id, ModelMap model){
        model.put("receipt", receiptRepository.findOne(id));
        return "admin/report/preview";
    }



}
