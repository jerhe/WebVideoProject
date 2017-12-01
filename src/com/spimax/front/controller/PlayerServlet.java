package com.spimax.front.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.front.data.DanmuItem;
import com.spimax.front.data.PlayerData;
import com.spimax.front.entity.Comment;
import com.spimax.front.entity.Danmu;
import com.spimax.front.entity.Videos;
import com.spimax.front.service.FrontCommentService;
import com.spimax.front.service.FrontDanmuService;
import com.spimax.front.service.FrontUsersService;
import com.spimax.front.service.FrontVideoTypeService;
import com.spimax.front.service.FrontVideosService;

/**
 * 视频详细页面需要传递videoid
 * @author zhuzhen
 *
 */
@WebServlet("/PlayerServlet")
public class PlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 FrontVideosService fvs = new FrontVideosService();
	 FrontUsersService fus = new FrontUsersService();
	 FrontDanmuService fds = new FrontDanmuService();
	 FrontCommentService fcs= new FrontCommentService();
	 FrontVideoTypeService fvts = new FrontVideoTypeService();
	 
	 Gson gson = new Gson();
	 String backString ="";
    
    public PlayerServlet() {
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PlayerData playerData = new PlayerData();
		backString="";
		if(request.getParameter("VIDEOID")!=null && request.getParameter("plcontent")!=null) {
			String plcontent= request.getParameter("plcontent");
			Users user= (Users)request.getSession().getAttribute("user");
			if (user !=null) {
				Comment comment = new Comment();
				comment.setUSERNAME(user.getUSERNAME());
				comment.setCOMMENTCONTENT(plcontent);
				comment.setVIDEOID(request.getParameter("VIDEOID"));
				fcs.addComment(comment);
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				out.print(1);
				out.close();
				return;
			}
			/*回传jsp页面*/
			PrintWriter  out = response.getWriter();
			out.print(0);
			out.close();
			return;
			
		}
		if(request.getParameter("VIDEOID")!=null && request.getParameter("danmu")!=null) {
			if(request.getSession().getAttribute("user")==null) {
				return;
			}
			String VIDEOID= request.getParameter("VIDEOID");
			String danmu= request.getParameter("danmu");
			DanmuItem danmuItem = JSON.parseObject(danmu, DanmuItem.class);
			System.out.println(danmuItem);
			Danmu newDanmu = new Danmu(danmuItem.getText(), danmuItem.getTime(),Integer.parseInt(VIDEOID), danmuItem.getSize(), danmuItem.getPosition(), danmuItem.getColor());
		
			if (fds.addDanmu(newDanmu)) {
				System.out.println("弹幕添加成功");
			}else{
				System.out.println("弹幕添加失败");
			}
			return;
		}
		//填充PlayerData
		if (request.getParameter("VIDEOID")!=null) {
			int VIDEOID = Integer.parseInt(request.getParameter("VIDEOID"));
			System.out.print(VIDEOID);
			Videos v = fvs.getVideosById(VIDEOID);
			Users u = fus.getUsersByUserName(v.getUSERNAME());
			List<Danmu> danmuList=fds.getDanmuByVIDEOID(VIDEOID);
			List<DanmuItem> danmuData= new ArrayList<DanmuItem>();
			if(danmuList!=null) {
				for (Danmu danmu : danmuList) {
					DanmuItem di =new DanmuItem(danmu.getDANMUCONTENT(), danmu.getDMCOLOR(), danmu.getDMSIZE(), danmu.getDMPOSITION(), danmu.getDANMUTIME());
					danmuData.add(di);
				}
			}
			List<Comment> commitsList=fcs.getCommentByVIDEOID(VIDEOID);
			HashMap<Integer,Users> listUser= new HashMap<>();
			if(commitsList!=null) {
				for (int i = 0; i < commitsList.size(); i++) {
					Comment comment = commitsList.get(i);
					listUser.put(i, fus.getUsersByUserName(comment.getUSERNAME()) );
				}
			}
			
			VideoType vt= fvts.getTypeByVIDEOID(v.getVIDEOTYPEID());
			playerData.setVideo(v);
			playerData.setUser(u);
			playerData.setDanmuData(danmuData);
			playerData.setCommitsList(commitsList);
			playerData.setListUser(listUser);
			playerData.setVideoType(vt);
			backString=gson.toJson(playerData);
			FrontVideosService fvs = new FrontVideosService();
			fvs.addPlayercount(VIDEOID);
			
			/*回传jsp页面*/
			PrintWriter  out = response.getWriter();
			out.print(backString);
			System.out.println(backString);
			out.close();
		}
		
		
		
		
		
	}
	
	
}
