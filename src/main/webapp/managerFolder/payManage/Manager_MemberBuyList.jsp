<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>


<script>
$( document ).ready( function() {
   
    
    $('.deleteBtn').hover(function()
    {
    	$('.deleteBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.deleteBtn').stop().animate({
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
			<div class="buyListBody">
				<a class="title">Buy List</a>
				
				<c:forEach var="sl" items="${selectList}" varStatus="status">
					<div class="buyListBox">
						<a style="margin-top:0px; display:block;"><img src="..${sl.goods_imageTitle }"  alt="상품이미지" class="buyImage"/></a>
						<a class="goods_name"  href="../BuyGoodsSelectOne.do?buy_index=${sl.buy_index }">${sl.goods_name }</a><br>
						<a class="buy_index">주문번호:${sl.buy_index }</a><br>
						<a class="goods_price">${sl.goods_price} 원</a><br>
						<a class="goods_count">총 ${sl.goods_countS+sl.goods_countM+sl.goods_countL} 개</a><br>
						<a class="account">입금계좌 : ${sl.account}</a><br>
						<c:if test="${sl.del_state eq '입금대기중'}">
							<a class="goods_lastprice">총 입금 금액 : ${sl.goods_lastprice }</a>/<a class="goods_pay">실제 입금 금액 : 0</a><br>
						</c:if>
						<c:if test="${sl.del_state ne '입금대기중'}">
							<a class="goods_lastprice">총 입금 금액 : ${sl.goods_lastprice }</a>/<a class="goods_pay">실제 입금 금액 : ${sl.goods_lastprice }</a><br>
						</c:if>		

						<c:if test="${sl.del_state ne '입금대기중'}">
							<a class="goods_price" style="border:1px solid black;">입금완료</a>
							<c:if test="${sl.del_state ne '배송중' }">
								<a class="goods_price" style="border:1px solid black; cursor:pointer;" onclick="delGo('${sl.buy_index}','${page}','${sl.goods_lastprice}')">상품보내기</a>
							</c:if>
						</c:if>
						<a class="goods_price" style="float:right; margin-right:6px;"> [ ${sl.del_state} ] </a>
					</div>
				</c:forEach>
			</div>
			
			<div class="pagenum">
				<div class="pagenum_loc">
				<div class="paging" style="text-align:center;">
				<ul style="display:inline-block; list-style:none;">
					<c:if test="${page > 9}">
						<li style="float:left;"><a href="BuyGoodsList.do?page=${startPage - 9}&member_id=All" style="float:left; position:relative; ">이전으로</a></li>
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<li style="float:left;"><a href="BuyGoodsList.do?page=${i}&member_id=All" style="float:left; position:relative; ">[${i}]</a></li>
						</c:if>
						
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
							<li style="float:left;"><a href="BuyGoodsList.do?page=${startPage+9}&member_id=All" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
					</c:if>
				</ul>
				</div>
				
				</div>
			</div>
		</div>
	</div>
	<script>
		function delGo(buy_index,page,goods_lastprice)
		{
			if(confirm("정말 배송하시겠습니까?"))
			{
				location.href = "ManagerBuyGoodsDelGo.do?buy_index="+buy_index + "&page=" + page + "&goods_lastprice=" + goods_lastprice;
			}
			else
			{
				return;
			}
			
		}		
	</script>
</body>
</html>

