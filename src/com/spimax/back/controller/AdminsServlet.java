package com.spimax.back.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.spimax.back.entity.Admins;
import com.spimax.back.entity.Caldeners;
import com.spimax.back.service.AdminsService;
import com.spimax.back.service.CaldenerService;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/AdminsServlet")
public class AdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminsService as = new AdminsService();
	CaldenerService cs=new CaldenerService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminsServlet() {
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
		response.setCharacterEncoding("gbk");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			if (op.equals("queryUserAndPwd")) {
				String username = request.getParameter("username");
				String userpwd = request.getParameter("userpwd");
				System.out.println(userpwd);
				// 调用service dao 完成查询
				if (as.getAdminByNameAndPwd(username, userpwd).size() > 0) {

					// 将用户的信息存储在session中
					// 这里就是HttpSession
					
					List<Admins> alist = as.getAdminByNameAndPwd(username, userpwd);
					for (Admins admins : alist) {
						Admins a=admins;
						session.setAttribute("admins", a);
					}
				

					// 跳转到
					response.sendRedirect("back/Admin.jsp");
				} else {
					response.getWriter().println("<script>alert('用户名或密码错误');location.href='back/login.jsp'</script>");
					// request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				// 有问题 再跳转回登录页面
			}else if(op.equals("queryPwd"))
			{
				Admins adm=	(Admins) session.getAttribute("admins");
				String pwd=request.getParameter("passwords");
			    System.out.println("querypwd"+pwd);
			    System.out.println("admin"+adm.getADMINPWD());
			    System.out.println(adm.getADMINPWD().equals(pwd));
			    boolean flag=false;
				if(adm.getADMINPWD().equals(pwd))
				 {
					flag=true;
					out.print(flag);
				 }
				else
				{
					out.print(flag);
				}
			}
			else if (op.equals("updatePwd")) {
				Admins adm=	(Admins) session.getAttribute("admins");
				String pwd=request.getParameter("password");
				
				boolean flag=as.updatePwd(adm.getADMINID(),pwd);
				if(flag)
				{	response.getWriter().println("<script>alert('修改密码成功,需要重新登陆');location.href='back/login.jsp'</script>");
				session.removeAttribute("admins");}
				
			}else if (op.equals("queryNews"))
			{   
				Admins adm=	(Admins)session.getAttribute("admins");
				
				List<Caldeners> list=cs.getAllNewsList(adm.getADMINID());
				
				String json = new Gson().toJson(list);// ? 这里要注意一下 这里有一个json格式的转换
				System.out.println(json);
				response.setContentType("application/json");
				
				out.print(json);
				
			}else if (op.equals("queryNewsBydate"))
			{
				Admins adm=	(Admins)session.getAttribute("admins");
				int year=Integer.parseInt(request.getParameter("years"));
				int month=Integer.parseInt(request.getParameter("months"));
				int day=Integer.parseInt(request.getParameter("days"));
				int i=cs.getAllNewsBydate(year, month, day, adm.getADMINID());
				response.setContentType("text/html; charset=utf-8");
				out.print(i);
			}else if (op.equals("updateNews"))
				{
				Admins adm=	(Admins)session.getAttribute("admins");
				int year=Integer.parseInt(request.getParameter("years"));
				int month=Integer.parseInt(request.getParameter("months"));
				int day=Integer.parseInt(request.getParameter("days"));
				int cid=Integer.parseInt(request.getParameter("cid"));
				String content=request.getParameter("content");
				String title=request.getParameter("title");
				Caldeners cls=new Caldeners(cid, title, content, year, day, month, adm.getADMINID(), null);
				boolean flag=cs.updateNews(cls);
				response.setContentType("text/html; charset=utf-8");
				out.println(flag);
				}else if (op.equals("insertNews"))
				{
					Admins adm=	(Admins)session.getAttribute("admins");
					int year=Integer.parseInt(request.getParameter("years"));
					int month=Integer.parseInt(request.getParameter("months"));
					int day=Integer.parseInt(request.getParameter("days"));
					String content=request.getParameter("content");
					String title=request.getParameter("title");
					Caldeners cls=new Caldeners(0, title, content, year, day, month, adm.getADMINID(), null);
				    boolean flag=cs.insertNews(cls);
					response.setContentType("text/html; charset=utf-8");
				    out.print(flag);
				    }
		}
	}

}
