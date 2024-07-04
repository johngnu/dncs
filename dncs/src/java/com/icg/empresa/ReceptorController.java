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
@RequestMapping(value = "/receptor")
public class ReceptorController {
    
    private static final Logger logger = LoggerFactory.getLogger(ReceptorController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        try {
            // Dashboard 
            model.addAttribute("count_eventos", service.countEntity("public", "evento"));
            model.addAttribute("count_donantes", service.countEntity("public", "donante"));
            
            return "receptor/index";
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
            List<Map<String, Object>> list = service.find("public", "solicitud").getListData();
            List<Map<String, Object>> listOut = new ArrayList<>();
            for (Map<String, Object> en : list) {                
                if (user.getPrincipal() == Long.parseLong(en.get("persona").toString())) {                    
                    listOut.add(en);
                }
            }
            
            model.addAttribute("list", listOut);
            
            return "receptor/donations/index";
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
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "solicitud", request);
            in.put("registro", new Date());
            in.put("persona", user.getPrincipal());
            in.put("estado", "PENDIENTE");
            
            Object id = service.persist(in, "public", "solicitud").getPrimaryKey();
            
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
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "solicitud", request);
            
            // put data
            en.put("fecha", in.get("fecha"));
            en.put("ubicacion", in.get("ubicacion"));
            en.put("ciudad", in.get("ciudad"));
            
            if (responsable != null) {
                en.put("responsable", responsable);
            }
            
            service.persist(en, "public", "solicitud");
            
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
                Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
                en.put("persona", service.get("public", "persona", en.get("persona")).getObjectData());
                if (en != null) {
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("solicituddetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));
                    
                    //model.addAttribute("items", service.selectQueryForName("donacion_voluntarios", id).getListData());
                    
                    model.addAttribute("categorias", service.selectQueryForName("donaciones_recogidos").getListData());
                    return "receptor/donations/donation";
                } else {
                    return "redirect:donations";
                }
            } else {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                
                model.addAttribute("cl", service.get("public", "persona", user.getPrincipal()).getObjectData());
            
                return "receptor/donations/registro";
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
            item.put("solicitud", id);
            item.put("categoria", categoria);
            item.put("cantidad", cantidad);
            item.put("detalle", detalle);
            
            service.persist(item, "public", "solicitud_detalle");
            
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
            Map<String, Object> qd = service.get("public", "solicitud_detalle", id).getObjectData();

            // delte donation detail
            service.delete("public", "solicitud_detalle", id);
            model.addAttribute("deleted", Boolean.TRUE);
            
            return "redirect:donation?id=" + qd.get("solicitud") + "#products";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
    
    @RequestMapping(value = "/additem", method = RequestMethod.GET)
    public String addItem(Model model, @RequestParam Long id, @RequestParam Long solicitud) {
        try {
            // get current item
            Map<String, Object> en = service.get("public", "donacion_detalle", id).getObjectData();
            
            Map<String, Object> in = new HashMap<>();
            in.put("categoria", en.get("categoria"));
            in.put("cantidad", en.get("cantidad"));
            in.put("detalle", en.get("detalle"));
            in.put("solicitud", solicitud);

            // add new item
            service.persist(in, "public", "solicitud_detalle");
            
            return "redirect:donation?id=" + solicitud + "#products";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
