package com.site.controllers;

import com.site.repositories.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dkpavlov
 * Date: 2/8/15
 * Time: 19:45
 */

@Controller
@RequestMapping("")
public class NewsController {

    @Autowired
    NewsRepository newsRepository;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String index(ModelMap model) throws IOException {
        return "public/news";

    }

    @RequestMapping(value = "/admin/news/new", method = RequestMethod.GET)
    public ModelAndView adminNewsNew() throws IOException {
        ModelAndView mv = new ModelAndView("");
        return mv;

    }

    @RequestMapping(value = "/admin/news/new", method = RequestMethod.POST)
    public String adminNewsSaveNew(ModelMap model) throws IOException {
        return "public/contacts";

    }

    @RequestMapping(value = "/admin/news", method = RequestMethod.GET)
    public String adminNews(ModelMap model) throws IOException {
        return "public/contacts";

    }

    @RequestMapping(value = "/admin/news/preview/{id}", method = RequestMethod.GET)
    public String adminNewsPreview(@PathVariable("id") Long id,
                                   ModelMap model) throws IOException {
        return "public/contacts";

    }

    @RequestMapping(value = "/admin/news/preview/{id}", method = RequestMethod.DELETE)
    public String adminNewsDelete(@PathVariable("id") Long id,
                                   ModelMap model) throws IOException {
        return "public/contacts";

    }

    @RequestMapping(value = "/admin/news/preview/{id}/edit", method = RequestMethod.GET)
    public String adminNewsEdit(@PathVariable("id") Long id,
                                  ModelMap model) throws IOException {
        return "public/contacts";

    }

    @RequestMapping(value = "/admin/news/preview/{id}/edit", method = RequestMethod.POST)
    public String adminNewsSaveEdit(@PathVariable("id") Long id,
                                ModelMap model) throws IOException {
        return "public/contacts";

    }

}
