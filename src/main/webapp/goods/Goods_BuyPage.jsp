<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
	var goodsAllprice = parseInt($(".goodsAllPrice").val());
	if(goodsAllprice > 50000)
	{
		$(".delPrice").val(0);
	}
	else
	{
		$(".delPrice").val(2500);
		$(".goodsAllPrice").val(allPrice+2500);
	}

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
		// 적립금에 값 null 체크
		var memberUseSiteMoneyX = $('.memberUseSiteMoney').val();
		if(memberUseSiteMoneyX == null || memberUseSiteMoneyX == "")
		{
			$('.memberUseSiteMoney').val(0);
		}
		
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
		if(memberUseSiteMoney < 0)
		{
			alert("0원미만으로는 사용하실수 없습니다.");	
			$('.memberUseSiteMoney').val("0");
			$('.goodsLastPrice').val(allPrice);
		}
		
	});
	
	('.memberUseSiteMoney').keyup(function(){
		// 적립금에 값 null 체크
		var memberUseSiteMoneyX = $('.memberUseSiteMoney').val();
		if(memberUseSiteMoneyX == null)
		if(memberUseSiteMoneyX == null || memberUseSiteMoneyX == "")
		{
			$('.memberUseSiteMoney').val(0);
		}
		
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
		if(memberUseSiteMoney < 0)
		{
			alert("0원미만으로는 사용하실수 없습니다.");	
			$('.memberUseSiteMoney').val("0");
			$('.goodsLastPrice').val(allPrice);
		}		
	});
	
	
});
</script>
</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="wrapper_p">
			<form action="BuyGoodsInsert.do" method="post">
				<div class="goodsBuyBox">
					<a class="goodsBuyTitle">상품 정보</a>
					<img src=".${goodsVO.goods_imageTitle }" alt="상품이미지" class="goodsImg"/>
					<div class="GoodsInfo">
						<input type="text" value="${goodsVO.goods_name }" name="goods_name" readonly="readonly" class="goodsName" /><br>
						<fmt:parseNumber var="Integerprice" value="${goodsVO.goods_price-goodsVO.goods_price/100*goodsVO.goods_sale}" integerOnly="true" />
						
						<a class="goodsBuyInfoA">가격</a><input type="text" value="${Integerprice}" name="goods_price" class="goodsPrice" readonly="readonly"/><a class="won">원</a>
						<a class="goodsBuyInfoB">갯수(Size-S)</a><input type="number" value="${goods_countS }" name="goods_countS" class="goodsCount" id="countS"/><a class="won">개</a><br>
						<a class="goodsBuyInfoB">갯수(Size-M)</a><input type="number" value="${goods_countM }" name="goods_countM" class="goodsCount" id="countM"/><a class="won">개</a><br>
						<a class="goodsBuyInfoB">갯수(Size-L)</a><input type="number" value="${goods_countL }" name="goods_countL" class="goodsCount" id="countL"/><a class="won">개</a><br>
						<a class="goodsBuyInfoB">배송비</a><input type="text" value="" name="del_price" class="delPrice" readonly="readonly"/><a class="won">원</a><br>
						
						<input type="hidden" id="del_priceX" value="2500"/>
						<input type="hidden" id="priceS" value="0"/>
						<input type="hidden" id="priceM" value="0"/>
						<input type="hidden" id="priceL" value="0"/>
						<input type="hidden" name="goods_imageTitle" value="${goodsVO.goods_imageTitle }"/>
						<input type="hidden" name="member_id" value="${memberVO.member_id }" />
						<input type="hidden" name="goods_index" value="${goodsVO.goods_index}" />
						<input type="hidden" name="goods_kind" value="${goodsVO.goods_kind}" />
						
						<div class="margin"></div>
						<a class="goodsBuyInfoB" style="width:60px;">총가격</a><input type="text" value="" name="" class="goodsAllPrice" readonly="readonly"><a class="won" style="font-size:24px;">원</a><br>
					</div>
				</div>
				<div class="goodsBuyHumanBox">
					<a class="goodsBuyTitle">구매자 정보</a>
					<a>이름</a><br><input type="text" value="${memberVO.member_name }" name="member_name" class="BuyName" required="required"/>
					<a>전화번호</a><br><input type="text" value="${memberVO.member_tel }" name="member_tel" class="BuyTel" required="required"/>
					<a>주소</a><br><input type="text" value="${memberVO.member_address }" name="member_address" class="BuyAddress" required="required"/>
					<a>적립금</a><br><input type="text" value="${memberVO.member_siteMoney }" name="member_sitemoney" class="siteMoney" readonly="readonly"/>
				</div>
				<img src="./image/icon/rightArrow.PNG" alt="구매자정보에서배송자정보" class="goodsBuyArrow"/>
				<div class="goodsBuyHumanBox">
					<a class="goodsBuyTitle">받는이 정보</a>
					<a>받는이 이름</a><br><input type="text" value="" name="del_name" class="DelName" required="required"/>
					<a>받는이 전화번호</a><br><input type="text" value="" name="del_tel" class="DelTel" required="required"/>
					<a>받는이 주소</a><br><input type="text" value="" name="del_address" class="DelAddress" required="required"/>
					<a>배송메모</a><br><input type="text" value="" name="del_request" />
				</div>
				<div class="goodsBuyPayment">
					<a class="goodsBuyTitle">결제 정보</a><br>
					<a class="leftmargin">결제금액</a>
					<a>적립금사용</a>
					<a>최종결제금액</a>
					<input type="text" name="goods_allprice" value="" class="goodsAllPrice leftmargin" readonly="readonly"><a class="blank">-</a>
					<input type="number" name="member_usesitemoney" value="0" class="memberUseSiteMoney" ><a class="blank">=</a>
					<input type="text" name="goods_lastprice" value="" class="goodsLastPrice" readonly="readonly"/><br>
					
					<a class="goodsBuyTitle">입금계좌정보</a><br>
					<a class="leftmargin">입금자</a>
					<a>입금은행</a>
					<a>계좌번호</a>
					<input type="text" name="account_name" value="${memberVO.account_name }" class="leftmargin" ><a class="blank">-</a>
					<input type="text" name="account_bank" value="${memberVO.account_bank }" class="" ><a class="blank">-</a>
					<input type="text" name="account" value="${memberVO.account }" class="" readonly="readonly"/><br>
										
					<input type="submit" value="결제하기" class="payBtn">
				</div>
			</form>
		</div>
	</div>
	<script>
	$(document).ready(function()
	{
		$('.payBtn').hover(function(){
			$('.payBtn').stop().animate({
				backgroundColor:'black',
				color:'white'
			},300);
		},
		function()
		{
			$('.payBtn').stop().animate({
				backgroundColor:'white',
				color:'black'
			},300);
		});
	});
	</script>
</body>
</html>