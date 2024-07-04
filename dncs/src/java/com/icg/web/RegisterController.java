package com.icg.web;

import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
    @Autowired
    private IEntityServices service;

    private Boolean activate = false;
    private String message = "Alert server is alive...";
    Map<String, Object> alert = null;

    @RequestMapping
    public String register(Model model,
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Boolean error,
            @RequestParam(required = false) String tipo,
            @RequestParam(required = false) String usr) {
        if (id != null) {
            // get client data
            Map<String, Object> cl = service.get("public", "persona", id).getObjectData();
            model.addAttribute("client", cl);

            if (error != null) {
                if (error) {
                    model.addAttribute("error", Boolean.TRUE);
                }
            }
            return "web/registerSuccess";
        }
        model.addAttribute("tipo", tipo);
        model.addAttribute("usr", usr);
        return "web/registerForm";
    }

    @RequestMapping(value = "/saveform", method = RequestMethod.POST)
    public String register(Model model,
            @RequestParam String tipo,
            @RequestParam String usr,
            HttpServletRequest request) {
        try {
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "persona", request);

            boolean sw = service.existObject("public", "persona", "email", in.get("email"));
            if (!sw) {
                in.put("registro", new Date());
                // in.put("estado", "A"); // A is active initial client
                in.put("pin", service.pin());

                EntityResult er = service.persist(in, "public", "persona");
                createUser(er.getPrimaryKey());
                return "redirect:/register?id=" + er.getPrimaryKey();
            }

            // if cliente exist
            Map<String, Object> cl = service.getExistObject("public", "persona", "email", in.get("email"));
            return "redirect:/register?id=" + cl.get("persona_id") + "&error=true";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    public void createUser(Object id) throws NoSuchAlgorithmException {
        Map<String, Object> in = service.get("public", "persona", id).getObjectData();
        String rol = in.get("usr").equals("don") ? "donante" : "receptor";
        Map<String, Object> u = new HashMap<>();
        u.put("activo", Boolean.TRUE);
        u.put("nombre", in.get("nombre"));
        u.put("apellido", in.get("apellido"));
        u.put("email", in.get("email"));
        u.put("rol", rol);
        u.put("cargo", "principal");
        u.put("usuario", in.get("email"));
        u.put("principal", in.get("persona_id"));
        u.put("clave", this.hashMD5Password(in.get("pin").toString()));
        // create user account
        service.persist(u, "security", "usuario");
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

    @RequestMapping(value = "/results", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> results(@RequestParam String device) {
        Map<String, Object> data = new HashMap<>();
        try {
            System.out.println("*************** " + device);
            EntityResult er = service.selectQueryForName("results", Long.parseLong(device));
            /*int index = 1;
                List<ItemAlert> ls = new ArrayList<>();
             */
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            /*for (Map<String, Object> m : er.getListData()) {
                Date date = (Date) m.get("fecha_desaparicion");
                m.put("fecha_desaparicion", df.format(date));
            }*/

            data.put("data", er.getListData());
            data.put("devideId", System.currentTimeMillis());
            data.put("success", Boolean.TRUE);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/resultsol", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> resultsol(@RequestParam String device) {
        Map<String, Object> data = new HashMap<>();
        try {
            System.out.println("*************** " + device);
            EntityResult er = service.selectQueryForName("resultsol", Long.parseLong(device));
            data.put("data", er.getListData());
            data.put("devideId", System.currentTimeMillis());
            data.put("success", Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/donacion", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> donacion(@RequestParam Long id) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> en = service.get("public", "donacion", id).getObjectData();
            EntityResult dt = service.selectQueryForName("donationdetail", id);
            String detail = "";
            for (Map<String, Object> d : dt.getListData()) {
                detail += d.get("descripcion") + ": " + d.get("detalle") + " " + d.get("cantidad") + "\n";
            }
            /*int index = 1;
                List<ItemAlert> ls = new ArrayList<>();
             */
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            /*for (Map<String, Object> m : er.getListData()) {
                Date date = (Date) m.get("fecha_desaparicion");
                m.put("fecha_desaparicion", df.format(date));
            }*/

            data.put("fecha", df.format(en.get("fecha")));
            data.put("responsable", en.get("responsable"));
            data.put("ubicacion", en.get("ubicacion"));
            data.put("ciudad", en.get("ciudad"));
            data.put("detail", detail);
            data.put("estado", en.get("estado"));

            data.put("success", Boolean.TRUE);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/solicitud", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> solicitud(@RequestParam Long id) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> en = service.get("public", "solicitud", id).getObjectData();
            EntityResult dt = service.selectQueryForName("solicituddetail", id);
            String detail = "";
            for (Map<String, Object> d : dt.getListData()) {
                detail += d.get("descripcion") + ": " + d.get("detalle") + " " + d.get("cantidad") + "\n";
            }
            /*int index = 1;
                List<ItemAlert> ls = new ArrayList<>();
             */
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            /*for (Map<String, Object> m : er.getListData()) {
                Date date = (Date) m.get("fecha_desaparicion");
                m.put("fecha_desaparicion", df.format(date));
            }*/

            data.put("fecha", df.format(en.get("fecha")));
            data.put("responsable", en.get("responsable"));
            data.put("ubicacion", en.get("ubicacion"));
            data.put("ciudad", en.get("ciudad"));
            data.put("detail", detail);
            data.put("estado", en.get("estado"));

            data.put("success", Boolean.TRUE);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/recogido", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> recogido(@RequestParam Long id) {
        Map<String, Object> data = new HashMap<>();
        try {
            service.updateSingleAttribute("public", "donacion", id, "estado", "RECOGIDO");
            data.put("success", Boolean.TRUE);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/recogidosol", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> recogidosol(@RequestParam Long id) {
        Map<String, Object> data = new HashMap<>();
        try {
            service.updateSingleAttribute("public", "solicitud", id, "estado", "ENTREGADO");
            data.put("success", Boolean.TRUE);

        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/init", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, ? extends Object> init(@RequestParam String user, @RequestParam String pass, HttpServletRequest request) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> usr = service.getExistObject("security", "usuario", "usuario", user);
            if (usr != null) {
                if (usr.get("clave").equals(hashMD5Password(pass))) {
                    // response data object
                    Map<String, Object> out = new HashMap<>();
                    out.put("device", usr.get("usuario_id"));
                    out.put("localLevel", 0);
                    data.put("data", out);
                    data.put("success", Boolean.TRUE);
                } else {
                    data.put("message", "Credencial incorrecto.");
                    data.put("success", Boolean.FALSE);
                }
            } else {
                data.put("message", "Usuario no encontrado.");
                data.put("success", Boolean.FALSE);
            }
        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }

    @RequestMapping(value = "/dncs", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> dncs(@RequestParam String device) {
        Map<String, Object> data = new HashMap<>();
        try {
            System.out.println("query from device: " + device);
            EntityResult dev = service.get("public", "device", new Long(device));
            if (dev.getSize() > 0) {
                // save device's last login
                dev.getObjectData().put("last_login", new Date());
                service.persist(dev.getObjectData(), "public", "device");
                // device ID exist
                data.put("isdevice", Boolean.TRUE);

                // get amber if exist
                EntityResult en = service.selectQueryForName("donacion");
                if (en.getSize() > 0) {
                    data.put("data", en.getObjectData());
                    data.put("activate", Boolean.TRUE);
                    data.put("message", "Dncs se ha activado");
                } else {
                    data.put("message", message);
                    data.put("activate", Boolean.FALSE);
                    data.put("success", Boolean.TRUE);
                }
            } else {
                data.put("message", "device not found");
                data.put("activate", Boolean.FALSE);
                data.put("success", Boolean.FALSE);
                data.put("isdevice", Boolean.FALSE);
            }
        } catch (Exception e) {
            e.printStackTrace();
            data.put("message", e.getMessage());
            data.put("success", Boolean.FALSE);
        }
        return data;
    }
}
