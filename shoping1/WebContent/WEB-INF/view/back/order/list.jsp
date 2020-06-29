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
    <title>订单列表页面</title>
   
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/css/taobao.css" rel="stylesheet" />
    <!-- 引入分页标签样式 -->
    <link href="${pageContext.request.contextPath }/resources/css/pager.css" rel="stylesheet" />

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
	   
	     function sendOrder(id,status){
	    	 
	    	var flag = window.confirm(status == "0" ? "是否取消发货" :"是否确认发送?");
	    	if(flag){
	    		window.location = "${pageContext.request.contextPath}/checkOrder.do?id="+id+"&status="+status;
	    	}
	     }
	
	</script>
</head>

<body>

<!-- 横幅导航条开始 -->
<%@ include file="/WEB-INF/view/front/nva/nva_back.jsp" %>

<!-- 横幅导航条结束 -->
 <div class="container">
                
                
            <div class="alert alert-info" role="alert">
                <div>
                    <form action="<c:url value="/mOrderList.do"/>" method="post">
                        <table class="table-condensed">
                            <tbody>
                            <tr>
                               <td>
                                <div class="input-group">
                                    
                                                                                          支付状态:<input type="radio" value="1" name="payStatus"/>已支付   
                                           <input type="radio" value="0" name="payStatus"/>未支付                                                                                     
                                </div>
                               </td>
                              
                              <td>    
                                <div class="input-group">
                                    <input type="text" name="ordeCode" value="${ordeCode}"
                                           class="form-control" placeholder="订单编号" />
                                                                                                                                        
                                    <div class="input-group-btn">
                                        <button class="btn" type="submit">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                                </td>
                              
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            
            
				<div class="table-responsive">
				<table class="table table-hover table-bordered table-striped">
				
				<!-- 遍历订单 -->
				<c:forEach items="${orderList}" var="order">
				
				     <thead>
						<tr style="background-color: #eeccff">
							<th style="width: 15%">订单号</th>
							<th style="width: 20%">下单时间</th>
							<th style="width: 15%">发货时间</th>
							<th style="width: 10%">订单状态</th>
							<th style="width: 10%">订单总金额</th>
							<th style="width: 10%">支付状态</th>
							<th style="width: 20%">操作</th>
						</tr>
					</thead>
					
					<tbody>
					    <tr>
								<td>
									 ${order.orderCode}
								</td>
								<td>
								   <fmt:formatDate value="${order.createDate}" pattern="yyyy年MM月dd日  HH:mm:ss"/> 
								</td>
								<td>
									<fmt:formatDate value="${order.sendDate}" pattern="yyyy年MM月dd日  HH:mm:ss"/> 
								</td>
								<td>
								   <c:choose>
								      <c:when test="${order.status eq '0'}">未发货</c:when>
								      <c:otherwise>已发货</c:otherwise>
								   </c:choose>
								</td>
								<td>
									${order.amount}
								</td>
								
								<td>
									<c:choose>
									    <c:when test="${order.paystatus eq '0'}">
									                             未支付
									    </c:when>
									    <c:otherwise>
									                             已支付
									    </c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
									      <c:when test="${order.status eq '0'}">
									         <a href="javascript:sendOrder('${order.id}','1')">确认发货</a>
									      </c:when>
									       <c:when test="${order.status eq '1'}">
									         <a href="javascript:sendOrder('${order.id}','0')">取消发货</a>
									      </c:when>
									</c:choose>
								</td>
							</tr>
					
					</tbody>
					
					
					<!-- 获取订单中的详情信息   order.items:List<OrderItem>    item:OrderItem -->
					<c:forEach items="${order.items}" var="item">
					      <thead>
						<tr>
							<th style="width: 15%">图片</th>
							<th style="width: 20%">名称</th>
							<th style="width: 15%">原价</th>
							<th style="width: 10%">折后价</th>
							<th style="width: 10%">购买数量</th>
							<th style="width: 10%">小计</th>
							<th style="width: 20%">库存</th>
						</tr>
					</thead>
					<tbody>
					
						
					 
							<tr>
								<td>
									<img alt="商品图片" src="${pageContext.request.contextPath}/resources/image/article/${item.article.image}">
								</td>
								<td>
                                    ${item.article.title}
								</td>
								<td>
									<span class="price">${item.article.price}</span>	
								</td>
								<td>
									<font color="red"><fmt:formatNumber value="${item.article.discount * item.article.price}" pattern="0.00"></fmt:formatNumber></font>	
								</td>
								<td>
								     ${item.orderNum}
								</td>
								<td>
									<fmt:formatNumber value="${item.article.discount * item.article.price * item.orderNum}" pattern="0.00"></fmt:formatNumber>
								</td>
								
								<td>
									${item.article.storage}
								</td>
							</tr>
						
					</tbody> 
					</c:forEach>
				   
				</c:forEach>
  
				</table>
				 
			</div>
				 
             <zx:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" pageStyle="black" totalNum="${pageModel.totalNum}" 
		   submitUrl="${pageContext.request.contextPath}/mOrderList.do?pageIndex={0}"></zx:pager>

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