package com.spimax.front.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.spimax.front.data.LoginData;
import com.spimax.front.service.FrontUsersService;


@WebServlet("/FrontUserServlet")
public class FrontUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    FrontUsersService fus= new FrontUsersService();

    public FrontUserServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String path = request.getScheme() + "://" + request.getServerName()
		+ ":" + request.getLocalPort() + request.getContextPath()
		+ "/";
		
		
		if(request.getParameter("op")!=null) {
			String op = request.getParameter("op");
			if(op.equals("login")) {
				String backString = "";
				LoginData loginData= new LoginData();
				Users user = new Users();
				int flag= 0;
				if(request.getParameter("userName")!=null && !request.getParameter("userName").equals("")) {
					String userName=request.getParameter("userName");
					String userPwd= request.getParameter("userPwd");
					user=fus.getUsersByUserName(userName);
					if(user.getUSERPWD().equals(userPwd)) {
						flag=1;
						System.out.print(user.getUSERBRITH().substring(0, user.getUSERBRITH().length()-2));
						String nowdata =user.getUSERBRITH();
						user.setUSERBRITH(nowdata.substring(0, 10));
						request.getSession().setAttribute("user", user);
					}
					loginData.setFlag(flag);
					loginData.setUser(user);
					Gson gson =new Gson();
					backString = gson.toJson(loginData);
					/*回传jsp页面*/
					PrintWriter  out = response.getWriter();
					out.print(backString);
					System.out.println(backString);
					out.close();
				}
				
			}
			//注册用户
			if(op.equals("adduser")) {
				Users user  =new Users();
				
				String uname= request.getParameter("uname");
				String userpwd= request.getParameter("userpwd");
				String phone= request.getParameter("phone");
				user.setUSERNAME(uname);
				user.setUSERPWD(userpwd);
				user.setUSERTEL(phone);
				if(!fus.addUsers(user)) {
					request.getSession().setAttribute("result",0);
					response.sendRedirect("http://localhost:8080/WebVideoProject/front/user/register.jsp");
				}else {
					response.sendRedirect("http://localhost:8080/WebVideoProject/front/user/index.jsp");
				}
				
			}
			//退出
			if(op.equals("exit")) {
				request.getSession().setAttribute("user", null);
				return;
			}
			//重置密码
			if(op.equals("resetpwd")) {
				String USERPWD=request.getParameter("USERPWD");
				String USERTEL=request.getParameter("USERTEL");
				fus.upUserPwdByUserTel(USERPWD, USERTEL);
				PrintWriter out = response.getWriter();
				out.print(1);
				out.close();
				return;
			}
			if(op.equals("loginbytel")) {
				String USERTEL= request.getParameter("USERTEL");
				System.out.println("\n"+USERTEL);
				Users user= fus.getUsersByUserTel(USERTEL);
				request.getSession().setAttribute("user", user);
				PrintWriter out = response.getWriter();
				out.print(1);
				out.close();
				return;
			}
			//更新资料
			if(op.equals("upziliao")) {
				boolean flag =false;
				Users user=new Users();
				ServletContext servletContext = this.getServletConfig().getServletContext();
				DiskFileItemFactory factory = new DiskFileItemFactory();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					String videocoverurls="";
					while (iter.hasNext()) {
						FileItem item = iter.next();
						if (item.isFormField()) {
							String name = item.getFieldName();
							String value = item.getString("utf-8");
							if (name.equals("username")) {
								user.setUSERNAME(value);
							} else if (name.equals("userpwd")) {
								user.setUSERBRITH(value);
							} else if (name.equals("usertel")) {
								user.setUSERREMARK(value);
							}
						}
					}

				}catch (FileUploadException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				//返回数据
				flag=fus.upUsers(user);
				if(flag) {
					request.getSession().setAttribute("user", user);
				}
				PrintWriter out = response.getWriter();
				out.print(flag);
				out.close();
				return;
				
			}
			
			if(op.equals("upheadimg")) {
				Users user=(Users)request.getSession().getAttribute("user");
				boolean imgflag = false;
				boolean videoflag = false; 
				String  serverpath = "http://localhost:8080/WebVideoProject/",imgvideo = "",videocoverurl = "";
				int videoid = 0;
				int videotypeid = 0;

				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);
				String fileType="jpg,png,bmp,gif,jpeg";
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					String videocoverurls="";
					while (iter.hasNext()) {
						FileItem item = iter.next();
						if (!item.isFormField()) {
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
								if (fieldName.equals("videocoverurls")) {
									if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
										item.delete();
										imgflag = false;

									} else {
										imgvideo = "imgs/" +new Date().getTime()+"." + extName;
										String pathimg = "C:/Users/zhuzhen/git/WebVideoProject/WebContent/"+imgvideo;
										String pathimg2="D:/JAVA/tomcat/apache-tomcat-9.0.0.M26/webapps/wtpwebapps/WebVideoProject/"+imgvideo;
										serverpath=serverpath+imgvideo;
										File uploadedFile = new File(pathimg);
										File uploadedFile2 = new File(pathimg2);
										item.write(uploadedFile);
										item.write(uploadedFile2);
										imgflag = true;
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
				if(imgflag) {
					fus.upHeadimg(user.getUSERID(), serverpath);
					user.setHEADIMG(serverpath);
					request.getSession().setAttribute("user", user);
				}
				PrintWriter out = response.getWriter();
				System.out.println(imgflag);
				out.print(imgflag);
				out.close();
			}
			
			
		}

		
	}

}
