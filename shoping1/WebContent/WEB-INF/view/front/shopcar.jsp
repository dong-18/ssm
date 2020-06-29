<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>购物车</title>
<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />

<link href="resources/css/taobao.css" rel="stylesheet" />
<script src="resources/jquery/jquery-1.11.0.min.js"></script>
<script src="resources/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.js"></script>
<script src="resources/js/taobao.js"></script>
<script type="text/javascript">
	   
	      function num(flag,articleId,buyNumId,storage){
	    	  //获取购买数量 对应 输入框的dom对象
   		      var domObj = document.getElementById(buyNumId);
   		      //获取当前购买数量
   		      var num = parseInt(domObj.value);
	    	   if(flag == 'min' && num > 1){
	    		   domObj.value = num - 1;
	    	   }else if(flag == "plus" && num < storage){   
	    		   domObj.value = num + 1;
	    	   }
	    	   else if(flag == "plus" && num > storage)
	    		   {
	    		   domObj.value = storage;
	    		   }
	    	   window.location = "${ctx}/updateShopCar.do?articleId="+articleId+"&buynum="+domObj.value;
	      }
	      
	      //删除购物车中商品信息
	      function  deleteShopcar(id){
	    	  
	    	  if(window.confirm("是否确认删除?")){
	    		  window.location = "${ctx}/deleteShopCar.do?articleId="+id;
	    	  }
	      }

	      //进行全选操作
	      function checkAll(obj){
	    	   //获取所有的子checkbox
	    	   var boxes = document.getElementsByName("box");
	    	   for(var i=0;i<boxes.length;i++){
	    		   boxes[i].checked = obj.checked;
	    	   }
	    	   
	    	   //操作提交数量
	    	   document.getElementById("articleNum").innerText = obj.checked ? boxes.length : 0;
	     
	    	   //计算提交的订单的总金额
	    	   var totalPrice = 0.0;
	    	   var xjs = document.getElementsByName("xj");
	    	   for(var i=0;i<xjs.length;i++){
	    		   totalPrice += parseFloat(xjs[i].innerText);
	    	   }
	    	   document.getElementById("totalMoney").innerHTML = obj.checked ? totalPrice : "0";
	    	   document.getElementById("totalAmount").value = obj.checked ? totalPrice : 0;
	    	   //调用函数用于计算选中的商品id以及购买的商品数量
	    	   getCheckedArticleInfo();
	      }
	      
	      function boxcli(obj,xj){
	    	  //获取历史下单的数量
	    	 var num = document.getElementById("articleNum").innerText;
	    	  //获取历史下单的总金额
	    	  var totalPrice = document.getElementById("totalMoney").innerHTML;
	    	  if(obj.checked){
	    		  //当前checkbox是选中
	    		  document.getElementById("articleNum").innerText = parseInt(num)+1;
	    		  var n = parseFloat(totalPrice)+parseFloat(xj);

	    		  document.getElementById("totalMoney").innerHTML = (parseFloat(totalPrice)+parseFloat(xj)).toFixed(2);
	    	      
	    		  document.getElementById("totalAmount").value = (parseFloat(totalPrice)+parseFloat(xj)).toFixed(2);
	    	  }else{
	    		  //取消选中
	    		  document.getElementById("articleNum").innerText = parseInt(num)-1;
	    		  document.getElementById("totalMoney").innerHTML = (parseFloat(totalPrice)-parseFloat(xj)).toFixed(2);
	    		  document.getElementById("totalAmount").value = (parseFloat(totalPrice)-parseFloat(xj)).toFixed(2);

	    	  }
	    	  
	    	  //调用函数用于计算选中的商品id以及购买的商品数量
	    	   getCheckedArticleInfo();
	      }
	      
	      
	      function  getCheckedArticleInfo(){
	    	  
	    	  var info = "";
	    	  //获取所有的子checkbox
	    	   var boxes = document.getElementsByName("box");
	    	   for(var i=0;i<boxes.length;i++){
	    		  if(boxes[i].checked){
	    			  //当前checkbox是选中的，则获取该checkbox的value值
	    			  info = "#"+boxes[i].value + info;
	    		  }
	    	   }
	    	   
	    	   document.getElementById("articleInfo").value = info;
	    	   
	      }
	      
	      //提交订单
	      function fsubmit(){
	          var len = 0;
	    	  var boxes = document.getElementsByName("box");
	    	  for(var i=0;i<boxes.length;i++){
	    		  if(boxes[i].checked){
	    			  len++;
	    		  }
	    	  }
	    	  
	    	  if(len == 0){
	    		  alert("请选择需要购买的商品信息！");
	    	  }else{
	    		  //提交表单
	    		  document.getElementById("form").submit();
	    	  }
	      }
</script>

</head>
<body>
	<!-- 横幅导航条开始 -->
		<%@ include file="/WEB-INF/view/front/nva/nva.jsp" %>
	
	<!--  .navbar -->
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-12">
				<div>当前位置：我的购物车</div>
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-striped">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" onclick="checkAll(this)"></th>
								<th style="width: 15%">图片</th>
								<th style="width: 50%">名称</th>
								<th style="width: 10%">价格</th>
								<th style="width: 10%">数量</th>
								<th style="width: 8%">小计</th>
								<th style="width: 7%">操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.list}" var="shopcar" varStatus="stat">
	
							<tr>
								<td style="vertical-align: middle;"><input type="checkbox"
									 name="box" value="${shopcar.article.id}_${shopcar.buynum}" onclick="boxcli(this,'${shopcar.article.discountPrice * shopcar.buynum}')" /> <span id="total_1"
									style="display: none;"></span></td>
								<td><img alt="商品图片"
									src="resources/image/article/${shopcar.article.image}"></td>
								<td>${shopcar.article.title}</td>
								<td><span class="price">${shopcar.article.price}</span>&nbsp;<span style="color:red"><fmt:formatNumber pattern="0.00" value="${shopcar.article.discountPrice}"></fmt:formatNumber></span></td>
								<td><span class="glyphicon glyphicon-minus" onclick="num('min','${shopcar.article.id}','${stat.index}','${shopcar.article.storage}')"></span>
									<input id="${stat.index}" value="${shopcar.buynum}"
									style="width: 40px; text-align: center;"
									/> <span
									class="glyphicon glyphicon-plus" onclick="num('plus','${shopcar.article.id}','${stat.index}','${shopcar.article.storage}')"></span>
								</td>
								<td name="xj"><fmt:formatNumber pattern="0.00" value="${shopcar.article.discountPrice * shopcar.buynum}"></fmt:formatNumber></td>
								<td><a href="javascript:deleteShopcar('${shopcar.article.id}')">删除</a>
									<a>收藏</a></td>
							</tr>
                           </c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- 内容主体结束 -->
		</div>
		<!--/row-->
        <form action="${pageContext.request.contextPath}/saveOrder.do" method="post" id="form">
          <!-- 存放商品总金额 -->
          <input type="hidden" name="totalAmount" id="totalAmount"/>
          <!-- 存放商品id以及购买数量 -->
           <input type="hidden" name="articleInfo" id="articleInfo"/>
		<div align="right">
			总金额:<span id="totalMoney" style="color: red;">0</span>元&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="commitOrder" class="btn btn-danger" type="button" onclick="fsubmit()">
				提交订单 <span class="badge" id="articleNum">0</span>
			</button>
		</div>
	  </form>

		<hr>
		<footer>
			<p>&copy; 版权所有，欢迎借鉴</p>
		</footer>
	</div>
	<!--/.container-->
	<!--  横幅下方的主体结束 -->
</body>
</html>