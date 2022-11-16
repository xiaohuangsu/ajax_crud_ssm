<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">批量删除</button>
        </div>
    </div>
        <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emps">
                    <tr>
                        <th>${emps.empId}</th>
                        <th>${emps.empName}</th>
                        <th>${emps.gender}</th>
                        <th>${emps.email}</th>
                        <th>${emps.dept.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                修改
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
        <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前第 ${pageInfo.pageNum} 页 , 总共 ${pageInfo.pages} 页 , 总记录数 ${pageInfo.total} 条;
        </div>
            <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum == pageInfo.pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>

                    </c:forEach>


                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
