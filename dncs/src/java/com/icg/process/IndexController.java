package com.icg.process;

import com.icg.services.IEntityServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletContext;

/**
 * IndexController
 *
 * @author John Castillo
 * @since 01-06-2017
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {

    @Autowired
    private IEntityServices service;
    @Autowired
    ServletContext servletContext;

    @RequestMapping
    public String EscritorioIndex(Model model) {
        try {
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
