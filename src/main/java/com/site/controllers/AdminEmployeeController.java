package com.site.controllers;

import com.site.models.Employee;
import com.site.models.Status;
import com.site.repositories.EmployeeRepository;
import com.site.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 15-3-17
 * Time: 11:27
 */

@Controller
public class AdminEmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    /* LIST */
    @RequestMapping(value = "/admin/employee", method = RequestMethod.GET)
    public String getAllEmployees(@PageableDefault Pageable pageable, ModelMap model){
        model.put("page", employeeRepository.findAll(pageable));
        return "admin/employee/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/employee/new", method = RequestMethod.GET)
    public ModelAndView newEmployee(){
        ModelAndView mv = new ModelAndView("admin/employee/edit", "employee", new Employee());
        return mv;
    }

    @RequestMapping(value = "/admin/employee/new", method = RequestMethod.POST)
    public String postNewEmployee(@ModelAttribute("employee") Employee employee,
                                  MultipartFile file){
        employee.setImage(FileUtils.createImage(file));
        employeeRepository.save(employee);
        return "redirect:/admin/employee";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/employee/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editEmployee(@PathVariable("id") Long id){
        Employee employee = employeeRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/employee/edit", "employee", employee);
        return mv;
    }

    @RequestMapping(value = "/admin/employee/{id}/edit", method = RequestMethod.POST)
    public String postEditEmployee(@ModelAttribute("employee") Employee employee,
                                   @PathVariable("id") Long id,
                                   MultipartFile file){
        Employee old = employeeRepository.findOne(id);
        old.copy(employee);
        if(!file.isEmpty()){
            old.setImage(FileUtils.createImage(file));
        }
        employeeRepository.save(old);
        return "redirect:/admin/employee";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/employee/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        Employee employee = employeeRepository.findOne(id);
        employee.setStatus(status);
        employeeRepository.save(employee);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
