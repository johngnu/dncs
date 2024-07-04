package com.icg.empresa;

import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.util.Date;
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
public class ClientesController {

    private static final Logger logger = LoggerFactory.getLogger(ClientesController.class);
    @Autowired
    private IEntityServices service;

    @RequestMapping(value = "/donantes", method = RequestMethod.GET)
    public String donantes(Model model) {
        try {
            // clientes
            EntityResult er = service.find("public", "donante");
            model.addAttribute("list", er.getListData());

            return "empresa/donantes/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardardonante", method = RequestMethod.POST)
    public String guardarDonante(Model model, HttpServletRequest request) {
        try {
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "donante", request);
            in.put("registro", new Date());

            service.persist(in, "public", "donante");

            return "redirect:donantes";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/donante", method = RequestMethod.GET)
    public String donante(Model model, @RequestParam(required = false) Long id) {
        try {
            // get cliente
            if (id != null) {
                EntityResult er = service.get("public", "donante", id);
                model.addAttribute("cliente", er.getObjectData());

                return "empresa/donantes/donante";
            } else {
                // cliente extras

                return "empresa/donantes/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/actualizarcliente", method = RequestMethod.POST)
    public String actualizarCliente(Model model,
            @RequestParam Long cliente,
            HttpServletRequest request) {
        try {
            // get customer
            Map<String, Object> cl = service.get("crm", "cliente", cliente).getObjectData();

            // build in from request
            Map<String, Object> in = service.buildPersistenObjectFromRequest("crm", "cliente", request);

            // update customer            
            cl.put("nombre", in.get("nombre"));
            cl.put("extendido", in.get("extendido"));
            cl.put("apellido", in.get("apellido"));
            cl.put("tipo_cliente", in.get("tipo_cliente"));
            cl.put("razon_social", in.get("razon_social"));
            cl.put("nit", in.get("nit"));
            cl.put("direccion", in.get("direccion"));
            cl.put("email", in.get("email"));
            cl.put("telefono", in.get("telefono"));
            cl.put("celular", in.get("celular"));
            cl.put("ciudad", in.get("ciudad"));

            service.persist(cl, "crm", "cliente");

            return "redirect:cliente?id=" + cliente;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/eliminarcliente", method = RequestMethod.GET)
    public String eliminarCliente(Model model, @RequestParam Long id) {
        try {
            // delte quote detail
            service.delete("crm", "cliente", id);
            //model.addAttribute("deleted", Boolean.TRUE);

            return "redirect:clientes";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/beneficiarios", method = RequestMethod.GET)
    public String beneficiarios(Model model) {
        try {
            // beneficiarios
            EntityResult er = service.find("public", "beneficiario");
            model.addAttribute("list", er.getListData());

            return "empresa/beneficiarios/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarbeneficiario", method = RequestMethod.POST)
    public String guardarBeneficiario(Model model, HttpServletRequest request) {
        try {
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "beneficiario", request);
            in.put("registro", new Date());

            service.persist(in, "public", "beneficiario");

            return "redirect:beneficiarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/beneficiario", method = RequestMethod.GET)
    public String beneficiario(Model model, @RequestParam(required = false) Long id) {
        try {
            // get beneficiario
            if (id != null) {
                EntityResult er = service.get("public", "beneficiario", id);
                model.addAttribute("cliente", er.getObjectData());

                return "empresa/beneficiarios/cliente";
            } else {
                // cliente extras

                return "empresa/beneficiarios/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/voluntarios", method = RequestMethod.GET)
    public String voluntarios(Model model) {
        try {
            // voluntarios
            EntityResult er = service.find("public", "voluntario");
            model.addAttribute("list", er.getListData());

            return "empresa/voluntarios/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarvoluntario", method = RequestMethod.POST)
    public String guardarVoluntario(Model model, HttpServletRequest request) {
        try {
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "voluntario", request);
            in.put("registro", new Date());

            service.persist(in, "public", "voluntario");

            return "redirect:voluntarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/voluntario", method = RequestMethod.GET)
    public String voluntario(Model model, @RequestParam(required = false) Long id) {
        try {
            // get voluntarios
            if (id != null) {
                EntityResult er = service.get("public", "voluntario", id);
                model.addAttribute("cliente", er.getObjectData());

                return "empresa/voluntarios/cliente";
            } else {
                // cliente extras

                return "empresa/voluntarios/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
