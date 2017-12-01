package com.spimax.back.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spimax.back.entity.Admins;
@WebFilter(urlPatterns= {"/back/Admin.jsp","/back/AminMange.jsp","/back/index.jsp","/back/Users2.jsp","/back/Videos.jsp","/back/VideosPublish.jsp","/Users2Servlet","/VideosServlet","/VideoTypeServlet"})
public class FileCharater implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		      // TODO Auto-generated method stub
		      response.setCharacterEncoding("utf-8");
              request.setCharacterEncoding("utf-8");
            HttpServletRequest req = (HttpServletRequest) request;  
              HttpServletResponse resp = (HttpServletResponse) response;  
              String path = req.getContextPath();  
              String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path;  
              HttpSession session = req.getSession(true);  
              Admins ad =  (Admins)session.getAttribute("admins");  
            
              if (ad == null) {  
                    
                   
                  resp.sendRedirect(basePath+"/back/login.jsp");  
              } else {  
                  chain.doFilter(req,resp); 
              }  
              
              
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
