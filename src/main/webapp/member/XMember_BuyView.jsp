<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>


<script>
$( document ).ready( function() {
   
    
    $('.buyDeliveryUpdateBtn').hover(function()
    {
    	$('.buyDeliveryUpdateBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.buyDeliveryUpdateBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    
    $('.buyDeliveryDeleteBtn').hover(function()
    {
    	$('.buyDeliveryDeleteBtn').stop().animate({
    	    	backgroundColor:'black',
    	    	color:'white'
    	 },300);
    	    			
    },
    function()
    {
    	 $('.buyDeliveryDeleteBtn').stop().animate({
    	    	backgroundColor:'white',
    	    	color:'black'
    	 },300);
    });
    
  } );
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="buyViewBody">
				<a class="title">Buy View</a>
				<div class="buyViewBox">
					<img src="image/battle.jpg" alt="상품이미지" class="buyImage"/>
					<a class="goods_name">상품제목</a><br>
					<a class="buy_index">주문번호</a><br>
					<a class="goods_kind">상품 종류</a><br>
					<a class="goods_price">상품 가격</a><br>
					<a class="goods_count">상품 수</a><br>
					<a class="tel">전화번호</a><br>
					<a class="name">입금인</a><br>
					<a class="account_name">입금계좌</a><br>
					<a class="goods_lastprice">총 입금 금액</a>/<a class="goods_pay">실제 입금 금액</a>
				</div>
				<div class="buyViewBox2">
					<a class="deladdr">배송지</a><br>
					<a class="delname">상품수신인</a><br>
					<a class="deltel">수신인전화번호</a><br>
					<a class="delrequest">기타메시지</a><br>
					<a class="delState">배송상태</a><br>
					<a href="#" class="buyDeliveryUpdateBtn">구입상품 정보수정</a>
					<a href="#" class="buyDeliveryDeleteBtn">구입상품 취소하기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

