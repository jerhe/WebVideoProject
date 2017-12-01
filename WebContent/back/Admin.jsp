<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>
<%-- <link rel="stylesheet" href="${path}/back/css/bootstrap.min.css" />    --%>
<link rel="stylesheet" type="text/css"
	href="${path}back/plugin/datatables/bootstrap.min.css" />

<link rel="stylesheet"
	href="${path}back/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${path}back/css/uniform.css" />
<link rel="stylesheet" href="${path}back/css/select2.css" />

<link rel="stylesheet" href="${path}back/css/unicorn.main.css" />
<link rel="stylesheet" href="${path}back/css/unicorn.blue.css"
	class="skin-color" />

<script src="${path}back/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
       $(function(){
    	   var text1=  $(".active").find("span").text();
    	   if(text1=='用户信息管理')
		   {
			 $("#_div_userlist").load("${path}back/Users2.jsp"); 
		   }
	   else if(text1=='评论管理')
		   { $("#_div_userlist").load("${path}back/Comment.jsp"); 
		   }
	   else if(text1=='用户视频管理')
		   {
		   $("#_div_userlist").load("${path}back/Videos.jsp"); 
		   }else if(text1=='管理员密码修改')
			   {
			   $("#_div_userlist").load("${path}back/AdminMange.jsp"); 
			   }
		   else if(text1=='首页')
	    	{
		    	 $("#_div_userlist").load("${path}back/index.jsp");
		    	 $("#classfi").text('首页');
		 		   $("#classfi2").text('');
		    	}
	   else
		   {}
    	   $("li").click(function(){
    	    $(".active").removeClass("active");
    	    $(this).addClass("active");
    	    text1=  $(".active").find("span").text();
    	    if(text1=='用户信息管理')
 		   {
 			 $("#_div_userlist").load("${path}back/Users2.jsp"); 
 			$("#classfi").text('用户信息管理');
 			 $("#classfi2").text("");
 		   }
    	    else if(text1=='评论管理')
    	    	{ 
    	   
    	    	 $("#_div_userlist").load("${path}back/Comment.jsp"); 
    	    	$("#classfi").text('评论管理');
    	    	 $("#classfi2").text("");
    	    	}
    	    else if(text1=='用户视频管理')
 		   { 
 		     $("#_div_userlist").load("${path}back/Videos.jsp"); 
 		    $("#classfi").text('视频管理');
 		   $("#classfi2").text('用户视频管理');
 		   }
    	    else if(text1=='视频类别管理')
    	    	{
    	    	 $("#_div_userlist").load("${path}back/VideoTypeReal.jsp");
    	    	}
    	    else if(text1=='视频管理')
    	    	{
    	    	   $("#classfi").text('视频管理');
    	    	   $("#classfi2").text("");
    	    	}
    	    else if(text1=='管理员密码修改')
			   {
			   $("#_div_userlist").load("${path}back/AdminMange.jsp"); 
				$("#classfi").text('管理员密码修改');
	 			 $("#classfi2").text("");
			   }
    	    else if(text1=='视频发布管理')
	    	{
	    	 $("#_div_userlist").load("${path}back/VideosPublish.jsp");
	    	 $("#classfi").text('视频管理');
	 		   $("#classfi2").text('视频发布管理');
	    	}
    	    else if(text1=='视频弹幕管理')
    	    	{ $("#_div_userlist").load("${path}back/Danmu.jsp");
    	    	 $("#classfi").text('视频弹幕管理');
    	    	  $("#classfi2").text("");
    	    	} else if(text1=='首页')
    	    	{
    		    	 $("#_div_userlist").load("${path}back/index.jsp");
    		    	 $("#classfi").text('首页');
    		 		   $("#classfi2").text('');
    		    	}
    	    
    	   });
    
    	
    		   
    		  
       });
       
       </script>


<script src="${path}back/js/jquery.min.js"></script>
<script src="${path}back/js/jquery.ui.custom.js"></script>
<script src="${path}back/js/bootstrap.min.js"></script>
<script src="${path}back/js/jquery.uniform.js"></script>
<script src="${path}back/js/select2.min.js"></script>
<script src="${path}back/js/jquery.dataTables.min.js"></script>
<script src="${path}back/js/unicorn.js"></script>
<script src="${path}back/js/unicorn.tables.js"></script>
<script src="${path}back/js/jquery.validate.js"></script>
<script src="${path}back/js/unicorn.form_validation.js"></script>
</head>
<body>
	<div id="header">
		<h1>
			<a href="#">视频网站管理后台 </a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-user"></i> <span class="text">文件</span></a></li>
			<li class="btn btn-inverse dropdown" id="menu-messages"><a
				href="#" data-toggle="dropdown" data-target="#menu-messages"
				class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
					class="text">消息</span> <span class="label label-important">5</span>
					<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a class="sAdd" title="" href="#">新的消息 </a></li>
					<li><a class="sInbox" title="" href="#">收信箱</a></li>
					<li><a class="sOutbox" title="" href="#">写信箱</a></li>
					<li><a class="sTrash" title="" href="#">垃圾箱</a></li>
				</ul></li>
			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-cog"></i> <span class="text">设置</span></a></li>
			<li class="btn btn-inverse"><a title="" href="login.html"><i
					class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-th-list"></i>
			表格</a>
		<ul>
			<li class="active"><a href="${path}back/Admin.jsp"><i
					class="icon icon-home"></i> <span>首页</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>视频管理</span> <span class="label">2</span></a>
				<ul>
					<li><a href="#"><span>用户视频管理</span></a></li>
					<li><a href="#"><span>视频发布管理</span></a></li>

				</ul></li>
			<li><a href="#"><i class="icon icon-tint"></i> <span>视频弹幕管理</span></a></li>
			<li><a href="#"><i class="icon icon-pencil"></i> <span>评论管理</span></a></li>
			<li><a><i class="icon icon-th"></i> <span>用户信息管理</span></a></li>
			<li><a href="#"><i class="icon icon-th-list"></i> <span>管理员密码修改</span></a></li>


		</ul>

	</div>



	<div id="content">
		<div id="content-header">
			<h1>管理界面</h1>

		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> 主界面</a> <a href="#" id="classfi" class="current">用户信息管理</a>
			<a href="#" id="classfi2" class="current"></a>
		</div>
		<div class="container-fluid">




			<div id="_div_userlist" class="widget-content nopadding"
				style="padding-left: -10px"></div>





			<div class="row-fluid">
				<div id="footer" class="span12">
					SP-IMAX视频管理后台，如有雷同，必是一家人，请不要相互举报</div>
			</div>
		</div>
	</div>

</body>
</html>