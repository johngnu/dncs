package com.icg.account;

import com.icg.services.IEntityServices;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * ApiController
 *
 * @since 10-11-2018
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
@RestController
@RequestMapping(value = "/api")
public class ApiController {

    private static String VERSION = "1.0";
    private static String DOC_URL = "https://...";
    private static String SUPPORT = "john.gnu@gmail.com";
    private static String APP_CURRENT = "1";

    private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
    @Autowired
    private IEntityServices service;
    @Autowired
    ServletContext servletContext;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public Map<String, ? extends Object> index() {
        Map<String, Object> data = new HashMap<>();
        try {
            data.put("success", Boolean.TRUE);
            data.put("support", SUPPORT);
            data.put("version", VERSION);
            data.put("app", APP_CURRENT);
            data.put("documentation", DOC_URL);
        } catch (Exception e) {
            logger.error("Error al obtener | ejecutar: " + e.getMessage());
            data.put("success", Boolean.FALSE);
            data.put("errorMessage", e.getMessage());
        }
        return data;
    }

}
