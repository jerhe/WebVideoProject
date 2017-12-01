<%@ page contentType="text/html" pageEncoding="UTF-8"%><%@ page import = "java.io.*" %>
<%@ page import = "java.net.*" %><%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %><%
String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

int mobile_code = (int)((Math.random()*9+1)*100000);
//删除2222就可以用
String account = "C38227908";
String password = "9331f333ab131afa7d9cac4dceda6a2f";
String mobile = request.getParameter("mobile");
String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

try {

	URL url = new URL(postUrl);
	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	connection.setDoOutput(true);//允许连接提交信息
	connection.setRequestMethod("POST");//网页提交方式“GET”、“POST”
	connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	connection.setRequestProperty("Connection", "Keep-Alive");
	StringBuffer sb = new StringBuffer();
	sb.append("account="+account);
	sb.append("&password="+password);
	sb.append("&mobile="+mobile);
	sb.append("&content="+content);
	OutputStream os = connection.getOutputStream();
	os.write(sb.toString().getBytes());
	os.close();

	String line, result = "";
	BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
	while ((line = in.readLine()) != null) {
		result += line + "\n";
	}
	in.close();
	out.println(mobile_code);

} catch (IOException e) {
	e.printStackTrace(System.out);
}

%>