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
		
		<title>用户注册</title>
		<link rel="shortcut icon" href="img/favicon.ico">
		<link media="all" href="css/register.css" type="text/css" rel="stylesheet">
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>	
	
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
							<a class="i-link" href="${path}front/home.jsp"><span>主站</span></a>
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
		<div id="login-app">
			<div>
				<div class="top-banner"><img src="img/title.png"></div>
				<div class="title-line"><span class="tit">注册</span></div>
				<div class="register-container">
					<form id="registerForm" method="post" action="http://localhost:8080/WebVideoProject/FrontUserServlet?op=adduser">
						<div class="new_phone center_div">
							<input name="dopost" value="regok" type="hidden">
							<input name="uname" id="uname" placeholder="昵称" class="user_id_password mar_b_40px" value="" type="text">
							<p id="unameTip" class="yzm_x mar_t_69"></p>
						</div>
						<div class="register-hidden-gruop">
							
						</div>
						<div class="center_div">
							<input name="userpwd" id="userpwd" placeholder="密码" class="user_id_password" type="password">
							<p id="userpwdTip" class="yzm_x mar_t_69"></p>
						</div>
						<div class="register-hidden-gruop">
							
						</div>
						<div class="center_div">
							<input name="cuserpwd" id="cuserpwd"placeholder="重输密码" class="user_id_password" type="password">
							<p id="cuserpwdTip" class="yzm_x mar_t_57"></p>
						</div>
					
						<!--  <div class="new_phone center_div">
							
							<input name="email" id="email" placeholder="请输入邮箱号" class="user_id_password mar_b_40px" value="" type="text">
							<p id="emailTip" class="yzm_x mar_t_69"></p>
						</div>
						-->
						
						
							<div class="new_phone center_div">
							
							<input name="phone" id="phone" placeholder="请输入电话号码" class="user_id_password mar_b_40px" value="" type="text">
							<p id="phonetip" class="yzm_x mar_t_69"></p>
						</div>
							<div class="register-hidden-gruop">
							
						</div>
					
						
						<div class="center_div yzm yzm_buttom_a back-fff">
							<input id="yzm" name="code" value="" type="text" disabled="true" style="margin: 0px">
							<p id="yzmTip" class="yzm_x mar_t_69"></p>
							<div id="captchCheck" class="check" style="display: none;"></div>
							<input id="getCaptch" type="button" class="yzm_buttom" value=" 发送手机验证码 "     onClick="get_mobile_code();" style="color:white;background: rgb(0, 181, 229) none repeat scroll 0% 0%;width: 160px";
							onmouseover="this.style.backgroundColor='rgb(0, 150, 230)'"; onmouseout="this.style.backgroundColor='rgb(0, 180, 280)'"> 
							<!-- <a id="getCaptch" class="yzm_buttom" onclick="get_mobile_code();" >点击获取</a> -->
					
					
							<p class="yzm_x"></p>
						</div>
						
						<div class="register-hidden-gruop">
							<div class="center_div pc-register-descript">
								<label>
									<input name="agree" id="agree" value="1" class="m-r-10" type="checkbox"> 我已同意
									<a target="_top" href="https://passport.bilibili.com/register/licence">《SP IMAX弹幕网用户使用协议》</a>和<a target="_top" href="http://www.bilibili.com/html/help.html#q">《SP IMAX弹幕网账号中心规范》</a></label>
							</div>
						</div>
						<input value="注册" id="register" class=" next_step center_div mar_t_120 ys-a "; type="button">
						<div class="register-hidden-gruop text-right"><a href="index.html">已有账号，直接登录&gt;</a></div>
					</form>
					<!---->
					<!---->
				</div>
			</div>
		</div>
		<div class="footer bili-footer">
			<div class="footer-wrp">
				<div class="footer-cnt clearfix">
					
					<div class="partner">
						<div class="block left" style="padding-top: 0px;">
							<div class="partner-banner"></div>
						</div>
						<div class="block left" style="margin: 0px 68px 0px 115px; line-height: 24px; float: none;">
							<p>广播电视节目制作经营许可证：<span>（沪）字第1248号</span> | 网络文化经营许可证：<span>沪网文[2013]0480-056号</span> | 信息网络传播视听节目许可证：<span>0910417</span> | 互联网ICP备案：<span>沪ICP备13002172号-3</span> 沪ICP证：<span>沪B2-20100043</span> | 违法不良信息举报邮箱：help@bilibili.com | 违法不良信息举报电话：4000233233转3</p>
							<p><a href="http://www.shjbzx.cn/" target="_top"><i class="icons-footer icons-footer-report"></i><span> 上海互联网举报中心</span></a> |<a href="http://jb.ccm.gov.cn/" target="_top">12318 全国文化市场举报网站</a> |
								<a target="_top" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011502001911"><img src="img/beiantubiao.png" style="vertical-align: top;"> 沪公网安备 31011502001911号 |</a><a href="mailto:userreport@bilibili.com">儿童色情信息举报专区</a></p>
							<p><a href="http://report.12377.cn:13225/toreportinputNormal_anis.do" target="_top">网上有害信息举报专区：<img src="img/12377.png" style="vertical-align: sub;" width="16" height="16"> 中国互联网违法和不良信息举报中心</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
	<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css" media="all">
