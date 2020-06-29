<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a  class="navbar-brand " style="color: red" href="<c:url value="/mindex.do"/>">卖家系统-商品管理</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
        
        	<ul class="nav navbar-nav">
        		<li class="active"><a href="<c:url value="/mindex.do"/>">商品管理</a></li>
	            <li><a href="<c:url value="/articleTypeList.do"/>">商品类型管理</a></li>
	            <li><a href="<c:url value="/userList.do"/>">用户管理</a></li>
	            <li><a href="<c:url value="/mOrderList.do"/>">订单管理</a></li>
          	</ul>
          	
             <ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${not empty session_user}">
						  	<li><a href="#"> <span style='color: red;'></span>
							</a></li>
							<li><a href="#">欢迎[<font color="red">${session_user.name}</font>]访问!</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
							<li><a href="${ctx}/register.action">免费注册</a></li>
						    <li><a href="${pageContext.request.contextPath}/index.action">进入官网</a></li>
						    
						</c:when>
						<c:otherwise>
							<li><a href="#"> <span style='color: red;'></span>
							</a></li>
							<li><a href="${ctx}/login.action">登录</a></li>
							<li><a href="${ctx}/register.action">免费注册</a></li>
						    <li><a href="${pageContext.request.contextPath}/index.action">进入官网</a></li>
						    
						</c:otherwise>
					</c:choose>
			</ul>
        </div>

    </div>
</nav>