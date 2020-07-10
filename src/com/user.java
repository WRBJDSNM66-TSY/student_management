package com;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class user implements Filter {
	  
protected FilterConfig config;
protected String ROLE;
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		String role=request.getParameter("role");
	
        RequestDispatcher dispatcher=request.getRequestDispatcher("admin.jsp");
        if (role==null) {
			dispatcher.forward(request, response);
			return;
		}
        try {
            if (role.equals(ROLE)) {
			   dispatcher.forward(request, response);
			   return;
		}	
        }catch (NumberFormatException e) {
			dispatcher.forward(request, response);
			return;
		}
		
        chain.doFilter(request, response);
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {	
		  this.config=filterConfig;
		  ROLE = config.getInitParameter("ROLE");
		}

}
	

	