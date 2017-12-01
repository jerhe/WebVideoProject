package com.spimax.back.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.spimax.back.entity.VideoType;
import com.spimax.back.service.VideosTypeService;
import com.spimax.back.util.PageData;

/**
 * Servlet implementation class VideoTypeServlet
 */
@WebServlet("/VideoTypeServlet")
public class VideoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    VideosTypeService vts=new VideosTypeService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoTypeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		//图片的格式
		String fileType = "gif,png,bmp,jpeg,jpg";
		if (request.getParameter("op") != null) {
			// 将op的值取出来 判断这个值

			String op = request.getParameter("op");
			if (op.equals("queryAll")) {
				List<VideoType> list =vts.getAllVideos();
				String json = new Gson().toJson(list);// ? 这里要注意一下 这里有一个json格式的转换
				response.setContentType("application/json");
			
				out.print(json);
				
				
			}else 	if (op.equals("querytypeAll")) {
				// 分页查询

				String table = "V_VIDEOTYPE";

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
				String[] cols = { "", "", "VIDEOTYPEID", "VIDEOTYPENAME", "VIDEOTYPEJPARENT" };
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
					sArray.add(" VIDEOTYPEID like '%" + searchValue + "%'");
					sArray.add(" VIDEOTYPENAME like '%" + searchValue + "%'");
					sArray.add(" VIDEOTYPEPARENT like '%" + searchValue + "%'");
				//	sArray.add(" HEADIMG like '%" + searchValue + "%'");
					//日期查询
				//	sArray.add("to_char(USERBRITH,'yyyy-MM-dd hh24:mi:ss') LIKE '%" + searchValue + "%'");

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

				List<VideoType> users = new ArrayList<VideoType>();
				String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;

				recordsTotal = String.valueOf(vts.getVideotypeCount());

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

				PageData<VideoType> pu = vts.getAllVideostypeBySearch(sql, realstart, Integer.parseInt(length));

				for (VideoType ur : pu.getData()) {
					/*//日期的截取
					String dates = ur.getUSERBRITH();
					ur.setUSERBRITH(dates.substring(0, 10));
*/
                   //添加数据打数组list
					
					users.add(ur);
				}

				if (searchValue != "") {

					recordsFiltered = String.valueOf(vts.getVideotypeCountBySearch(recordsFilteredSql));

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

			}else if (op.equals("updateVideoType")) {
			
				boolean imgflag = true;
				String videotypeid = "", videotypename = "", videotypeparent = "",headimg="";
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
							if (name.equals("videotypeid")) {
								videotypeid = value;
							} else if (name.equals("videotypename")) {
								videotypename = value;
							} else if (name.equals("videotypeparent")) {
								videotypeparent = value;
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
								String extName = fileName.substring(fileName.indexOf(".") + 1).toLowerCase().trim();
								if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
									item.delete();
									imgflag = false;
								} else {
									String files = videotypename + "." + extName;
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
					//把之前路径重新写进去；
				//	headimg = imgurl;
				}
				VideoType vt = new VideoType(Integer.parseInt(videotypeid), videotypename, Integer.parseInt(videotypeparent));
				boolean flag = vts.updateUsers(vt);

				out.print(flag);

			} else if (op.equals("delVideoType")) {
				int id = Integer.parseInt(request.getParameter("userid"));
				boolean flag = vts.delectVideotype(id);

				out.print(flag);
			} else if (op.equals("delSomeVideoType")) {
				if (request.getParameter("userid") != null && request.getParameter("userid") != "") {
					String[] idsd = request.getParameter("userid").split(",");
					boolean flag = false;
					for (int i = 0; i < idsd.length; i++) {
						flag = vts.delectVideotype(Integer.parseInt(idsd[i]));
					}
					out.print(flag);
				}
			}
			else if(op.equals("insertsVideoType"))
			{
				boolean imgflag = true;
				String  typename = "", typeparent = "";
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
							if (name.equals("typename")) {
								typename = value;
							} else if (name.equals("typeparent")) {
								typeparent = value;
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
								String extName = fileName.substring(fileName.indexOf(".") + 1).toLowerCase().trim();
								if (!Arrays.<String>asList(fileType.split(",")).contains(extName)) {
									item.delete();
									imgflag = false;
								} else {
									/*String files = videotypename + "." + extName;
									headimg = "/imgs/" + files;
									String path ="D:/bsb/java/软件/eclipse/workspace/WebVideoProject/WebContent"+headimg;
									File uploadedFile = new File(path);
									item.write(uploadedFile);*/
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
					//把之前路径重新写进去；
				//	headimg = imgurl;
				}
				VideoType vt = new VideoType(0, typename,Integer.parseInt(typeparent));
				boolean flag = vts.insertVideoType(vt);

				out.print(flag);
	
			}
		}

	}

}
