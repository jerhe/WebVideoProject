<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Unicorn Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.error {
	color: red;
}
</style>
<script src="${path}back/js/jquery.min.js"></script>
<script src="${path}back/js/jquery.validate.min.js"></script>
<script src="${path}back/js/messages_zh.js"></script>
<script src="${path}back/js/jquery.uniform.js"></script>
<script src="${path}back/js/layer.js"></script>
<!--<script type="text/javascript" src="/dt-page/extjs.js"></script>-->
<link rel="stylesheet" href="${path}back/css/layer.css" />
<script>
	$().ready(function(){
		$("#state").click(function()
		{
			alert("1232");
		});
	
		 $("#signupForm").validate({
		
			    rules: {
			    
			      oldpwd: {
			        required: true,
			        minlength: 6
			      },
			      password: {
			        required: true,
			        minlength: 6
			      },
			      confirm_password: {
			        required: true,
			        minlength: 6,
			        equalTo: "#password"
			      }
			    },
			    messages: {
			
			    	oldpwd: {
			        required: "请输入旧密码",
			        minlength: "密码长度不能小于 6 个字母"
			      },
			      password: {
			        required: "请输入密码",
			        minlength: "密码长度不能小于 6 个字母"
			      },
			      confirm_password: {
			        required: "请输入密码",
			        minlength: "密码长度不能小于 6 个字母",
			        equalTo: "两次密码输入不一致"
			      },
			    },
			    success:"valid",
			     submitHandler:function(form){
			    	  $.ajax({
	       		            url: "${path}AdminsServlet?op=queryPwd",
	       		            data: {
	       		                "passwords": $("#oldpwd").val()
	       		            }, success: function (data) {
	       		          	  if(data=='true')
	       		         	   {
	       		                layer.msg('旧密码正确');
	       		                 form.submit();
	       		         	   }
	       		           if(data=='false')
	       		         	   {layer.msg('旧密码不正确');
	       		         	   
	       		         	   }
	       		            }
	       		        }); 
			             
			        
			        }    
		 });

		
		
	});

	
	</script>

</head>
<body>
	<div class="widget-box">
		<div class="widget-title">
			<span class="icon"> <i class="icon-align-justify"></i>
			</span>
			<h5>管理员密码修改</h5>
		</div>
		<form class="form-horizontal" role="form" id="signupForm"
			method="post" action="${path}AdminsServlet?op=updatePwd">
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">请输入旧密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="oldpwd"
						name="oldpwd" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">请输入新密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">请再次输入密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="confirm_password"
						name="confirm_password" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-10 control-label"></label>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary" value="修改密码" />
				</div>
			</div>
		</form>
	</div>

</body>

</html>
