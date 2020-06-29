<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 引入自定义标签 -->   
<%@ taglib prefix="zx" uri="/MyPager-tag"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品类型管理</title>
    
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/taobao.css" rel="stylesheet" />
    <!-- 引入分页标签样式 -->
     <link href="${pageContext.request.contextPath}/resources/css/pager.css" rel="stylesheet" />

	<style type="text/css">
		.panel-heading .btn
		{
			margin-top: -5px;
		}
		.panel-body
		{
			padding: 0;
		}
	</style>
</head>

<body>

<!-- 横幅导航条开始 -->
<%@ include file="/WEB-INF/view/front/nva/nva_back.jsp" %>

<!-- 横幅导航条结束 -->
 <font color="red">${message}</font>
<!--  主体内容开始 -->
<div class="container">
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>管理员列表</span>
	    	<span class="pull-right">
	    		<a href="<c:url value="/addOrUpdateArticleType.do"/>" class="btn btn-sm btn-success">
	    			<i class="glyphicon glyphicon-plus">更新个人信息</i>
	    		</a>
	    	</span>
	    </div>
	    <div class="panel-body">
		    <table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>电话</th>
						<th>地址</th>
						<th>审核状态</th>
						<c:if test="${session_user.role ==3}">
						    <th>操作</th>
						</c:if>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users }" var="u">
						<tr>
							<td>${u.name}</td>
							<td><c:choose>
							     <c:when test="${u.sex == 1 }">
							                        男
							     </c:when>
							     <c:otherwise>
							                       女
							     </c:otherwise>
							  </c:choose></td>
							<td>${u.email}</td>
							<td>${u.phone}</td>
							<td>${u.address}</td>
							<td>
							  <c:choose>
							     <c:when test="${u.disabled eq '1'}">
							                        审核已通过
							     </c:when>
							     <c:otherwise>
							                       待审核
							     </c:otherwise>
							  </c:choose>
							
							</td>
							<c:if test="${session_user.role ==3}">
							<td>
							    <c:choose>
							     <c:when test="${u.disabled eq '1'}">
                                     <span  class="label label-info"><a href="${pageContext.request.contextPath}/activeServlet.do?id=${u.id}&disabled=0" style="color: white;">冻结</a></span>    
                                   
							     </c:when>
							     <c:otherwise>
                                    <span  class="label label-warning"><a href="${pageContext.request.contextPath}/activeServlet.do?id=${u.id}&disabled=1" style="color: white;">激活</a></span>    
    
							     </c:otherwise>
							    </c:choose>
							     
							
							</td>
							</c:if>
							
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

		 </div>
	</div>
    <hr>

    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>
</div>
<!--  主体内容结束 -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/resources/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/taobao.js"></script>

</body>
</html>