<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<html>
<head>
<title>주문 목록</title>
	<style>
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:900px; margin:0 auto; }
		header#header {}
		/* nav#nav {} */
		section#container { }
			section#content { float:right; width:700px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:20px; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center; padding:30px 0; }
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
/* 		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; } */
		
		section#container { }
		
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:white; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#ff7f00; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#ff7f00; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#ff7f00; border:1px solid #ff7f00; }
		aside#aside li:hover > ul.low li a:hover { background:#ff7f00;}
		aside#aside li > ul.low li { width:180px; }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
	</style>
	
<style>
/*
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
*/
	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	section#content ul li a { color:#ff7f00; }
	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
	
</head>
<body>
<pre>

</pre>
<div id="root">
	
	<section id="container">
		<h1 style="color:white;"><b>구매 내역</b></h1>
		<hr color="white">
		<div id="container_box">
		
			<section id="content">
				
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
						<li>
							<div>
								<p><span>주문번호</span><a href="${pageContext.request.contextPath}/Order/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
								<p><span>아이디</span>${orderList.id}</p>
								<p><span>총 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.totalPrice}" /> 원</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			
			</section>
			
			<aside id="aside">
				<%@ include file="../aside.jsp" %>
			</aside>
			
		</div>
	</section>

</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>