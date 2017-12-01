package com.spimax.front.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spimax.front.data.PaiHangData;
import com.spimax.front.entity.Videos;
import com.spimax.front.service.FrontVideosService;

/**
 * 排行相关的service
 * @author zhuzhen
 *
 */
@WebServlet("/PaiHangServlet")
public class PaiHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    FrontVideosService fvs = new FrontVideosService();
    Gson gson = new Gson();
    String backString ="";
    
    public PaiHangServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		PaiHangData paiHangData = new PaiHangData();
		backString = "";
		if(request.getParameter("VEDIOTYPEID")!=null) {
			System.out.print(request.getParameter("VEDIOTYPEID"));
			int VEDIOTYPEID = Integer.parseInt(request.getParameter("VEDIOTYPEID"));
			List<Videos> list= new ArrayList<>();
			list=fvs.getPaiHangVideo(VEDIOTYPEID);
			paiHangData.setPhData(list);
			backString=gson.toJson(paiHangData);
			
			
			
			/*回传jsp页面*/
			PrintWriter  out = response.getWriter();
			out.print(backString);
			System.out.println(backString);
			out.close();
		}
		
	}

}
