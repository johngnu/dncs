package com.icg.security;

import com.google.gson.Gson;
import com.icg.dao.Dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * InitController
 *
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 * @since 01-12-2018
 */
@Controller
public class InitController {

    @Autowired
    Dao dao;

    @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
    public String accessdenied(Model model) {
        Authentication autenticacion = SecurityContextHolder.getContext().getAuthentication();
        // view user data in main log
        Gson g = new Gson();
        System.out.println("session: " + g.toJson(autenticacion));
        model.addAttribute("user", autenticacion.getName());
        return "/deniedpage";
    }

}
