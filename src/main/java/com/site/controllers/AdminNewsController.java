package com.site.controllers;

import com.site.models.News;
import com.site.models.Status;
import com.site.repositories.NewsRepository;
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
 * Date: 15-3-18
 * Time: 11:29
 */

@Controller
public class AdminNewsController {

    @Autowired
    NewsRepository newsRepository;

    /* LIST */
    @RequestMapping(value = "/admin/news", method = RequestMethod.GET)
    public String getAll(@PageableDefault(size = 150) Pageable pageable, ModelMap model){
        model.put("page", newsRepository.findByStatusNot(Status.ARCHIVED, pageable));
        return "admin/news/list";
    }

    /* NEW */
    @RequestMapping(value = "/admin/news/new", method = RequestMethod.GET)
    public ModelAndView newNews(){
        ModelAndView mv = new ModelAndView("admin/news/edit", "news", new News());
        return mv;
    }

    @RequestMapping(value = "/admin/news/new", method = RequestMethod.POST)
    public String postNewNews(@ModelAttribute("news") News news,
                              @RequestParam("file") MultipartFile file){

        news.setImage(FileUtils.createImage(file));
        newsRepository.save(news);
        return "redirect:/admin/news";
    }

    /* EDIT */
    @RequestMapping(value = "/admin/news/{id}/edit", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable("id") Long id){
        News news = newsRepository.findOne(id);
        ModelAndView mv = new ModelAndView("admin/news/edit", "news", news);
        return mv;
    }

    @RequestMapping(value = "/admin/news/{id}/edit", method = RequestMethod.POST)
    public String postEditNews(@ModelAttribute("news") News news,
                               @PathVariable("id") Long id,
                               MultipartFile file){
        News old = newsRepository.findOne(id);
        old.copy(news);
        if(!file.isEmpty()){
            old.setImage(FileUtils.createImage(file));
        };
        newsRepository.save(old);
        return "redirect:/admin/news";
    }

    /* CHANGE STATUS */
    @RequestMapping(value = "/admin/news/{id}/status", method = RequestMethod.PUT)
    @ResponseBody
    public String changeStatus(@PathVariable("id") Long id, Status status){
        News news = newsRepository.findOne(id);
        news.setStatus(status);
        newsRepository.save(news);
        return "SUCCESS";
    }

    /* STATUSES */
    @ModelAttribute("statuses")
    public Status[] getStatuses(){
        return Status.values();
    }
}
