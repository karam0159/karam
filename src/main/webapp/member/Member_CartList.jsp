<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function()
{
	var gPrice = parseInt($('.goodsPrice').val());
	var gCount = parseInt($('.goodsCount').val());
	var dPrice = parseInt($('.delPrice').val());
	var allprice = ((gPrice*gCount)+dPrice);
	$('.goodsAllPrice').val(allprice);
	$('.goodsLastPrice').val(allprice);
	
	$(".menuA").click(function(){
		
		$('.menuA').removeClass('underLine');
		$(this).addClass('underLine');
	});
	
	$(".goodsCount").change(function(){
		
		var gPrice = parseInt($('.goodsPrice').val());
		var gCount = parseInt($('.goodsCount').val());
		var dPrice = parseInt($('.delPrice').val());
		var allprice = ((gPrice*gCount)+dPrice);
		
		if(gPrice*gCount < 50000)
		{
			$('.goodsAllPrice').val(allprice);
			$('.delPrice').val("2500");
			if(gCount < 1)
			{
				$('.goodsCount').val("1");
				alert('1보다 낮은 값은 선택하실 수 없습니다.');
				$('.goodsAllPrice').val(gPrice+dPrice);
			}
		}
		if(gPrice*gCount >= 50000)
		{
			$('.goodsAllPrice').val(gPrice*gCount);
			$('.delPrice').val("0");
			if(gCount < 1)
			{
				$('.goodsCount').val("1");
				alert('1보다 낮은 값은 선택하실 수 없습니다.');
				$('.goodsAllPrice').val(gPrice);
			}
			
		}
	});
	
	// 구매자정보와 받는이 정보매칭
	$('.goodsBuyArrow').click(function(){
		$('.DelName').val($('.BuyName').val());
		$('.DelTel').val($('.BuyTel').val());
		$('.DelAddress').val($('.BuyAddress').val());
	});
	
	// 적립금 사용
	$('.memberUseSiteMoney').change(function(){
		var memberSM = parseInt($('.siteMoney').val());
		var memberUseSM = parseInt($('.memberUseSiteMoney').val());
		var allPrice = parseInt($('.goodsAllPrice').val());
		
		var lastprice = (allPrice-memberUseSM);
		
		$('.goodsLastPrice').val(lastprice);
		
		if(memberSM < memberUseSM)
		{
			var lastpriceNoerror = (allprice-memberSM);
			alert('소유하신 적립금 보다 많습니다.');
			$('.memberUseSiteMoney').val($('.siteMoney').val());
			$('.goodsLastPrice').val(lastpriceNoerror);
		}
		
	});
	
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

</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="wrapper_p" id="refrash">
			<c:forEach var="sl" items="${selectList }" varStatus="status">
				<div class="goodsBuyBox" style="height:285px;">
					<a class="goodsBuyTitle">상품 정보</a>
					<img src=".${sl.goods_imageTitle }" alt="상품이미지" class="goodsImg" style="height:200px;"/>
					
					<div class="GoodsInfo">
						<input type="text" value="${sl.goods_name }" name="goods_name" readonly="readonly" class="goodsName" /><br>
						<a class="goodsBuyInfoA">가격</a><input type="text" value="${sl.goods_price }" name="goods_price" class="goodsPrice" readonly="readonly"/><a class="won">원</a>
						<div class="margin" style="height:40px;"></div>
						<input type="button"  value="구매하러가기" onclick="buyGo('${sl.goods_index}')" style="margin-left:410px; margin-top:10px; background-color:white; border:1px solid black; "/>
						<input type="button" value="삭제하기" onclick="DeleteGo('${sl.cart_index}')" style="margin-left:5px; margin-top:10px; background-color:white; border:1px solid black; "/>
						<input type="hidden" value="${sl.cart_index }" id="cart_index" />
						<input type="hidden" value="${sl.member_id }" id="member_id" />
					</div>
				</div>
			</c:forEach>
			<div class="pagenum">
				<div class="pagenum_loc">
				<div class="paging" style="text-align:center;">
				<ul style="display:inline-block; list-style:none;">
					<c:if test="${page > 9}">
						<li style="float:left;"><a href="CartList.do?page=${startPage - 9}&member_id=${memberVO.member_id}" style="float:left; position:relative; ">이전으로</a></li>
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<li style="float:left;"><a href="CartList.do?page=${i}&member_id=${memberVO.member_id}" style="float:left; position:relative; ">[${i}]</a></li>
						</c:if>
						
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
							<li style="float:left;"><a href="CartList.do?page=${startPage + 9}&member_id=${memberVO.member_id}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
					</c:if>
				</ul>
				</div>
				
				</div>
			</div>
		</div>
	</div>
	<script>
	function DeleteGo(cart_index)
	{
		if(confirm("정말 삭제하시겠습니까?"))
		{
			$.ajax
			({
				type : "POST",
	
				url : "CartDelete.do",
	
				data : "cart_index="+cart_index,
	
				//  dataType : "text",
	    		        
				success : function(data)
	    		{
					console.log("성공"+data);
					$('#refrash').load(document.URL +  ' #refrash');		//일부만 새로고침
	    		},
				error:function()
				{
			    	console.log("실패");
				}
			});
		}
		else
		{
			return;	
		}
		
	}
	
	function buyGo(goods_index)
	{
		location.href = "GoodsSelectOne.do?page=1&goods_index="+goods_index;
	}
	</script>
</body>
</html>