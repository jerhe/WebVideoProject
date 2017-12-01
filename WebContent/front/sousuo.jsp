<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	//折中处理一下
	pageContext.setAttribute("path", path);
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	window.startTime = new Date().getTime();
</script>
<title>搜索结果</title>
<!--minDetail-->
<link rel="stylesheet" type="text/css" href="${path}front/cssplayer/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${path}front/cssplayer/page-core.css" />
<link rel="stylesheet" type="text/css" href="${path}front/cssplayer/page-tag.css" />
<link rel="stylesheet" href="${path}front/css/search-bb9aeef663.css">

	<link rel="shortcut icon" href="${path}front/img/home/favicon.ico">
	<script type="text/javascript" src="${path}front/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}front/css/bilibilimain.css"/>
	<link rel="stylesheet" type="text/css" href="${path}front/css/home.21d3fc64.css"/>
	<link rel="stylesheet" type="text/css" href="${path}front/css/bilibilifooter.css"/>
	<script type="text/javascript">
	
	$(function(){
		//初始化相关
		var VIDEOTITLE="<%=request.getParameter("VIDEOTITLE")%>";
		if(VIDEOTITLE==null){
			return;
		}
		$("#search-keyword").val(VIDEOTITLE);
		$.post("${path}SearchServlet",{"op":"init","VIDEOTITLE":VIDEOTITLE,"page":1},function(pageData,status){
			init(pageData);
	 	});
		
		$(document).on("click",".pagelistbox>.p",function(index){
			var VIDEOTITLE=<%=request.getParameter("VIDEOTITLE")%>;;
			 /* 做个判断type是否有值如果没有值跳转到首页 */
			if(VIDEOTITLE==null){
				VIDEOTITLE="";
			}
			 
			$.post("${path}SearchServlet",{"op":"init","VIDEOTITLE":VIDEOTITLE,"page":$(this).attr("page")},function(pageData,status){
				init(pageData);
			});
		});
		
		$(document).on("click",".jumppage",function(index){
			var VIDEOTITLE="<%=request.getParameter("VIDEOTITLE")%>";
			if(VIDEOTITLE==null){
				VIDEOTITLE="";
			}
			if(/^\d+$/.test($(".textjumppage").val())){
				var maxtotalpage=parseInt($(".maxtotalpage").attr("page"));
				var textjumppage=parseInt($(".textjumppage").val());
				if(textjumppage<=maxtotalpage){
					$.post("${path}LiebieServlet",{"op":"init","VIDEOTITLE":VIDEOTITLE,"page":$(".textjumppage").val()},function(leibieData,status){
						init(leibieData);
					});
					return;
				}
				
			}
			$.post("${path}SearchServlet",{"op":"init","VIDEOTITLE":VIDEOTITLE,"page":1},function(leibieData,status){
				init(leibieData);
			});
		});
		
		$(document).on("click",".sousuosubmit",function(index){
			document.getElementById("searchform").submit();
		});
		
	});
	
	function init(pageData){
		$(".search-result").empty();
		$(".pagelistbox").empty();
		if(pageData==-1){
			$(".search-result").append("<br/><span>暂无数据</span>");
			return;
		}
		$(".textjumppage").val("");
		$.each(pageData.data,function(index,data){
			$(".search-result").append("<li class='video matrix'><a"+
					"href=''"+
					"target='_blank' se-linkid='video_img_3'"+
					"title='"+data.VIDEOTITLE+"' lnk-type='video'>"+
					"<div class='img'>"+
					"<img data-loaded='true' src='"+data.VIDEOCOVERURL+"'>"+
					"</div>"+
					"</a><div class='info'>"+
					"<div class='headline '>"+
					"<a class='title' title='"+data.VIDEOTITLE+"'"+
					"href=''"+
					"target='_blank' se-linkid='video_title_3' lnk-type='video'>"+data.VIDEOTITLE+
					" </a></div>"+
					"<div class='tags'>"+
					"<span class='so-icon watch-num' title='观看'>播放数：<i"+
					"class='icon-playtime'></i> "+data.VIDEOPLAYCOUNT+
					"</span>"+
					"<span class='so-icon' title='up主'> <i class='icon-uper'></i>"+
					"<a href='https://space.bilibili.com/652315?from=search&amp;seid=5875834396625243676'"+
					"class='up-name' target='_blank' se-linkid='video_3_7562545_up'>〈一方通行〉</a>"+
					"</span>"+
					"</div>"+
					"</div></li>");
		});
		
		if(pageData.data==null){
			return;
		}
		if(pageData.page>1){
			$(".pagelistbox").append("<a class='p' page='"+(pageData.page-1)+"'>上一页</a>");
		}
		if(pageData.page == 1){
			$(".pagelistbox").append("<a class='p  active' page='1'>1</a>");
		}else{
			$(".pagelistbox").append("<a class='p' page='1'>1</a>");
		}
		if((pageData.page-2)>2){
			$(".pagelistbox").append("<strong>...</strong>");
		}
		for(var i=(pageData.page-2); i<(pageData.page+2);i++){
			if(i>=2 && i<pageData.totalPage ){
				if(pageData.page==i){
					$(".pagelistbox").append("<a class='p  active' page='"+i+"'>"+i+"</a>");
				}else{
					$(".pagelistbox").append("<a class='p' page='"+i+"'>"+i+"</a>");
				}
			}
		}
		if((pageData.page+2)< (pageData.totalPage-1)){
			$(".pagelistbox").append("<strong>...</strong>");
		}
		if(pageData.totalPage > 1){
			if(pageData.page==pageData.totalPage){
				$(".pagelistbox").append("<a class='p active maxtotalpage' page='"+pageData.totalPage+"'>"+pageData.totalPage+"</a>");
			}else{
				$(".pagelistbox").append("<a class='p maxtotalpage' page='"+pageData.totalPage+"'>"+pageData.totalPage+"</a>");
			}
			
		}
		if(pageData.page<pageData.totalPage){
			$(".pagelistbox").append("<a class='p' page='"+(pageData.page+1)+"'>下一页</a>");
		}
		$(".pagelistbox").append("<div class='custom-right'>"+
				"<span class='result custom-right-inner'>共 "+pageData.totalPage+" 页/ "+pageData.total+" 个 ，</span>"+
				"<input type='text' class='b-input custompage custom-right-inner textjumppage'>"+
				"<span class='custom-right-inner'>页</span>"+
				"<input type='button' class='b-input custompage custom-right-inner jumppage' value='跳页'/> </div>");
		
	}
	
	
	
	</script>


