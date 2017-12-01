package com.spimax.front.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
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


@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "C:\\Users\\zhuzhen\\git\\WebVideoProject\\WebContent\\front\\img\\head\\1\\";

	public UploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String pathUrl = request.getScheme() + "://" + request.getServerName()
		+ ":" + request.getLocalPort() + request.getContextPath()
		+ "/";
		boolean imgflag = true;
		boolean videoflag = true;
		String username = "", serverpath = "", typename = "", imgvideo = "", videoremark = "", videotitle = "",
				videourl = "", videotypename = "", videocoverurl = "", videotime = "";
		int videoid = 0;
		int videotypeid = 0;



DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);
		String fileType="jpg,png,bmp,gif,jpeg";
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
					//	List<Integer> vtypeid = vtd.getTypeOneId(videotypename);

						/*for (Integer integer : vtypeid) {
							videotypeid = integer;
						}*/
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
								imgvideo = "/front/img/1/" + 1111 +"." + extName;

								String path = "C:/Users/zhuzhen/git/WebVideoProject/WebContent"+imgvideo;
								File uploadedFile = new File(path);
								imgvideo = serverpath + imgvideo;
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


		/*Videos vs = new Videos(videoid, videotypeid, 0, username, videotitle, videotime, imgvideo, videourl, 1,
				videoremark);
		// Users users = new Users(userid, username, "", email, videocoverurl,
		// brithdate);
		boolean flag = us.updateVideos(vs);

		out.print(flag);*/


	}

}