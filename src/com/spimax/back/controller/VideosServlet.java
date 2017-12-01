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

import javax.servlet.ServletConfig;
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
import com.spimax.back.dao.VideoTypeDao;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.service.UsersService;
import com.spimax.back.service.VideosService;
import com.spimax.back.service.VideosTypeService;
import com.spimax.back.util.PageData;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/VideosServlet")
public class VideosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VideosService us = new VideosService();
	VideosTypeService vtd = new VideosTypeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideosServlet() {
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
		String videotype = "mp4";
		// 这里要判断做什么查询? 所有 ？模糊？ 。。。
		if (request.getParameter("op") != null) {
			// 将op的值取出来 判断这个值

			String op = request.getParameter("op");
			if (op.equals("queryAll")) {
				// 分页查询

				String table = "V_VIDEOS";

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

				// 定义列名 {"data": "VIDEOID"},
				// {"data": "USERNAME"},{"data": "videoType:'VIDEOTYPENAME'"},
				// {"data": "VIDEOTITLE"},
				// {"data": "VIDEOURL"},
				// {"data": "VIDEOCOVERURL"},
				// {"data": "VIDEOTIME"},
				String[] cols = { "", "", "VIDEOID", "USERNAME", "VIDEOTYPENAME", "VIDEOTITLE", "VIDEOURL",
						"VIDEOCOVERURL", "VIDEOREMARK", "VIDEOTIME" };
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

				// 模糊查询 {"data": "VIDEOID"},
				// {"data": "USERNAME"},{"data": "videoType:'VIDEOTYPENAME'"},
				// {"data": "VIDEOTITLE"},
				// {"data": "VIDEOURL"},
				// {"data": "VIDEOCOVERURL"},
				// {"data": "VIDEOTIME"},
				List<String> sArray = new ArrayList<String>();
				if (!searchValue.equals("")) {
					List<Integer> listint = vtd.getTypeId(searchValue);

					sArray.add(" VIDEOID like '%" + searchValue + "%'");
					sArray.add(" USERNAME like '%" + searchValue + "%'");
					sArray.add(" VIDEOTITLE like '%" + searchValue + "%'");
					if (listint != null)
						for (int typeid : listint) {
							sArray.add("videotypeid=" + typeid);

						}
					sArray.add(" VIDEOURL like '%" + searchValue + "%'");
					sArray.add(" VIDEOCOVERURL like '%" + searchValue + "%'");
					sArray.add(" VIDEOREMARK like '%" + searchValue + "%'");
					sArray.add("to_char(VIDEOTIME,'yyyy-MM-dd hh24:mi:ss') LIKE '%" + searchValue + "%'");

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

				List<Videos> videos = new ArrayList<Videos>();
				String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;

				recordsTotal = String.valueOf(us.getVideosCount());

				String searchSQL = "";
				String sql = "SELECT * FROM " + table;
				if (individualSearch != "") {
					searchSQL = " where " + individualSearch + "and videoflag=1";
				}
				else
				searchSQL = " where videoflag=1";
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

				PageData<Videos> pu = us.getAllVideosBySearch(sql, realstart, Integer.parseInt(length));

				for (Videos ur : pu.getData()) {
					String dates = ur.getVIDEOTIME();
					ur.setVIDEOTIME(dates.substring(0, 10));
					List<VideoType> listvt = vtd.getAllVideosTypeList(ur.getVIDEOTYPEID());
					for (VideoType vtype : listvt) {

						ur.setVideoType(vtype);

					}
					videos.add(ur);

				}

				if (searchValue != "") {

					recordsFiltered = String.valueOf(us.getVideosCountBySearch(recordsFilteredSql));

				} else {
					recordsFiltered = recordsTotal;
				}

				Map<Object, Object> info = new HashMap<Object, Object>();
				info.put("data", videos); // users是一个 List<User>
				info.put("recordsTotal", recordsTotal);
				info.put("recordsFiltered", recordsFiltered);
				info.put("draw", draw);

				String json = new Gson().toJson(info);// ? 这里要注意一下 这里有一个json格式的转换

				out.print(json);

			} else if (op.equals("updateVideos")) {
			
				/*
				 * $("#videoid").val(videoid).attr("readonly",true);
				 * $("#username").val(username); $("#typename").val(typename);
				 * $("#videotitle").val(videotitle); $("#videourl").val(videourl);
				 * $("#videocoverurl").val(videocoverurl); $("#videotime").val(videotime);
				 */
				boolean imgflag = false;
				boolean videoflag = false;
				String username = "", serverpath = "", typename = "", imgvideo = "", videoremark = "", videotitle = "",
						videourl = "", videotypename = "", videocoverurl = "", videotime = "";
				int videoid = 0;
				int videotypeid = 0;
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
							} else if (name.equals("videoid")) {
								videoid = Integer.parseInt(value);
							} else if (name.equals("videotitle")) {
								videotitle = value;
							} else if (name.equals("videourl")) {
								videourl = value;
							
							} else if (name.equals("videocoverurl")) {
								videocoverurl = value;
								
							} else if (name.equals("videotime")) {
								videotime = value;

							} else if (name.equals("videoremark")) {
								videoremark = value;
						
							} else if (name.equals("videotype")) {
								videotypename = value;
								List<Integer> vtypeid = vtd.getTypeOneId(videotypename);

								for (Integer integer : vtypeid) {
									videotypeid = integer;
								}
							} else if (name.equals("path")) {
								serverpath = value;
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
								if (fieldName.equals("videocoverurls")) {
									if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
										item.delete();
										imgflag = false;

									} else {
										String files = videotitle + "." + extName;
										imgvideo = "/front/img/" + videotypeid + "/" + files;

										String path = "C:/Users/zhuzhen/git/WebVideoProject/WebContent"
												+ imgvideo;
										File uploadedFile = new File(path);
										imgvideo = serverpath + imgvideo;
										item.write(uploadedFile);
									}
								} else if (fieldName.equals("videourls")) {
									if (!Arrays.<String>asList(videotype.split(",")).contains(extName)) {
										item.delete();
										videoflag = false;
									} else {
										String videospath = "/front/video/" + videotypeid + "/" + fileName;
										videocoverurl = "C:/Users/zhuzhen/git/WebVideoProject/WebContent"
												+ videospath;
										File uploadedFile = new File(videocoverurl);

										videourl = serverpath + videospath;
										;
										item.write(uploadedFile);
									}
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
					imgvideo = videocoverurl;
				}


				Videos vs = new Videos(videoid, videotypeid, 0, username, videotitle, videotime, imgvideo, videourl, 1,
						videoremark);
				// Users users = new Users(userid, username, "", email, videocoverurl,
				// brithdate);
				boolean flag = us.updateVideos(vs);

				out.print(flag);

			} else if (op.equals("insertVideos")) {
				boolean imgflag = true;
				boolean videoflag = true;
				String username = "", typename = "", serverpath = "", imgvideo = "", videoremark = "", videotitle = "",
						videourl = "", videotypename = "", videocoverurl = "", videotime = "";
				int videoid = 0;
				int videotypeid = 0;
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
							} else if (name.equals("videoid")) {
								videoid = Integer.parseInt(value);
							} else if (name.equals("videotitle")) {
								videotitle = value;
							} else if (name.equals("videourl")) {
								videourl = value;
								
							} else if (name.equals("videocoverurl")) {
								videocoverurl = value;
								
							} else if (name.equals("videotime")) {
								videotime = value;

							} else if (name.equals("pathadd")) {
								serverpath = value;
							} else if (name.equals("videoremark")) {
								videoremark = value;
								
							} else if (name.equals("videotypeadd")) {
								videotypename = value;
								List<Integer> vtypeid = vtd.getTypeOneId(videotypename);

								for (Integer integer : vtypeid) {
									videotypeid = integer;
								}
								
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
								if (fieldName.equals("videocoverurlsadd")) {
									if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
										item.delete();
										imgflag = false;

									} else {
										String files = videotitle + "." + extName;
										imgvideo = "/front/imgs/" + videotypeid + "/" + files;

										String path = "D:/bsb/java/软件/eclipse/workspace/WebVideoProject/WebContent"
												+ imgvideo;
										File uploadedFile = new File(path);
										imgvideo = serverpath + imgvideo;
									
										item.write(uploadedFile);
									}
								} else if (fieldName.equals("videourladd")) {
									if (!Arrays.<String>asList(videotype.split(",")).contains(extName)) {
										item.delete();
										videoflag = false;
									} else {
										String videospath = "/front/videos/" + videotypeid + "/" + fileName;
										videocoverurl = "D:/bsb/java/软件/eclipse/workspace/WebVideoProject/WebContent"
												+ videospath;
										File uploadedFile = new File(videocoverurl);
										videourl = serverpath + videospath;
										item.write(uploadedFile);
									}
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
					imgvideo = videocoverurl;
				}

				

				Videos vs = new Videos(videoid, videotypeid, 0, "admin", videotitle, videotime, imgvideo, videourl, 0,
						videoremark);
				// Users users = new Users(userid, username, "", email, videocoverurl,
				// brithdate);
				boolean flag = us.insertVideos(vs);

				out.print(flag);
			} else if (op.equals("delVideos")) {
				int userid = Integer.parseInt(request.getParameter("userid"));
				boolean flag = us.delectVideos(userid);
                 System.out.println(userid);
				out.print(flag);
			} else if (op.equals("delSomeVideos")) {
				if (request.getParameter("userid") != null && request.getParameter("userid") != "") {
					String[] idsd = request.getParameter("userid").split(",");
					boolean flag = false;
					for (int i = 0; i < idsd.length; i++) {
						flag = us.delectVideos(Integer.parseInt(idsd[i]));
					}
					out.print(flag);
				}
			} else if (op.equals("Ispass")) {
				boolean flag = false;
				String flag1 = request.getParameter("flag");
				int videoid = Integer.parseInt(request.getParameter("videoid"));
				if (flag1.equals("true")) {
					flag = us.updatVideoPass(1, videoid);
					
				}
				else
				{
					flag = us.updatVideoPass(2, videoid);
				}
				out.print(flag);
			}else if (op.equals("queryAllpub")) {
				// 分页查询

				String table = "V_VIDEOS";

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

				// 定义列名 {"data": "VIDEOID"},
				// {"data": "USERNAME"},{"data": "videoType:'VIDEOTYPENAME'"},
				// {"data": "VIDEOTITLE"},
				// {"data": "VIDEOURL"},
				// {"data": "VIDEOCOVERURL"},
				// {"data": "VIDEOTIME"},
				String[] cols = { "", "", "VIDEOID", "USERNAME", "VIDEOTYPENAME", "VIDEOTITLE", "VIDEOURL",
						"VIDEOCOVERURL", "VIDEOREMARK", "VIDEOTIME" };
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

				// 模糊查询 {"data": "VIDEOID"},
				// {"data": "USERNAME"},{"data": "videoType:'VIDEOTYPENAME'"},
				// {"data": "VIDEOTITLE"},
				// {"data": "VIDEOURL"},
				// {"data": "VIDEOCOVERURL"},
				// {"data": "VIDEOTIME"},
				List<String> sArray = new ArrayList<String>();
				if (!searchValue.equals("")) {
					List<Integer> listint = vtd.getTypeId(searchValue);

					sArray.add(" VIDEOID like '%" + searchValue + "%'");
					sArray.add(" USERNAME like '%" + searchValue + "%'");
					sArray.add(" VIDEOTITLE like '%" + searchValue + "%'");
					if (listint != null)
						for (int typeid : listint) {
							sArray.add("videotypeid=" + typeid);

						}
					sArray.add(" VIDEOURL like '%" + searchValue + "%'");
					sArray.add(" VIDEOCOVERURL like '%" + searchValue + "%'");
					sArray.add(" VIDEOREMARK like '%" + searchValue + "%'");
					sArray.add("to_char(VIDEOTIME,'yyyy-MM-dd hh24:mi:ss') LIKE '%" + searchValue + "%'");

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

				List<Videos> videos = new ArrayList<Videos>();
				String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;

				recordsTotal = String.valueOf(us.getVideosCount());

				String searchSQL = "";
				String sql = "SELECT * FROM " + table;
				if (individualSearch != "") {
					searchSQL = " where " + individualSearch + "and videoflag=0";
				}
				else
				{
					searchSQL = " where videoflag=0";
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

				PageData<Videos> pu = us.getAllVideosBySearch(sql, realstart, Integer.parseInt(length));

				for (Videos ur : pu.getData()) {
					String dates = ur.getVIDEOTIME();
					ur.setVIDEOTIME(dates.substring(0, 10));
					List<VideoType> listvt = vtd.getAllVideosTypeList(ur.getVIDEOTYPEID());
					for (VideoType vtype : listvt) {

						ur.setVideoType(vtype);

					}
					videos.add(ur);

				}

				if (searchValue != "") {

					recordsFiltered = String.valueOf(us.getVideosCountBySearch(recordsFilteredSql));

				} else {
					recordsFiltered = recordsTotal;
				}

				Map<Object, Object> info = new HashMap<Object, Object>();
				info.put("data", videos); // users是一个 List<User>
				info.put("recordsTotal", recordsTotal);
				info.put("recordsFiltered", recordsFiltered);
				info.put("draw", draw);

				String json = new Gson().toJson(info);// ? 这里要注意一下 这里有一个json格式的转换

				out.print(json);

			}
		}
	}

}
