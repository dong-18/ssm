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
    <title>商品类型修改添加页面</title>
  
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/taobao.css" rel="stylesheet" />
    <!-- 引入分页标签样式 -->
    <link href="${pageContext.request.contextPath }/resources/css/pager.css" rel="stylesheet" />
    <script src="resources/jquery/jquery.js"></script>

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
	

      <script type="text/javascript">
      
           $(function(){
        	   //获取商品的类型   
               var code = "${articleType.code}";

              
               var pCode = code.substring(0,code.length - 4);
               $("#selectParent").val(pCode);
        	   
           })
          
      </script>
</head>

<body>

<!-- 横幅导航条开始 -->
<%@ include file="/WEB-INF/view/front/nva/nva_back.jsp" %>
<!-- 横幅导航条结束 -->

<!--  主体内容开始 -->
<div class="container">
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>
	    		<c:if test="${not empty articleType }">
	    			修改
	    		</c:if>
	    		<c:if test="${empty articleType }">
	    			新增
	    		</c:if>
	    		商品类型
	    	</span>
	    </div>
	    <div class="panel-body" style="padding-top: 15px;">
		    <form action="<c:url value="addOrUpdateArticleType.do"/>" method="post"
		    	class="form-horizontal">
		    	<input type="text" value="${articleType.code}" name="code"/>
		    	<div class="form-group col-sm-12 col-md-6">
				    <label for="selectParent" class="col-sm-2 control-label">上级类型</label>
				    <div class="col-sm-10">
				        <select class="form-control" name="parentCode" id="selectParent">
				        	<option value="">==请选择==</option>
				        	<c:forEach items="${types}" var="type">
				        	   <option value="${type.code}">${type.name}</option>
				        	</c:forEach>
				        </select>
				    </div>
				</div>

		    	<div class="form-group col-sm-12 col-md-6">
				    <label for="inputName" class="col-sm-2 control-label">名称</label>
				    <div class="col-sm-10">
				        <input class="form-control" name="name" value="${articleType.name}" id="inputName" />
				    </div>
				</div>
		    	<div class="form-group col-sm-12">
				    <label for="inputRemark" class="col-sm-1 control-label">备注</label>
				    <div class="col-sm-11">
				        <textarea class="form-control" name="remark" id="inputRemark">${articleType.remark}</textarea>
				    </div>
				</div>
				<div class="form-group col-sm-12">
					<div class="pull-right">
				    	<button type="submit" class="btn btn-primary">提交</button>
				    </div>
				</div>
		    </form>
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