package com.geetest.sdk.java.web.demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.geetest.sdk.java.GeetestLib;


@WebServlet("/pc-geetest-register")
public class StartCaptchaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key());

		String resStr = "{}";
		String userid = "";
		int gtServerStatus = gtSdk.preProcess(userid);
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		request.getSession().setAttribute("userid", userid);
		
		resStr = gtSdk.getResponseStr();

		PrintWriter out = response.getWriter();
		out.println(resStr);

	}
}