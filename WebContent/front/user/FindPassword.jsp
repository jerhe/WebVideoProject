<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	//折中处理一下
	pageContext.setAttribute("path", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">


<meta name="referrer" content="always">
<title>重置密码</title>
    <link rel="shortcut icon" href="${path}front/img/userimg/favicon.ico">



<link media="all" href="css/FindPassword.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css" media="all">
<script src="http://res.layui.com/layui/release/layer/dist/layer.js?v=310"></script>
<script language="javascript">
    var a="555555";

   
	function get_mobile_code(){
		
        $.post('sms.jsp', {mobile:jQuery.trim($('#phone').val())}, function(msg) {
          var ok1=false;
        	$("#phone").blur(function(){
				if($(this).val().length==0){
					$("#phonetip").html("手机号不能为空！");
				}
				else if (/^1\d{10}$/g.test($(this).val())==false) {
					$("#phonetip").html("号码格式为1**********的11位数字");
				}
				else{
					$("#phonetip").html(" ");
					ok1=true;
				}

			});
        	if($("#phone").val().length==0){
				$("#phonetip").html("请输入手机号！");
			}
			else if (/^1\d{10}$/g.test($("#phone").val())==false) {
				$("#phonetip").html("号码格式为1**********的11位数字");
			}
			else{
				$("#phonetip").html(" ");
				ok1=true;
			}
        	if (/^1\d{10}$/g.test($("#phone").val())==false) {
				alert("请输入号码格式为1**********的11位数字");
			}
			a=parseInt(msg);
		
			if (ok1) {
				RemainTime();
				document.getElementById('text_yzm').disabled = false;
			}
			
        });
        
	};
	var iTime = 59;
	var Account;
	function RemainTime(){
		document.getElementById('yzm').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='请再次获取';
				document.getElementById('text_yzm').disabled = true;
				iTime = 59;
				document.getElementById('yzm').disabled = false;
				a="555555";
				$("#text_yzm").val("");
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('yzm').value = sTime;
	}
	
	function get_login() {
		if($("#phone").val().length==0 || $("#text_yzm").val().length==0){
			layer.msg("请先填写相关信息");
		}
		
	//验证码验证
	if ($("#text_yzm").val()==a) {
			layer.alert('验证成功', {
			    skin: 'layui-layer-lan'
			    ,closeBtn: 0
			    ,anim: 4 //动画类型
			  });
			$("#phone").hide();
			$("#text_yzm").hide();
			$("#yzm").hide();
			$("#login").hide();
			$("#password5").show();
	    	$("#password6").show();
	    	$("#updatepwd").show();
		}else{
			layer.msg("验证码错误");
		}
	};
	
	//重设密码的验证
	function get_pwd() {
		if($("#password5").val().length<6){
			layer.msg("密码不能小于6位");
		}
		else if($("#password5").val()!=$("#password6").val()){
			layer.msg("两次密码不一致");
		}
		else 
			
			/* 动画 */
			$.post("${path}FrontUserServlet",{"op":"resetpwd","USERTEL":$("#phone").val(),"USERPWD":$("#password5").val()},function(data,status){
				window.location.href='${path}front/user/index.jsp';
		 	});
			
		};
	 
</script>

<script type="text/javascript">
			$(function(){
				var ok1=false;
				var ok2=false;
				var ok3=false;
				var ok4=false;
				var ok5=false;
				
			   $("#userpwd").blur(function(){
					if($(this).val().length<6){
						$("#userpwdTip").html("密码不能小于六位！");
					}else{
						$("#userpwdTip").html(" ");
						ok2=true;
					}

				});
			   
			  
			   
				  $("#cuserpwd").blur(function(){
					if($(this).val()!=$("#userpwd").val()){
						$("#cuserpwdTip").html("两次密码不一致！");
					}else{
						$("#cuserpwdTip").html(" ");
						ok3=true;
					}
				});
				
				
				
				
			});
//		
		</script>

    		<div class="z_top_container">
			<div class="z_top b-header-blur white">
			<div class="b-header-mask-wrp">
				<div class="b-header-mask-bg" style="background-image: url(&quot;${path}front/img/headimg.png&quot;);"></div>
				<div class="b-header-mask"></div>
			</div>
			<div class="z_header">
				<div class="z_top_nav">
					<ul>
						<li class="home">
							<a class="i-link" href="${path}front/home.jsp" style="margin-left: 8px;">主站</a>
						</li>
							
					</ul>
				</div>
				<div class="uns_box">
					<ul class="menu">
						
						<li class="u-i i_user" id="i_menu_login_reg" guest="yes" style="display: list-item;">
							<a id="login_default_face" href="${path}front/user/index.jsp">
							<c:if test="${user != null}">
								<img class="i_face" src="${user.HEADIMG}"></a>
							</c:if>
							<c:if test="${user == null}">
								<img class="i_face" src="${path}front/img/akari.jpg"></a>
							</c:if>
							<div class="i_menu" id="i_menu_login">
								<a class="login-btn" href="${path}front/user/index.jsp">登录</a>
							</div>
						</li>
						
						<li class="u-i b-post">
								<c:if test="${user != null}">
								<a class="i-link">菜 单</a>
								<ul class="s-menu show-audio">
									<li>
										<a href="${path}front/home.jsp"><i class="b-icon b-icon-art"></i><em>首页</em></a>
									</li>
									<li class="tougaohead">
										<a><i class="b-icon b-icon-art"></i><em>投稿</em></a>
									</li>
									<li class="upimghead">
										<a><i class="b-icon b-icon-vp"></i><em>更换头像</em></a>
									</li>
									<li class="ziliaohead">
										<a><i class="b-icon b-icon-ap"></i><em>资料</em></a>
									</li>
									
									<li class="tuichuhead">
										<a><i class="b-icon b-icon-vm"></i><em>退出</em></a>
									</li>
								</ul>	
								</c:if>
								<c:if test="${user == null}">
								<a href="${path}front/user/index.jsp" class="i-link">登 录</a>
								</c:if>
								<i class="up-new"></i>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<div class="top_bg">
		<div class="top"></div>
	</div>
<div class="head_foot_content">
	<div class="retrieve-tab">
		<div class="retrieve-password">
			<div class="retrieve-mobile retrieve-current">通过绑定的手机找回密码</div>
			<!--<div class="retrieve-email">通过绑定的邮箱找回密码</div>-->
		</div>
		<div class="retrieve-line"></div>
	</div>
	<div class="verify-content mob" style="margin-top: 40px;">
		<form method="#" action="./index.jsp">
			<input value="mobile_getpwd" name="dopost" type="hidden">
			<div class="box">
			
				<input id="phone" name="mobile" placeholder="请输入手机号码" class="password" value="" type="text">
				
				
			</div>
			
			<div class="box">
			
			<p id="phonetip" color: red" class="password">hellohhhhhhhhhhh</p>
			
				
			</div>
			
			
			<div class="box">
		  
				<input disabled="true" name="vdCodeTxt" id="text_yzm" placeholder="验证码" class="code" style="margin-top: 30px;" type="text">
				<!--<img name="captchaImg" src="resetpwd" class="yzm" alt="" style="display: none;">
				<p name="refreshCaptchaAch" style="display: none;">换一张</p>-->
				<input id="yzm" class="yzm" value="发送验证码" type="button" style="" onclick="get_mobile_code()">
				<p id="findpwdtip" class="yzm_x mar_t_69" style="color: red"></p>
			</div>
			<input name="ct" value="8aba8ee0b3a411e7821c0242ac123ee4" type="hidden">
			<input id="login" class="login" value="发送到手机" type="button" onclick="get_login()">
			<a href="./index.html" class="no-account">返回登录&gt;</a>
			<br />	<br />
				
					
			<input id="password5" name="mobile" placeholder="请输入密码" class="password" value="" type="password" style="display:none;" >
			<p id="userpwdTip" class="yzm_x mar_t_69"></p>
			<br />
			
			&nbsp<input id="password6" name="mobile" placeholder="重复密码" class="password" value="" type="password" style="display:none;">
			<p id="cuserpwdTip" class="yzm_x mar_t_57"></p>
			<br />
			<input id="updatepwd" class="login" value="确定并返回登录界面" type="button" onclick="get_pwd()" style="display:none;" >
			
		</form>
	</div>
	<div class="verify-content eml" style="margin-top: 40px; display: none;">
		<form method="get" action="#">
			<input value="email_getpwd" name="dopost" type="hidden">
			<div class="box">
				<input placeholder="请输入邮箱" name="email" class="password" value="" type="text">
			</div>
			<div class="box">
				<input name="vdCodeTxt" value="验证码" class="code" style="margin-top: 30px;" type="text">
				<img name="captchaImg" src="#" class="yzm" alt="" style="display: none;">
				<p name="refreshCaptchaAch" style="display: none;">换一张</p>
			</div>
			<input name="ct" value="8aba8ee0b3a411e7821c0242ac123ee4" type="hidden">
			<input class="login" value="发送到验证邮箱" type="submit"> <a href="https://passport.bilibili.com/login" class="no-account">返回登录&gt;</a>
		</form>
	</div>
</div>



<iframe style="position: absolute; width: 1px; height: 1px; left: -9999px;" src="#"></iframe><ul class="bilibili-suggest" style="top: 42px; left: 1201px; display: none; min-width: 188px; max-width: 360px;"></ul></body>
</html>