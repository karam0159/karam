<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function()
{
	// 초기값 설정
	var gPrice = parseInt($('.goodsPrice').val());
	
	var gCountS = parseInt($('#countS').val());
	var gCountM = parseInt($('#countM').val());
	var gCountL = parseInt($('#countL').val());
		
	$('#priceS').val(gPrice*gCountS);
	$('#priceM').val(gPrice*gCountM);
	$('#priceL').val(gPrice*gCountL);
	
	var priceS = parseInt($("#priceS").val());
	var priceM = parseInt($("#priceM").val());
	var priceL = parseInt($("#priceL").val());
	var allPrice = priceS+priceM+priceL;
	
	$(".goodsAllPrice").val(allPrice);

	var siteMoney = parseInt($('.siteMoney').val());
	var memberUseSiteMoney = parseInt($('.memberUseSiteMoney').val());
	var allPrice = parseInt($('.goodsAllPrice').val());
	var lastprice = (allPrice-memberUseSiteMoney);
	$('.goodsLastPrice').val(lastprice);

	//////////////////////////////////////////////////////
	
	$(".menuA").click(function(){
		
		$('.menuA').removeClass('underLine');
		$(this).addClass('underLine');
	});
	
	$("#countS").change(function(){				// 스몰 사이즈 변경
		
		var gPrice = parseInt($('.goodsPrice').val());
		var gCountS = parseInt($('#countS').val());
		var gCountM = parseInt($('#countM').val());
		var gCountL = parseInt($('#countL').val());
		var allCount = gCountS+gCountM+gCountL;
		
		if(allCount == 0)
		{
			alert("1개 이상은 구입하셔야합니다.");
			$('#countS').val(1);
			var gCountS = parseInt($('#countS').val());
			$("#priceS").val(gPrice);
		}
		
		var SPrice = gPrice*gCountS;
		$("#priceS").val(SPrice);
		
		var priceS = parseInt($("#priceS").val());
		var priceM = parseInt($("#priceM").val());
		var priceL = parseInt($("#priceL").val());
		var allPrice = priceS+priceM+priceL;
		
		var del_priceX = parseInt($("#del_priceX").val());
		
		if(gCountS < 0)
		{
			alert("0보다 적은 수는 선택 하실 수 없습니다.");
			$('#countS').val(0);
			$("#priceS").val(0);
		}
		if(allPrice >= 50000)
		{
			$(".delPrice").val(0);
			$(".goodsAllPrice").val(allPrice);
		}
		else if(allPrice < 50000)
		{
			$(".delPrice").val(del_priceX);
			$(".goodsAllPrice").val(allPrice+del_priceX);
		}
		
		
		var siteMoney = parseInt($('.siteMoney').val());
		var memberUseSiteMoney = parseInt($('.memberUseSiteMoney').val());
		var allPrice = parseInt($('.goodsAllPrice').val());
		var lastprice = (allPrice-memberUseSiteMoney);
		$('.goodsLastPrice').val(lastprice);
	});
	$("#countM").change(function(){			// 미디움 사이즈 변경
		
		var gPrice = parseInt($('.goodsPrice').val());
		var gCountS = parseInt($('#countS').val());
		var gCountM = parseInt($('#countM').val());
		var gCountL = parseInt($('#countL').val());
		var allCount = gCountS+gCountM+gCountL;
		
		if(allCount == 0)
		{
			alert("1개 이상은 구입하셔야합니다.");
			$('#countM').val(1);
			var gCountM = parseInt($('#countM').val());
			$("#priceM").val(gPrice);
		}
		
		var MPrice = gPrice*gCountM;
		$("#priceM").val(MPrice);
		
		var priceS = parseInt($("#priceS").val());
		var priceM = parseInt($("#priceM").val());
		var priceL = parseInt($("#priceL").val());
		var allPrice = priceS+priceM+priceL;
		
		var del_priceX = parseInt($("#del_priceX").val());
		
		if(gCountM < 0)
		{
			alert("0보다 적은 수는 선택 하실 수 없습니다.");
			$('#countM').val(0);
			$("#priceM").val(0);
		}
		if(allPrice >= 50000)
		{
			$(".delPrice").val(0);
			$(".goodsAllPrice").val(allPrice);
		}
		else if(allPrice < 50000)
		{
			$(".delPrice").val(del_priceX);
			$(".goodsAllPrice").val(allPrice+del_priceX);
		}
		
		
		var siteMoney = parseInt($('.siteMoney').val());
		var memberUseSiteMoney = parseInt($('.memberUseSiteMoney').val());
		var allPrice = parseInt($('.goodsAllPrice').val());
		var lastprice = (allPrice-memberUseSiteMoney);
		$('.goodsLastPrice').val(lastprice);
		
	});
	$("#countL").change(function(){			// 라지 사이즈 변경
		
		var gPrice = parseInt($('.goodsPrice').val());
		var gCountS = parseInt($('#countS').val());
		var gCountM = parseInt($('#countM').val());
		var gCountL = parseInt($('#countL').val());
		var allCount = gCountS+gCountM+gCountL;
		
		if(allCount == 0)
		{
			alert("1개 이상은 구입하셔야합니다.");
			$('#countL').val(1);
			var gCountL = parseInt($('#countL').val());
			$("#priceL").val(gPrice);
		}
		
		var LPrice = gPrice*gCountL;
		$("#priceL").val(LPrice);
		
		var priceS = parseInt($("#priceS").val());
		var priceM = parseInt($("#priceM").val());
		var priceL = parseInt($("#priceL").val());
		var allPrice = priceS+priceM+priceL;
		
		var del_priceX = parseInt($("#del_priceX").val());
		
		if(gCountL < 0)
		{
			alert("0보다 적은 수는 선택 하실 수 없습니다.");
			$('#countL').val(0);
			$("#priceL").val(0);
		}
		if(allPrice >= 50000)
		{
			$(".delPrice").val(0);
			$(".goodsAllPrice").val(allPrice);
		}
		else if(allPrice < 50000)
		{
			$(".delPrice").val(del_priceX);
			$(".goodsAllPrice").val(allPrice+del_priceX);
		}
		
		var siteMoney = parseInt($('.siteMoney').val());
		var memberUseSiteMoney = parseInt($('.memberUseSiteMoney').val());
		var allPrice = parseInt($('.goodsAllPrice').val());
		var lastprice = (allPrice-memberUseSiteMoney);
		$('.goodsLastPrice').val(lastprice);
	});	
	
	// 구매자정보와 받는이 정보매칭
	$('.goodsBuyArrow').click(function(){
		$('.DelName').val($('.BuyName').val());
		$('.DelTel').val($('.BuyTel').val());
		$('.DelAddress').val($('.BuyAddress').val());
	});
	
	// 적립금 사용
	$('.memberUseSiteMoney').change(function(){
		var siteMoney = parseInt($('.siteMoney').val());
		var memberUseSiteMoney = parseInt($('.memberUseSiteMoney').val());
		var allPrice = parseInt($('.goodsAllPrice').val());
	
		if(siteMoney < memberUseSiteMoney)
		{
			alert('소유하신 적립금 보다 많습니다.');
			$('.memberUseSiteMoney').val(siteMoney);
			var noError = allPrice-siteMoney;
			$('.goodsLastPrice').val(noError);
		}
		else
		{
			var lastprice = (allPrice-memberUseSiteMoney);
			$('.goodsLastPrice').val(lastprice);
		}

		
	});

	
	$('#payBtn').hover(function(){
		$('#payBtn').stop().animate({
			backgroundColor:'black',
			color:'white'
		},300);
	},
	function()
	{
		$('#payBtn').stop().animate({
			backgroundColor:'white',
			color:'black'
		},300);
	});
	
	
	$('#deleteBtn').hover(function(){
		$('#deleteBtn').stop().animate({
			backgroundColor:'black',
			color:'white'
		},300);
	},
	function()
	{
		$('#deleteBtn').stop().animate({
			backgroundColor:'white',
			color:'black'
		},300);
	});
	
	
});
</script>
</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="wrapper_p">
			<form action="BuyGoodsUpdate.do" method="post">
				<div class="goodsBuyBox">
					<a class="goodsBuyTitle">상품 정보</a>
					<img src=".${buyGoodsVO.goods_imageTitle }" alt="상품이미지" class="goodsImg"/>
					<div class="GoodsInfo">
						<input type="text" value="${buyGoodsVO.goods_name}" name="goods_name" readonly="readonly" class="goodsName" /><br>
						<a class="goodsBuyInfoA">가격</a><input type="text" value="${buyGoodsVO.goods_price}" name="goods_price" class="goodsPrice" readonly="readonly"/><a class="won">원</a>
						<input type="hidden" name="member_id" value="${buyGoodsVO.member_id }" />
						<input type="hidden" name="goods_index" value="${buyGoodsVO.goods_index}" />
						<input type="hidden" name="goods_kind" value="${buyGoodsVO.goods_kind}" />
						<input type="hidden" name="buy_index" value="${buyGoodsVO.buy_index}" />
						<input type="hidden" name="member_usesitemoney" value="${buyGoodsVO.member_usesitemoney }" />
					</div>
				</div>
				<div class="goodsBuyHumanBox">
					<a class="goodsBuyTitle">구매자 정보</a>
					<a>이름</a><br><input type="text" value="${memberVO.member_name }" name="member_name" class="BuyName" required="required"/>
					<a>전화번호</a><br><input type="text" value="${memberVO.member_tel }" name="member_tel" class="BuyTel" required="required"/>
					<a>주소</a><br><input type="text" value="${memberVO.member_address }" name="member_address" class="BuyAddress" required="required"/>
				</div>
				<img src="./image/icon/rightArrow.PNG" alt="구매자정보에서배송자정보" class="goodsBuyArrow"/>
				<div class="goodsBuyHumanBox">
					<a class="goodsBuyTitle">받는이 정보</a>
					<a>받는이 이름</a><br><input type="text" value="${buyGoodsVO.del_name}" name="del_name" class="DelName" required="required"/>
					<a>받는이 전화번호</a><br><input type="text" value="${buyGoodsVO.del_tel }" name="del_tel" class="DelTel" required="required"/>
					<a>받는이 주소</a><br><input type="text" value="${buyGoodsVO.del_address }" name="del_address" class="DelAddress" required="required"/>
					<a>배송메모</a><br><input type="text" value="${buyGoodsVO.del_request }" name="del_request" />
				</div>
				<div class="goodsBuyPayment" style="height:320px;">
					<a class="goodsBuyTitle">입금계좌정보</a><br>
					<a class="leftmargin">입금자</a>
					<a>입금은행</a>
					<a>계좌번호</a>
					<input type="text" name="account_name" value="${memberVO.account_name }" class="leftmargin" ><a class="blank">-</a>
					<input type="text" name="account_bank" value="${memberVO.account_bank }" class="" ><a class="blank">-</a>
					<input type="text" name="account" value="${memberVO.account }" class="" readonly="readonly"/><br>
				
				<c:if test="${buyGoodsVO.del_state eq '입금대기중' }">
					<input type="submit" value="수정하기" class="payBtn" id="payBtn">
					<input type="button" value="구입취소" class="payBtn" id="deleteBtn" onclick="BuyGoodsDelete('${buyGoodsVO.buy_index}','${buyGoodsVO.member_usesitemoney}','${buyGoodsVO.member_id }');">
				</c:if>
				<c:if test="${buyGoodsVO.del_state ne '입금대기중' }">
					<a style="margin-top:50px;width:1100px; text-align:center; display:inline-block;">상품이 배송중이라 수정하실 수 없습니다.</a><br>
					<a style="margin-top:20px;width:1100px; text-align:center; display:inline-block;">상품의 수정을 원하신다면 고객센터로 연락주세요.</a>
				</c:if>

				</div>
			</form>
		</div>
	</div>
	<script>
		function BuyGoodsDelete(buy_index,member_usesitemoney,member_id)
		{
			location.href = "BuyGoodsDelete.do?buy_index="+buy_index+"&member_usesitemoney="+member_usesitemoney+"&member_id="+member_id;
		}
	</script>
</body>
</html>