<script src="http://res.layui.com/layui/release/layer/dist/layer.js?v=310"></script>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js">	</script>
	 <script type="text/javascript">
			$(function(){
				if("${result}" == "0"){
					layer.alert('用户名或手机号已存在，注册失败', {
    				    skin: 'layui-layer-lan'
        				    ,closeBtn: 0
        				    ,anim: 4 //动画类型
        				  });
					<%session.setAttribute("result",null);%>
				}
				
				
				var ok1=false;
				var ok2=false;
				var ok3=false;
				//var ok4=false;
				var ok5=false;
				$("#uname").blur(function(){
					if($(this).val().length==0){
						$("#unameTip").html("昵称不能为空！");
					}else{
						$("#unameTip").html(" ");
						ok1=true;
					}

				});
			   $("#userpwd").blur(function(){
					if($(this).val().length<6){
						$("#userpwdTip").html("密码不能小于六位！");
					}else{
						$("#userpwdTip").html(" ");
						ok2=true;
					}

				});
			   
			   $("#yzm").blur(function(){
					if($(this).val().length!=6){
						$("#yzmTip").html("请输入正确的验证码");
					}else{
						$("#yzmTip").html(" ");
						ok5=true;
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
				//var regem = new RegExp("^[A-Za-z0-9]{6,}[@][A-Za-z0-9]{2,}[.][A-Za-z0-9]{2,}$");
				 // $("#email").blur(function(){
				//	if(!regem.test($(this).val())){
				//		$("#emailTip").html("亲，你的邮箱格式错误哦！");
				//	}else{
				//		$("#emailTip").html(" ");
				//		ok4=true;
				//	}
				//});
				$("#register").click(function(){
					if($("#agree").is(":checked")){
						if(ok1 && ok2 && ok3  && ok5){
							//注册成功
							 document.getElementById("registerForm").submit();
							
						}else{
							alert("请填写完信息！");
						}
					}else{
						alert("未同意本网站协议和规范！");
					}
				});
				
				
			});
//		
		</script> 
	
	
<!-- 手机验证码的js -->
	<script type="text/javascript" src="./js/jquery.js"></script>
<script language="javascript">



//手机验证
    var a="";
	function get_mobile_code(){
		
        $.post('sms.jsp', {mobile:jQuery.trim($('#phone').val())}, function(msg) {
          var ok1=false;
        	$("#phone").blur(function(){
				if($(this).val().length==0){
					$("#phonetip").html("昵称不能为空！");
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
				$("#phonetip").html("手机号不能为空！");
			}
			else if (/^1\d{10}$/g.test($("#phone").val())==false) {
				$("#phonetip").html("号码格式为1**********的11位数字");
			}
			else{
				$("#phonetip").html(" ");
				ok1=true;
			}
        	
			a=parseInt(msg);
			if (ok1) {
				RemainTime();
				document.getElementById('yzm').disabled = false;
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
	function RemainTime(){
		document.getElementById('getCaptch').disabled = true;
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
				document.getElementById('yzm').disabled = true;
				iTime = 59;
				document.getElementById('getCaptch').disabled = false;
				
				$("#yzm").val("");
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('getCaptch').value = sTime;
	}
	
	function get_yanzhengma() {

	if ($("#yzm").val()==a) {
			alert("验证成功")
		} 
	};
</script>
<script type="text/javascript">
		//页面层-自定义
		$(function(){
			layermodel=-1;
			$(document).on("click",".btnclose",function(index){
				if(layermodel!=-1){
					layer.close(layermodel);
				}
			});
			/* 资料 */
			$(document).on("click",".ziliaohead",function(index){
				layermodel=layer.open({
					  type: 1,
					  area: '600px',
					  title: false,
					  closeBtn: 0,
					  shadeClose: true,
					  skin: 'yourclass',
					  content: "<form class='form-horizontal' method='post' id='upziliao' enctype='multipart/form-data' action='${path}FrontUserServlet'>"+	
					  	"<div class='modal-content'>"+
					 	"<div class='modal-header'>"+
					  	"<button type='button' class='close btnclose' data-dismiss='modal' aria-label='Close'><span"+
					  	"aria-hidden='true'>&times;</span></button>"+
					  	"<h4 class='modal-title' id='myModalLabel'>个人资料</h4>"+
					  	"</div>"+
					  	"<div class='modal-body'>"+
					  	"<div class='form-group'>"+
					  	"昵称："+
					  	"<input type='text' class='form-control' id='username' name='username' placeholder='用户名称' value='${user.USERNAME}'>"+
					  	"</div>"+
					  	"<div class='form-group'>"+
					  	"出生日期："+
					  	"<input type='date' class='form-control' id='brithdate' name='brithdate' placeholder='出生日期' value='${user.USERBRITH}' />"+
					  	"</div>"+
					  	"<div class='form-group'>"+
					  	"用户简介:<br/>"+
					  	"<textarea rows='5' cols='50' id='userremark' name='userremark'>${user.USERREMARK}</textarea>"+
					  	"</div>"+
					  	"</div>"+
					  	"<div class='modal-footer'>"+
					 	"<button type='button' class='btn btn-default btnclose' data-dismiss='modal'>关闭</button>"+
					  	"<button type='button' class='btn btn-primary' id='upsave'>保存</button>"+
					  	"</div>"+
					  	"</div>"+
			        	"</form>"
					});
			});
			
			$(document).on("click",".upsave",function(index){
				if($(".videotitle").val()==""&& $(".videoremark").val()==""){
					layer.msg("昵称和资料不能为空");
					return;
				}
				if($(".videocoverurl").val() != "" && $(".videourl").val() != ""){
					var url ="${path}HomeServlet?op=addvideo" ;
			        var formdata=new window.FormData($("#upziliao")[0]);
					$.ajax({
			            url:url ,
			             type: "POST",
			            data: 
			            	//表单提交 设置的请求参数Content-Type的值一定要有boundary的值，
			            	formdata, 
			            	contentType: false,
			                processData:false,
			                success: function(data){
				               if(data)
				            	   {
				            	   layer.msg('操作成功');
				            	   }
				               else
				            	   {layer.msg('操作失败');
				            	   }
				               layer.close(layermodel);
			            	}
							
			        });
				}else{
					layer.msg('请选择要上传的封面和视频');
				}
			});
			
			/* 投稿 */
			$(document).on("click",".tougaohead",function(index){
				layermodel=layer.open({
					  type: 1,
					  area: '600px',
					  title: false,
					  closeBtn: 0,
					  shadeClose: true,
					  skin: 'yourclass',
					  content: "<form class='form-horizontal' method='post' enctype='multipart/form-data' id='formaddvideo' novalidate='novalidate'>"+	
					  	"<div class='modal-content'>"+
					 	"<div class='modal-header'>"+
					  	"<button type='button' class='close btnclose' data-dismiss='modal' aria-label='Close'><span"+
					  	"aria-hidden='true'>&times;</span></button>"+
					  	"<h4 class='modal-title' id='myModalLabel'>投稿</h4>"+
					  	"</div>"+
					  	"<div class='modal-body'>"+
					  	"<div class='form-group'>"+
					  	"<input type='text' class='form-control videotitle' name='videotitle' placeholder='视频标题'>"+
					  	"</div>"+
					  	"<div class='form-group'>"+
					  	"<textarea rows='5' cols='50' class='videoremark' name='videoremark' placeholder='视频简介'></textarea>"+
					  	"</div>"+
					  	"<div class='form-group'>"+
					  	"<select class='form-control' name='videotype'>"+
					  	"<option value='MAD·AMV'>MAD·AMV</option>"+
						"<option value='MAD·3D'>MAD·3D</option>"+
						"<option value='短片·手书·配音'>短片·手书·配音</option>"+
						"<option value='国产动画'>国产动画</option>"+
						"<option value='布袋戏'>布袋戏</option>"+
						"<option value='资讯'>资讯</option>"+
						"<option value='原创音乐'>原创音乐</option>"+
						"<option value='翻唱'>翻唱</option>"+
						"<option value='演奏'>演奏</option>"+
						"<option value='三次元音乐'>三次元音乐</option>"+
						"<option value='纪录片'>纪录片</option>"+
						"<option value='科普人文'>科普人文</option>"+
						"<option value='野生协会'>野生协会</option>"+
						"<option value='数码'>数码</option>"+
						"<option value='机械'>机械</option>"+
						"<option value='汽车'>汽车</option>"+
						"<option value='搞笑'>搞笑</option>"+
						"<option value='日常'>日常</option>"+
						"<option value='美食'>美食</option>"+
						"<option value='动物圈'>动物圈</option>"+
						"<option value='运动'>运动</option>"+
						"<option value='其他'>其他</option>"+
						"<option value='鬼畜调教'>鬼畜调教</option>"+
						"<option value='音MAD'>音MAD</option>"+
						"<option value='人力VOCCALOID'>人力VOCCALOID</option>"+
						"<option value='综艺'>综艺</option>"+
						"<option value='明星'>明星</option>"+
						"</select>"+
					  	"</div>"+
					  	"<div class='form-group'>"+
					  	"<input type='file' class='form-control videocoverurl' name='videocoverurl' placeholder='上传封面' >"+
					  	"<span class='state1'>视屏封面（为图片格式）</span>"+
					  	"</div>"+
					  	
					  	"<div class='form-group'>"+
					  	"<input type='file' class='form-control videourl' name='videourl' placeholder='上传视频'>"+
					  	"<span class='state1'>视频文件（为webm）</span>"+
					  	"</div>"+
					  	
					  	"</div>"+
					  	"<div class='modal-footer'>"+
					 	"<button type='button' class='btn btn-default btnclose' data-dismiss='modal'>关闭</button>"+
					  	"<button type='button' class='btn btn-primary tougaosubmit' id='save'>保存</button>"+
					  	"</div>"+
					  	"</div>"+
			        	"</form>"
					});
				
				
			});
			$(document).on("click",".tougaosubmit",function(index){
				if($(".videotitle").val()==""&& $(".videoremark").val()==""){
					layer.msg("视频标题和简介不能为空！");
					return;
				}
				if($(".videocoverurl").val() != "" && $(".videourl").val() != ""){
					var url ="${path}HomeServlet?op=addvideo" ;
			        var formdata=new window.FormData($("#formaddvideo")[0]);
					$.ajax({
			            url:url ,
			             type: "POST",
			            data: 
			            	//表单提交 设置的请求参数Content-Type的值一定要有boundary的值，
			            	formdata, 
			            	contentType: false,
			                processData:false,
			                success: function(data){
				               if(data)
				            	   {
				            	   layer.msg('操作成功');
				            	   }
				               else
				            	   {layer.msg('操作失败');
				            	   }
				               layer.close(layermodel);
			            	}
							
			        });
				}else{
					layer.msg('请选择要上传的封面和视频');
				}
				/* document.getElementById('formimg').submit();  */
			});
			
			
			
			
			
			/* 更换头像 */
			$(document).on("click",".upimghead",function(index){
				layermodel=layer.open({
					  type: 1,
					  area: '300px',
					  title: false,
					  closeBtn: 0,
					  shadeClose: true,
					  skin: 'yourclass',
					  content: "<form class='form-horizontal' method='post' enctype='multipart/form-data' id='formimg' novalidate='novalidate' >"+	
					  	"<div class='modal-content'>"+
					  	"<div class='modal-header'>"+
					  	"<button type='button' class='close btnclose' data-dismiss='modal' aria-label='Close'><span"+
					  	"aria-hidden='true'>&times;</span></button>"+
					  	"<h4 class='modal-title' id='myModalLabel'>更换头像</h4>"+
					  	"</div>"+
					  	"<div class='modal-body'>"+
					  	"<input type='hidden' class='form-control' id='path' name='path' value='${path}'>"+
					  	"<div class='form-group'>"+
					  	"<input type='file' class='form-control headimgurl' name='videocoverurls' placeholder='用户头像'>"+
					  	"<span class='state1'>请选择文件类型（要为图片类型）</span>"+
					  	"</div>"+
					  	"</div>"+
					  	"<div class='modal-footer'>"+
					  	"<button type='button' class='btn btn-default btnclose' data-dismiss='modal'>关闭</button>"+
					  	"<button type='button' class='btn btn-primary saveheadimg'>提交头像</button>"+
					  	"</div>"+
					  	"</div>"+
					  	"</form>"
					});
			});
			$(document).on("click",".saveheadimg",function(index){
				if($(".headimgurl").val() != ""){
					var url ="${path}FrontUserServlet?op=upheadimg" ;
			        var formdata=new window.FormData($("#formimg")[0]);
					$.ajax({
			            url:url ,
			             type: "POST",
			            data: 
			            	//表单提交 设置的请求参数Content-Type的值一定要有boundary的值，
			            	formdata, 
			            	contentType: false,
			                processData:false,
			                success: function (data) {
				               if(data)
				            	   {
				            	   layer.msg('操作成功');
				            	   window.location.href='${path}front/home.jsp';
				            	   }
				               else
				            	   {layer.msg('操作失败');
				            	   }
				               layer.close(layermodel);
				              
			            	}
							
			        });
				}
				/* document.getElementById('formimg').submit();  */
			});
			
			 

		});
		
		

	</script>
	
</html>