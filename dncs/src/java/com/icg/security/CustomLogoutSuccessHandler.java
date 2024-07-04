package com.icg.security;

import com.icg.services.IEntityServices;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

/**
 * CustomLogoutSuccessHandler
 *
 * @author John Castillo Valencia email: john.gnu@gmail.com
 * @since 01-03-2011
 */
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {

    @Autowired
    IEntityServices service;

    public CustomLogoutSuccessHandler() {
        super();
    }

    @Override
    public void onLogoutSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        if (authentication != null) {
            System.out.println(authentication.getName());
        }

        String URL = request.getContextPath() + "/";
        response.setStatus(HttpStatus.OK.value());
        response.sendRedirect(URL);
    }

}
