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
<title>SP IMAX排行榜</title>
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

<!--排行榜-->
<link rel="stylesheet" type="text/css"
	href="${path}front/cssvideo/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/cssplayer/page-core.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/cssvideo/rank.css" />

<script type="text/javascript">
			
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

		<div class="b-page-body">
			<div class="main-inner">
				<div class="rank-container">
					<div class="rank-head">
						<div class="rank-inner">
							<ul class="rank-menu" id="rank_menu">
								<li type="bangumi" class="on"><span
									class="rank-icon bangumi rqtype"></span><span class="txt">人气榜</span></li>
								<li type="all" class=""><span class="rank-icon all qztype"></span><span
									class="txt">全站榜</span></li>
								<li type="rookie" class=""><span
									class="rank-icon rookie newtype"></span><span class="txt">新发布</span></li>
							</ul>
						</div>
					</div>
					<div class="rank-body">
						<div class="rank-tab-wrp">
							<ul class="rank-tab" id="rank_catalogy_tab">
								<li value='2'>动画</li>
								<li value='3'>国创</li>
								<li value='4'>音乐</li>
								<li value='5'>科技</li>
								<li value='6'>生活</li>
								<li value='7'>鬼畜</li>
								<li value='8'>娱乐</li>
								<li value='9'>电影</li>
							</ul>
						</div>
						<!--主要内容-->
						<div class="rank-list-container">
							<!--公告-->
							<!--<div class="rank-list-head">
									<div class="rank-tip-wrp">
										<div id="rank_tips" style="display: block;">
											<i class="b-icon b-icon-tip"></i>
											<span class="tip-txt">统计所有投稿在 2017年10月09日 - 2017年10月12日 的数据综合得分，每日更新一次</span>
										</div>
									</div>
								</div>-->
							<!--具体内容-->
							<ul class="rank-list" id="rank_list" style="opacity: 1;">

							</ul>

						</div>

					</div>
				</div>
			</div>
		</div>

		<!---->
		<!---->
	</div>

	<script src="js/manifest.a11c8a55.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/vendor.67326039.js" type="text/javascript"
		charset="utf-8"></script>
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

	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
			if(!+"\v1") {
				document.body.innerHTML = "<div style='background: #00a1d6; text-align: center; padding: 10px 0; color: #fff;'>为了保护你的账号安全，bilibili已不支持IE8及以下版本浏览器访问，建议你升级到IE最新版本浏览器，或使用Chrome等其他浏览器。</div>"
			}
			
			$(function(){
				/*rank-menu点击事件*/
					$(".rank-menu>li").each(function(index) {
						$(this).click(function() {
							$(".rank-menu>li").removeClass("on");
							$(".rank-menu>li").eq(index).addClass("on");
							if(index==0){
								$(".rank-tab-wrp").remove();
								$(".rank-body").prepend("<div class='rank-tab-wrp'>"+
										"<ul class='rank-tab' id='rank_catalogy_tab'>"+
										"<li value='2'>动画</li>"+
										"<li value='3'>国创</li>"+
										"<li value='4'>音乐</li>"+
										"<li value='5'>科技</li>"+
										"<li value='6'>生活</li>"+
										"<li value='7'>鬼畜</li>"+
										"<li value='8'>娱乐</li>"+
										"<li value='9'>电影</li>"+
										"</ul>"+
										"</div>");
							}else{
								$(".rank-tab-wrp").remove();
								/* 获取全站排行 */
								if (index==1) {
									$.post("${path}PaiHangServlet",{"VEDIOTYPEID":"0"},function(paiHangData,status){
										$(".rank-list").empty();
										$.each(paiHangData.phData,function(index2,data){
											$(".rank-list").append("<li>"+
													"<div class='rank-item'>"+
													"<div class='num'>"+(index2+1)+"</div>"+
													"<div class='content clearfix'>"+
													"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
													"<div class='preview'>"+
													"<img data-img='' src='"+data.VIDEOCOVERURL+"' loaded='loaded' style='opacity: 1;'></div>"+
													"</a><i class='watch-later' aid='15245197'></i>"+
													"<div class='info '>"+
													"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
													"<div class='title'>"+data.VIDEOTITLE+"</div>"+
													"</a>"+
													"<div class='detail'>"+
													"<span class='data-box author'><i class='b-icon b-icon-v-author'></i>"+data.USERNAME+"</span>"+
													"</div>"+
													"<div class='pts' title='播放量'>"+
													"<div>"+data.VIDEOPLAYCOUNT+"</div>播放量</div>"+
													"</div>"+
													"</div>"+
													"</div>"+
													"</li>");
										
										});
									});
								}
								
								/* 获取最新的排行榜 */
								if(index==2){
									$.post("${path}PaiHangServlet",{"VEDIOTYPEID":"-1"},function(paiHangData,status){
										$(".rank-list ").empty();
										$.each(paiHangData.phData,function(index2,data){
											$(".rank-list").append("<li>"+
													"<div class='rank-item'>"+
													"<div class='num'>"+(index2+1)+"</div>"+
													"<div class='content clearfix'>"+
													"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
													"<div class='preview'>"+
													"<img data-img='' src='"+data.VIDEOCOVERURL+"' loaded='loaded' style='opacity: 1;'></div>"+
													"</a><i class='watch-later' aid='15245197'></i>"+
													"<div class='info '>"+
													"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
													"<div class='title'>"+data.VIDEOTITLE+"</div>"+
													"</a>"+
													"<div class='detail'>"+
													"<span class='data-box author'><i class='b-icon b-icon-v-author'></i>"+data.USERNAME+"</span>"+
													"</div>"+
													"<div class='pts' title='播放量'>"+
													"<div>"+data.VIDEOPLAYCOUNT+"</div>播放量</div>"+
													"</div>"+
													"</div>"+
													"</div>"+
													"</li>");
										
										});
									});
								}
							}
							
							var type=GetQueryString("VIDEOTYPEID");
							if(type==null){
								type=1;
							}
							$("#rank_catalogy_tab>li").removeClass("on");
							$("#rank_catalogy_tab>li").eq(type-1).addClass("on");
						
							
						});
				});
				
				//排行导航条设置点击事件
				$(document).on("click","#rank_catalogy_tab>li",function(index){
			 		$("#rank_catalogy_tab>li").removeClass("on");
						$(this).addClass("on");
						$.post("${path}PaiHangServlet",{"VEDIOTYPEID":""+parseInt($(this).val())},function(paiHangData,status){
							
							$(".rank-list ").empty();
							$.each(paiHangData.phData,function(index2,data){
								$(".rank-list").append("<li>"+
										"<div class='rank-item'>"+
										"<div class='num'>"+(index2+1)+"</div>"+
										"<div class='content clearfix'>"+
										"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
										"<div class='preview'>"+
										"<img data-img='' src='"+data.VIDEOCOVERURL+"' loaded='loaded' style='opacity: 1;'></div>"+
										"</a><i class='watch-later' aid='15245197'></i>"+
										"<div class='info '>"+
										"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
										"<div class='title'>"+data.VIDEOTITLE+"</div>"+
										"</a>"+
										"<div class='detail'>"+
										"<span class='data-box author'><i class='b-icon b-icon-v-author'></i>"+data.USERNAME+"</span>"+
										"</div>"+
										"<div class='pts' title='播放量'>"+
										"<div>"+data.VIDEOPLAYCOUNT+"</div>播放量</div>"+
										"</div>"+
										"</div>"+
										"</div>"+
										"</li>");
							
							});
						});
						
				});
				
				(function () {
					//alert(GetQueryString("VIDEOTYPEID"));
					var type=GetQueryString("VIDEOTYPEID");
					if(type==null){
						type=2;
					}
					$("#rank_catalogy_tab>li").removeClass("on");
					$("#rank_catalogy_tab>li").eq(type-2).addClass("on");
					$.post("${path}PaiHangServlet",{"VEDIOTYPEID":type},function(paiHangData,status){	
						$(".rank-list ").empty();
						$.each(paiHangData.phData,function(index,data){
							$(".rank-list").append("<li>"+
									"<div class='rank-item'>"+
									"<div class='num'>"+(index+1)+"</div>"+
									"<div class='content clearfix'>"+
									"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
									"<div class='preview'>"+
									"<img data-img='' src='"+data.VIDEOCOVERURL+"' loaded='loaded' style='opacity: 1;'></div>"+
									"</a><i class='watch-later' aid='15245197'></i>"+
									"<div class='info '>"+
									"<a href='${path}front/palyer.jsp?VIDEOID="+data.VIDEOID+"' target='_blank'>"+
									"<div class='title'>"+data.VIDEOTITLE+"</div>"+
									"</a>"+
									"<div class='detail'>"+
									"<span class='data-box author'><i class='b-icon b-icon-v-author'></i>"+data.USERNAME+"</span>"+
									"</div>"+
									"<div class='pts' title='播放量'>"+
									"<div>"+data.VIDEOPLAYCOUNT+"</div>播放量</div>"+
									"</div>"+
									"</div>"+
									"</div>"+
									"</li>");
						
						});
					});
				})();
				
				
			});
			
			
			function GetQueryString(name)
			{
			     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  unescape(r[2]); return null;
			}

		</script>


	<ul class="bilibili-suggest"
		style="top: 154px; left: 894.5px; display: none; min-width: 268px; max-width: 360px;">

	</ul>
</body>

</html>