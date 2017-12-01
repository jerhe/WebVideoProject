package com.spimax.back.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import com.spimax.back.service.UsersService;
import com.spimax.back.util.PageData;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/UsersServlet2")
public class UsersServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsersService us = new UsersService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		PageData<Users> list = new PageData<Users>();
		// String fileType = "mp3,mp4,video,rmvb,pdf,txt,xml,doc,gif,png,bmp,jpeg";
		String fileType = "gif,png,bmp,jpeg,jpg";

		// 这里要判断做什么查询? 所有 ？模糊？ 。。。
		if (request.getParameter("op") != null) {
			// 将op的值取出来 判断这个值

			String op = request.getParameter("op");
			if (op.equals("queryAll")) {
				// 分页查询

				String table = "V_USERS";

				// 获取请求次数
				String draw = "0";
				draw = request.getParameter("draw");
				// 数据起始位置
				String start = request.getParameter("start");

				// 数据长度
				String length = request.getParameter("length");

				// 总记录数
				String recordsTotal = "0";

				// 过滤后记录数
				String recordsFiltered = "";

				// 定义列名
				String[] cols = { "", "", "USERID", "USERNAME", "USERTEL", "HEADIMG", "USERBRITH","USERREMARK" };
				// 获取客户端需要那一列排序
				String orderColumn = "0";
				orderColumn = request.getParameter("order[0][column]");

				orderColumn = cols[Integer.parseInt(orderColumn)];

				// 获取排序方式 默认为asc
				String orderDir = "asc";
				orderDir = request.getParameter("order[0][dir]");

				/*
				 * Map map = request.getParameterMap(); Iterator<String> iter =
				 * map.keySet().iterator(); while (iter.hasNext()) { String key = iter.next();
				 * System.out.println("key=" + key); String[] value = (String[]) map.get(key);
				 * System.out.print("value="); for (String v : value) { // out.print(v + "  ") ;
				 * System.out.println(v + "  "); } }
				 */

				// 获取用户过滤框里的字符
				String searchValue = request.getParameter("search[value]");

				List<String> sArray = new ArrayList<String>();
				if (!searchValue.equals("")) {
					sArray.add(" USERID like '%" + searchValue + "%'");
					sArray.add(" USERNAME like '%" + searchValue + "%'");
					sArray.add(" EMAIL like '%" + searchValue + "%'");
					sArray.add(" HEADIMG like '%" + searchValue + "%'");
					sArray.add("to_char(USERBRITH,'yyyy-MM-dd hh24:mi:ss') LIKE '%" + searchValue + "%'");

				}

				String individualSearch = "";
				if (sArray.size() == 1) {
					individualSearch = sArray.get(0);
				} else if (sArray.size() > 1) {
					for (int i = 0; i < sArray.size() - 1; i++) {
						individualSearch += sArray.get(i) + " or ";
					}
					individualSearch += sArray.get(sArray.size() - 1);
				}

				List<Users> users = new ArrayList<Users>();
				String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;

				recordsTotal = String.valueOf(us.getUsersCount());

				String searchSQL = "";
				String sql = "SELECT * FROM " + table;
				if (individualSearch != "") {
					searchSQL = " where " + individualSearch;
				}
				sql += searchSQL;
				recordsFilteredSql += searchSQL;
				sql += " order by " + orderColumn + " " + orderDir;
				recordsFilteredSql += " order by " + orderColumn + " " + orderDir;

				int realstart = 0;
				int startindex0 = (Integer.parseInt(start) + 1) / (Integer.parseInt(length));
				int startindex = (Integer.parseInt(start) + 1) % (Integer.parseInt(length));

				if (startindex > 0) {
					realstart = ++startindex0;
				} else {
					realstart = startindex0;
				}

				PageData<Users> pu = us.getAllUsersBySearch(sql, realstart, Integer.parseInt(length));

				for (Users ur : pu.getData()) {
					String dates = ur.getUSERBRITH();
					ur.setUSERBRITH(dates.substring(0, 10));

					users.add(ur);
				}

				if (searchValue != "") {

					recordsFiltered = String.valueOf(us.getUsersCountBySearch(recordsFilteredSql));

				} else {
					recordsFiltered = recordsTotal;
				}

				Map<Object, Object> info = new HashMap<Object, Object>();
				info.put("data", users); // users是一个 List<User>
				info.put("recordsTotal", recordsTotal);
				info.put("recordsFiltered", recordsFiltered);
				info.put("draw", draw);

				String json = new Gson().toJson(info);// ? 这里要注意一下 这里有一个json格式的转换

				out.print(json);

			} else if (op.equals("updateUsers")) {
				
				boolean imgflag = false;
				String userpwd = "", imgurl = "", userremark="",username = "", email = "", headimg = "", brithdate = "";
				int userid = 0;
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// Configure a repository (to ensure a secure temp location is used)
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);

				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					while (iter.hasNext()) {
						FileItem item = iter.next();

						if (item.isFormField()) {
							String name = item.getFieldName();
							String value = item.getString("utf-8");
							if (name.equals("username")) {
								username = value;
							} else if (name.equals("userid")) {
								userid = Integer.parseInt(value);
							} else if (name.equals("tel")) {
								email = value;
							} else if (name.equals("brithdate")) {
								brithdate = value;
							} else if (name.equals("imgurl")) {
								imgurl = value;
							}else if (name.equals("userremark"))
							{
								userremark=value;
							}

						} else {
							String fieldName = item.getFieldName();
							String fileName = item.getName();
							String contentType = item.getContentType();
							boolean isInMemory = item.isInMemory();
							long sizeInBytes = item.getSize();
							if (fileName.equals("")) {
								imgflag = false;

							} else { // 获取文件后缀名
								String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase().trim();
								if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
									item.delete();
									imgflag = false;
								} else {
									String files = username + "." + extName;
									headimg = "/imgs/" + files;
									String path ="D:/bsb/java/软件/eclipse/workspace/WebVideoProject/WebContent"+headimg;
									File uploadedFile = new File(path);
									item.write(uploadedFile);
								}
							}

						}
					}

				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (!imgflag) {
					headimg = imgurl;
				}
							Users users = new Users(userid, username, "", email, headimg, brithdate,userremark);
				boolean flag = us.updateUsers(users);
                
				out.print(flag);

			} else if (op.equals("insertUsers")) {
				boolean imgflag = true;
				String userpwd = "", username = "",userremark="",localpath="", email = "", headimg = "", brithdate = "";
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// Configure a repository (to ensure a secure temp location is used)
				ServletContext servletContext = this.getServletConfig().getServletContext();
				File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);

				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request
				try {
					List<FileItem> items = upload.parseRequest(request);
					Iterator<FileItem> iter = items.iterator();
					while (iter.hasNext()) {
						FileItem item = iter.next();

						if (item.isFormField()) {
							String name = item.getFieldName();
							String value = item.getString("utf-8");
							if (name.equals("usernameadd")) {
								username = value;
							} else if (name.equals("userpasswordadd")) {
								userpwd = value;
							} else if (name.equals("tel")) {
								email = value;
							} else if (name.equals("date")) {
								brithdate = value;
							}else if (name.equals("userremark"))
							{
								userremark=value;
							}else if(name.equals("path")) {
								localpath=value;
								
							}

						} else {
							String fieldName = item.getFieldName();
							String fileName = item.getName();
							String contentType = item.getContentType();
							boolean isInMemory = item.isInMemory();
							long sizeInBytes = item.getSize();
							if (fileName.equals("")) {
								imgflag = false;

							} else { // 获取文件后缀名
								String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase().trim();
							
								if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
									item.delete();
									imgflag = false;
								} else {
									String files = username + "." + extName;

									headimg = "/imgs/" + files;
								
									String path ="C:/Users/zhuzhen/git/WebVideoProject/WebContent"+headimg;
									
									headimg=localpath+headimg;
								
									File uploadedFile = new File(path);
									item.write(uploadedFile);
								}
							}

						}
					}

				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (!imgflag) {
					headimg = "无";
				}
				Users users = new Users(0, username, userpwd, email, headimg, brithdate,userremark);
				boolean flag = us.insertUsers(users);
              
				out.print(flag);
			} else if (op.equals("delUsers")) {
				int userid = Integer.parseInt(request.getParameter("userid"));
				boolean flag = us.delectUsers(userid);

				out.print(flag);
			} else if (op.equals("delSomeUsers")) {
				if (request.getParameter("userid") != null && request.getParameter("userid") != "") {
					String[] idsd = request.getParameter("userid").split(",");
					boolean flag = false;
					for (int i = 0; i < idsd.length; i++) {
						flag = us.delectUsers(Integer.parseInt(idsd[i]));
					}
					out.print(flag);
				}
			}
			else if(op.equals("ChangeUsers"))
			{
				if (request.getParameter("userid") != null && request.getParameter("userid") != "") {
					
					boolean	flag = us.updateUsersPwd(Integer.parseInt(request.getParameter("userid")));
					
					out.print(flag);
				}
			}
		}
	}

}
