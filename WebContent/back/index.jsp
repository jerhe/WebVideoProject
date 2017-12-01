<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>

<link rel="stylesheet" type="text/css"
	href="${path}back/plugin/datatables/bootstrap.min.css" />
<link rel="stylesheet"
	href="${path}back/css/bootstrap-responsive.min.css" />

<link rel="stylesheet" href="${path}back/css/unicorn.main.css" />

<link rel="stylesheet" href="${path}back/css/unicorn.blue.css"
	class="skin-color" />
<script src="${path}back/js/excanvas.min.js"></script>
<script src="${path}back/js/jquery.min.js"></script>



<script src="${path}back/js/jquery.ui.custom.js"></script>
<script src="${path}back/js/bootstrap.min.js"></script>
<script src="${path}back/js/jquery.flot.min.js"></script>
<script src="${path}back/js/jquery.flot.resize.min.js"></script>
<script src="${path}back/js/jquery.peity.min.js"></script>

<script src="${path}back/js/fullcalendar.min.js"></script>

<script src="${path}back/js/unicorn.dashboard.js"></script>
<script type="text/javascript" src="${path}back/js/jquery.e-calendar.js"></script>

<link rel="stylesheet" href="${path}back/css/jquery.e-calendar.css" />
<script type="text/javascript">
	        
	    	$(function(){
	    	    var editflag=false;
	    		 $("#save").click(function(){
	    			 $("#myModal").modal("hide");
	    			 var url;
	    			 if(editflag)
	    				 {
	    				  url="${path}AdminsServlet?op=updateNews"
	    				 }
	    			 else
	    				 {
	    				 url="${path}AdminsServlet?op=insertNews"
	    				 }
	    			  $.ajax({
	    		            url: url,
	    		            data: {
	    		            	"years":$("#years").val(),
	    		                "months": $("#months").val(),
	    		                 "days":$("#days").val(),
	    		                 "cid":$("#cid").val(),
	    		                 "content":$("#contenttitle").val(),
	    		                 "title":$("#contents").val()
	    		            }, async:false,success: function (data) {
	    	                        if(data=='true')
	    	                        	{
	    	                        	layer.msg("操作成功")
	    	                        	}
	    	                        else
	    	                        	{
	    	                        	layer.msg('操作失败')
	    	                        	}
	    		            }

	    		        }); 
	    			 
	    			 
	    			 var text=queryCal();
	    			 
	    			 
	    			 
	    			
	    		      console.log($("#contents").val());
	    		      console.log($("#months").val());
	    			  $('#calendar').eCalendar({
	    	             weekDays: ['周天', '周一', '周二', '周三', '周四', '周五', '周六'],
	    	            firstDayOfWeek: 1,
	    	            months: ['01月', '02月', '03月', '04月', '05月', '06月',
	    	'07月', '08月', '09月', '10月', '11月', '12月'],
	    	eventTitle: '备忘录',
	    	events:text     
	    			  }); 
	    			 
	    		 });
	    		  $(document).on("click",".c-day",function(){
	    
	    			  day=$(this).text();
	    			  var mouths=$(".c-month").text();
	    			  console.log(mouths.substr(0,2));
	    			  console.log(mouths.substr(4,6));
	    		      year=mouths.substr(4,6);
	    		      month=mouths.substr(0,2);
	    		      $("#years").val(year);
	    		      $("#months").val(month);
	    		      $("#days").val(day);
	    		      $("#myModal").modal("show");
	    		      $.ajax({
	    		            url: "${path}AdminsServlet?op=queryNewsBydate",
	    		            data: {
	    		            	"years":year,
	    		                "months":month,
	    		                 "days":day
	    		                	}, async:false,success: function (data) {
	    		                		console.log("data:"+data);
	    		            	   if(data==0)
	    		            	    {
	    		            		   editflag=false;
	    		            		   console.log(false)
	    		            	    }
	    		            	   else
	    		            		   {   
	    		            		   $("#cid").val(data);
	    		            		   editflag=true;
	    		            		   }
	    		            
	    		            }

	    		        }); 
	    		  
	    		  });   
	    		  
	    		function queryCal()
	    		{    $("#contenttitle").val(""),
	                 $("#contents").val("")
	    			 var text=new Array();
		    		  $.ajax({
	     		            url: "${path}AdminsServlet?op=queryNews",
	     		            data: {
	     		            	
	     		            }, async:false,success: function (data) {
	     		            	$.each(data,function(index,cal){
	     		            		var text1={
	     		            				  title: cal.CALENDERTITLE, 
	     		            		          description: cal.CALENDERCONTENT, 
	     		            		          datetime: new Date(cal.CYEAR, (cal.CMONTH)-1, cal.CDAY, 0)	
	     		            		}
	     		            		text.push(text1);
	     		            	
	     		            	})
	     		            	
	     		            
	     		            }

	     		        }); 
	    		return text;
	    		}
                 
               var text=queryCal();
	    		//With links on the description
	    		$('#calendar').eCalendar({
	    		                          weekDays: ['周天', '周一', '周二', '周三', '周四', '周五', '周六'],
	    		                          firstDayOfWeek: 1,
	    		                          months: ['01月', '02月', '03月', '04月', '05月', '06月',
	    		         '07月', '08月', '09月', '10月', '11月', '12月'],
	    		         eventTitle: '备忘录',
	    		    events: text
	    		});
	    		    		
	    		    });
	    		    
	
		
		</script>

