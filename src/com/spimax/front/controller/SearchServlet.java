package com.spimax.front.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.spimax.back.entity.VideoType;
import com.spimax.front.data.LeibieData;
import com.spimax.front.entity.Videos;
import com.spimax.front.service.FrontVideoTypeService;
import com.spimax.front.service.FrontVideosService;
import com.spimax.front.util.PageData;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FrontVideoTypeService fts= new FrontVideoTypeService() ;
    FrontVideosService fvs = new FrontVideosService(); 
    public SearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		if (request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			if(op.equals("init")) {
				String backString ="";
				String VIDEOTITLE = request.getParameter("VIDEOTITLE");
				int page =1;
			    int pageSize=10;
				if (request.getParameter("page")!=null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				PageData<Videos> pageData=fvs.getPageData(VIDEOTITLE,page, pageSize);
				Gson gson = new Gson();
				/*»Ø´«jspÒ³Ãæ*/
				backString =gson.toJson(pageData);
				PrintWriter  out = response.getWriter();
				if(!pageData.getData().isEmpty()) {
					out.print(backString);
				}else {
					out.print(-1);
				}
				System.out.println(backString);
				out.close();
					
			}
		}
		
	}

}
