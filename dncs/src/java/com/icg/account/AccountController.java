package com.icg.account;

import com.icg.security.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @RequestMapping
    public String index(Model model) {
        try {
            // authenticated user
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();

            if (user.getRole().equals("admin")) {
                return "redirect:/empresa/index";
            }

            if (user.getRole().equals("donante")) {
                return "redirect:/donante/index";
            }

            if (user.getRole().equals("receptor")) {
                return "redirect:/receptor/index";
            }

            if (user.getRole().equals("voluntario")) {
                return "redirect:/voluntario/index";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

}
