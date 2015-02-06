package com.site.controllers;

import com.site.models.User;
import com.site.repositories.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.BufferedReader;
import java.io.FileReader;
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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String hello(ModelMap model) throws IOException {
        String everything = null;
        BufferedReader br = new BufferedReader(new FileReader("MDTesting/Tests/Markdown Documentation.text"));
        try {
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append(System.lineSeparator());
                line = br.readLine();
            }
            everything = sb.toString();
        }finally {
            br.close();
        }
        PegDownProcessor processor = new PegDownProcessor();
        String html = processor.markdownToHtml(everything);
        model.addAttribute("name", html);
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
