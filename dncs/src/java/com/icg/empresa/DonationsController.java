package com.icg.empresa;

import com.google.gson.Gson;
import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.util.HashMap;
import java.util.List;
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
public class DonationsController {

    private static final Logger logger = LoggerFactory.getLogger(DonationsController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/donations", method = RequestMethod.GET)
    public String donations(Model model) {
        try {
            // donations
            List<Map<String, Object>> list = service.find("public", "donacion").getListData();
            for (Map<String, Object> en : list) {
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
            }

            model.addAttribute("list", list);

            return "empresa/donations/index";
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
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                if (en != null) {
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("donationdetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));

                    model.addAttribute("items", service.selectQueryForName("donacion_voluntarios", id).getListData());
                    model.addAttribute("resp", service.selectQueryForName("count_responsable", id).getObjectData().get("count"));

                    //model.addAttribute("productos", service.find("public", "producto").getListData());
                    return "empresa/donations/donation";
                } else {
                    return "redirect:donations";
                }
            } else {
                model.addAttribute("list", service.find("public", "donante").getListData());
                return "empresa/donations/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarvoluntarios", method = RequestMethod.POST)
    public String guardarVoluntarios(Model model,
            @RequestParam Long id,
            HttpServletRequest request) {
        try {
            // get request ids for notas
            String[] notasIds = request.getParameterValues("notaid");
            // delete current notas
            service.executeSQLStatement("delete from donacion_voluntario where donacion=" + id);
            if (notasIds != null) {
                for (String sid : notasIds) {
                    Map<String, Object> nn = new HashMap<>();
                    nn.put("donacion", id);
                    nn.put("voluntario", new Long(sid));
                    nn.put("responsable", Boolean.FALSE);
                    service.persist(nn, "public", "donacion_voluntario");
                }
            } else {
                System.out.println("notas is empty...");
            }

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

    @RequestMapping(value = "/setresponsable", method = RequestMethod.GET)
    public String setResponsable(Model model, @RequestParam Long id) {
        try {
            // get data
            Map<String, Object> en = service.get("public", "donacion_voluntario", id).getObjectData();
            Boolean res = (Boolean) en.get("responsable");
            if (!res) {
                service.executeSQLStatement("update donacion_voluntario set responsable=false where donacion=" + en.get("donacion"));
                en.put("responsable", Boolean.TRUE);
                service.persist(en, "public", "donacion_voluntario");
            }
            return "redirect:donation?id=" + en.get("donacion") + "#voluntarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/recogerdonacion", method = RequestMethod.GET)
    public String recogerdonacion(Model model, @RequestParam Long id) {
        try {
            // get donation data
            Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
            if (en != null) {
                service.updateSingleAttribute("public", "donacion", id, "estado", "RECOGIDO");
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
    
    @RequestMapping(value = "/donationpend", method = RequestMethod.GET)
    public String donationpend(Model model, @RequestParam Long id) {
        try {
            // get donation data
            Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
            if (en != null) {
                service.updateSingleAttribute("public", "donacion", id, "estado", "PENDIENTE");
            }
            return "redirect:donations";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
