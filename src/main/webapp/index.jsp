<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>员工列表</title>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    /*pageContext.setAttribute("BATE_PATH",pageContext.request.contextPath);*/
%>
    
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
</script>
<body>
<!-- 更新员工信息模态框 -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <%--<p class="form-control-static" id="empName_update"></p>--%>
                                <input type="text" class="form-control" id="empName_update" name="empName" disabled >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email_update" placeholder="Email@qq.com" name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_m" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_f" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="deptId" id="deptName_update">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="updateEmp_save_btn">保存修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 添加员工模态框 -->
<div class="modal fade" id="empAndModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_add" placeholder="EmpName" name="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email_add" placeholder="Email@qq.com" name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_m" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_f" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="deptId" id="deptName_add">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="addEmp_save_btn">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--显示标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-增删改查</h1>
        </div>
    </div>
        <%--显示按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_and_model_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">批量删除</button>
        </div>
    </div>
        <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all" ></th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
        <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area"></div>
            <%--分页条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>


<script type="text/javascript">
    var totalRecord,currentPage;
    $(function (){
        to_page(1);
    });
    //跳转页面
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn=" + pn,
            type:"get",
            success:function (result){
                //console.log(result);
                //1，解析并显示员工数据
                build_emp_table(result);
                //2，解析并显示分页数据
                build_page_info(result);
                //3,解析显示分页条数据
                build_page_nav(result);
            }
        })
    }
    <%--显示表格数据--%>
    function build_emp_table(result){
        $("#emps_table tbody").empty();
        //
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
           // var genderTd = $("<td></td>").append(item.gender=='1'?"男":"女");
            var genderTd = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("delete-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd).appendTo("#emps_table tbody");
        });
    }
    <%--显示分页信息--%>
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第 "+ result.extend.pageInfo.pageNum +" 页 , 总共 "+
            result.extend.pageInfo.pages + " 页 , 总记录数 "+
            result.extend.pageInfo.total +" 条;")
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }
    /*显示分页导航*/
    function build_page_nav(result){
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>")
            .append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>")
            .append("&laquo;").attr("href","#"));
        if (result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled")
        }else{
            //点击事件
            firstPageLi.click(function (){
                to_page(1);
            })
            prePageLi.click(function (){
                /*if (result.extend.pageInfo.hasPreviousPage == true) {*/
                to_page(result.extend.pageInfo.prePage);
                //}
            })
        }

        var nextPageLi = $("<li></li>").append($("<a></a>")
            .append("&raquo;").attr("href","#"));
        var lastPageLi = $("<li></li>").append($("<a></a>")
            .append("尾页").attr("href","#"));
        if (result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }else{
            nextPageLi.click(function (){
                //if (result.extend.pageInfo.hasNextPage == true) {
                    to_page(result.extend.pageInfo.nextPage);
                //}
            })
            lastPageLi.click(function (){
                to_page(result.extend.pageInfo.pages);
            })
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,
            function (index,item){
                var numLi = $("<li></li>").append($("<a></a>")
                    .append(item).attr("href","#"));
                if (result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function (){
                    to_page(item);
                })
                ul.append(numLi);
            }
        )
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //添加新增点击弹出模态框事件
    $("#emp_and_model_btn").click(function (){
        //清楚表单数据
        reset_form("#empAndModel form")
        //发送ajax请求获取部门信息
        getDepts("#deptName_add");
        //弹出模态框
        $("#empAndModel").modal({
            //点击背景不消失
            backdrop:"static"
            }
        );
    })
    //模态框获取下拉框信息
    function getDepts(ele){
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result){
                /*console.log(result);*
                extend: {depts: [{deptId: 1, deptName: "开发部"},
                {deptId: 2, deptName: "测试部"}]}
                 */
                //两种获取方法，那个顺眼用哪个
                //$("#empAndModel select")
                //$("#deptName_add")
                $.each(result.extend.depts,function (){
                    var optionsEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionsEle.appendTo(ele);
                })
            }
        })
    }
    //校验模态框文本数据
    function validate_add_form(){
        var empName = $("#empName_add").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            //alert("用户名可填写的范围是2-5位中文或6-16位英文加数字");
            /*$("#empName_add").parent().addClass("has-error");
            $("#empName_add").next("span").text("用户名可填写的范围是2-5位中文或6-16位英文加数字");*/
            show_validate_msg("#empName_add","error","用户名可填写的范围是2-5位中文或6-16位英文加数字");
            return false;
        }else{
            show_validate_msg("#empName_add","success","");
        }

        var email = $("#email_add").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            //alert("请输入正确的邮箱格式" + email);
            /*$("#email_add").parent().addClass("has-error");
            $("#email_add").next("span").text("请输入正确的邮箱格式");*/
            show_validate_msg("#email_add","error","请输入正确的邮箱格式")
            return false;
        }else{
            show_validate_msg("#email_add","success","")
        }

        return true;
    }
    //抽出方法校验文本框输入是否规范
    function show_validate_msg(els,status,msg){
        $(els).parent().removeClass("has-success has-error");
        $(els).next("span").text("");
        if ("success" == status){
            $(els).parent().addClass("has-success");
            $(els).next("span").text(msg);

        }else if ("error" == status){
            $(els).parent().addClass("has-error");
            $(els).next("span").text(msg);
        }
    }
    //发送ajax校验请求用户名
    $("#empName_add").change(function (){
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName=" + empName,
            type:"POST",
            success:function (result){
                if (result.code == 100){
                    show_validate_msg("#empName_add","success","用户名可用");
                    $("#addEmp_save_btn").attr("ajax-ck","success");
                }else{
                    show_validate_msg("#empName_add","error",result.extend.ck_msg);
                    $("#addEmp_save_btn").attr("ajax-ck","error");
                }
            }
        })
    })
    //模态框保存事件
    $("#addEmp_save_btn").click(function (){
        /*alert($("#empAndModel form").serialize());*/
        if (!validate_add_form()){
            //前端校验用户名和邮箱合法性
            return false;
        };
        if ($(this).attr("ajax-ck") != "success"){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data: $("#empAndModel form").serialize(),
            success:function(result){
                /*alert(result.msg)*/
                //返回后端判断发送数据的合法性
                if (result.code == 100) {
                    $("#empAndModel").modal("hide");
                    to_page(totalRecord)
                }else if (result.code == 200){
                    if (undefined != result.extend.errorField.empName){
                        show_validate_msg("#empName_add","success",result.extend.errorField.empName);
                    }
                    if (undefined != result.extend.errorField.email){
                        show_validate_msg("#email_add","error",result.extend.errorField.email)
                    }
                }
            }
        })
    })
    //绑定编辑按钮事件
    $(document).on("click",".edit_btn",function (){
        //alert("修改按钮");
        //发送ajax请求获取部门信息
        getDepts("#deptName_update");
        getEmp($(this).attr("edit-id"));
        $("#updateEmp_save_btn").attr("edit-id",$(this).attr("edit-id"));

        $("#empUpdateModel").modal({
                //点击背景不消失
                backdrop:"static"
            }
        );
    })
    //
    $(document).on("click",".delete_btn",function (){
        var delName = $(this).parents("tr").find("td:eq(2)").text();
        const delId = $(this).attr("delete-id");
        if(confirm("确定要删除【"+ delName +"】吗?")){
            $.ajax({
                url:"${APP_PATH}/emp/" + delId,
                type:"DELETE",
                success:function (result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    })
    //点击编辑按钮获取员工信息
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/" + id,
            type:"GET",
            success:function (result){
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update").val(empData.empName);
                $("#email_update").val(empData.email);
                $("#empUpdateModel input[name=gender]").val([empData.gender]);
                $("#empUpdateModel select").val([empData.deptId]);
            }
        })
    }
    //
    $("#updateEmp_save_btn").click(function () {

        var email = $("#email_update").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate_msg("#email_update","error","请输入正确的邮箱格式")
            return false;
        }else{
            show_validate_msg("#email_update","success","")
        }
        /*
            直接将jquery的ajax请求改成put的话会封装不上数据，
            除了id之外其他数据都获取不到，
            tomcat不会封装put请求到map集合中，导致所有方法都拿不到数据
        */
        console.log($(this).attr("edit-id"));
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",//ssm想直接使用可以去web.xml配置FormContentFilter
            data:$("#empUpdateModel form").serialize(),
            /*data:$("#empUpdateModel form").serialize() + "&_method=PUT",*/
            success:function (result){
                //alert(result.msg);
                $("#empUpdateModel").modal("hide");
                to_page(currentPage);
            }

        })
    })
    //删除全选按钮
    $("#check_all").click(function (){
        //prop用来获取dom原生的属性，attr用来获取自定义属性
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    $(document).on("click",".check_item",function (){
        const flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    })
    //
    $("#emp_delete_all_btn").click(function (){
        var delNames = "";
        var delId_str = "";
        $.each($(".check_item:checked"),function (){
            delNames += ($(this).parents("tr").find("td:eq(2)").text()) + ",";
            delId_str += ($(this).parents("tr").find("td:eq(1)").text()) + "-";
        })
        delNames = delNames.substring(0,delNames.length-1);
        delId_str = delId_str.substring(0,delId_str.length-1);
        if (confirm("确定删除【"+ delNames +"】吗？")){
            $.ajax({
                url:"${APP_PATH}/emp/" + delId_str,
                type:"DELETE",
                success:function (result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    })
</script>
</body>
</html>
