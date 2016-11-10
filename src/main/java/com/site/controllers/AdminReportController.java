package com.site.controllers;

import com.site.models.Receipt;
import com.site.repositories.ReceiptRepository;
import com.site.repositories.UserRepository;
import com.site.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by dimitar.pavlov.mus on 17.08.2016.
 */

@Controller
public class AdminReportController {

    @Autowired
    ReceiptRepository receiptRepository;

    @Autowired
    UserRepository userRepository;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "/admin/report", method = RequestMethod.GET)
    private String getReportPage(@RequestParam(value = "userId", required = false) Long userId,
                                 @RequestParam(value = "fromDate", required = false) String fromDate,
                                 @RequestParam(value = "toDate", required = false) String toDate,
                                 @PageableDefault(size = 50) Pageable pageable, ModelMap model, HttpServletRequest request){
        Date from = null;
        Date to = null;
        try {
            from = (fromDate != null && fromDate.trim().length() > 0) ? sdf.parse(fromDate) : null;
            to = (toDate != null && toDate.trim().length() > 0) ? sdf.parse(toDate) : null;
            if(to != null){
                to = new Date(to.getTime() + Constants.DAY_IN_MS);
            }
        } catch (ParseException e) {
            //e.printStackTrace();
        }
        model.put("page", receiptRepository.selectForReport(userId, from, to, pageable));
        model.put("userList", userRepository.findByRole("EMPLOYEE"));
        model.put("url", (request.getRequestURL()+"?"+request.getQueryString()).replaceAll("&page=\\d*", ""));
        return "admin/report/list";
    }

    //TODO http://stackoverflow.com/questions/5673260/downloading-a-file-from-spring-controllers
    //https://gist.github.com/madan712/3912272
    @RequestMapping(value = "/admin/report/export", method = RequestMethod.GET)
    private void exportReport(@RequestParam(value = "userId", required = false) Long userId,
                              @RequestParam(value = "fromDate", required = false) String fromDate,
                              @RequestParam(value = "toDate", required = false) String toDate,
                              HttpServletResponse response){

        Date from = null;
        Date to = null;
        try {
            from = (fromDate != null && fromDate.trim().length() > 0) ? sdf.parse(fromDate) : null;
            to = (toDate != null && toDate.trim().length() > 0) ? sdf.parse(toDate) : null;
            if(to != null){
                to = new Date(to.getTime() + Constants.DAY_IN_MS);
            }
        } catch (ParseException e) {
            //e.printStackTrace();
        }
        List<Receipt> receipts = (List<Receipt>) receiptRepository.selectForReport(userId, from, to);

        String sheetName = "Sheet1";//name of sheet

    }

    @RequestMapping(value = "/admin/receipt/{id}", method = RequestMethod.GET)
    private String previewReceipt(@PathVariable("id") Long id, ModelMap model){
        model.put("receipt", receiptRepository.findById(id));
        return "admin/report/preview";
    }

}
