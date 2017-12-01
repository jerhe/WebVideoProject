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
import com.spimax.back.dao.VideoTypeDao;
import com.spimax.back.dao.VideosDao;
import com.spimax.back.entity.Comment;
import com.spimax.back.entity.Users;
import com.spimax.back.entity.VideoType;
import com.spimax.back.entity.Videos;
import com.spimax.back.service.CommentService;
import com.spimax.back.service.UsersService;
import com.spimax.back.util.PageData;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentService cs = new CommentService();
	VideosDao vtd=new VideosDao();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
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
		PageData<Comment> pd = new PageData<Comment>();
		
		

		// ����Ҫ�ж���ʲô��ѯ? ���� ��ģ���� ������
		if (request.getParameter("op") != null) {
			// ��op��ֵȡ���� �ж����ֵ

			String op = request.getParameter("op");
			if (op.equals("queryAll")) {
				// ��ҳ��ѯ
              List<Comment> list=cs.getAllVideos();
              String json = new Gson().toJson(list);// ? ����Ҫע��һ�� ������һ��json��ʽ��ת��
				response.setContentType("application/json");
				System.out.println(json);
				out.print(json);
			
	}else if(op.equals("queryCommentAll")) {
		// ��ҳ��ѯ

		String table = "V_COMMENT";

		// ��ȡ�������
		String draw = "0";
		draw = request.getParameter("draw");
		// ������ʼλ��
		String start = request.getParameter("start");

		// ���ݳ���
		String length = request.getParameter("length");

		// �ܼ�¼��
		String recordsTotal = "0";

		// ���˺��¼��
		String recordsFiltered = "";

		// ��������
		String[] cols = { "", "", "COMMENTID", "COMMENTCONTENT", "USERNAME", "PARENTID", "VIDEOID","VIDEOTITLE", "COMMENTTIME"};
		// ��ȡ�ͻ�����Ҫ��һ������
		String orderColumn = "0";
		orderColumn = request.getParameter("order[0][column]");

		orderColumn = cols[Integer.parseInt(orderColumn)];

		// ��ȡ����ʽ Ĭ��Ϊasc
		String orderDir = "asc";
		orderDir = request.getParameter("order[0][dir]");

		/*
		 * Map map = request.getParameterMap(); Iterator<String> iter =
		 * map.keySet().iterator(); while (iter.hasNext()) { String key = iter.next();
		 * System.out.println("key=" + key); String[] value = (String[]) map.get(key);
		 * System.out.print("value="); for (String v : value) { // out.print(v + "  ") ;
		 * System.out.println(v + "  "); } }
		 */

		// ��ȡ�û����˿�����ַ�
		String searchValue = request.getParameter("search[value]");

		List<String> sArray = new ArrayList<String>();
		if (!searchValue.equals("")) {
			// List<Integer> listint=vtd.get(searchValue);
			List<Integer> listint=vtd.getTypeId(searchValue);
			sArray.add(" COMMENTID like '%" + searchValue + "%'");
			sArray.add(" COMMENTCONTENT like '%" + searchValue + "%'");
			sArray.add(" USERNAME like '%" + searchValue + "%'");
			sArray.add(" PARENTID like '%" + searchValue + "%'");
			sArray.add(" VIDEOID like '%" + searchValue + "%'");
			if(listint!=null)
				for (Integer videoid : listint) {
					sArray.add("videoid="+videoid);
					
				}
			//���ڲ�ѯ
			sArray.add("to_char(COMMENTTIME,'yyyy-MM-dd hh24:mi:ss') LIKE '%" + searchValue + "%'");

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

		List<Comment> users = new ArrayList<Comment>();
		String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;

		recordsTotal = String.valueOf(cs.getCommentCount());

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

		PageData<Comment> pu = cs.getAllCommentBySearch(sql, realstart, Integer.parseInt(length));
		
		 
		for (Comment ur : pu.getData()) {
			//���ڵĽ�ȡ
			String dates = ur.getCOMMENTTIME();
			ur.setCOMMENTTIME(dates.substring(0, 10));

           //������ݴ�����list
			 List<Videos> vi=cs.getAllVideosByVideoid(ur.getVIDEOID());
			 
			for (Videos videos : vi) {
				 ur.setVIDEOTITLE(videos);
			
			}
			users.add(ur);
		}

		if (searchValue != "") {

			recordsFiltered = String.valueOf(cs.getCommentCountBySearch(recordsFilteredSql));

		} else {
			recordsFiltered = recordsTotal;
		}

		Map<Object, Object> info = new HashMap<Object, Object>();
		info.put("data", users); // users��һ�� List<User>
		info.put("recordsTotal", recordsTotal);
		info.put("recordsFiltered", recordsFiltered);
		info.put("draw", draw);

		String json = new Gson().toJson(info);// ? ����Ҫע��һ�� ������һ��json��ʽ��ת��
        
		out.print(json);

	} else if (op.equals("delComment")) {
		int id = Integer.parseInt(request.getParameter("commentid"));
		boolean flag = cs.delectComment(id);

		out.print(flag);
	} else if (op.equals("delSomeComment")) {
		if (request.getParameter("commentid") != null && request.getParameter("commentid") != "") {
			String[] idsd = request.getParameter("commentid").split(",");
			boolean flag = false;
			for (int i = 0; i < idsd.length; i++) {
				flag = cs.delectComment(Integer.parseInt(idsd[i]));
			}
			out.print(flag);
		}
	}

}
}
}