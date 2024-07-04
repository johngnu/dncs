package com.icg.empresa;

import com.icg.services.IEntityServices;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/empresa")
public class EmpresaController {

    private static final Logger logger = LoggerFactory.getLogger(EmpresaController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        try {
            model.addAttribute("count_eventos", service.countEntity("public", "evento"));
            model.addAttribute("count_donantes", service.countEntity("public", "donante"));

            return "empresa/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/actualizarclave", method = RequestMethod.POST)
    public String actualizarClave(Model model,
            HttpServletRequest request,
            @RequestParam Long id,
            @RequestParam String clave) {
        try {
            // set new password
            service.updateSingleAttribute("security", "usuario", id, "clave", hashMD5Password(clave));

            return "redirect:usuarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    private String hashMD5Password(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());

        byte byteData[] = md.digest();
        //convert the byte to hex format method 1
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        return sb.toString();
    }
}
