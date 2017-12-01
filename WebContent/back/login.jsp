<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>
<title>Unicorn Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${path}back/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${path}back/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${path}back/css/unicorn.login.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div id="logo">
		<img src="${path}back/img/logo.png" alt="" />
	</div>
	<div id="loginbox">
		<form id="loginform" class="form-vertical" method="post"
			action="${path}AdminsServlet?op=queryUserAndPwd" />
		<p>输入正确的用户名和密码进行登录.</p>
		<div class="control-group">
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"><i class="icon-user"></i></span><input
						name="username" type="text" placeholder="Username" />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"><i class="icon-lock"></i></span><input
						name="userpwd" type="password" placeholder="Password" />
				</div>
			</div>
		</div>
		<div class="form-actions">
			<span class="pull-left"><a href="#" class="flip-link">返回主页</a></span>
			<span class="pull-right"><input type="submit"
				class="btn btn-inverse" value="登录" /></span>
		</div>
		</form>

	</div>

	<script src="${path}back/js/jquery.min.js"></script>
	<script src="${path}back/js/unicorn.login.js"></script>
	<script type="text/javascript">
        
        $(function(){
        	
        	
        	
        	
        	
        	
        });
        
        
        </script>
</body>
</html>
