package com.icg.empresa;

import com.google.gson.Gson;
import com.icg.entityclassutils.EntityResult;
import com.icg.security.CustomUserDetails;
import com.icg.services.IEntityServices;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@RequestMapping(value = "/voluntario")
public class VoluntarioController {

    private static final Logger logger = LoggerFactory.getLogger(VoluntarioController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        try {
            // Dashboard 
            model.addAttribute("count_eventos", service.countEntity("public", "evento"));
            model.addAttribute("count_donantes", service.countEntity("public", "donante"));

            return "voluntario/index";
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
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                listOut.add(en);
            }

            model.addAttribute("list", listOut);

            return "voluntario/donations/index";
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
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                // get donation data
                Map<String, Object> en = service.get("public", "donacion", id).getObjectData();

                if (en != null) {
                    Map<String, Object> params = new HashMap<>();
                    params.put("donacion", id);
                    params.put("voluntario", user.getPrincipal());
                    int c = Integer.parseInt(service.selectQueryForName("soy_voluntario", params).getObjectData().get("count").toString());
                    if (c != 0) {
                        en.put("soyvoluntario", Boolean.TRUE);
                    } else {
                        en.put("soyvoluntario", Boolean.FALSE);
                    }
                    en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("donationdetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));

                    //model.addAttribute("items", service.selectQueryForName("donacion_voluntarios", id).getListData());
                    //model.addAttribute("productos", service.find("public", "producto").getListData());
                    return "voluntario/donations/donation";
                } else {
                    return "redirect:donations";
                }
            } else {

                return "voluntario/donations/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/soyvoluntario", method = RequestMethod.GET)
    public String soyVoluntario(Model model,
            @RequestParam Long id) {
        try {
            // get donation data
            Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
            if (en != null) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                Map<String, Object> params = new HashMap<>();
                params.put("donacion", id);
                params.put("voluntario", user.getPrincipal());
                int c = Integer.parseInt(service.selectQueryForName("soy_voluntario", params).getObjectData().get("count").toString());
                if (c == 0) {
                    Map<String, Object> nn = new HashMap<>();
                    nn.put("donacion", id);
                    nn.put("voluntario", user.getPrincipal());
                    nn.put("voluntario", user.getPrincipal());
                    nn.put("responsable", Boolean.FALSE);
                    service.persist(nn, "public", "donacion_voluntario");
                } else {
                    service.executeSQLStatement("delete from donacion_voluntario where donacion=" + id + " and voluntario=" + user.getPrincipal());
                }

                return "redirect:donation?id=" + id;
            } else {
                return "redirect:donations";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/solicitudes", method = RequestMethod.GET)
    public String solicitudes(Model model) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
            // donations
            List<Map<String, Object>> list = service.find("public", "solicitud").getListData();
            List<Map<String, Object>> listOut = new ArrayList<>();
            for (Map<String, Object> en : list) {
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                listOut.add(en);
            }

            model.addAttribute("list", listOut);

            return "voluntario/solicitudes/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/solicitud", method = RequestMethod.GET)
    public String solicitud(Model model,
            @RequestParam(required = false) Long id) {
        try {
            // get guia
            if (id != null) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                // get donation data
                Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();

                if (en != null) {
                    Map<String, Object> params = new HashMap<>();
                    params.put("solicitud", id);
                    params.put("voluntario", user.getPrincipal());
                    int c = Integer.parseInt(service.selectQueryForName("soy_voluntario_sol", params).getObjectData().get("count").toString());
                    if (c != 0) {
                        en.put("soyvoluntario", Boolean.TRUE);
                    } else {
                        en.put("soyvoluntario", Boolean.FALSE);
                    }
                    en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("solicituddetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));

                    //model.addAttribute("items", service.selectQueryForName("donacion_voluntarios", id).getListData());
                    //model.addAttribute("productos", service.find("public", "producto").getListData());
                    return "voluntario/solicitudes/donation";
                } else {
                    return "redirect:solicitudes";
                }
            } else {

                return "voluntario/solicitudes/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/soyvoluntariosol", method = RequestMethod.GET)
    public String soyVoluntarioSol(Model model,
            @RequestParam Long id) {
        try {
            // get solicitud data
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            if (en != null) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                CustomUserDetails user = (CustomUserDetails) authentication.getPrincipal();
                Map<String, Object> params = new HashMap<>();
                params.put("solicitud", id);
                params.put("voluntario", user.getPrincipal());
                int c = Integer.parseInt(service.selectQueryForName("soy_voluntario_sol", params).getObjectData().get("count").toString());
                if (c == 0) {
                    Map<String, Object> nn = new HashMap<>();
                    nn.put("solicitud", id);
                    nn.put("voluntario", user.getPrincipal());
                    nn.put("responsable", Boolean.FALSE);
                    service.persist(nn, "public", "solicitud_voluntario");
                } else {
                    service.executeSQLStatement("delete from solicitud_voluntario where solicitud=" + id + " and voluntario=" + user.getPrincipal());
                }

                return "redirect:solicitud?id=" + id;
            } else {
                return "redirect:solicitudes";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
