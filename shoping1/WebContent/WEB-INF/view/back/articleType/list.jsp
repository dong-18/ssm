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
 <font color="red">${message}</font>
<!-- 横幅导航条开始 -->
<%@ include file="/WEB-INF/view/front/nva/nva_back.jsp" %>

<!-- 横幅导航条结束 -->
 <font color="red">${message}</font>
<!--  主体内容开始 -->
<div class="container">
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>商品类型列表</span>
	    	<span class="pull-right">
	    		<a href="<c:url value="/addOrUpdateArticleType.do"/>" class="btn btn-sm btn-success">
	    			<i class="glyphicon glyphicon-plus"></i>
	    		</a>
	    	</span>
	    </div>
	    <div class="panel-body">
		    <table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>CODE</th>
						<th>类型名称</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${types }" var="t">
						<tr>
							<td>${t.code }</td>
							<td>${t.name }</td>
							<td>${t.remark }</td>
							<td>
								<span  class="label label-info"><a href="${pageContext.request.contextPath}/addOrUpdateArticleType.do?code=${t.code}" style="color: white;">修改</a></span>
								<span class="label label-danger"><a href="${pageContext.request.contextPath}/deleteType.do?code=${t.code}" style="color: white;">删除</a></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		 <!-- 自定义分页标签 -->
		   <zx:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" pageStyle="black" totalNum="${pageModel.totalNum}" 
		   submitUrl="${pageContext.request.contextPath}/articleTypeList.do?pageIndex={0}"></zx:pager>
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