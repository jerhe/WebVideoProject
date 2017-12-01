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
<title>小分类详细页</title>
<!--minDetail-->
<link rel="stylesheet" type="text/css"
	href="${path}front/cssplayer/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/cssplayer/page-core.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/cssplayer/page-tag.css" />

<!--medol-->
<link rel="shortcut icon"
	href="https://static.hdslb.com/images/favicon.ico">
<script type="text/javascript" src="${path}front/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilimain.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/home.21d3fc64.css" />
<link rel="stylesheet" type="text/css"
	href="${path}front/css/bilibilifooter.css" />


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
						<li class="sub-nav-item"><a
							href="${path}front/leibiemin.jsp?VIDEOTYPEID=42"
							class="sub-nav-link"><span>Korea相关<i class="arrow"></i></span></a>
						</li>
					</ul></li>
				<!--影视-->
				<li class="nav-item"><a
					href="${path}front/leibiemin.jsp?VIDEOTYPEID=10" class="nav-link">
						<div class="nav-name">电影</div>
				</a></li>

			</ul>

		</div>
		<!---->
		<!---->

		<div class="b-page-body">

			<div class="main-inner">
				<div class="container-body">
					<div class="list-custom-wrp rank-page">
						<!--左-->
						<div class="b-page-large b-f-left">
							<div class="b-head list-custom">
								<span class="b-head-i"></span> <span class="b-head-t">暂无数据</span>
							</div>
							<div class="video-list list-c">
								<div class="vl-hd clearfix">
									<div class="left">
										<ul class="vl-tab" id="tab_list_order">
											<li class="tab-i on" id="list_order_hot" order="hot">视频热度排序</li>
										</ul>
									</div>

									<div class="vl-hd-sub" style="display: block;">
										<div class="bili-dropdown rank-dropdown">
											<span class="selected ">播放次数</span> <i
												class="icon icon-arrow-down paihanglb" value='1'></i>
											<ul class="dropdown-list">
												<li class="dropdown-item" value='1' style="display: none;">播放次数</li>
												<li class="dropdown-item" value='2'>发布时间</li>
											</ul>
										</div>

										<span class="s-line"></span>
									</div>
								</div>
								<div class="vd-list-cnt loaded">
									<ul class="vd-list l2">



									</ul>
								</div>
								<div class="pagelistbox fenye"></div>
							</div>
							<script type="text/javascript">
									var lastpinyin = '';
									var order = 'default';
									var tid = '24';
								</script>
						</div>
						<!--左-->

					</div>
				</div>
			</div>
		</div>

		<!---->
		<!---->
	</div>
	<script src="${path}front/js/jquery.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">	
			/* 排序相关 */
        	$(".rank-dropdown>.dropdown-list>.dropdown-item").each(function(){
        			$(this).click(function(){
        				$(".rank-dropdown>.dropdown-list>.dropdown-item").removeAttr("style")
        				$(".rank-dropdown>.selected").text(''+$(this).text());
        				$(".paihanglb").val($(this).val());
        				/*display: none;*/
        				$(this).css("display","none");
        				var videoTypeId=GetQueryString("VIDEOTYPEID");
	       				 /* 做个判断type是否有值如果没有值跳转到首页 */
	       				if(videoTypeId==null){
	       					window.location.href='${path}/front/home.jsp';
	       				}
        				$.post("${path}LiebieServlet",{"op":"init","paihang":$(".paihanglb").val(),"VIDEOTYPEID":videoTypeId,"page":1},function(leibieData,status){
        					init(leibieData);
        				});
        					
        			});
        			
        		});
			//初始化
			$(function(){
				var videoTypeId=GetQueryString("VIDEOTYPEID");
				 /* 做个判断type是否有值如果没有值跳转到首页 */
				if(videoTypeId==null){
					window.location.href='${path}/front/home.jsp';
				}
				$.post("${path}LiebieServlet",{"op":"init","VIDEOTYPEID":videoTypeId,"paihang":1,"page":1},function(leibieData,status){
						init(leibieData);
				});
				
					
			 });
				
			$(document).on("click",".pagelistbox>.p",function(index){
				var videoTypeId=GetQueryString("VIDEOTYPEID");
				 /* 做个判断type是否有值如果没有值跳转到首页 */
				if(videoTypeId==null){
					window.location.href='${path}/front/home.jsp';
				}
				 
				$.post("${path}LiebieServlet",{"op":"init","paihang":$(".paihanglb").val(),"VIDEOTYPEID":videoTypeId,"page":$(this).attr("page")},function(leibieData,status){
					init(leibieData);
				});
			});
			
			$(document).on("click",".jumppage",function(index){
				var videoTypeId=GetQueryString("VIDEOTYPEID");
				
				 /* 做个判断type是否有值如果没有值跳转到首页 */
				if(videoTypeId==null){
					window.location.href='${path}/front/home.jsp';
				}
				
				if(/^\d+$/.test($(".textjumppage").val())){
					var maxtotalpage=parseInt($(".maxtotalpage").attr("page"));
					var textjumppage=parseInt($(".textjumppage").val());
					if(textjumppage<=maxtotalpage){
						$.post("${path}LiebieServlet",{"op":"init","paihang":$(".paihanglb").val(),"VIDEOTYPEID":videoTypeId,"page":$(".textjumppage").val()},function(leibieData,status){
							init(leibieData);
						});
						return;
					}
					
				}
				$.post("${path}LiebieServlet",{"op":"init","paihang":$(".paihanglb").val(),"VIDEOTYPEID":videoTypeId,"page":1},function(leibieData,status){
					init(leibieData);
				});
			});
				
				
			function init(leibieData){
				$(".vd-list").empty();
				$(".textjumppage").val("");
				$.each(leibieData.pageData.data,function(index,data){
					$(".vd-list").append("<li>"+
							"<div class='l-item'>"+
							"<div class='l-l'>"+
							"<a href='${path}front/palyer.jsp?VIDEOID="+data.vIDEOID+"' target='_blank' class='preview cover-preview'><img data-img='' src='"+data.vIDEOCOVERURL+"' loaded='loaded' alt='"+data.VIDEOTITLE+"' style='opacity: 1;'>"+
							"<div class='back'>"+
							"<div></div>"+
							"</div>"+
							"<div class='fore'><span></span>"+
							"<div class='bar'>"+
							"<div></div>"+
							"</div>"+
							"</div>"+
							"<div class='x'></div>"+
							"</a><i class='watch-later'></i>"+
							"<a href='${path}front/palyer.jsp?VIDEOID="+data.vIDEOID+"' target='_blank' class='title' title='"+data.vIDEOTITLE+"'>"+data.vIDEOTITLE+"</a>"+
							"</div>"+
							"<div class='l-r'>"+
							"<div class='v-desc'>"+data.vIDEOREMARK+"</div>"+
							"<div class='v-info'><span class='v-info-i gk'><i class='b-icon b-icon-v-play' title='观看'></i><span number='"+data.vIDEOPLAYCOUNT+"'>"+data.vIDEOPLAYCOUNT+"</span></span>"+
							"</div>"+
							"<div class='up-info'>"+
							"<a class='v-author' href='${path}front/palyer.jsp?VIDEOID="+data.vIDEOID+"' target='_blank' title='"+data.uSERNAME+"'>"+data.uSERNAME+"</a></div>"+
							"</div>"+
							"</div>"+
							"</li>");
				});
				$(".nav-item").removeClass("channel on");
				$(".nav-item").eq(leibieData.videoType.vIDEOTYPEPARENT-1).addClass("channel on");
				$(".b-head-t").text(leibieData.videoType.vIDEOTYPENAME);
				
				$(".pagelistbox").empty();
				if(leibieData.pageData.data==null){
					return;
				}
				if(leibieData.pageData.page>1){
					$(".pagelistbox").append("<a class='p' page='"+(leibieData.pageData.page-1)+"'>上一页</a>");
				}
				if(leibieData.pageData.page == 1){
					$(".pagelistbox").append("<a class='p  active' page='1'>1</a>");
				}else{
					$(".pagelistbox").append("<a class='p' page='1'>1</a>");
				}
				if((leibieData.pageData.page-2)>2){
					$(".pagelistbox").append("<strong>...</strong>");
				}
				for(var i=(leibieData.pageData.page-2); i<(leibieData.pageData.page+2);i++){
					if(i>=2 && i<leibieData.pageData.totalPage ){
						if(leibieData.pageData.page==i){
							$(".pagelistbox").append("<a class='p  active' page='"+i+"'>"+i+"</a>");
						}else{
							$(".pagelistbox").append("<a class='p' page='"+i+"'>"+i+"</a>");
						}
					}
				}
				if((leibieData.pageData.page+2)< (leibieData.pageData.totalPage-1)){
					$(".pagelistbox").append("<strong>...</strong>");
				}
				if(leibieData.pageData.totalPage > 1){
					if(leibieData.pageData.page==leibieData.pageData.totalPage){
						$(".pagelistbox").append("<a class='p active maxtotalpage' page='"+leibieData.pageData.totalPage+"'>"+leibieData.pageData.totalPage+"</a>");
					}else{
						$(".pagelistbox").append("<a class='p maxtotalpage' page='"+leibieData.pageData.totalPage+"'>"+leibieData.pageData.totalPage+"</a>");
					}
					
				}
				if(leibieData.pageData.page<leibieData.pageData.totalPage){
					$(".pagelistbox").append("<a class='p' page='"+(leibieData.pageData.page+1)+"'>下一页</a>");
				}
				$(".pagelistbox").append("<div class='custom-right'>"+
						"<span class='result custom-right-inner'>共 "+leibieData.pageData.totalPage+" 页/ "+leibieData.pageData.total+" 个 ，</span>"+
						"<input type='text' class='b-input custompage custom-right-inner textjumppage'>"+
						"<span class='custom-right-inner'>页</span>"+
						"<input type='button' class='b-input custompage custom-right-inner jumppage' value='跳页'/> </div>");
				
			}
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