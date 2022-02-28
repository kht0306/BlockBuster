<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<html>
<head>
<title>주문 상세 목록</title>	
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
		
		/* nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
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
	.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;} 
	.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
	
	.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	.orderView li::after { content:""; display:block; clear:both; }
	
	.thumb { float:left; width:200px; }
	.thumb img { width:200px; height:300px; }
	.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
	.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	.gdsInfo input.button { font-size:15px; border:none; padding:5px 10px; background:#F5F5F5; border-radius:8px; margin-right:20px;}
	.gdsInfo input.button:hover { background-color: #ff7f00; }
</style>

</head>
<body>
<pre>

</pre>
<div id="root">
	
	<section id="container">
		<h1 style="color:white;"><b>구매 상세 목록</b></h1>
		<hr color="white">
		<div id="container_box">
		
			<section id="content">
			
				<div class="orderInfo">
					<c:forEach items="${orderView}" var="orderView" varStatus="status">	
						<%-- 첫번째 요소만 출력. 주문 상세 페이지에서 중복되는 부분이므로 모두 출력할 필요 없음 --%>
						<c:if test="${status.first}">
							<p><span>주문번호</span>${orderView.orderId}</p>
							<p><span>아이디</span>${orderView.id}</p>
							<p><span>총 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.totalPrice}" /> 원</p>						
						</c:if>			
					</c:forEach>
				</div>
				
				<ul class="orderView">
					<c:forEach items="${orderView}" var="orderView">					
					<li>
						<div class="thumb">
							<img src="${orderView.p_img}" onerror="this.src='${pageContext.request.contextPath}/resources/img/logo2.png'" />
						</div>
						<div class="gdsInfo">
							<p>
								<span>상품명</span>${orderView.title}<br />
								<span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.price}" /> 원<br />                
							</p>
							<input type="button" value="재생 ▶" onclick="window.open('${orderView.p_video }')" class="button"> <!-- window.open은 새로운 창이 뜸 -->
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