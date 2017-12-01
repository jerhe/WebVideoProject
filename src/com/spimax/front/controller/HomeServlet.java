package com.spimax.front.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.spimax.back.entity.Users;
import com.spimax.front.data.HomeData;
import com.spimax.front.entity.Videos;
import com.spimax.front.service.FrontVideoTypeService;
import com.spimax.front.service.FrontVideosService;

/**
 * 主页的请求
 * @author zhuzhen
 *
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    FrontVideosService fvs = new FrontVideosService();
    FrontVideoTypeService fvts=new FrontVideoTypeService();
    Gson gson = new Gson();
    public HomeServlet() {
        super();
    }

	
	protected synchronized void  doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected synchronized  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String backString ="";
		HomeData homeData = new HomeData();
		if(request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			if(op.equals("init")) {
				int VIDEOTYPEID=Integer.parseInt(request.getParameter("VEDIOTYPEID"));
				System.out.print(request.getParameter("VEDIOTYPEID"));
				//fvs.getHomeVideo(1);
				List<Videos> list= new ArrayList<>();
				list=fvs.getHomeVideoNew(VIDEOTYPEID,8);
				homeData.setNrData(list);
				list=fvs.getHomeVideoHot(VIDEOTYPEID,7);
				homeData.setPhData(list);
				
				backString=gson.toJson(homeData);
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				out.print(backString);
				System.out.println(backString);
				out.close();
				
			}
			if(op.equals("headinit")) {
				List<Videos> list= new ArrayList<>();
				list=fvs.getPaiHangVideo(0);
				list=list.subList(0, 6);
				
				backString=gson.toJson(list);
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				out.print(backString);
				System.out.println(backString);
				out.close();
				
			}
			if(op.equals("addvideo")) {
				Users user=(Users)request.getSession().getAttribute("user");
				boolean imgflag = false;
				boolean videoflag = false; 
				String  serverpath = request.getScheme() + "://" + request.getServerName()
									+ ":" + request.getLocalPort() + request.getContextPath()
									+ "/",imgvideo = "",videocoverurl = "";
				Videos newVideo = new Videos();
				newVideo.setUSERNAME(user.getUSERNAME());

				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);
				String fileType="jpg,png,bmp,gif,jpeg,webm";
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					
					while (iter.hasNext()) {
						FileItem item = iter.next();
						if (item.isFormField()) {
							String name = item.getFieldName();
							String value = item.getString("utf-8");
							if (name.equals("videotitle")) {
								newVideo.setVIDEOTITLE(value);
							} else if (name.equals("videoremark")) {
								newVideo.setVIDEOREMARK(value);
							} else if (name.equals("videotype")) {
								newVideo.setVIDEOTYPEID(fvts.getTypeIdByTypeName(value));
							}
						} else {
							String fieldName = item.getFieldName();
							String fileName = item.getName();
							String contentType = item.getContentType();
							boolean isInMemory = item.isInMemory();
							long sizeInBytes = item.getSize();
							if (fileName.equals("")) {
								imgflag = false;
								videoflag = false;
							} else { // 获取文件后缀名
								String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase().trim();
								if (fieldName.equals("videocoverurl")) {
									if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
										item.delete();
										imgflag = false;

									} else {
										//String files = videotitle + "." + extName;
										videocoverurl="/front/img/"+newVideo.getVIDEOTYPEID()+"/" +new Date().getMinutes()+"." + extName;
										String pathimg = "C:/Users/zhuzhen/git/WebVideoProject/WebContent"+videocoverurl;
										String pathimg2="D:/JAVA/tomcat/apache-tomcat-9.0.0.M26/webapps/wtpwebapps/WebVideoProject/"+videocoverurl;
										System.out.print(pathimg);
										File uploadedFile1 = new File(pathimg);
										File uploadedFile2 = new File(pathimg2);
										item.write(uploadedFile1);
										item.write(uploadedFile2);
										newVideo.setVIDEOCOVERURL(serverpath+videocoverurl);
										imgflag=true;
										
										
									}
								}
								if(fieldName.equals("videourl")) {
									if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
										item.delete();
										imgflag = false;

									} else {
										//String files = videotitle + "." + extName;
										imgvideo = "/front/video/"+newVideo.getVIDEOTYPEID()+"/" +new Date().getTime()+"." + extName;
										String pathveideo = "C:/Users/zhuzhen/git/WebVideoProject/WebContent"+imgvideo;
										String pathveideo2="D:/JAVA/tomcat/apache-tomcat-9.0.0.M26/webapps/wtpwebapps/WebVideoProject/"+imgvideo;
										System.out.print(pathveideo);
										File uploadedFile1 = new File(pathveideo);
										File uploadedFile2 = new File(pathveideo2);
										item.write(uploadedFile1);
										item.write(uploadedFile2);
										newVideo.setVIDEOURL(serverpath+imgvideo);
										videoflag=true;
										
									}
									
								}
							}

						}
					}

				} catch (FileUploadException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				//返回数据
				if(imgflag&&videoflag) {
					fvs.addVideo(newVideo);
				}
				System.out.print(newVideo);
				PrintWriter out = response.getWriter();
				System.out.println(imgflag&&videoflag);
				out.print(imgflag&&videoflag);
				out.close();
			}
		}
		
	}

}
