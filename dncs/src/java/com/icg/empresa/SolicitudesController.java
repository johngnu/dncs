package com.icg.empresa;

import com.google.gson.Gson;
import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.util.Date;
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
public class SolicitudesController {

    private static final Logger logger = LoggerFactory.getLogger(SolicitudesController.class);
    @Autowired
    private IEntityServices service;
    // root file repository
    private String serverPathSufix = "/appsdata/dncs/files/";

    @RequestMapping(value = "/solicitudes", method = RequestMethod.GET)
    public String donations(Model model) {
        try {
            // donations
            List<Map<String, Object>> list = service.find("public", "solicitud").getListData();
            for (Map<String, Object> en : list) {
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
            }

            model.addAttribute("list", list);

            return "empresa/solicitudes/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/savesolicitud", method = RequestMethod.POST)
    public String saveDonation(Model model, HttpServletRequest request) {
        try {
            // create donacion
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "solicitud", request);
            in.put("registro", new Date());
            in.put("estado", "PENDIENTE");

            Object id = service.persist(in, "public", "solicitud").getPrimaryKey();

            return "redirect:solicitud?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/updatesolicitud", method = RequestMethod.POST)
    public String updateDonation(Model model,
            @RequestParam Long id,
            @RequestParam String fecha,
            @RequestParam(required = false) String observacion,
            @RequestParam(required = false) String responsable,
            HttpServletRequest request) {
        try {
            // get evento data
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "categoria", request);

            if (observacion != null) {
                en.put("observacion", observacion);
            }
            // put data
            en.put("fecha", in.get("fecha"));
            en.put("responsable", in.get("responsable"));
            en.put("ubicacion", in.get("ubicacion"));
            en.put("ciudad", in.get("ciudad"));

            if (responsable != null) {
                en.put("responsable", responsable);
            }

            service.persist(en, "public", "solicitud");

            return "redirect:solicitud?id=" + id;
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
                // get donation data
                Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
                en.put("donante", service.get("public", "persona", en.get("persona")).getObjectData());
                if (en != null) {
                    model.addAttribute("donation", en);

                    // products detail
                    EntityResult pd = service.selectQueryForName("solicituddetail", id);
                    model.addAttribute("donationdetail", pd.getListData());
                    model.addAttribute("qjsondetail", new Gson().toJson(pd.getListData()));

                    model.addAttribute("items", service.selectQueryForName("solicitud_voluntarios", id).getListData());
                    model.addAttribute("resp", service.selectQueryForName("count_responsablesol", id).getObjectData().get("count"));
                    
                    //model.addAttribute("productos", service.find("public", "producto").getListData());
                    return "empresa/solicitudes/donation";
                } else {
                    return "redirect:solicitudes";
                }
            } else {
                model.addAttribute("list", service.find("public", "donante").getListData());
                return "empresa/solicitudes/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/solicitudpend", method = RequestMethod.GET)
    public String solicitudpend(Model model, @RequestParam Long id) {
        try {
            // get donation data
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            if (en != null) {
                service.updateSingleAttribute("public", "solicitud", id, "estado", "PENDIENTE");
            }
            return "redirect:solicitudes";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarvoluntariossol", method = RequestMethod.POST)
    public String guardarVoluntariosSol(Model model,
            @RequestParam Long id,
            HttpServletRequest request) {
        try {
            // get request ids for notas
            String[] notasIds = request.getParameterValues("notaid");
            // delete current notas
            service.executeSQLStatement("delete from solicitud_voluntario where solicitud=" + id);
            if (notasIds != null) {
                for (String sid : notasIds) {
                    Map<String, Object> nn = new HashMap<>();
                    nn.put("solicitud", id);
                    nn.put("voluntario", new Long(sid));
                    nn.put("responsable", Boolean.FALSE);
                    service.persist(nn, "public", "solicitud_voluntario");
                }
            } else {
                System.out.println("notas is empty...");
            }

            return "redirect:solicitud?id=" + id + "#products";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/entregarsolicitud", method = RequestMethod.GET)
    public String entregarsolicitud(Model model, @RequestParam Long id) {
        try {
            // get donation data
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            if (en != null) {
                service.updateSingleAttribute("public", "solicitud", id, "estado", "ENTREGADO");
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
    
    @RequestMapping(value = "/setresponsablesol", method = RequestMethod.GET)
    public String setResponsable(Model model, @RequestParam Long id) {
        try {
            // get data
            Map<String, Object> en = service.get("public", "solicitud_voluntario", id).getObjectData();
            Boolean res = (Boolean) en.get("responsable");
            if (!res) {
                service.executeSQLStatement("update solicitud_voluntario set responsable=false where solicitud=" + en.get("solicitud"));
                en.put("responsable", Boolean.TRUE);
                service.persist(en, "public", "solicitud_voluntario");
            }
            return "redirect:solicitud?id=" + en.get("solicitud") + "#voluntarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
