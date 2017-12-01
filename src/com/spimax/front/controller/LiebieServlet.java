package com.spimax.front.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.spimax.back.entity.VideoType;
import com.spimax.front.data.BigleibieData;
import com.spimax.front.data.BigleibieItem;
import com.spimax.front.data.LeibieData;
import com.spimax.front.entity.Videos;
import com.spimax.front.service.FrontVideoTypeService;
import com.spimax.front.service.FrontVideosService;
import com.spimax.front.util.PageData;


@WebServlet("/LiebieServlet")
public class LiebieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    FrontVideoTypeService fts= new FrontVideoTypeService() ;
    FrontVideosService fvs = new FrontVideosService();
    public LiebieServlet() {
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
				LeibieData<Videos>  leibieData= new LeibieData<>();
				String paihang="1";
				int page =1;
			    int pageSize=10;
				if (request.getParameter("page")!=null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				if(request.getParameter("paihang")!=null) {
					paihang=request.getParameter("paihang");
				}
				int VIDEOTYPEID = Integer.parseInt(request.getParameter("VIDEOTYPEID"));
				PageData<Videos> pageData=fvs.getPageData(paihang,VIDEOTYPEID, page, pageSize);
				VideoType videoType= fts.getTypeByVIDEOID(VIDEOTYPEID);
				leibieData.setPageData(pageData);
				leibieData.setVideoType(videoType);
				backString =JSON.toJSONString(leibieData);
				
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				out.print(backString);
				System.out.println(backString);
				out.close();	
			}
			if(op.equals("initbig")) {
				String backString ="";
				BigleibieData bigleibieData= new BigleibieData();
				HashMap<Integer, BigleibieItem> biglbData = new HashMap<>();
				
				int VIDEOTYPEID=Integer.parseInt(request.getParameter("VIDEOTYPEID"));
				List<VideoType> listType= fts.getChildType(VIDEOTYPEID);
				for (VideoType videoType : listType) {
					BigleibieItem blb= new BigleibieItem();
					List<Videos> list = null;
					list=fvs.getLeibieVideoNew(videoType.getVIDEOTYPEID(), 12);
					blb.setNrData(list);
					list=fvs.getLeibieVideoHot(videoType.getVIDEOTYPEID(), 10);
					blb.setPhData(list);
					biglbData.put(videoType.getVIDEOTYPEID(), blb);
				}
				bigleibieData.setListType(listType);
				bigleibieData.setBigleibieData(biglbData);
				
				//JSON.toJSONString(bigleibieData)会导致post请求接受不到
				Gson g= new Gson();
				backString=g.toJson(bigleibieData);
				
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				System.out.println(backString);
				out.print(backString);
			
				out.close();
				
			}
			
			
			
		}
		
	}

}
