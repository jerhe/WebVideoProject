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
<title>SP IMAX首页</title>

<link rel="shortcut icon" href="${path}front/img/home/favicon.ico">
<script type="text/javascript" src="${path}front/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilimain.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/home.21d3fc64.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilifooter.css" />


<script type="text/javascript">
		//定时器 异步运行 
		bannercount=0;
		function adbanner(){
		$(".adbannerimg").css("margin-left","-"+bannercount+"00%");
		$(".adbannertitle>a").removeClass("on");
		$(".adbannertitle>a").eq(bannercount).addClass("on");
		$(".adbannertrig>span").removeClass("on");
		$(".adbannertrig>span").eq(bannercount).addClass("on");
		bannercount=(bannercount+1)%5;
		} 
		//使用方法名字执行方法 
		var t2 = window.setInterval("adbanner()",3000); 
			
		/*trig点击事件*/
		$(function(){
			$(".adbannertrig>span").each(function(index){
				$(this).click(function(){
					bannercount=index;
					$(".adbannerimg").css("margin-left","-"+bannercount+"00%");
					$(".adbannertitle>a").removeClass("on");
					$(".adbannertitle>a").eq(bannercount).addClass("on");
					$(".adbannertrig>span").removeClass("on");
					$(".adbannertrig>span").eq(bannercount).addClass("on");
				});
			});
		});
		
		/* 初始化数据相关 */
		/* 1初始化动画的内容数据 */
		$(function(){
			/* 头部初始化 */
			$.post("${path}HomeServlet",{"op":"headinit"},function(data,status){
				$(".headvideo").empty();
				$.each(data,function(index,data){
					$(".headvideo").append("<div class='groom-module home-card'>"+
							"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank' title='"+data.VIDEOTITLE+"'><img src='"+data.VIDEOCOVERURL+"' alt='"+data.VIDEOTITLE+"' width='160' height='100' class='pic'>"+
							"<div class='card-mark'>"+
							"<p class='title'>"+data.VIDEOTITLE+"</p>"+
							"<p class='author'>up主："+data.USERNAME+"</p>"+
							"<p class='play'>播放："+data.VIDEOPLAYCOUNT+"</p>"+
							"</div>"+
							"</a>"+
							"<div class='watch-later-trigger w-later'></div>"+
							"</div>");
				
				});
		 	});
			
			/* 动画 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"2"},function(homeData,status){
				initFeilei(".donghua",homeData)
		 	});
			
			/* 国创 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"3"},function(homeData,status){
				initFeilei(".guochuang",homeData);
		 	});
			/* 音乐 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"4"},function(homeData,status){
				initFeilei(".yinyue",homeData);
		 	});
			/* 科技 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"5"},function(homeData,status){
				initFeilei(".keji",homeData);
		 	});
			/* 生活 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"6"},function(homeData,status){
				initFeilei(".shenghuo",homeData);
		 	});
			/* 鬼畜 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"7"},function(homeData,status){
				initFeilei(".guichu",homeData);
		 	});
			/* 娱乐 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"8"},function(homeData,status){
				initFeilei(".yule",homeData);
		 	});
			/* 电影 */
			$.post("${path}HomeServlet",{"op":"init","VEDIOTYPEID":"9"},function(homeData,status){
				initFeilei(".dianying",homeData);
		 	});
		});
		
		$(function(){
			/* 导航的菜单栏相关 */
			$(document).on("click",".tuichuhead",function(index){
				$.post("${path}FrontUserServlet",{"op":"exit"},function(data,status){
					window.location.href='${path}front/home.jsp';
			 	});
			});
			
		});
		
		
		function initFeilei(target,flData) {
			$(target+"nr").empty();
			$(target+"ph").empty();
			$.each(flData.nrData,function(index,data){
				/* 每个动画的内容 */
				//alert(data.VIDEOTITLE);
				$(target+"nr").append("<div class='spread-module'>"+
						"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
						"<div class='pic'>"+
						"<div class='lazy-img'><img alt='"+data.VIDEOTITLE+"' src='"+data.VIDEOCOVERURL+"'></div><i class='icon medal '></i>"+
						"<div class='cover-preview-module'>"+
						"<div class='progress-bar'><span style='width: 0%;'></span></div>"+
						"</div>"+
						"<div class='mask-video'></div>"+
						"<div class='danmu-module'></div><span class='dur'>23:24</span>"+
						"<div class='watch-later-trigger w-later'></div>"+
						"</div>"+
						"<p title='"+data.VIDEOTITLE+"' class='t'>"+data.VIDEOTITLE+"</p>"+
						"<p class='num'><span class='play'><i class='icon'></i>"+data.VIDEOPLAYCOUNT+"</span></p>"+
						"</a></div");
			
			});
			$.each(flData.phData,function(index,data){
				/* 排行榜相关 */
				if(index == 0 ){
					$(target+"ph").append("<li class='rank-item  show-detail first highlight'><i class='ri-num'>"+(index+1)+"</i>"+
							"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank' title='"+data.VIDEOTITLE+" 播放量:"+data.VIDEOPLAYCOUNT+"' class='ri-info-wrap clearfix'>"+
							"<div class='lazy-img ri-preview'>"+
							"<img alt='"+data.VIDEOTITLE+"' src='"+data.VIDEOCOVERURL+"'></div>"+
							"<div class='ri-detail'>"+
							"<p class='ri-title'>"+data.VIDEOTITLE+"</p>"+
							"<p class='ri-point'>播放量："+data.VIDEOPLAYCOUNT+"</p>"+
							"</div>"+
							"<div class='watch-later-trigger w-later'></div>"+
							"</a>"+
							"</li>");
				}else{
					$(target+"ph").append("<li class='rank-item  highlight'><i class='ri-num'>"+(index+1)+"</i>"+
							"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank' title='"+data.VIDEOTITLE+" 播放:"+data.VIDEOPLAYCOUNT+"' class='ri-info-wrap clearfix'>"+
							"<div class='ri-detail'>"+
							"<p class='ri-title'>"+data.VIDEOTITLE+"</p>"+
							"<p class='ri-point'>播放量："+data.VIDEOPLAYCOUNT+"</p>"+
							"</div>"+
							"</a>"+
							"</li>");
				}
			});
		}
			
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
		<!--轮播右侧-->
		<div id="chief_recommend"
			class="chief-recommend-module report-wrap-module report-scroll-module clearfix">
			<div class="carousel-box">
				<!--轮播-->
				<div class="carousel-module">
					<div class="panel">
						<ul class="pic adbannerimg" style="width: 500%; margin-left: 0%;">
							<li data-id="88962" data-loc-id="23" class="scrollx"><a">
									<div class="lazy-img">
										<img alt="" src="./img/home/banner1.png">
									</div>
							</a> <a class="more-text">更多</a></li>
							<li data-id="88818" data-loc-id="23" class="scrollx"><a>
									<div class="lazy-img">
										<img alt="" src="./img/home/banner2.png">
									</div>
							</a> <a class="more-text">更多</a></li>
							<li data-id="87990" data-loc-id="23" class="scrollx"><a>
									<div class="lazy-img">
										<img alt="" src="./img/home/banner3.png">
									</div>
							</a> <a class="more-text">更多</a></li>
							<li data-id="87912" data-loc-id="23" class="scrollx"><a>
									<div class="lazy-img">
										<img alt="" src="./img/home/banner4.png">
									</div>
							</a> <a class="more-text">更多</a></li>
							<li data-id="86688" data-loc-id="23" class="scrollx"><a>
									<div class="lazy-img">
										<img alt="" src="./img/home/banner5.png">
									</div>
							</a> <a class="more-text">更多</a></li>
						</ul>
						<ul class="title adbannertitle">
							<a href="#" class=""> <!----> 萌节来袭！
							</a>
							<a href="#" class=""> <!----> 航海游戏！
							</a>
							<a href="#" class=""> <!----> 出去走走吧-3-~
							</a>
							<a href="#" class=""> <!----> 不如来追番！
							</a>
							<a href="#" class=""> <!----> 欢迎来到凹凸世界~
							</a>
						</ul>
						<ul class="trig adbannertrig">
							<span class="on"></span>
							<span class=""></span>
							<span class=""></span>
							<span class=""></span>
							<span class=""></span>
						</ul>
					</div>
				</div>
			</div>
			<div class="recommend-module clearfix headvideo"></div>
		</div>

		<!--动画详细-->
		<div id="bili_douga"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<div class="new-comers-module l-con">
					<!-- 动画模块的标题 -->
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-douga"></i> <a href="#" class="name">动画</a>
							<a href="#" target="_blank" class="fire"><i
								class="icon pmt-icon"></i> [2017年秋]新番介绍 </a> <a href="#"
								target="_blank" class="link-more"> 更多 <i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<!-- 模块的内容开始 -->
					<div class="storey-box clearfix donghuanr">
						<!---->

						<!-- 模块的内容开始 -->
					</div>
				</div>
				<!--动画排行榜-->
				<section id="ranking_douga"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list donghuaph">
						<!--排行榜内容 -->

					</ul>
					<!-- 没有数据的时候加载数未定 -->
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<!-- 跳转的排行榜页面 --> <a
					href="${path}/front/paihangbang.jsp?VIDEOTYPEID=2" target="_blank"
					class="more-link">查看更多<i class="icon icon-arrow-r"></i></a> </section>

			</div>
		</div>

		<!--国创详细-->
		<div id="bili_guochuang"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="guochuang-module">
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix">
							<i class="icon icon_t icon-guochuang"></i> <a href=""
								class="name">国创</a> <a href="" target="_blank" class="link-more">
								更多 <i class="icon"></i>
							</a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix guochuangnr">
						<!---->

					</div>
				</div>
				<section id="ranking_guochuang"
					class="sec-rank report-wrap-module zone-rank-gc"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list guochuangph">
						<!---->

					</ul>
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=3"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>
		<!--音乐详细-->
		<div id="bili_music"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-music"></i> <a href="" class="name">音乐</a>
							<a class="fire"><i class="icon pmt-icon"></i> 看完你还觉得了解乐器的音色吗？</a>
							<a class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix yinyuenr">
						<!---->

					</div>
				</div>
				<section id="ranking_music"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list yinyueph">
						<!---->

					</ul>

					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=4"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>
		<!--科技详细-->
		<div id="bili_technology"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-technology"></i> <a href=""
								class="name">科技</a> <a class="fire"><i class="icon pmt-icon"></i>
								你身上的微生物是如何统治你的？</a> <a class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix kejinr">
						<!---->


					</div>
				</div>
				<section id="ranking_technology"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>

				</header>
				<div class="rank-list-wrap ">
					<ul class="rank-list hot-list kejiph">
						<!---->

					</ul>

					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=5"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>

		<!--生活详细-->
		<div id="bili_life"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-life"></i> <a href="" class="name">生活</a>
							<a class="fire"><i class="icon pmt-icon"></i> 我要代表月亮消灭你！</a> <a
								class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix shenghuonr">
						<!---->

					</div>
				</div>
				<section id="ranking_life"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list shenghuoph">
						<!---->


					</ul>
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=6"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>
		<!--鬼畜详细-->
		<div id="bili_kichiku"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-kichiku"></i> <a class="name">鬼畜</a> <a
								class="fire"><i class="icon pmt-icon"></i> 跟老白一起说江湖话</a> <a
								class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix guichunr">
						<!---->

					</div>
				</div>
				<!--排行榜-->
				<section id="ranking_kichiku"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list guichuph">
						<!---->

					</ul>
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=7"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>
		<!--娱乐详细-->
		<div id="bili_ent"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-ent"></i> <a href="" class="name">娱乐</a>
							<a class="fire"><i class="icon pmt-icon"></i> 王刚、王琳再现经典角色</a> <a
								class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix yulenr"></div>
				</div>
				<!--排行榜-->
				<section id="ranking_ent"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list yuleph">
						<!---->

					</ul>
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=8"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>
		<!--电影详细-->
		<div id="bili_movie"
			class="zone-wrap-module report-wrap-module report-scroll-module clearfix">
			<div class="zone-module">
				<!---->
				<div class="new-comers-module l-con">
					<div class="zone-title">
						<div class="headline clearfix ">
							<i class="icon icon_t icon-movie"></i> <a class="name">电影</a> <a
								class="fire"><i class="icon pmt-icon"></i> 来自糸守町的秋日谢礼！</a> <a
								class="link-more">更多<i class="icon"></i></a>
							<div class="read-push">
								<i class="icon icon_read"></i>
							</div>
						</div>
					</div>
					<div class="storey-box clearfix dianyingnr">
						<!---->

					</div>
				</div>
				<section id="ranking_movie"
					class="sec-rank report-wrap-module zone-rank"> <header
					class="rank-head">
				<h3>排行</h3>
				</header>
				<div class="rank-list-wrap">
					<ul class="rank-list hot-list dianyingph">
						<!---->

					</ul>
					<ul class="rank-list origin-list">
						<li class="state">
							<div class="b-loading">
								<!---->
								<!---->
							</div>
						</li>
					</ul>
				</div>
				<a href="${path}/front/paihangbang.jsp?VIDEOTYPEID=9"
					target="_blank" class="more-link">查看更多<i
					class="icon icon-arrow-r"></i></a> </section>
			</div>
		</div>

		<!--悬浮条相关-->
		<div class="elevator-module" style="top: 124px;">
			<div class="nav-bg">
				<div class="tips-img"></div>
			</div>
			<div class="nav-list">
				<div data-to="bili_douga" class="item sortable">动画</div>
				<div data-to="bili_guochuang" class="item sortable">国创</div>
				<div data-to="bili_music" class="item sortable">音乐</div>
				<div data-to="bili_technology" class="item sortable">科技</div>
				<div data-to="bili_game" class="item sortable">游戏</div>
				<div data-to="bili_life" class="item sortable">生活</div>
				<div data-to="bili_kichiku" class="item sortable">鬼畜</div>
				<div data-to="bili_ent" class="item sortable">娱乐</div>
				<div data-to="bili_movie" class="item sortable">电影</div>
			</div>
			<div class="s-line"></div>
			<div class="back-top icon"></div>
			<div class="app-download">
				<div class="app-icon"></div>
				<div class="app-tips-icon"></div>
			</div>
		</div>
		<!---->
		<!---->
		<!---->
	</div>

	<script type="text/javascript">
			
			
		
			/*滑到顶部*/
			$(".back-top").click(function () {
			        var speed=200;//滑动的速度
			        $('body,html').animate({ scrollTop: 0 }, speed);
			        return false;
			 });
			 
			/*滑动到指定的层*/
			$('.nav-list').on('click','div',function(e){
            var target = e.target;
            var id = $(target).data("to");
            $('html,body').animate({scrollTop:$('#'+id).offset().top}, 300);
        	});
        	
        	/*动画周榜更新*/
        	$(".fanjubanner>.bili-tab-item").click(function(){
        		$(".fanjubanner>.bili-tab-item").removeClass("on");
        		$(this).addClass("on");
        	});
        	
        	/*国创周榜更新*/
        	$(".bannerguochang>.bili-tab-item").click(function(){
        		$(".bannerguochang>.bili-tab-item").removeClass("on");
        		$(this).addClass("on");
        	});
        	
        	/*排行榜：
        	 * 0.动画排行1番剧排行2.国创排行3.音乐排行4科技排行
        	 * 5游戏排行6生活排行7鬼畜排行8娱乐排行9电影排行10电视剧排行*/
        	
        	$(".rank-dropdown").each(function(index){
        		$(".rank-dropdown>.dropdown-list>.dropdown-item").each(function(){
        			$(this).click(function(){
        				$(".rank-dropdown>.dropdown-list>.dropdown-item").removeAttr("style")
        				$(".rank-dropdown>.selected").eq(index).text(''+$(this).text());
        				/*display: none;*/
        				$(this).css("display","none");
        			});
        			
        		});
        	});
        
		</script>


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
								全国文化市场举报网站</a> | <a href="mailto:userreport@bilibili.com">儿童色情信息举报专区</a>
						</p>
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<ul class="bilibili-suggest"
		style="top: 154px; left: 894.5px; display: none; min-width: 268px; max-width: 360px;">

	</ul>



</body>

</html>