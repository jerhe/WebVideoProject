<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getLocalPort() + request.getContextPath()
			+ "/";
	//折中处理一下
	pageContext.setAttribute("path",path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hans">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别详情页</title>
<meta name="renderer" content="webkit">
<meta name="baidu-site-verification" content="gbRdPloQBZ">
<meta name="spm_prefix" content="333.334">
<link rel="shortcut icon"
	href="https://static.hdslb.com/images/favicon.ico">
<script type="text/javascript" src="${path}front/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilimain.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/home.21d3fc64.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilifooter.css" />
<script type="text/javascript">
			//定时器 异步运行 
			bannercount = 0;

			function adbanner() {
				$(".adbannerimg").css("margin-left", "-" + bannercount + "00%");
				$(".adbannertitle>a").removeClass("on");
				$(".adbannertitle>a").eq(bannercount).addClass("on");
				$(".adbannertrig>span").removeClass("on");
				$(".adbannertrig>span").eq(bannercount).addClass("on");
				bannercount = (bannercount + 1) % 4;
			}
			//使用方法名字执行方法 
			var t2 = window.setInterval("adbanner()", 3000);

			/*trig点击事件*/
			$(function() {
				$(".adbannertrig>span").each(function(index) {
					$(this).click(function() {
						bannercount = index;
						$(".adbannerimg").css("margin-left", "-" + bannercount + "00%");
						$(".adbannertitle>a").removeClass("on");
						$(".adbannertitle>a").eq(bannercount).addClass("on");
						$(".adbannertrig>span").removeClass("on");
						$(".adbannertrig>span").eq(bannercount).addClass("on");
					});
				});
			});
		</script>
</head>

<body>
	<div class="z-top-container has-banner report-wrap-module"
		id="home_nav">
		<div class="z_top b-header-blur white">
			<div class="b-header-mask-wrp">
				<div class="b-header-mask-bg"
					style="background-image: url(&quot;${path}front/img/headimg.png&quot;);"></div>
				<div class="b-header-mask"></div>
			</div>
			<div class="z_header">
				<div class="z_top_nav">
					<ul>
						<li class="home"><a class="i-link"
							href="${path}front/home.jsp"><span>主站</span></a></li>

					</ul>
				</div>
				<div class="uns_box">
					<ul class="menu">

						<li class="u-i i_user" id="i_menu_login_reg" guest="yes"
							style="display: list-item;"><a id="login_default_face"
							href="${path}front/user/index.jsp"> <c:if
									test="${user != null}">
									<img class="i_face" src="${user.HEADIMG}"></a> </c:if> <c:if
								test="${user == null}">
								<img class="i_face" src="${path}front/img/akari.jpg">
								</a>
							</c:if>
							<div class="i_menu" id="i_menu_login">
								<a class="login-btn" href="${path}front/user/index.jsp">登录</a>
							</div></li>

						<li class="u-i b-post"><c:if test="${user != null}">
								<a class="i-link">菜 单</a>
								<ul class="s-menu show-audio">
									<li><a href="${path}front/home.jsp"><i
											class="b-icon b-icon-art"></i><em>首页</em></a></li>
									<li class="tougaohead"><a><i class="b-icon b-icon-art"></i><em>投稿</em></a>
									</li>
									<li class="upimghead"><a><i class="b-icon b-icon-vp"></i><em>更换头像</em></a>
									</li>
									<li class="ziliaohead"><a><i class="b-icon b-icon-ap"></i><em>资料</em></a>
									</li>

									<li class="tuichuhead"><a><i class="b-icon b-icon-vm"></i><em>退出</em></a>
									</li>
								</ul>
							</c:if> <c:if test="${user == null}">
								<a href="${path}front/user/index.jsp" class="i-link">登 录</a>
							</c:if> <i class="up-new"></i></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="header"
			style="background-image: url(&quot;${path}front/img/headimg.png&quot;);">
			<div class="header-layer"></div>
			<a class="header-link" target="_blank" href="javascript:;"
				data-loc-id="142"></a>
			<div class="h-center">
				<a class="logo" href="${path}front/home.jsp"
					style="background-image: url(&quot;${path}front/img/sp1.png&quot;);"></a>
				<div class="banner-title" style="display: none;"></div>
				<div class="search">
					<form id="searchform" action="${path}front/sousuo.jsp"
						target="_blank">
						<input class="search-keyword" id="search-keyword"
							name="VIDEOTITLE" type="text" autocomplete="off" accesskey="s"
							x-webkit-speech="" x-webkit-grammar="builtin:translate"
							placeholder="请输入视频标题" data-recommend="av15037668">
						<button class="search-submit" type="submit"></button>
					</form>
					<a class="link-ranking" href="${path}front/paihangbang.jsp"
						target="_blank"><span>排行榜</span></a>
				</div>
			</div>
		</div>
	</div>
	<div id="home-app"></div>
	<div id="app" class="bili-wrapper">
		<!-- 轮播 -->
		<div id="primary_menu"
			class="primary-menu report-wrap-module report-scroll-module ">
			<!--副导航栏-->
			<ul class="nav-menu">

				<!--动画-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=2" class="nav-link">
						<div class="nav-name">动画</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=11"
							class="sub-nav-link"><span>MAD·AMV<i class="arrow"></i></span></a>
						</li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=12"
							class="sub-nav-link"><span>MMD·3D<i class="arrow"></i></span></a>
						</li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=13"
							class="sub-nav-link"><span>短片·手书·配音<i class="arrow"></i></span></a>
						</li>
					</ul></li>

				<!--国创-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=3" class="nav-link">
						<div class="nav-name">国创</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=18"
							class="sub-nav-link"><span>国产动画<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=19"
							class="sub-nav-link"><span>布袋戏<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=20"
							class="sub-nav-link"><span>资讯<i class="arrow"></i></span></a></li>
					</ul></li>
				<!--音乐-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=4" class="nav-link">
						<div class="nav-name">音乐</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=21"
							class="sub-nav-link"><span>原创音乐<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=22"
							class="sub-nav-link"><span>翻唱<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=23"
							class="sub-nav-link"><span>演奏<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=24"
							class="sub-nav-link"><span>三次元音乐<i class="arrow"></i></span></a>
						</li>

					</ul></li>
				<!--科技-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=5" class="nav-link">
						<div class="nav-name">科技</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=25"
							class="sub-nav-link"><span>纪录片<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=26"
							class="sub-nav-link"><span>科普人文<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=27"
							class="sub-nav-link"><span>野生协会<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=28"
							class="sub-nav-link"><span>数码<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=29"
							class="sub-nav-link"><span>机械<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=30"
							class="sub-nav-link"><span>汽车<i class="arrow"></i></span></a></li>
					</ul></li>
				<!--生活-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=6" class="nav-link">
						<div class="nav-name">生活</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=31"
							class="sub-nav-link"><span>搞笑<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=32"
							class="sub-nav-link"><span>日常<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=33"
							class="sub-nav-link"><span>美食圈<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=34"
							class="sub-nav-link"><span>动物圈<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=35"
							class="sub-nav-link"><span>运动<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=36"
							class="sub-nav-link"><span>其他<i class="arrow"></i></span></a></li>

					</ul></li>
				<!--鬼畜-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=7" class="nav-link">
						<div class="nav-name">鬼畜</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=37"
							class="sub-nav-link"><span>鬼畜调教<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=38"
							class="sub-nav-link"><span>音MAD<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=39"
							class="sub-nav-link"><span>人力VOCALOID<i class="arrow"></i></span></a>
						</li>

					</ul></li>
				<!--娱乐-->
				<li class="nav-item"><a
					href="${path}front/leibie.jsp?VIDEOTYPEID=8" class="nav-link">
						<div class="nav-name">娱乐</div>
				</a>
					<ul class="sub-nav">
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=40"
							class="sub-nav-link"><span>综艺<i class="arrow"></i></span></a></li>
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=41"
							class="sub-nav-link"><span>明星<i class="arrow"></i></span></a></li>
					</ul></li>
				<!--影视-->
				<li class="nav-item"><a
					href="${path}front/leibiemin.jsp?VIDEOTYPEID=9" class="nav-link">
						<div class="nav-name">电影</div>
				</a></li>

			</ul>

		</div>

		<div class="sub-nav-m">
			<ul class="clearfix">
				<li class="on"><a
					href="${path}front/leibiemin.jsp?VIDEOTYPEID=10">全部</a></li>
			</ul>
		</div>
		<!-- 内容 -->
		<div class="channel-m"></div>

	</div>
	<!--分类-->
	<link rel="stylesheet" type="text/css"
		href="${path}front/css/channel.da8f049c.css" />
	<script src="${path}front/js/jquery.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
			$(function(){
				
				var videoTypeId=GetQueryString("VIDEOTYPEID");
				 /* 做个判断type是否有值如果没有值跳转到首页 */
				if(videoTypeId==null){
					window.location.href='${path}/front/home.jsp';
					return;
				}
				$(".nav-item").removeClass("channel on");
				$(".nav-item").eq(videoTypeId-1).addClass("channel on");
				$.post("${path}LiebieServlet",{"op":"initbig","VIDEOTYPEID":videoTypeId},function(bigleibieData,status){
					$.each(bigleibieData.listType,function(index,data){
						$(".clearfix").eq(0).append("<li><a href='${path}front/leibiemin.jsp?VIDEOTYPEID="+data.VIDEOTYPEID+"'>"+data.VIDEOTYPENAME+"</a></li>");
					});
					
					$.each(bigleibieData.listType,function(index,data){
						$(".channel-m").append("<div class='sub-zone-m clearfix report-wrap-module report-scroll-module'>"+
								"<div class='clearfix'>"+
								"<div class='video-floor-m l-con'>"+
								"<div class='zone-title'>"+
								"<div class='headline clearfix'>"+
								"<a href='${path}front/leibiemin.jsp?VIDEOTYPEID="+bigleibieData.listType[index].VIDEOTYPEID+"' class='name'>"+bigleibieData.listType[index].VIDEOTYPENAME+"</a>"+
								"<a href='${path}front/leibiemin.jsp?VIDEOTYPEID="+bigleibieData.listType[index].VIDEOTYPEID+"' target='_blank' class='link-more'>更多<i class='icon'></i></a>"+
								"</div>"+
								"</div>"+
								"<div class='storey-box clearfix leibienr"+bigleibieData.listType[index].VIDEOTYPEID+"' style='height:504px;'>"+
								"</div>"+
								"</div>"+
								"<div class='r-con'>"+
								"<section class='sec-rank'>"+
								"<header class='rank-head'>"+
								"<h3>热门</h3>"+
								"</header>"+
								"<div class='rank-list-wrap'>"+
								"<ul class='rank-list hot-list leibieph"+bigleibieData.listType[index].VIDEOTYPEID+"'>"+
								"</ul>"+
								"<ul class='rank-list origin-list'>"+
								"<li class='state'>"+
								"<div class='b-loading'>"+
								"</div>"+
								"</li>"+
								"</ul>"+
								"</div>"+
								"<a href='${path}front/paihangbang.jsp?VIDEOTYPEID="+videoTypeId+"' target='_blank' class='more-link'>查看更多<i class='icon icon-arrow-r'></i></a>"+
								"</section>"+
								"</div>"+
								"</div>"+
								"</div>");
					});
					
					/*内容 */
					 $.each(bigleibieData.listType,function(index,data){
						$.each(bigleibieData.bigleibieData[data.VIDEOTYPEID].nrData,function(index2,data){
							$(".leibienr"+data.VIDEOTYPEID).append("<div class='spread-module'>"+
									"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
									"<div class='pic'>"+
									"<div class='lazy-img'><img alt='"+data.VIDEOTITLE+"' src='"+data.VIDEOCOVERURL+"'></div><i class='icon medal '></i>"+
									"<div class='cover-preview-module'>"+
									"<div class='progress-bar'><span style='width: 0%;'></span></div>"+
									"</div>"+
									"<div class='mask-video'></div>"+
									"<div class='watch-later-trigger w-later'></div>"+
									"</div>"+
									"<p title='"+data.VIDEOTITLE+"' class='t'>"+data.VIDEOTITLE+"</p>"+
									"<p class='num'><span class='play'><i class='icon'></i>"+data.VIDEOPLAYCOUNT+"</span></p>"+
									"</a></div>");
						});
						/* 排行榜 */
						$.each(bigleibieData.bigleibieData[data.VIDEOTYPEID].phData,function(index2,data){
							$(".leibieph"+data.VIDEOTYPEID).append("<li class='rank-item highlight'><i class='ri-num'>"+(index2+1)+"</i>"+
									"<a href='https://www.bilibili.com/video/av15259907/' target='_blank' title='"+data.VIDEOTITLE+" 播放:"+data.VIDEOPLAYCOUNT+"' class='ri-info-wrap clearfix'>"+
									"<div class='ri-detail'>"+
									"<p class='ri-title'>"+data.VIDEOTITLE+"</p>"+
									"</div>"+
									"</a>"+
									"</li>");
						}); 
						
						
					});
					
					
			 	}); 
				
				
			});	
			
			 /* 获取url中的数据 */
			 function GetQueryString(name)
			{
				  var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				  var r = window.location.search.substr(1).match(reg);
				  if(r!=null)return  unescape(r[2]); return null;
			}
		</script>


	<div class="footer bili-footer report-wrap-module" id="home_footer">
		<div class="footer-wrp">
			<div class="footer-cnt clearfix">

				<div class="partner">
					<div class="block left" style="padding-top: 0px;">
						<div class="partner-banner"></div>
					</div>
					<div class="block left"
						style="margin: 0px 68px 0 115px; line-height: 24px; float: none;">
						<p>
							广播电视节目制作经营许可证：<span>（沪）字第1248号</span> | 网络文化经营许可证：<span>沪网文[2013]0480-056号</span>
							| 信息网络传播视听节目许可证：<span>0910417</span> | 互联网ICP备案：<span>沪ICP备13002172号-3</span>
							沪ICP证：<span>沪B2-20100043</span> | 违法不良信息举报邮箱：help@bilibili.com |
							违法不良信息举报电话：4000233233转3
						</p>
						<p>
							<a href="http://www.shjbzx.cn/" target="_blank"><i
								class="icons-footer icons-footer-report"></i><span>
									上海互联网举报中心</span></a> | <a href="http://jb.ccm.gov.cn/" target="_blank">12318
								全国文化市场举报网站</a> | <a target="_blank"
								href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011502001911"><img
								src="./哔哩哔哩 (゜-゜)つロ 干杯_-bilibili_files/beiantubiao.png"
								style="vertical-align: top;"> 沪公网安备 31011502001911号 |</a> <a
								href="mailto:userreport@bilibili.com">儿童色情信息举报专区</a>
						</p>
						<p>
							<a
								href="http://report.12377.cn:13225/toreportinputNormal_anis.do"
								target="_blank">网上有害信息举报专区：<img
								src="./哔哩哔哩 (゜-゜)つロ 干杯_-bilibili_files/12377.png" width="16"
								height="16" style="vertical-align: sub;"> 中国互联网违法和不良信息举报中心
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<ul class="bilibili-suggest"
		style="top: 154px; left: 894.5px; display: none; min-width: 268px; max-width: 360px;">

	</ul>

	<!-- 外部弹框 -->
	<link rel="stylesheet"
		href="http://res.layui.com/layui/dist/css/layui.css" media="all">
	<script
		src="http://res.layui.com/layui/release/layer/dist/layer.js?v=310"></script>
	<link rel="stylesheet" type="text/css"
		href="${path}front/css/mybootstrap.css" />
	<script type="text/javascript"
		src="//cdn.staticfile.org/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>

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
					  content: "<form class='form-horizontal' method='post'  action='${path}FrontUserServlet'>"+	
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
					  	"<button type='submit' class='btn btn-primary' id='save'>保存</button>"+
					  	"</div>"+
					  	"</div>"+
			        	"</form>"
					});
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