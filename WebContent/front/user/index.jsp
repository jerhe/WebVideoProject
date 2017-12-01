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
<title>SP IMAX</title>
<link rel="shortcut icon" href="${path}/front/user/img/favicon.ico">

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link media="all" href="css/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 引入封装了failback的接口--initGeetest -->
<script type="text/javascript" src="${path}/front/user/js/gt.js"></script>

<!-- 保存密码模块 js-->
<script type="text/javascript" src="${path}/front/user/js/cookie.js"></script>
<!-- 滑动模块的css -->
<style>
.inp {
	padding: 0 10px;
	width: 300px;
	height: 30px;
	font-size: 12px;
}

.btn {
	border: 1px solid gray;
	width: 150px;
	height: 40px;
	font-size: 18px;
	cursor: pointer;
}

#embed-captcha {
	width: 300px;
	padding-top: 10px;
}

.show {
	display: block;
}

.hide {
	display: none;
}

#notice {
	color: red;
}
/* 以下遮罩层为demo.用户可自行设计实现 */
#mask {
	display: none;
	position: fixed;
	text-align: center;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	overflow: auto;
}
/* 可自行设计实现captcha的位置大小 */
.popup-mobile {
	position: relative;
}

#popup-captcha-mobile {
	position: fixed;
	display: none;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	z-index: 9999;
}

.remember {
	margin: 10px 0px;
	color: rgb(113, 113, 113);
}

.remember span {
	color: rgb(187, 187, 187);
	margin-left: 10px;
}

.remember .forget-password {
	float: right;
}

.remember .not-checkout {
	float: right;
	margin-right: 10px;
}

.btn-login {
	border: 1px solid rgb(3, 129, 170);
	color: rgb(255, 255, 255);
	background-color: rgb(0, 167, 222);
}

.btn-login:hover {
	background: rgb(0, 190, 231) none repeat scroll 0% 0%;
}

.btn2 {
	width: 150px;
	height: 40px;
	font-size: 18px;
}

.btn-reg {
	margin-left: 34px;
}

.btn-reg:hover {
	background: rgb(247, 247, 247) none repeat scroll 0% 0%;
}
</style>

</head>

<body>
	<div class="z-top-container">
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
	<div id="login-app">
		<div class="login-app">
			<div>
				<div class="top-banner">
					<img src="${path}/front/user/img/title.png">
				</div>
				<div class="title-line">
					<span class="tit">登录</span>
				</div>
				<div class="login-box clearfix">
					<div class="login-left">
						<div class="qrcode-login">
							<img alt="" src="${path}/front/user/img/left2.png">
						</div>
					</div>
					<div class="line"></div>
					<div class="login-right">
						<div class="popup">

							<p>
								<label for="username2"></label> <input class="inp"
									id="username2" type="text" placeholder="请输入用户名"
									style="margin-top: 30px">
							</p>
							<p id="unameTip" class="yzm_x mar_t_69" style="color: red"></p>
							<br>
							<p>
								<label for="password2"></label> <input class="inp"
									id="password2" type="password" placeholder="密码">
							</p>
							<p id="userpwdTip" class="yzm_x mar_t_69" style="color: red"></p>

							<div id="embed-captcha"></div>
							<p id="wait" class="show">正在加载验证码......</p>
							<p id="notice" class="hide">请先拖动验证码到相应位置</p>

							<br>
							<li class="remember"><label> <input id="saveCookie"
									checked="checked" type="checkbox" value=""> 记住我 <span>不是自己的电脑上不要勾选此项</span>
							</label> <!----></li> <input class="btn btn-login" id="embed-submit"
								type="button" value="登录"> <input class="btn2 btn-reg"
								id="reg" type="button" value="注册"
								onclick="javascript:window.location.href='${path}front/user/register.jsp';">
							<br> <br> <a id="modal-527295"
								href="#modal-container-527295" role="button" class="btnbtn"
								data-toggle="modal" style="font-size: 15px">--使用短信登录</a> <a
								href="${path}front/user/FindPassword.jsp" class="forget-password"
								style="margin: 50px; font-size: 15px">忘记密码?</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer bili-footer" style="margin-top: 58px;">
		<div class="footer-wrp">
			<div class="footer-cnt clearfix">

				<div class="partner">
					<div class="block left" style="padding-top: 0px;">
						<div class="partner-banner"></div>
					</div>
					<div class="block left"
						style="margin: 0px 68px 0px 115px; line-height: 24px; float: none;">
						<p>
							广播电视节目制作经营许可证：<span>（沪）字第1248号</span> | 网络文化经营许可证：<span>沪网文[2013]0480-056号</span>
							| 信息网络传播视听节目许可证：<span>0910417</span> | 互联网ICP备案：<span>沪ICP备13002172号-3</span>
							沪ICP证：<span>沪B2-20100043</span> | 违法不良信息举报邮箱：help@bilibili.com |
							违法不良信息举报电话：4000233233转3
						</p>
						<p>
							<a href="http://www.shjbzx.cn/" target="_top"><i
								class="icons-footer icons-footer-report"></i><span>
									上海互联网举报中心</span></a> |<a href="http://jb.ccm.gov.cn/" target="_top">12318
								全国文化市场举报网站</a> | <a target="_top"
								href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011502001911"><img
								src="${path}/front/user/img/beiantubiao.png"
								style="vertical-align: top;"> 沪公网安备 31011502001911号 |</a><a
								href="mailto:userreport@bilibili.com">儿童色情信息举报专区</a>
						</p>
						<p>
							<a
								href="http://report.12377.cn:13225/toreportinputNormal_anis.do"
								target="_top">网上有害信息举报专区：<img
								src="${path}/front/user/img/12377.png"
								style="vertical-align: sub;" width="16" height="16">
								中国互联网违法和不良信息举报中心
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 短信登录-模态框 -->
	<div class="modal fade" id="modal-container-527295" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">短信登录</h4>
				</div>
				<div class="modal-body">
					<form action="reg.jsp" method="post" name="formUser"
						onSubmit="return register();">
						<table width="100%" border="0" align="left" cellpadding="5"
							cellspacing="3">
							<tr>
								<td align="right" style="font-size: 16px">手机号：
								<td><input id="mobile" name="mobile" type="text"
									class="inputBg" style="height: 20px;" /><span
									style="color: #FF0000;"> *</span> <input id="zphone"
									type="button" value=" 发送验证码 " onClick="get_mobile_code();"></td>

							</tr>
							<tr>
								<td>
								<td><p style="color: red" id="phonetip"
										class="yzm_x mar_t_69"></p></td>
								<br />
								</td>

							</tr>

							<tr>

								<td align="right" style="font-size: 16px"><br>验证码：</td>
								<td><input type="text" id="text_yzm" size="8"
									name="mobile_code" class="inputBg" disabled="true"
									style="margin-top: 20px" /></td>

							</tr>

						</table>
					</form>
					&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
					<p style="color: green" id="yzmtip" class="yzm_x mar_t_69"></p>
					<p style="color: red" id="yzmtip2" class="yzm_x mar_t_69"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btnbtn btn-default"
						data-dismiss="modal">关闭</button>
					<button type="button" onclick="get_yanzhengma()"
						class="btnbtn btn-primary">登录</button>
				</div>
			</div>

		</div>

	</div>

