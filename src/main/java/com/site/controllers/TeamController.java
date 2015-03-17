package com.site.controllers;

import com.site.models.Status;
import com.site.repositories.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:47
 */

@Controller
public class TeamController {

    @Autowired
    EmployeeRepository employeeRepository;

    @RequestMapping(value = "/team", method = RequestMethod.GET)
    public String index(@PageableDefault Pageable pageable, ModelMap model) throws IOException {
        model.put("page", employeeRepository.findByStatus(Status.ACTIVE, pageable));
        return "public/team";
    }
}
