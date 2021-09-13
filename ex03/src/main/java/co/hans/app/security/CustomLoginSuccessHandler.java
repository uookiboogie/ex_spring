package co.hans.app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component("customLogin")
@Log
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
          log.info("==========");
          log.info("login handler 실행");
          
          List<String> roleNames = new ArrayList<String>();
          authentication.getAuthorities().forEach(authority->{roleNames.add(authority.getAuthority());}); //role을 string으로 ~
          
          String path = request.getContextPath();
          
          if(roleNames.contains("ROLE_ADMIN")) {
        	  response.sendRedirect(path+"/admin/admin.jsp"); //절대경로
          }else if(roleNames.contains("ROLE_USER")) {
          	  response.sendRedirect("user/user.jsp");         //상대경로
          }else {
        	  response.sendRedirect("/top.jsp");
          }
	}

}
