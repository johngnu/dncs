package com.icg.empresa;

import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.util.Map;
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
public class ProductosController {

    private static final Logger logger = LoggerFactory.getLogger(EventosController.class);
    @Autowired
    private IEntityServices service;
    // root file repository
    private String serverPathSufix = "/appsdata/dncs/files/";

    @RequestMapping(value = "/productos", method = RequestMethod.GET)
    public String productos(Model model) {
        try {
            // categorias
            EntityResult er = service.find("public", "categoria");
            model.addAttribute("list", er.getListData());

            return "empresa/productos/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarproducto", method = RequestMethod.POST)
    public String guardarProducto(Model model, HttpServletRequest request) {
        try {
            // create producto
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "categoria", request);
            //in.put("registro", new Date());

            Object id = service.persist(in, "public", "categoria").getPrimaryKey();

            return "redirect:productos";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/actualizarproducto", method = RequestMethod.POST)
    public String actualizarProducto(Model model,
            @RequestParam Long id,
            HttpServletRequest request) {
        try {
            // get evento data
            Map<String, Object> en = service.get("public", "categoria", id).getObjectData();
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "categoria", request);

            // put data
            en.put("descripcion", in.get("descripcion"));
            service.persist(en, "public", "categoria");

            return "redirect:producto?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/producto", method = RequestMethod.GET)
    public String producto(Model model,
            @RequestParam(required = false) Long id) {
        try {
            // get guia
            if (id != null) {
                // get categoria data
                Map<String, Object> en = service.get("public", "categoria", id).getObjectData();
                if (en != null) {
                    model.addAttribute("evento", en);
                    return "empresa/productos/producto";
                } else {
                    return "redirect:productos";
                }
            } else {
                return "empresa/productos/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/inventario", method = RequestMethod.GET)
    public String inventario(Model model) {
        try {
            // inventario
            EntityResult er = service.selectQueryForName("inventario");
            model.addAttribute("list", er.getListData());

            return "empresa/productos/inventario";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
