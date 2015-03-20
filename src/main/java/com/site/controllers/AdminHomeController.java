package com.site.controllers;

import org.springframework.stereotype.Controller;

/**
 * Created with IntelliJ IDEA.
 * User: dpavlov
 * Date: 14-10-23
 * Time: 13:35
 */

@Controller
//@RequestMapping("/admin")
public class AdminHomeController {

    /*private final Logger slf4jLogger = LoggerFactory.getLogger(AdminHomeController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String loginPage(@RequestParam(value = "loginError", required = false) String error, ModelMap model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken) {
            model.put("error", error);
            return "login";
        } else {
            return "redirect:/admin/home";
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String adminHome(ModelMap model) throws IOException {
        String everything = null;
        BufferedReader br = new BufferedReader(new FileReader("MDTesting/Tests/Inline-HTML-Advanced.text"));
        StringBuilder sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
            sb.append(line);
            sb.append(System.lineSeparator());
            line = br.readLine();
        }
        everything = sb.toString();
        br.close();
        PegDownProcessor processor = new PegDownProcessor();
        String html = processor.markdownToHtml(everything);
        model.addAttribute("body", html);
        return "admin/home";
    }*/
}
