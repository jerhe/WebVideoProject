<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>
<title>Datatable-serverSide 服务器分页例子 java</title>
<!--  http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css-->
<!--  <link rel="stylesheet" type="text/css" href="plugin/datatables/bootstrap.min.css"/>  -->
<!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>-->
<!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css-->
<link rel="stylesheet" type="text/css"
	href="${path}back/plugin/datatables/dataTables.bootstrap.css" />
<!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js-->
<!--   <script src="plugin/datatables/jquery.js"></script> -->
<%--   <script src="${path}back/js/jquery-3.2.0.min.js"></script> --%>
<!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js-->
<script src="${path}back/plugin/datatables/jquery.dataTables.min.js"></script>
<!--<script src="dt.js"></script>-->
<!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js-->
<script type="text/javascript" language="javascript"
	src="${path}back/plugin/datatables/dataTables.bootstrap.js"></script>
<!--http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js-->
<%--   <script src="${path}back/plugin/datatables/bootstrap.min.js"></script> --%>

<script src="${path}back/plugin/date/bootstrap-datetimepicker.min.js"></script>
<script src="${path}back/plugin/handlebars-v3.0.1.js"></script>

<script src="${path}back/js/layer.js"></script>
<!--<script type="text/javascript" src="/dt-page/extjs.js"></script>-->
<link rel="stylesheet" href="${path}back/css/layer.css" />
<style type="text/css">
table {
	width: 50%;
	table-layout: fixed;
}

th {
	width: 50%;
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
}

td {
	width: 50%;
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<table id="example"
			class="table table-striped table-bordered with-check">
			<thead>
				<tr>
					<th><input type="checkbox" id="title-table-checkbox"
						name="title-table-checkbox" /></th>
					<th>序号</th>
					<th>视频编号</th>
					<th>视频作者</th>
					<th>视频类型</th>
					<th>视频标题</th>
					<th>视频路径</th>
					<th>封面路径</th>
					<th>视频简介</th>
					<th>发布日期</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- Button trigger modal -->


	<!-- Modal -->
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
						<h4 class="modal-title" id="myModalLabel">修改</h4>
					</div>
					<input type="hidden" class="form-control" id="videoid"
						name="videoid"> <label id="videoids"> </label> <label
						id="videotitle"> </label>
					<div class="modal-body">
						<div class="form-group">
							<video id="urlsrc" width="520" height="400" controls autoplay>
								<source src="" type="video/mp4">
							</video>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btnclose"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="pass">通过</button>
						<button type="button" class="btn btn-danger" id="notpass">驳回</button>
					</div>
				</div>
			</form>
		</div>
	</div>



</body>
</html>
<!--定义操作列按钮模板-->
<!--说下这里使用模板的作用，除了显示和数据分离好维护以外，绑定事件和传值也比较方便，希望大家能不拼接html则不拼接-->
<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <input type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}" value="{{this.name}}"/>
    {{/each}}
