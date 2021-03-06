<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情页面</title>
   
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/taobao.css" rel="stylesheet" />

</head>

<body>

<!-- 横幅导航条开始 -->
<%@ include file="/WEB-INF/view/front/nva/nva_back.jsp" %>
<!-- 横幅导航条结束 -->

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <!-- 内容主体开始 -->
        <div class="col-xs-12 col-sm-12">
            <div class="col-xs-12 col-sm-6">
                <img alt="商品的图片" src="${pageContext.request.contextPath}/resources/image/article/${article.image}">
            </div>
            <div class="col-xs-12 col-sm-6">
                <p>${article.title}</p>
                <p>${article.supplier}</p>
                <p>
                    <span class="price">${article.price}</span>
                    <c:if test="${article.discount!=null}">
                        <span style="color: red">折扣价： (${article.discount})</span>
                    </c:if>

                </p>
                <p>
                    库存量：<span id="storage">${article.storage}</span>
                </p>
                <p>
                <form method="get" action="<c:url value="/mindex.do"/>">
                    <!-- 商品数量 -->
                    <button>
							<span class="glyphicon glyphicon-chevron-left"
                                  style="color: red;"></span>返回
                    </button>
                </form>
                </p>

            </div>
            <div class="col-xs-12">
                <fieldset>
                    <legend>介绍</legend>
                    ${article.description}
                </fieldset>
            </div>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>
</div>
<script src="${pageContext.request.contextPath }/resources/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/taobao.js"></script>
</body>
</html>