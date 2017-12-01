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
<script src="${path}back/plugin/datatables/bootstrap.min.js"></script>

<script src="${path}back/plugin/date/bootstrap-datetimepicker.min.js"></script>
<script src="${path}back/plugin/handlebars-v3.0.1.js"></script>

<script src="${path}back/js/layer.js"></script>
<!--<script type="text/javascript" src="/dt-page/extjs.js"></script>-->
<link rel="stylesheet" href="${path}back/css/layer.css" />
<style type="text/css">
th {
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
}

td {
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
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
					<th>用户编号</th>
					<th>用户名称</th>
					<th>用户电话</th>
					<th>头像图片</th>
					<th>出生日期</th>
					<th>用户简介</th>
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
					<div class="modal-body">
						<div class="form-group">
							用户编号： <input type="text" class="form-control" id="userid"
								name="userid" placeholder="用户编号">
						</div>
						<div class="form-group">
							用户名称： <input type="text" class="form-control" id="username"
								name="username" placeholder="用户名称">
						</div>
						<div class="form-group">
							用户电话: <input type="text" class="form-control" id="tel" name="tel"
								placeholder="用户电话"> <span class='state1'></span>
						</div>
						<!--进行路径的保存 -->
						<input type="hidden" class="form-control" id="imgurl"
							name="imgurl">

						<div class="form-group">
							出生日期： <input type="date" class="form-control" id="brithdate"
								name="brithdate" placeholder="出生日期" />
						</div>
						<div class="form-group">
							用户简介:
							<textarea rows="" cols="" id="userremark" name="userremark"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="initData">添加模拟数据</button>
						<button type="button" class="btn btn-default btnclose"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="myModaladd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<form class="form-horizontal" method="post"
				enctype="multipart/form-data" id="formadd" novalidate="novalidate">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close btnclose" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" class="form-control" id="path" name="path"
							value="${path}">
						<div class="form-group">
							<input type="text" class="form-control" id="usernameadd"
								name="usernameadd" placeholder="用户名称"> <span
								class='state1'></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="userpasswordadd"
								name="userpasswordadd" placeholder="用户密码"> <span
								class='state1'></span>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="teladd" required
								name="tel" placeholder="用户电话"> <span class='state1'></span>
						</div>
						<div class="form-group">
							<input type="file" accept="image/*" class="form-control"
								name="headimgadd" id="headimgadd" placeholder="用户头像"> <span
								class='state1'>请选择文件类型（要为图片类型）</span>
						</div>

						<div class="form-group">
							<input type="date" class="form-control" id="brithdateadd"
								name="date" placeholder="出生日期" /> <span class='state1'></span>
						</div>
						<div class="form-group">
							<textarea rows="" cols="" id="userremarkadd" name="userremark"></textarea>
						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default btnclose"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveadd">保存</button>
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
var ok1=false;
var ok2=false;
var ok3=false;
var ok4=false;
var ok5=false;
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
                url: "${path}UsersServlet2?op=queryAll" //此处的url应该是我们获取数据的请求地址,记得要应用将这个url地址修改为xxxServlet
            },
            "order": [[2, 'asc']],// dt默认是第一列升序排列 这里第一列为序号列，所以设置为不排序，并把默认的排序列设置到后面
            "serverSide": true,
            "columns": [
                {"data": null}, //因为要加行号，所以要多一列，不然会把第一列覆盖
                {"data": null},
                {"data": "USERID"},
                {"data": "USERNAME"},
                {"data": "USERTEL"},
                {"data": "HEADIMG"},
                {"data": "USERBRITH"},
                {"data": "USERREMARK"},
                {"data": null}
                
            ],
            "columnDefs": [
                {
                    "targets": 0,
                    "render": function (a, b, c, d) {
                        var context1 =
                        {
                            func: [
                            	 {"uid": c.USERID},
                                
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
                {
                    "targets": 8,
                    "render": function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"name": "修改", "fn": "edit(\'" + c.USERID + "\',\'" + c.USERNAME + "\',\'" + c.USERTEL + "\',\'" + c.HEADIMG + "\',\'" + c.USERBRITH + "\',\'" + c.USERREMARK +"\')", "type": "primary"},
                                {"name": "删除", "fn": "del(\'" + c.USERID + "\')", "type": "danger"},
                                {"name": "重置密码", "fn": "change(\'" + c.USERID + "\')", "type": "default"}
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
                $("#mytool").append('<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModaladd">添加</button>');
                $("#delsome").on("click", initData);
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

        $("#save").click(addup);
       $("#saveadd").click(add);
      
        $(".btnclose").click(clear);
        $("#initData").click(initSingleData);

    });

    /**
     * 初始化基础数据
     */
    function initData() {
   
        layer.confirm('你确定要删除这些信息吗？', {
        	  btn: ['确定','取消'] //按钮
        	}, function(){
        	var	 text = $("input[class='selects']:checked").map(function(index,elem) {
          	          return $(elem).val();
          	      }).get().join(',');
           
              	  $.ajax({
       		            url: "${path}UsersServlet2?op=delSomeUsers",
       		            data: {
       		                "userid": text
       		            }, success: function (data) {
       		       	  var dt = $("#example").DataTable();dt.ajax.reload(null,false)

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
     * 初始化基础数据
     */
    function initSingleData() {
    	$("#myModalLabel").text("修改");
        $("#userid").val("XXX");
       
        $("#tel").val("XXX@.XX.com");
        $("#headimg").val("imag/XX.jpg");
        $("#brithdate").val("1997/05/10");
    
    }

    /**
     * 清除
     */
    function clear() {
    	
        $("#userid").val("").attr("readonly",false);
        $("#username").val("").attr("readonly",false);
        $("#tel").val("");
        $("#headimg").val("");
        $("#headimg").next().text("").removeClass('state4').addClass('state1');;
        $("#brithdate").val("");
        $("#userremarkadd").text("");
        $("#usernameadd").val("");
        $("#usernameadd").next().text("").removeClass('state4').addClass('state1');
        $("#teladd").val("");
        $("#teladd").next().text("").removeClass('state4').addClass('state1');
        $("#headimgadd").val("");
        $("#headimgadd").next().text("").removeClass('state4').addClass('state1');
        $("#brithdateadd").val("");
        $("#brithdateadd").next().text("").removeClass('state4').addClass('state1');
        $("#userpasswordadd").val("");
        $("#userpasswordadd").next().text("").removeClass('state4').addClass('state1');
         ok1=false;
         ok2=false;
         ok3=false;
         ok4=false;
         ok5=false;
        editFlag = false;
    }

    /**
     * 添加数据
     **/
    function add() {
    	editFlag=false;
        var addJson = {
            "userpassword": $("#userpasswordadd").val(),
            "username": $("#usernameadd").val(),
            "tel": $("#teladd").val(),
            "headimg": $("#headimgadd").val(),
            "brithdate": $("#brithdateadd").val(),
           
        };
        if(ok1 && ok2 && ok3 && ok4 && ok5)
        {
        ajax(addJson);
        }
        else
        	{
        	 layer.msg('格式不对，无法保存');
        	}
    }
    function addup() {
        var addJson = {
            "userid": $("#userid").val(),
            "username": $("#username").val(),
            "tel": $("#tel").val(),
            "headimg": $("#headimg").val(),
            "brithdate": $("#brithdate").val(),
           
        };
    
        ajax(addJson);
      	
    	 
    }
    /**
     *编辑方法
     **/
    function edit(userid,username,tel,headimg,brithdate,userremark) {
    
        editFlag = true;
        $("#myModalLabel").text("修改");
        
        $("#userid").val(userid).attr("readonly",true);
        $("#username").val(username).attr("readonly",true);
        $("#tel").val(tel);
        $("#userremark").text(userremark);
        $("#imgurl").val(headimg);
        $("#brithdate").val(brithdate);
        $("#myModal").modal("show");
    }
    function change(uid)
    {
    	layer.confirm('您是确定要重置用户的密码吗？', {
  		  btn: ['是的','取消'] //按钮
  		}, function(){
  		     $.ajax({
  		            url: "${path}UsersServlet2?op=ChangeUsers",
  		            data: {
  		                "userid": uid
  		            }, success: function (data) {
  		        	  var dt = $("#example").DataTable();
                    	dt.ajax.reload(null,false)

  		                if(data)
  		         	   {
  		         	  
  		         	   layer.msg('重置密码成功');
  		         	   }
  		            else
  		         	   {layer.msg('重置密码失败');
  		         	   
  		         	   }
  		            }
  		        });
  		}, function(){
  		  
  		});
    	
    	
    }

    function ajax(obj) {
        var url ="${path}UsersServlet2?op=insertUsers" ;
        var formdata=new  window.FormData($('#formadd')[0]);
        if(editFlag){
            url = "${path}UsersServlet2?op=updateUsers";
            formdata=new window.FormData($('#formupdate')[0]);
        }
        
        $.ajax({
            url:url ,
             type: "POST",
            data: 
            	//表单提交 设置的请求参数Content-Type的值一定要有boundary的值，
            	 formdata, 
            	   contentType: false,
                  processData:false,
                  success: function (data) {
                	  var dt = $("#example").DataTable();
                  	dt.ajax.reload(null,false)
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
    		            url: "${path}UsersServlet2?op=delUsers",
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
    $(function(){
		  
        
        // 验证用户名
        $('input[name="usernameadd"]').focus(function(){
          $(this).next().attr("style","color:#CD0000")
          $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state2');
        }).blur(function(){
          if($(this).val().length >= 3 && $(this).val().length <=12 && $(this).val()!=''){
        	  $(this).next().attr("style","color:#66CD00")
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            ok1=true;
          }else{
        	  $(this).next().attr("style","color:#CD0000")
            $(this).next().text('用户名应该为3-20位之间').removeClass('state1').addClass('state3');
          }
            
        });
        $('#teladd').focus(function(){
            $(this).next().attr("style","color:#CD0000")
            $(this).next().text('简介应该为0-100位之间').removeClass('state1').addClass('state2');
          }).blur(function(){
            if($(this).text().length >= 0 && $(this).text().length <=100 && $(this).val()!=''){
          	  $(this).next().attr("style","color:#66CD00")
              $(this).next().text('输入成功').removeClass('state1').addClass('state4');
              ok5=true;
            }else{
          	  $(this).next().attr("style","color:#CD0000")
              $(this).next().text('简介应该为0-100位之间').removeClass('state1').addClass('state3');
            }
              
          });
  
        //验证密码
        $('input[name="userpasswordadd"]').focus(function(){
        	  $(this).next().attr("style","color:#CD0000")
          $(this).next().text('密码应该为6-20位之间').removeClass('state1').addClass('state2');
        }).blur(function(){
          if($(this).val().length >= 6 && $(this).val().length <=20 && $(this).val()!=''){
        	  $(this).next().attr("style","color:#66CD00")
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            ok2=true;
          }else{
        	  $(this).next().attr("style","color:#CD0000")
            $(this).next().text('密码应该为6-20位之间').removeClass('state1').addClass('state3');
          }
            
        });
  
        //验证图片
    $("#headimgadd").change(function () {
        var filepath = $("input[name='headimgadd']").val();
        var extStart = filepath.lastIndexOf(".");
        var ext = filepath.substring(extStart, filepath.length).toUpperCase();

        if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
        	 $(this).next().attr("style","color:#CD0000")
             $(this).next().text('请输入正确的图片格式').removeClass('state1').addClass('state2');
        } else { ok3=true;$(this).next().attr("style","color:#66CD00");$(this).next().text('输入成功').removeClass('state1').addClass('state4'); }
    });
        //验证日期
	 function checkDate(d){
		   var ds=d.match(/\d+/g),ts=['getFullYear','getMonth','getDate'];
		     var d=new Date(d.replace(/-/g,'/')),i=3;
		     ds[1]--;
		     while(i--)if( ds[i]*1!=d[ts[i]]()) return false;
		     return true;
		    }
        //验证邮箱
        $('input[name="email"]').focus(function(){
        	  $(this).next().attr("style","color:#CD0000")
          $(this).next().text('请输入正确的EMAIL格式').removeClass('state1').addClass('state2');
        }).blur(function(){
        	
          if($(this).val().search(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)==-1){
        	  $(this).next().attr("style","color:#CD0000")
            $(this).next().text('请输入正确的EMAIL格式').removeClass('state1').addClass('state3');
          }else{      
        	  $(this).next().attr("style","color:#66CD00")
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            ok4=true;
          }
            
        });
        $('input[name="tel"]').focus(function(){
      	  $(this).next().attr("style","color:#CD0000")
        $(this).next().text('请输入正确的电话格式').removeClass('state1').addClass('state2');
      }).blur(function(){
      	
        if($(this).val().search(/^(((13[0-9]{1})|159|153)+\d{8})$/)==-1){
      	  $(this).next().attr("style","color:#CD0000")
          $(this).next().text('请输入正确的电话格式').removeClass('state1').addClass('state3');
        }else{      
      	  $(this).next().attr("style","color:#66CD00")
          $(this).next().text('输入成功').removeClass('state1').addClass('state4');
          ok4=true;
        }
          
      });
    });

</script>