</script>
<script id="tpl1" type="text/x-handlebars-template">
    {{#each func}}
    <input type="checkbox" class="selects" value="{{this.uid}}"/>
    {{/each}}
</script>
<script>

    var table;
    var editFlag = false;
    $(function () {
       
        $('#start_date').datetimepicker();

        var tpl = $("#tpl").html();
        //预编译模板
        var template = Handlebars.compile(tpl);
        var tpl1 = $("#tpl1").html();
        //预编译模板
        var template1 = Handlebars.compile(tpl1);
        table = $('#example').DataTable({
            ajax: {
                url: "${path}VideosServlet?op=queryAll" //此处的url应该是我们获取数据的请求地址,记得要应用将这个url地址修改为xxxServlet
            },
            "order": [[2, 'asc']],// dt默认是第一列升序排列 这里第一列为序号列，所以设置为不排序，并把默认的排序列设置到后面
            "serverSide": true,
            "columns": [
                {"data": null}, //因为要加行号，所以要多一列，不然会把第一列覆盖
                {"data": null},
                {"data": "VIDEOID"},
                {"data": "USERNAME"},
                {"data": "videoType.VIDEOTYPENAME"},
                {"data": "VIDEOTITLE"},
                {"data": "VIDEOURL"},
                {"data": "VIDEOCOVERURL"},
                {"data": "VIDEOREMARK"},
                {"data": "VIDEOTIME"},
                
                {"data": null}
                
            ],
            "columnDefs": [
                {
                    "targets": 0,
                    "render": function (a, b, c, d) {
                        var context1 =
                        {
                            func: [
                            	 {"uid": c.VIDEOID},
                                
                            ]
                        };
                        var html1 = template1(context1);
                        return html1;
                    }
                },
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": [0,1,-1]
                },
                {   "orderable": false,
                    "targets": [4]
                	
                },
                {
                    "targets": 10,
                    "render": function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"name": "审核", "fn": "edit(\'" + c.VIDEOID + "\',\'" + c.USERNAME + "\',\'" + c.videoType.VIDEOTYPENAME + "\',\'" + c.VIDEOTITLE + "\',\'" + c.VIDEOURL + "\',\'"+c.VIDEOCOVERURL+"\',\'"+c.VIDEOTIME+"\',\'"+c.VIDEOREMARK+"\')", "type": "primary"},
                               
                            ]
                        };
                        var html = template(context);
                        return html;
                    }
                }
            

            ],
            "language": {
                "lengthMenu": "每页_MENU_ 条记录",
                "zeroRecords": "没有找到记录",
                "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                "infoEmpty": "无记录",
                "search": "搜索：",
                "infoFiltered": "(从 _MAX_ 条记录过滤)",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页"
                }
            },
            "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>" +
                    "t" +
                    "<'row'<'col-xs-6'i><'col-xs-6'p>>",
            "initComplete": function () {
                $("#mytool").append('<button id="delsome" type="button" class="btn btn-primary btn-sm">删除批量信息</button>&nbsp');
              
                $("#delsome").on("click", delsomData);
                $("#btnadd").on("click",showData);
            }

        });

        //添加序号
        //不管是排序，还是分页，还是搜索最后都会重画，这里监听draw事件即可
        table.on('draw.dt',function() {
                    table.column(1, {
                        search: 'applied',
                        order: 'applied'
                    }).nodes().each(function(cell, i) {
                        //i 从0开始，所以这里先加1
                        i = i+1;
                        //服务器模式下获取分页信息
                        var page = table.page.info();
                        //当前第几页，从0开始
                        var pageno = page.page;
                        //每页数据
                        var length = page.length;
                        //行号等于 页数*每页数据长度+行号
                        var columnIndex = (i+pageno*length);
                        cell.innerHTML = columnIndex;
                    });
                }).draw();

        $("#pass").click(addup);
       $("#notpass").click(add);
      
        $(".btnclose").click(clear);
        $("#initData").click(initSingleData);

    });
    function showData()
    {
  	  $.ajax({
          url: "${path}VideoTypeServlet?op=queryAll",
          data: {
          }, success: function (videotype) {
          	
          	$.each(videotype,function(index,types){
          		$("#videotypeadd").append("<option value ='"+types.VIDEOTYPENAME+"'>"+types.VIDEOTYPENAME+"</option>")
          	});
          }
      }); 
    }
    /**
     * 删除某些数据
     */
    function delsomData() {
   
        layer.confirm('你确定要删除这些信息吗？', {
        	  btn: ['确定','取消'] //按钮
        	}, function(){
        	var	 text = $("input[class='selects']:checked").map(function(index,elem) {
          	          return $(elem).val();
          	      }).get().join(',');
           
              	  $.ajax({
       		            url: "${path}VideosServlet?op=delSomeVideos",
       		            data: {
       		                "userid": text
       		            }, success: function (data) {
       		                  var dt = $("#example").DataTable();dt.ajax.reload(null,false);
       		                if(data)
       		         	   {
       		         	  
       		         	   layer.msg('删除成功');
       		         	   }
       		            else
       		         	   {layer.msg('删除失败');
       		         	   
       		         	   }
       		            }
       		        }); 
        	}, function(){
        	  layer.msg('什么也没发生');
        	});
       /*  	var check;
        var trs=	$("tbody").find("tr");
        	trs.each(function(){
        		check=$(this).find("td").eq(0).find("input");
        		if(check.attr('checked'))
        		   alert(check.val());
        	}) */
        	
        
    }


    /**
     * 清除
     */
    function clear() {
    	
    	 $("#videoids").text("");
         $("#videotitle").text("");
         $("#urlsrc")[0].pause();
        editFlag = false;
    }

    /**
     * 添加数据
     **/
    function add() {
    	editFlag=false;
    	  var addJson = {
    				"videoid": $("#videoid").val(),
    			  "flag": false,
          };
       
        ajax(addJson);
        
    }
    //更新数据
    function addup() {
        var addJson = {
        		"videoid": $("#videoid").val(),
        		"flag":true,
         };
  
        ajax(addJson);
    }
    /**
     *编辑方法
     **/
    function edit(videoid,username,typename,videotitle,videourl,videocoverurl,videotime,videoremark) {
    
        editFlag = true;
        $("#myModalLabel").text("审核");
       $("#videoids").text("视频编号:"+videoid);
       $("#videotitle").text("视频标题:"+videotitle);
      $("#urlsrc").prop("src",videourl);
      $("#urlsrc").attr("autoplay","true");
      
      $("#videoid").val(videoid);
      
       console.log(videourl);
        $("#myModal").modal("show");
    }

    function ajax(obj) {
      
        
        $.ajax({
            url:"${path}VideosServlet?op=Ispass" ,
             type: "POST",
            data: 
            	{"flag":obj.flag,
            	"videoid":obj.videoid}, 
            	  
                  success: function (data) {
                  var dt = $("#example").DataTable();dt.ajax.reload(null,false);
                $("#myModal").modal("hide");
                $("#myModaladd").modal("hide");
                clear();
               if(data)
            	   {
            	  
            	   layer.msg('操作成功');
            	   }
               else
            	   {layer.msg('操作失败');
            	   
            	   }
            }
        });
    }


    /**
     * 删除数据
     * @param name
     */
    function del(userid) {
    	layer.confirm('您是确定要删除此信息吗？', {
    		  btn: ['是的','取消'] //按钮
    		}, function(){
    		     $.ajax({
    		            url: "${path}VideosServlet?op=delUsers",
    		            data: {
    		                "userid": userid
    		            }, success: function (data) {
    		                  var dt = $("#example").DataTable();dt.ajax.reload(null,false);
    		                if(data)
    		         	   {
    		         	  
    		         	   layer.msg('删除成功');
    		         	   }
    		            else
    		         	   {layer.msg('删除失败');
    		         	   
    		         	   }
    		            }
    		        });
    		}, function(){
    		  
    		});
    	
    }
   
  

	  
	  


  $(function(){
  	
  	$(document).on("click","#title-table-checkbox",function(){
  
  		if($("#title-table-checkbox").attr('checked'))
  		{ 
  			$(".selects").attr("checked",true);
  		}else
  			{
  			$(".selects").attr("checked",false);
  			}
  	});
  	
  	
  });
</script>