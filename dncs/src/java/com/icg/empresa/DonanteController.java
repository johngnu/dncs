package com.icg.empresa;

import com.google.gson.Gson;
import com.icg.entityclassutils.EntityResult;
import com.icg.security.CustomUserDetails;
import com.icg.services.IEntityServices;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/donante")
public class DonanteController {
    
    private static final Logger logger = LoggerFactory.getLogger(DonanteController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
            // Dashboard 
            model.addAttribute("count_eventos", service.countEntity("public", "evento"));
            model.addAttribute("count_donantes", service.selectQueryForName("count_donations", user.getPrincipal()).getObjectData().get("nro"));
            
            return "donante/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/donations", method = RequestMethod.GET)
    public String donations(Model model) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
            // donations
            List<Map<String, Object>> list = service.find("public", "donacion").getListData();
            List<Map<String, Object>> listOut = new ArrayList<>();
            for (Map<String, Object> en : list) {                
                if (user.getPrincipal() == Long.parseLong(en.get("persona").toString())) {                    
                    listOut.add(en);
                }
            }
            
            model.addAttribute("list", listOut);
            
            return "donante/donations/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/savedonation", method = RequestMethod.POST)
    public String saveDonation(Model model, HttpServletRequest request) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();

            // create donacion
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "donacion", request);
            in.put("registro", new Date());
            in.put("persona", user.getPrincipal());
            in.put("estado", "PENDIENTE");
            
            Object id = service.persist(in, "public", "donacion").getPrimaryKey();
            
            return "redirect:donation?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/updatedonation", method = RequestMethod.POST)
    public String updateDonation(Model model,
            @RequestParam Long id,
            @RequestParam String fecha,
            @RequestParam(required = false) String responsable,
            HttpServletRequest request) {
        try {
            // get evento data
            Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "donacion", request);
            
            // put data
            en.put("fecha", in.get("fecha"));
            en.put("ubicacion", in.get("ubicacion"));
            en.put("ciudad", in.get("ciudad"));
            
            if (responsable != null) {
                en.put("responsable", responsable);
            }
            
            service.persist(en, "public", "donacion");
            
            return "redirect:donation?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/donation", method = RequestMethod.GET)
    public String donation(Model model,
            @RequestParam(required = false) Long id) {
        try {
            // get guia
            if (id != null) {
                // get donation data
                Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
                en.put("persona", service.get("public", "persona", en.get("persona")).getObjectData());
                if (en != null) {
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("donationdetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));
                    
                    //model.addAttribute("items", service.selectQueryForName("donacion_voluntarios", id).getListData());
                    
                    model.addAttribute("categorias", service.find("public", "categoria").getListData());
                    return "donante/donations/donation";
                } else {
                    return "redirect:donations";
                }
            } else {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                
                model.addAttribute("cl", service.get("public", "persona", user.getPrincipal()).getObjectData());
            
                return "donante/donations/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/adddonationproduct", method = RequestMethod.POST)
    public String addDonationProduct(Model model,
            HttpServletRequest request,
            @RequestParam Long id,
            @RequestParam Long categoria,
            @RequestParam String detalle,
            @RequestParam Double cantidad) {
        try {
            // new donation item 
            Map<String, Object> item = new HashMap<>();

            // set item data
            item.put("donacion", id);
            item.put("categoria", categoria);
            item.put("cantidad", cantidad);
            item.put("detalle", detalle);
            
            service.persist(item, "public", "donacion_detalle");
            
            return "redirect:donation?id=" + id + "#products";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/eliminardonacionproducto", method = RequestMethod.GET)
    public String eliminarDonacionProducto(Model model, @RequestParam Long id) {
        try {
            // get current item
            Map<String, Object> qd = service.get("public", "donacion_detalle", id).getObjectData();

            // delte donation detail
            service.delete("public", "donacion_detalle", id);
            model.addAttribute("deleted", Boolean.TRUE);
            
            return "redirect:donation?id=" + qd.get("donacion") + "#products";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