</body>
<!-- 模态框内容对应的js -->


<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css" media="all">
<script src="http://res.layui.com/layui/release/layer/dist/layer.js?v=310"></script>
<script language="javascript">
	var a = "888888";
	function get_mobile_code() {

		$.post('sms.jsp', {
			mobile : jQuery.trim($('#mobile').val())
		}, function(msg) {
			var ok1 = false;
			$("#mobile").blur(function() {
				if ($(this).val().length == 0) {
					$("#phonetip").html("手机号不能为空！");
				} else if (/^1\d{10}$/g.test($(this).val()) == false) {
					$("#phonetip").html("号码格式为1**********的11位数字");
				} else {
					$("#phonetip").html(" ");
					ok1 = true;
				}

			});
			if ($("#mobile").val().length == 0) {
				$("#phonetip").html("请输入手机号！");
			} else if (/^1\d{10}$/g.test($("#mobile").val()) == false) {
				$("#phonetip").html("号码格式为1**********的11位数字");
			} else {
				$("#phonetip").html(" ");
				ok1 = true;
			}

			a = parseInt(msg);
			if (ok1) {
				RemainTime();
				document.getElementById('text_yzm').disabled = false;
			}
			/* if (/^13\d{9}$/g.test($('#phone').val())) {
				alert("11111")
			}
			else{
				alert("22222")
			} */

			/* if (msg!=null && $('#phone').val()!="") {
				RemainTime();
				document.getElementById('yzm').disabled = false;
			}
			if ($('#phone').val()=="") {
				alert("请输入手机号");
			}  */
		});

	};
	var iTime = 59;
	var Account;
	function RemainTime() {
		document.getElementById('zphone').disabled = true;
		var iSecond, sSecond = "", sTime = "";
		if (iTime >= 0) {
			iSecond = parseInt(iTime % 60);
			iMinute = parseInt(iTime / 60)
			if (iSecond >= 0) {
				if (iMinute > 0) {
					sSecond = iMinute + "分" + iSecond + "秒";
				} else {
					sSecond = iSecond + "秒";
				}
			}
			sTime = sSecond;
			if (iTime == 0) {
				clearTimeout(Account);
				sTime = '请再次获取';
				document.getElementById('text_yzm').disabled = true;
				iTime = 59;
				a = "555555";
				document.getElementById('zphone').disabled = false;

				$("#text_yzm").val("");
			} else {
				Account = setTimeout("RemainTime()", 1000);
				iTime = iTime - 1;
			}
		} else {
			sTime = '没有倒计时';
		}
		document.getElementById('zphone').value = sTime;
	}

	function get_yanzhengma() {

		if ($("#text_yzm").val() == a) {
			$("#yzmtip").html("验证成功，即将跳转");
			$.post("${path}FrontUserServlet",{"op":"loginbytel","USERTEL":$(".inputBg").val()},function(data,status){
				 window.location.href = "${path}front/home.jsp";
	    	});
			
		} else
			$("#yzmtip").html("验证码错误");

	};
