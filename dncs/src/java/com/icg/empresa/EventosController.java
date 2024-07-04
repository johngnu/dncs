package com.icg.empresa;

import com.icg.entityclassutils.EntityResult;
import com.icg.services.IEntityServices;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/empresa")
public class EventosController {

    private static final Logger logger = LoggerFactory.getLogger(EventosController.class);
    @Autowired
    private IEntityServices service;
    // root file repository
    private String serverPathSufix = "/appsdata/eventos/files/";

    @RequestMapping(value = "/eventos", method = RequestMethod.GET)
    public String eventos(Model model) {
        try {
            // eventos
            EntityResult er = service.find("public", "evento");
            model.addAttribute("eventos", er.getListData());

            return "empresa/eventos/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardarevento", method = RequestMethod.POST)
    public String guardarEvento(Model model, HttpServletRequest request) {
        try {
            // create evento
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "evento", request);
            in.put("registro", new Date());

            Object id = service.persist(in, "public", "evento").getPrimaryKey();

            return "redirect:evento?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/actualizarevento", method = RequestMethod.POST)
    public String actualizarEvento(Model model,
            @RequestParam Long id,
            @RequestParam String fecha,
            @RequestParam(required = false) String observacion,
            @RequestParam(required = false) String responsable,
            HttpServletRequest request) {
        try {
            // get evento data
            Map<String, Object> en = service.get("public", "evento", id).getObjectData();
            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "evento", request);

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

            service.persist(en, "public", "evento");

            return "redirect:evento?id=" + id;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/evento", method = RequestMethod.GET)
    public String evento(Model model,
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Boolean edit) {
        try {
            // get guia
            if (id != null) {
                // get guide data
                Map<String, Object> en = service.get("public", "evento", id).getObjectData();
                if (en != null) {
                    model.addAttribute("evento", en);

                    if (edit != null) {
                        if (edit) {
                            return "empresa/eventos/guia_edit";
                        }
                    }

                    return "empresa/eventos/guia";
                } else {
                    return "redirect:eventos";
                }
            } else {
                // guia extras
                // data required
                // clientes
                //EntityResult er = service.find("crm", "cliente", new String[]{"nombre"});
                //model.addAttribute("clientes", er.getListData());

                //EntityResult gm = service.selectQueryForName("guia_max");
                //Integer max = (Integer) gm.getObjectData().get("maximo");
                //if (max != null) {
                //    model.addAttribute("max", max + 1);
                //}
                return "empresa/eventos/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/agregarproducto", method = RequestMethod.POST)
    public String agregarProducto(Model model,
            HttpServletRequest request,
            @RequestParam Long gid,
            @RequestParam Long pid,
            @RequestParam Double cantidad,
            @RequestParam Integer lote) {
        try {
            // guia 
            Map<String, Object> gd = service.get("bacheo", "guia", gid).getObjectData();

            // product
            Map<String, Object> p = service.get("bacheo", "producto", pid).getObjectData();
            Double precio = new Double(p.get("precio").toString());

            Map<String, Object> item = new HashMap<>();
            item.put("pedido", gd.get("pedido"));
            item.put("producto", pid);
            item.put("cantidad", cantidad);
            item.put("lote", lote);
            item.put("precio_original", precio);
            item.put("precio_final", precio);
            // set stock id by lote number
            Long stockId = this.stockByLote(lote, pid);
            if (stockId != null) {
                item.put("stock", stockId);
            }
            service.persist(item, "bacheo", "pedido_detalle");

            return "redirect:guia?id=" + gid;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    private Long stockByLote(Integer lote, Long product) throws ParseException {
        Map<String, Object> params = new HashMap<>();
        params.put("lote", lote);
        params.put("product", product);
        Map<String, Object> in = service.selectQueryForName("getstock_by_lote", params).getObjectData();
        if (in != null) {
            return new Long(in.get("stock_id").toString());
        }
        return null;
    }

    @RequestMapping(value = "/selectimage", method = RequestMethod.POST)
    public String selectImage(Model model,
            @RequestParam int x,
            @RequestParam int y,
            @RequestParam int x2,
            @RequestParam int y2,
            @RequestParam int w,
            @RequestParam int h,
            @RequestParam int bx,
            @RequestParam int by) {
        try {
            // delete temporal image
            // this.restore.setBaos(null);
            // Get the buffered image reference
            System.out.println("x:" + x + " y:" + y + " x2:" + x2 + "y2:" + y2 + " w:" + w + " h:" + h);

            // convert byte array back to BufferedImage
            /*InputStream in = new ByteArrayInputStream(this.restore.getBaos().toByteArray());
            BufferedImage image = ImageIO.read(in);
            System.out.println("widht:" + image.getWidth() + " height:" + image.getHeight());

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            //Get the sub image
            BufferedImage out = image.getSubimage((x * image.getWidth()) / bx, (y * image.getHeight()) / by, (w * image.getWidth()) / bx, (h * image.getHeight()) / by);
            ImageIO.write(out, "png", baos);

            this.restore.setSelected(baos);*/
            return "redirect:photoupload";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/eliminarcontenido", method = RequestMethod.GET)
    public String eliminarContenido(Model model, @RequestParam Long pid, @RequestParam Long gid) {
        try {
            // delete detail
            service.delete("bacheo", "pedido_detalle", pid);

            // redirect to guia
            return "redirect:guia?id=" + gid;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return null;
    }

    @RequestMapping(value = "/normativas", method = RequestMethod.GET)
    public String normativas(Model model) {
        try {
            // normativas
            EntityResult er = service.find("public", "norma");
            model.addAttribute("eventos", er.getListData());

            return "empresa/normativas/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return null;
    }

    @RequestMapping(value = "/openfile", method = RequestMethod.GET)
    public ResponseEntity<byte[]> openFile(@RequestParam Long id) {
        try {
            // get file
            Map<String, Object> file = service.get("files", "filedata", id).getObjectData();
            String path = file.get("serverpath").toString() + file.get("serverfilename").toString();

            InputStream in = new FileInputStream(path);

            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.valueOf(file.get("contenttype").toString()));
            //headers.set("Content-Disposition", "attachment; filename=\"" + file.get("originalfilename") + "\"");

            return new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/normativa", method = RequestMethod.GET)
    public String normativa(Model model,
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Boolean edit) {
        try {
            // get normativa
            if (id != null) {
                // get normativa data
                Map<String, Object> en = service.get("public", "norma", id).getObjectData();
                if (en != null) {
                    model.addAttribute("norma", en);

                    if (edit != null) {
                        if (edit) {
                            return "empresa/normativas/guia_edit";
                        }
                    }

                    return "empresa/normativas/normativa";
                } else {
                    return "redirect:normativas";
                }
            } else {

                return "empresa/normativas/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/usuarios", method = RequestMethod.GET)
    public String usuarios(Model model) {
        try {
            // usuarios
            EntityResult er = service.find("security", "usuario");
            model.addAttribute("users", er.getListData());

            return "empresa/usuarios/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return null;
    }

    @RequestMapping(value = "/guardarusuario", method = RequestMethod.POST)
    public String guardarUsuario(Model model,
            @RequestParam String usuario,
            @RequestParam String clave,
            @RequestParam String rol,
            HttpServletRequest request) {
        try {
            // create user
            if (rol.equals("voluntario")) {
                Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "voluntario", request);
                in.put("registro", new Date());
                Object id = service.persist(in, "public", "voluntario").getPrimaryKey();
                createUser(id, usuario, clave);
            }

            return "redirect:usuarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    public void createUser(Object id, String usuario, String clave) throws NoSuchAlgorithmException {
        Map<String, Object> in = service.get("public", "voluntario", id).getObjectData();
        Map<String, Object> u = new HashMap<>();
        u.put("activo", Boolean.TRUE);
        u.put("nombre", in.get("nombre"));
        u.put("apellido", in.get("apellido"));
        u.put("email", in.get("email"));
        u.put("rol", "voluntario");
        u.put("cargo", "sistema");
        u.put("usuario", usuario);
        u.put("principal", in.get("voluntario_id"));
        u.put("clave", hashMD5Password(clave));
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

    @RequestMapping(value = "/usuario", method = RequestMethod.GET)
    public String usuario(Model model,
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Boolean edit) {
        try {
            // get normativa
            if (id != null) {
                // get normativa data
                Map<String, Object> en = service.get("security", "usuario", id).getObjectData();
                if (en != null) {
                    model.addAttribute("user", en);

                    if (edit != null) {
                        if (edit) {
                            return "empresa/normativas/guia_edit";
                        }
                    }

                    return "empresa/usuarios/usuario";
                } else {
                    return "redirect:usuarios";
                }
            } else {

                return "empresa/usuarios/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/educativos", method = RequestMethod.GET)
    public String educativos(Model model) {
        try {
            // educativos
            EntityResult er = service.find("public", "recursoseducativos");
            model.addAttribute("items", er.getListData());

            return "empresa/educativos/index";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return null;
    }

    @RequestMapping(value = "/educativo", method = RequestMethod.GET)
    public String educativo(Model model,
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) Boolean edit) {
        try {
            // get normativa
            if (id != null) {
                // get normativa data
                Map<String, Object> en = service.get("public", "recursoseducativos", id).getObjectData();
                if (en != null) {
                    model.addAttribute("item", en);

                    if (edit != null) {
                        if (edit) {
                            return "empresa/educativos/guia_edit";
                        }
                    }

                    return "empresa/educativos/educativo";
                } else {
                    return "redirect:educativos";
                }
            } else {

                return "empresa/educativos/registro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/guardareducativo", method = RequestMethod.POST)
    public String guardarEducativo(Model model, HttpServletRequest request) {
        try {

            Map<String, Object> in = service.buildPersistenObjectFromRequest("public", "recursoseducativos", request);
            in.put("registro", new Date());
            in.put("tipo", "video");

            Object id = service.persist(in, "public", "recursoseducativos").getPrimaryKey();
            //return "redirect:educativo?id=" + id;
            return "redirect:educativos";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }

    @RequestMapping(value = "/actualizarusuario", method = RequestMethod.POST)
    public String actualizarUsuario(Model model, Long id, String clave, HttpServletRequest request) {
        try {
            // create user
            Map<String, Object> in = service.get("security", "usuario", id).getObjectData();
            in.put("clave", hashMD5Password(clave));

            service.persist(in, "security", "usuario").getPrimaryKey();

            return "redirect:usuarios";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "errorPage";
    }
}