<style>
</style>

</head>
<body>
	<div class="row-fluid">
		<div class="span12 center" style="text-align: center;">
			<ul class="stat-boxes">
				<li>
					<div class="left peity_bar_good">
						<span>2,4,9,7,12,10,12</span>+20%
					</div>
					<div class="right">
						<strong>36094</strong> Visits
					</div>
				</li>
				<li>
					<div class="left peity_bar_neutral">
						<span>20,15,18,14,10,9,9,9</span>0%
					</div>
					<div class="right">
						<strong>1433</strong> Users
					</div>
				</li>
				<li>
					<div class="left peity_bar_bad">
						<span>3,5,9,7,12,20,10</span>-50%
					</div>
					<div class="right">
						<strong>8650</strong> Orders
					</div>
				</li>
				<li>
					<div class="left peity_line_good">
						<span>12,6,9,23,14,10,17</span>+70%
					</div>
					<div class="right">
						<strong>8650</strong> Orders
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="alert alert-info">
				欢迎来到 <strong>SP-IMAX后台管理首页</strong>别忘了今天的工作哦~~ <a href="#"
					data-dismiss="alert" class="close">×</a>
			</div>
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon"><i class="icon-signal"></i></span>
					<h5>数据统计(就是好看,并没有什么用)</h5>
					<div class="buttons">
						<a href="#" class="btn btn-mini"><i class="icon-refresh"></i>
							Update stats</a>
					</div>
				</div>
				<div class="widget-content">
					<div class="row-fluid">
						<div class="span4">
							<ul class="site-stats">
								<li><i class="icon-user"></i> <strong>1433</strong> <small>Total
										Users</small></li>
								<li><i class="icon-arrow-right"></i> <strong>16</strong> <small>New
										Users (last week)</small></li>
								<li class="divider"></li>
								<li><i class="icon-shopping-cart"></i> <strong>259</strong>
									<small>Total Shop Items</small></li>
								<li><i class="icon-tag"></i> <strong>8650</strong> <small>Total
										Orders</small></li>
								<li><i class="icon-repeat"></i> <strong>29</strong> <small>Pending
										Orders</small></li>
							</ul>
						</div>
						<div class="span8">
							<div class="chart"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="row-fluid">
		<div class="span12">
			<div class="widget-box widget-calendar">
				<div class="widget-title">
					<span class="icon"><i class="icon-calendar"></i></span>
					<h5>Calendar</h5>
				</div>
				<div class="widget-content nopadding">
					<div id="calendar" style="margin: 0 auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form class="form-horizontal" method="post"
				enctype="multipart/form-data" id="formupdate">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close btnclose" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加事件</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							事件标题： <input type="text" class="form-control" id="contenttitle"
								name="contenttitle" placeholder="事件标题">
						</div>
						<div class="form-group">
							事件内容： <input type="text" class="form-control" id="contents"
								name="contents" placeholder="事件内容：">
						</div>
						<input type="hidden" class="form-control" id="years" name="years">
						<input type="hidden" class="form-control" id="months"
							name="months"> <input type="hidden" class="form-control"
							id="days" name="days"> <input type="hidden"
							class="form-control" id="cid" name="cid">
						<!--  <div class="form-group">
                                                 事件时间:
                    <input type="date" class="form-control" id="times" name="times" >
                    <span class='state1'></span>
                </div> -->
						<!--进行路径的保存 -->
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default btnclose"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>


</html>
