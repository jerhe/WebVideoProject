package com.geetest.sdk.java.web.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.server.SkeletonNotFoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.geetest.sdk.java.GeetestLib;

import org.json.JSONException;
import org.json.JSONObject;


@WebServlet("/VLS")
public class VerifyLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 244554953219893949L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key());
			
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
		String userid = (String)request.getSession().getAttribute("userid");
		
		int gtResult = 0;

		if (gt_server_status_code == 1) {
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);

		} else {
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
		}


		if (gtResult == 1) {
			
			PrintWriter out = response.getWriter();
			JSONObject data = new JSONObject();
			try {
				data.put("status", "success");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			out.println(data.toString());
		}
		
		else {
			JSONObject data = new JSONObject();
			
			try {
				data.put("status", "fail");
				data.put("version", gtSdk.getVersionInfo());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(data.toString());
		}

	}
}