</head>

<body class="report-wrap-module old-ver" data-cur_page="1"
	data-num_pages="1" data-total="9" data-keyword="三大哈就是"
	data-seid="5875834396625243676" data-errcode="" data-listtype="false"
	data-trackid_special="5875834396625243676"
	data-trackid="5875834396625243676">
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

	<div style="height: 44px;" class="js-search-wrap">

		<div id="search-wrap" class="" style="display: block;">
			<div id="header-search">
				<div class="logo-input">
					<a href="${path}front/img/web-log.png" id="logo"
						class="search-logo" se-linkid="s-logo"> <span class="ir"
						se-linkid="s-btn-top">bilibili | 搜索</span>
					</a>
					<div id="search-block">
						<i class="loupe" se-linkid="s-btn-loupe"></i>
						<form id="searchform" action="${path}front/sousuo.jsp" target="_blank">
						<div class="input-wrap">
							<input type="text" value="" id="search-keyword" name="VIDEOTITLE"
								autocomplete="off" style="height: 45px;" placeholder="请输入视频标题">
							<div class="bilibili-suggest"
								style="left: 0px; display: none; margin-top: 5px;"></div>
						</div>

						<div id="search-button">
							<span class="sousuosubmit">搜索</span>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="nav-sub">
		<ul class="wrap">
			<li class="sub active" se-linkid="cls-all">结果</li>
			<div class="hover-bar" style="left: 0px; display: block;"></div>
		</ul>
	</div>

	<div class="vague-tag"></div>
	<!--  -->

	<div class="so-wrap" style="position: relative;">
		<div class="so-info no-num">
			<div class="switch">
				<span class="aver js-video-switch active" se-linkid="switch-matrix">
					<i class="icon-aver "></i>
				</span> <span class="imgleft js-video-switch " se-linkid="switch-list">
					<i class="icon-imgleft"></i>
				</span>
			</div>
		</div>
		<ul class="ajax-render search-result" style="width: 1100px;">
			<!-- 内容 -->
			<br/>
			<span>暂无数据</span>
		</ul>
		
		<br/>
		<div class="pagelistbox fenye">
										
		</div>
	</div>

	<div class="no-result " style="display: none;">
		<p class="text"></p>
	</div>
	<div class="recom-wrap" style="display: none;"></div>

	<div class="paging-wrap" style="display: none;">
		<div class="s-paging">
			<ul id="video-paging">
				<span class="disabled" style="display: none;">上一页</span>
				<span class="current">1</span>
				<span class="disabled" style="display: none;">下一页</span>
			</ul>
		</div>
	</div>
	<div class="rocket-con" style="bottom: 348px;">
		<div class="so-rocket">
			<i class="rocket-icon" style="display: none;"></i>
		</div>
	</div>
	<div class="footer">
		<div class="footer-wrp">
			<div class="footer-cnt clearfix">
				<div class="partner">
					<div class="block left" style="padding-top: 0px;">
						<div class="partner-banner"></div>
					</div>
					<div class="block left"
						style="margin: 0px 68px 0 115px; line-height: 24px; float: none;">
						<p>
							广播电视节目制作经营许可证：<span>（沪）字第1248号 </span> | 网络文化经营许可证：<span>沪网文[2013]0480-056号</span>
							| 信息网络传播视听节目许可证：<span>0910417</span> | 互联网ICP备案：<span>沪ICP备13002172号-3</span>
							沪ICP证： <span>沪B2-20100043</span> | 违法不良信息举报邮箱：help@bilibili.com |
							违法不良信息举报电话：4000233233转3
						</p>
						<p>
							<a href="http://www.shjbzx.cn/" target="_blank">
							<i class="icons-footer icons-footer-report"></i>
							<span>上海互联网举报中心</span>
							</a> | 
							<a href="http://jb.ccm.gov.cn/" target="_blank">12318全国文化市场举报网站 </a> | 
							<a target="_blank" href=" "><img src=" " style="vertical-align: top;">
							 沪公网安备 31011502001911号</a> | 
							 <a href="mailto:userreport@bilibili.com">儿童色情信息举报专区</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- 外部弹框 -->
		<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css" media="all">
		<script src="http://res.layui.com/layui/release/layer/dist/layer.js?v=310"></script>
		<link rel="stylesheet" type="text/css" href="${path}front/css/mybootstrap.css"/>
		<script type="text/javascript" src="//cdn.staticfile.org/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
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
</body>

</html>