<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品详情</title>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="resources/css/taobao.css" rel="stylesheet" />
<script src="resources/jquery/jquery.js"></script>
<script src="resources/bootstrap/js/bootstrap.js"></script>
<script src="resources/js/taobao.js"></script>

<script type="text/javascript">
	//通过该函数控制  加与减
	function num(flag) {

		//获取当前购买数量
		var buyNum = parseInt(document.getElementById("number").value);

		if (flag == "plus" && buyNum < "${article.storage}") {
			document.getElementById("number").value = buyNum + 1;
		} else if (flag == "min" && buyNum > 1) {
			document.getElementById("number").value = buyNum - 1;
		}

	}

	//校验用户输入的数据是否合法
	function validNum(obj) {

		//获取用户输入的值
		var val = obj.value;
		if (isNaN(val) || val < 1) {
			obj.value = 1;
		} else {
			//向上取整
			obj.value = Math.ceil(obj.value) > "${article.storage}" ? "${article.storage}"
					: Math.ceil(obj.value);
		}
	}
</script>
</head>
<body>
	<!-- 横幅导航条开始 -->
	<%@ include file="/WEB-INF/view/front/nva/nva.jsp"%>
	<!--  横幅下方的主体开始 -->
	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-12">
				<div class="col-xs-12 col-sm-6">
					<img style="width: 200px; height: 200px;" alt="商品的图片"
						src="${ctx}/resources/image/article/${article.image}">
				</div>
				<div class="col-xs-12 col-sm-6">
					<p>${article.title}</p>
					<p>${article.locality}</p>
					<p>${article.supplier}</p>
					<p>
						<span class="price">${article.price}</span> <font color="red">${article.price * article.discount}</font>
					</p>
					<p>
						库存量：<span id="storage">${article.storage}</span>
					</p>
					<p>

						<c:choose>
							<c:when test="${article.disabled eq '0'}">
								<form method="get" action="${ctx}/addToCar.do">
									<input type="hidden" name="id" value="${article.id}" /> <span
										style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;"
										onclick="num('min')">-</span> <input id="number"
										onblur="validNum(this)" name="number" value="1"
										style="width: 50px;" /> <span
										style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;"
										onclick="num('plus')">+</span>
									<button>
										<span class="glyphicon glyphicon-shopping-cart"
											style="color: red;"></span>加入购物车
									</button>
								</form>
							</c:when>

							<c:otherwise>
								<form method="get" action="<c:url value="/index.action"/>">
									<!-- 商品数量 -->
									<button>
										<span class="glyphicon glyphicon-chevron-left"
											style="color: red;"></span>返回
									</button>
								</form>
							</c:otherwise>

						</c:choose>

					</p>
				</div>
				<div class="col-xs-12">
					<fieldset>
						<legend>介绍</legend>

						${article.description}
					</fieldset>
				</div>
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
	<!--/.container-->
	<!--  横幅下方的主体结束 -->

</body>
</html>