<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 引入分页标签 -->
<%@ taglib prefix="zx" uri="/MyPager-tag"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品首页</title>
<link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/resources/css/taobao.css" rel="stylesheet" />
</head>
<script src="${ctx}/resources/jquery/jquery.js"></script>
<script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>

<!-- 引入分页样式  -->
<link href="${ctx}/resources/css/pager.css" rel="stylesheet" />

  <script type="text/javascript">
      window.onload = function(){
    	  
    	     //获取一级类型
    	     var fTypes = document.getElementsByName("fType");
    	     for(var i=0;fTypes.length;i++){
    	    	 if(fTypes[i].id == "${firstCode}"){
    	    		 fTypes[i].className = "list-group-item active";
    	    	 }
    	     }
      }
  </script>
<body>
	<!-- 横幅导航条开始 -->
    <%@ include file="/WEB-INF/view/front/nva/nva.jsp" %>
	<!-- 横幅导航条结束 -->
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<!-- 侧边导航开始 -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<div class="list-group">
				 <c:forEach items="${types}" var="type">
				    <%--  <c:choose>
				         <c:when test="${firstCode eq  type.code}">
				            <a href="index.action?typeCode=${type.code}"
						     class="list-group-item active">${type.name}</a> 
				         </c:when>
				         <c:otherwise>
				             <a href="index.action?typeCode=${type.code}"
						     class="list-group-item">${type.name}</a> 
				         </c:otherwise>
				     </c:choose> --%>
				     
							 <a id="${type.code}" name="fType" href="${ctx}/index.action?typeCode=${type.code}"
						     class="list-group-item">${type.name}</a>			     
				 </c:forEach>
					
				</div>
			</div>
			<!--  侧边导航结束 -->
			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">显示导航条</button>
				</p>
				<div class="alert alert-info" role="alert">
                    <c:forEach items="${seTypes}" var="type">
                       <a href="index.action?typeCode=${type.code}"
						class="btn btn-default">${type.name}</a>
                    </c:forEach>
					

					<div>
						<form action="${ctx}/index.action" method="get">
							<!-- 如果当前选择了商品的类型，仅在该类型下面进行搜索 -->
							<input type="hidden" name="typeCode" value="${typeCode}"/>
							 <input
								name="keyword" value="${keyword}" />
							<button type="submit">搜索</button>
						</form>
					</div>
				</div>

                
                      <div class="row">
                      <c:forEach items="${articles}" var="article">
						<div class="col-xs-6 col-lg-4">
							<span class="thumbnail"> <a href="detail.action?id=${article.id}">
									<img src="resources/image/article/${article.image}" alt="...">
									<p style="height: 20px; overflow: hidden;">
									${article.title}
									</p>
							</a>
								<p>
									<span class="price">${article.price}</span>
	                                <font color="red"><fmt:formatNumber value="${article.price * article.discount}" pattern="0.00"></fmt:formatNumber>

	                                </font>  
								</p>
							</span>
						</div>
						 </c:forEach>
				</div>
               
				<!--/row-->


				<!-- p2是url前段部分pageNumber=之前 -->


				<!--  分页开始 -->
                <zx:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" pageStyle="black" totalNum="${pageModel.totalNum}" submitUrl="index.action?pageIndex={0}&keyword=${keyword}&typeCode=${typeCode}"></zx:pager>
				<!-- <div class="row">
					<nav>
						<ul class="pagination">

							<div>
								<a href="javascript:goPage(1)">首页</a> <a
									href='javascript:goPage(1)'>上一页</a> <a
									href='javascript:goPage(2)'>下一页</a> <a
									href='javascript:goPage(7)'>尾页</a> &nbsp; <span>第&nbsp;
									1&nbsp;页/共&nbsp; 7页 ，共 52 条数据 </span>
							</div>

						</ul>
				</div> -->
				<!-- 分页结束 -->
			</div>
			<!--/.col-xs-12.col-sm-9-->
			<!-- 内容主体结束 -->
		</div>
		<!--/row-->
		<hr>
		<footer>
			<p>&copy; 版权所有，欢迎借鉴</p>
		</footer>
	</div>
</body>
</html>