</script>

<script type="text/javascript">
	$(function() {
		var ok1 = false;
		var ok2 = false;
		var ok3 = false;
		var ok4 = false;
		//var reg = document.getElementById("reg");
		$("#username2").blur(function() {
			if ($(this).val().length == 0) {
				$("#unameTip").html("昵称不能为空！");
			} else {
				$("#unameTip").html(" ");
				ok1 = true;
			}

		});
		$("#password2").blur(function() {
			if ($(this).val().length < 4) {
				$("#userpwdTip").html("密码不能小于4位！");
				
			} else {
				$("#userpwdTip").html(" ");
				ok2 = true;
			}

		});

	});

	//极验模块
	
	
$(function (){
	 /* var userNameValue = getCookieValue("username2");  
	    $("#username2").val(userNameValue);   
	    var passwordValue = getCookieValue("password2");  
	    $("#password2").val(passwordValue); */
	    //$("password2").value = passwordValue;      
	var handlerEmbed = function (captchaObj) {
		
	    $("#embed-submit").click(function (e) {
	        var validate = captchaObj.getValidate();
	        //alert(validate);
	        var ok1=false;
			var ok2=false;
			var ok3=false;
			var ok4=false;
			//var reg = document.getElementById("reg");
		
				if($("#username2").val().length==0){
					$("#unameTip").html("昵称不能为空！");
				}else{
					$("#unameTip").html(" ");
					ok1=true;
				}

			
		   
				if($("#password2").val().length<4){
					$("#userpwdTip").html("密码不能小于4位！");
				}else{
					$("#userpwdTip").html(" ");
					ok2=true;
				}

		
	        if (!validate) {//没有完成验证
	            $("#notice")[0].className = "show";
	            setTimeout(function () {
	                $("#notice")[0].className = "hide";
	            }, 2000);
	            e.preventDefault();
	        }else if(ok1==true && ok2==true){
	        	//验证
	        	$.ajax({
	        		url: "${path}VLS", // 进行二次验证
	        		type: "post",
	        		dataType: "json",
	        		data: {
	        			username: $('#username2').val(),
	        			password: $('#password2').val(),
	        			geetest_challenge: validate.geetest_challenge,
	        			geetest_validate: validate.geetest_validate,
	        			geetest_seccode: validate.geetest_seccode
	        		},
	        		success: function (data) {
	        			if (data && (data.status === "success")) {
	        				var userNameValue = $("#username2").val();  
        			        var passwordValue = $("#password2").val();  
        			        //服务器验证（模拟）      
        			        var isMatched =0; 
        			    	$.post("${path}FrontUserServlet",{"op":"login","userName":userNameValue,"userPwd":passwordValue },function(loginData,status){
        			    		
        			    		if(loginData.flag==1){  
    	        			            if($("input[type='checkbox']").is(':checked')){
    	        			                setCookie("username2",$("#username2").val(),7,"/");  
    	        			                setCookie("password2",$("#password2").val(),7,"/");
    	        			            }else{
    	        			            	$.cookie("username2",null);
    	        			            	$.cookie("password2",null);
    	        			            	$.session.remove('user');
    	        			            } 
    	        			            
    	        			            window.location.href = "${path}front/home.jsp";
    	        			     }  
    	        			     else layer.alert('用户名或密码错误', {
    		        				    skin: 'layui-layer-lan'
    			        				    ,closeBtn: 0
    			        				    ,anim: 4 //动画类型
    			        				  },function(){
    			        					  window.location.href = "${path}front/user/index.jsp";
    			        				});
    							
    	        				
        			    	});
	        				
	        				
	        			} else {
	        				layer.alert('验证失败', {
	        				    skin: 'layui-layer-lan'
	        				    ,closeBtn: 0
	        				    ,anim: 4 //动画类型
	        				  });
	        				window.location.href = "${path}front/user/index.jsp";
	        				
	        			}
	        		}
	        	});
	        }
        });
	    // 将验证码加到id为captcha的元素里，同时会有三个input的值：geetest_challenge, geetest_validate, geetest_seccode
	    captchaObj.appendTo("#embed-captcha");
	    captchaObj.onReady(function () {
	        $("#wait")[0].className = "hide";
	    });
	    // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
	};
	
	$.ajax({
		// 获取id，challenge，success（是否启用failback）pc-geetest-register
		url: "${path}pc-geetest-register?t=" + (new Date()).getTime(), // 加随机数防止缓存
		type: "get",
		dataType: "json",
		success: function (data) {
			// 使用initGeetest接口
			// 参数1：配置参数
			// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
			initGeetest({
				gt: data.gt,
				challenge: data.challenge,
				product: "float", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
				offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
				// 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
			}, handlerEmbed);
		}
	});
});


function sleep(numberMillis) { 
	var now = new Date(); 
	var exitTime = now.getTime() + numberMillis; 
	while (true) { 
	now = new Date(); 
	if (now.getTime() > exitTime) 
	return; 
	} 
	}

</script>

</html>