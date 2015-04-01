package com.site.controllers;

import com.site.models.News;
import com.site.models.Status;
import com.site.models.User;
import com.site.repositories.NewsRepository;
import com.site.repositories.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-22
 * Time: 10:49
 */

@Controller
public class HomeController {

    private final Logger slf4jLogger = LoggerFactory.getLogger(HomeController.class);
    private final static String salt = "p2(K_v=,-E}Jug&O=BC=wi]$JtFTm^q-R9`/YpBu#l9+U(<SB~,_mxi?q4 OcaJ4";

    @Autowired
    UserRepository userRepository;

    @Autowired
    NewsRepository newsRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String hello(ModelMap model) throws IOException {

        PageRequest request = new PageRequest(0, 1, Sort.Direction.DESC, "id");
        Page<News> page = newsRepository.findByStatus(Status.ACTIVE, request);
        if(page.hasContent()){
            model.put("latestNews", page.getContent().get(0));
        }
        return "helloWorld";

    }

    @RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
    public String getFavicon(){
        return "forward:/assets/img/fav.png";
    }

    @RequestMapping(value = "/create/user", method = RequestMethod.GET)
    public String createAdminUser(){
        User user = userRepository.findByUsername("admin");
        if(user == null){
            user = new User();
            user.setUsername("admin");
            //TODO find problem with pass encryption and use username property as salt
            user.setPassword(new ShaPasswordEncoder(256).encodePassword("admin", ""));
            userRepository.save(user);
        }
        return "redirect:/";
    }
}
