<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
String path="http://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/";
pageContext.setAttribute("path", path);
%>
    <title>Datatable-serverSide 服务器分页例子 java</title>
    <!--  http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css-->
<%--     <link rel="stylesheet" type="text/css" href="${path}plugin/datatables/bootstrap.min.css"/> --%>
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>-->
    <!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css-->
    <link rel="stylesheet" type="text/css" href="plugin/datatables/dataTables.bootstrap.css  "/>
    <!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js-->
    <script src="plugin/datatables/jquery.js"></script>
    <!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js-->
    <script src="plugin/datatables/jquery.dataTables.min.js"></script>
    <!--<script src="dt.js"></script>-->
    <!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js-->
    <script type="text/javascript" language="javascript" src="plugin/datatables/dataTables.bootstrap.js"></script>
    <!--http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js-->
    <script src="plugin/datatables/bootstrap.min.js"></script>
    <script src="plugin/date/bootstrap-datetimepicker.min.js"></script>
    <script src="plugin/handlebars-v3.0.1.js"></script>

    <!--<script type="text/javascript" src="/dt-page/extjs.js"></script>-->
</head>
<body>
<div class="container">
    <table id="example" class="table table-striped table-bordered">
        <thead>
            <tr>
              <th><input type="checkbox" class="selectall"></th>
                <th>序号</th>
                <th>用户编号</th>
                <th>用户名称</th>
                <th>邮箱</th>
                <th>头像图片</th>
                <th>出生日期</th>
                <th>操作</th>
            </tr>
        </thead>
    </table>
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
        <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control" id="userid" placeholder="用户编号">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="用户名称">
                </div>
                 <div class="form-group">
                    <input type="text" class="form-control" id="email" placeholder="用户邮箱">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="headimg" placeholder="用户头像">
                </div>
                   <div class="form-group">
                    <input type="datetime" class="form-control" id="brithdate" placeholder="出生日期" /></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" id="initData">添加模拟数据</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<!--定义操作列按钮模板-->
<!--说下这里使用模板的作用，除了显示和数据分离好维护以外，绑定事件和传值也比较方便，希望大家能不拼接html则不拼接-->
<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}">{{this.name}}</button>
    {{/each}}
</script>
<script id="tpl1" type="text/x-handlebars-template">
    {{#each func}}
    <input type="checkbox" class="selects" onclick="{{this.fn}}"/>
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
                url: "../UsersServlet?op=queryAll" //此处的url应该是我们获取数据的请求地址,记得要应用将这个url地址修改为xxxServlet
            },
            "order": [[1, 'asc']],// dt默认是第一列升序排列 这里第一列为序号列，所以设置为不排序，并把默认的排序列设置到后面
            "serverSide": true,
            "columns": [
                {"data": null}, //因为要加行号，所以要多一列，不然会把第一列覆盖
                {"data": null},
                {"data": "USERID"},
                {"data": "USERNAME"},
                {"data": "EMAIL"},
                {"data": "HEADIMG"},
                {"data": "USERBRITH"},
               
                {"data": null}
                
            ],
            "columnDefs": [
                {
                    "targets": 0,
                    "render": function (a, b, c, d) {
                        var context1 =
                        {
                            func: [
                                { "fn": "edit(\'" + c.USERID + "\',\'" + c.USERNAME + "\',\'" + c.EMAIL + "\',\'" + c.HEADIMG + "\',\'" + c.USERBRITH + "\')"},
                                
                            ]
                        };
                        var html1 = template1(context1);
                        return html1;
                    }
                },
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": [0,-1]
                },
                {
                    "targets": 7,
                    "render": function (a, b, c, d) {
                        var context =
                        {
                            func: [
                                {"name": "修改", "fn": "edit(\'" + c.USERID + "\',\'" + c.USERNAME + "\',\'" + c.EMAIL + "\',\'" + c.HEADIMG + "\',\'" + c.USERBRITH + "\')", "type": "primary"},
                                {"name": "删除", "fn": "del(\'" + c.USERID + "\')", "type": "danger"}
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
                $("#mytool").append('<button id="datainit" type="button" class="btn btn-primary btn-sm">增加基础数据</button>&nbsp');
                $("#mytool").append('<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">添加</button>');
                $("#datainit").on("click", initData);
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

        $("#save").click(add);

        $("#initData").click(initSingleData);

    });

    /**
     * 初始化基础数据
     */
    function initData() {
        var flag = confirm("本功能将添加数据到数据库，你确定要添加么？");
        if (flag) {
            $.get("objects.txt", function (data) {
                var jsondata = JSON.parse(data);
                $(jsondata.data).each(function (index, obj) {
                    ajax(obj);
                });
            });
        }
    }

    /**
     * 初始化基础数据
     */
    function initSingleData() {
    	$("#myModalLabel").text("修改");
        $("#userid").val("XXX");
        $("#username").val("无");
        $("#email").val("XXX@.XX.com");
        $("#headimg").val("imag/XX.jpg");
        $("#brithdate").val("1997/05/10");
    
    }

    /**
     * 清除
     */
    function clear() {
        $("#userid").val("").attr("disabled",false);
        $("#username").val("");
        $("#email").val("");
        $("#headimg").val("");
        $("#brithdate").val("");
        editFlag = false;
    }

    /**
     * 添加数据
     **/
    function add() {
        var addJson = {
            "userid": $("#userid").val(),
            "username": $("#username").val(),
            "email": $("#email").val(),
            "headimg": $("#headimg").val(),
            "brithdate": $("#brithdate").val(),
           
        };

        ajax(addJson);
    }

    /**
     *编辑方法
     **/
    function edit(userid,username,email,headimg,brithdate) {
        console.log(name);
        editFlag = true;
        $("#myModalLabel").text("修改");
        $("#userid").val(userid).attr("disabled",true);
        $("#username").val(username);
        $("#email").val(email);
        $("#headimg").val(headimg);
        $("#brithdate").val(brithdate);
        $("#myModal").modal("show");
    }

    function ajax(obj) {
        var url ="add.jsp" ;
        if(editFlag){
            url = "../UsersServlet?op=updateUsers";
        }
        $.ajax({
            url:url ,
            data: {
                "userid": obj.userid,
                "username": obj.username,
                "email": obj.email,
                "headimg": obj.headimg,
                "brithdate": obj.brithdate
            }, success: function (data) {
                table.ajax.reload();
                $("#myModal").modal("hide");
                $("#myModalLabel").text("新增");
                clear();
                console.log("结果" + data);
            }
        });
    }


    /**
     * 删除数据
     * @param name
     */
    function del(userid) {
        $.ajax({
            url: "del.jsp",
            data: {
                "userid": userid
            }, success: function (data) {
                table.ajax.reload();
                console.log("删除成功" + data);
            }
        });
    }
</script>