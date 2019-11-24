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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<script>
$(document).ready(function()
{
	// 댓글창 페이징을 통해 온 경우라면
	var reply_key = $("#reply_key").val();
	if(reply_key == "yes")
	{
    	$('.GoodsViewTapBodyInfo').css('display','none');
    	$('.GoodsViewTapBodyReply').css('display','inline-block');
    	$('.GoodsViewTapBodyReturn').css('display','none');	
    	
    	 var offset = $("#replyBody").offset();
         $('html, body').animate({scrollTop : offset.top}, 0);
	}
	
	
	$(".menuA").click(function(){
		
		$('.menuA').removeClass('underLine');
		$(this).addClass('underLine');
	});
	
	$("#GoodsSize").change(function(){
		$('.GoodsSelect').css('display', 'inline-block');
		
		if(this.value=='S44-55')
		{
			var PriceH = $('#PriceH').val();
			var SCount = $('#SCount').val();
			var AllPrice = parseInt(PriceH*SCount);
			
			$('.GoodsSDiv').css('display', 'inline-block');
			$('#SPrice').val(AllPrice);
			
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
			
		}
		if(this.value=='M55-66')
		{
			var PriceH = $('#PriceH').val();
			var MCount = $('#MCount').val();
			var AllPrice = parseInt(PriceH*MCount);
			
			$('.GoodsMDiv').css('display', 'inline-block');
			$('#MPrice').val(AllPrice);
			
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
		}
		if(this.value=='L66-77')
		{
			var PriceH = $('#PriceH').val();
			var LCount = $('#LCount').val();
			var AllPrice = parseInt(PriceH*LCount);
			
			$('.GoodsLDiv').css('display', 'inline-block');
			$('#LPrice').val(AllPrice);
			
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
		}
	});
	
	$(".SDeleteBtn").click(function(){
		$('.GoodsSDiv').css('display', 'none');
		
		var SPrice = 0;
		$('#SPrice').val(SPrice);
		$('#SCount').val(0);
		var MPrice = parseInt($('#MPrice').val());
		var LPrice = parseInt($('#LPrice').val());
		var HapPrice = parseInt(SPrice+MPrice+LPrice);
		$('#GoodsAllPriceInput').val(HapPrice);
		
		if($(".GoodsSDiv").css("display") == "none" && $(".GoodsMDiv").css("display") == "none" && $(".GoodsLDiv").css("display") == "none")
		{
			$('.GoodsSelect').css('display', 'none');
		}
	});
	$(".MDeleteBtn").click(function(){
		$('.GoodsMDiv').css('display', 'none');
		
		var SPrice = parseInt($('#SPrice').val());
		var MPrice = 0;
		$('#MPrice').val(MPrice);
		$('#MCount').val(0);
		var LPrice = parseInt($('#LPrice').val());
		var HapPrice = parseInt(SPrice+MPrice+LPrice);
		$('#GoodsAllPriceInput').val(HapPrice);
		
		if($(".GoodsSDiv").css("display") == "none" && $(".GoodsMDiv").css("display") == "none" && $(".GoodsLDiv").css("display") == "none")
		{
			$('.GoodsSelect').css('display', 'none');
		}
	});
	$(".LDeleteBtn").click(function(){
		$('.GoodsLDiv').css('display', 'none');
		
		var SPrice = parseInt($('#SPrice').val());
		var MPrice = parseInt($('#MPrice').val());
		var LPrice = 0;
		$('#LCount').val(0);
		$('#LPrice').val(LPrice);
		var HapPrice = parseInt(SPrice+MPrice+LPrice);
		$('#GoodsAllPriceInput').val(HapPrice);
		
		if($(".GoodsSDiv").css("display") == "none" && $(".GoodsMDiv").css("display") == "none" && $(".GoodsLDiv").css("display") == "none")
		{
			$('.GoodsSelect').css('display', 'none');
		}
	});
	
	$("#SCount").change(function(){
		var PriceH = parseInt($('#PriceH').val());
		var SCount = parseInt($('#SCount').val());
		var AllPrice = PriceH*SCount;
		var MaxCount = parseInt($('#SGoodsMaxCount').val());
		
		if(SCount >= 0)
		{
			$('#SPrice').val(AllPrice);
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
			
			if(MaxCount < SCount)
			{
				$('#SCount').val(MaxCount);	
				var SCountMinusOne = SCount-1;
				var MaxAllPrice = SCountMinusOne*PriceH;
				$('#SPrice').val(MaxAllPrice);	
				
				var SPrice = parseInt($('#SPrice').val());
				var MPrice = parseInt($('#MPrice').val());
				var LPrice = parseInt($('#LPrice').val());
				var HapPrice = parseInt(SPrice+MPrice+LPrice);
				$('#GoodsAllPriceInput').val(HapPrice);
				
				alert('최대 재고량을 선택하셨습니다.');
			}
		}
		if(SCount < 0)
		{
			$('#SCount').val("0");
			var SCount = parseInt($('#SCount').val());
			$('#SPrice').val(0);
			alert('0보다 낮은 값은 선택하실 수 없습니다.');
		}

	});
	$("#MCount").change(function(){
		var PriceH = parseInt($('#PriceH').val());
		var MCount = parseInt($('#MCount').val());
		var AllPrice = PriceH*MCount;
		var MaxCount = parseInt($('#MGoodsMaxCount').val());
		
		if(MCount >= 0)
		{
			$('#MPrice').val(AllPrice);
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
			
			if(MaxCount < MCount)
			{
				$('#MCount').val(MaxCount);	
				var MCountMinusOne = MCount-1;
				var MaxAllPrice = MCountMinusOne*PriceH;
				$('#MPrice').val(MaxAllPrice);	
				
				var SPrice = parseInt($('#SPrice').val());
				var MPrice = parseInt($('#MPrice').val());
				var LPrice = parseInt($('#LPrice').val());
				var HapPrice = parseInt(SPrice+MPrice+LPrice);
				$('#GoodsAllPriceInput').val(HapPrice);
				
				alert('최대 재고량을 선택하셨습니다.');
			}
		}
		if(MCount < 0)
		{
			$('#MCount').val("0");
			var MCount = parseInt($('#MCount').val());
			$('#MPrice').val(0);
			alert('0보다 낮은 값은 선택하실 수 없습니다.');
		}

	});
	$("#LCount").change(function(){
		var PriceH = parseInt($('#PriceH').val());
		var LCount = parseInt($('#LCount').val());
		var AllPrice = PriceH*LCount;
		var MaxCount = parseInt($('#LGoodsMaxCount').val());
		
		if(LCount >= 0)
		{
			$('#LPrice').val(AllPrice);
			var SPrice = parseInt($('#SPrice').val());
			var MPrice = parseInt($('#MPrice').val());
			var LPrice = parseInt($('#LPrice').val());
			var HapPrice = parseInt(SPrice+MPrice+LPrice);
			$('#GoodsAllPriceInput').val(HapPrice);
			
			if(MaxCount < LCount)
			{
				$('#LCount').val(MaxCount);	
				var LCountMinusOne = LCount-1;
				var MaxAllPrice = LCountMinusOne*PriceH;
				$('#LPrice').val(MaxAllPrice);	
				
				var SPrice = parseInt($('#SPrice').val());
				var MPrice = parseInt($('#MPrice').val());
				var LPrice = parseInt($('#LPrice').val());
				var HapPrice = parseInt(SPrice+MPrice+LPrice);
				$('#GoodsAllPriceInput').val(HapPrice);
				
				alert('최대 재고량을 선택하셨습니다.');
			}
		}
		
		if(LCount < 0)
		{
			$('#LCount').val("0");
			var LCount = parseInt($('#LCount').val());
			$('#LPrice').val(0);
			alert('0보다 낮은 값은 선택하실 수 없습니다.');
		}

	});
});

$( document ).ready( function()
{
    $('.GoodsBuyBtn').hover(function()
	{
		$('.GoodsBuyBtn').stop().animate({
		backgroundColor:'black',
		color:'white'
	},300);
	},
	function()
	{
		$('.GoodsBuyBtn').stop().animate({
		backgroundColor:'white',
		color:'black'
	},300);
	});
    
    $('.GoodsCartBtn').hover(function()
    {
    	$('.GoodsCartBtn').stop().animate({
    	backgroundColor:'black',
    	color:'white'
    },300);
    },
    function()
    {
    	$('.GoodsCartBtn').stop().animate({
    	backgroundColor:'white',
    	color:'black'
    },300);
    });
    
    
    ////        TapMenu
    
    $('.GoodsViewTapBtnInfo').click(function()
    {
    	$('.GoodsViewTapBodyInfo').css('display','inline-block');
    	$('.GoodsViewTapBodyReply').css('display','none');
    	$('.GoodsViewTapBodyReturn').css('display','none');
    });
    $('.GoodsViewTapBtnReply').click(function()
	{
    	$('.GoodsViewTapBodyInfo').css('display','none');
		$('.GoodsViewTapBodyReply').css('display','inline-block');
		$('.GoodsViewTapBodyReturn').css('display','none');
	});
    $('.GoodsViewTapBtnReturn').click(function()
	{
    	$('.GoodsViewTapBodyInfo').css('display','none');
		$('.GoodsViewTapBodyReply').css('display','none');
		$('.GoodsViewTapBodyReturn').css('display','inline-block');
	});
    
    /// 사진 썸네일 클릭시 확대
    
    $("#cartGO").click(function(){
    	var goods_index = $("#hiddenGoods_index").val();
    	var member_id = $("#hiddenMember_id").val();
    	var goods_name = $("#hiddenGoods_name").val();
    	var goods_price = $("#hiddenGoods_price").val();
    	var goods_imageTitle = $("#hiddenImage").val();
    	
    	alert("장바구니에 담기 성공!");
    	
    	location.href="CartInsert.do?goods_index="+goods_index+"&member_id="+member_id+"&goods_imageTitle="+goods_imageTitle+"&goods_name="+goods_name+"&goods_price="+goods_price;
    	
    });
    $("#NoCartGO").click(function(){
    	alert("로그인해주세요");
    });
    $("#NoBuyBtn").click(function(){
    	alert("로그인해주세요");
    });
    
});
</script>

<script>
function ImageBig(num) {
    var link = $(".GoodsViewImgShow").eq(num).attr("src");
    $(".GoodsViewImg").attr("src", link);
}

function countCheck()
{
	var SCount = parseInt($("#SCount").val());
	var MCount = parseInt($("#MCount").val());
	var LCount = parseInt($("#LCount").val());
	var allCount = SCount+MCount+LCount;
	if(allCount == 0)
	{
		alert("1개 이상 선택해주세요.");
		return false;
	}
	return true;
}
</script>


</head>
<body>
	<div class="wrapper">	<!-- sidemenuul만빼서 c:if로 할까? -->
		<div class="GoodsViewBorder">
		</div>
		<div class="GoodsViewBody">
			<div class="GoodsViewBodyImg">
				<img src="./${goodsVO.goods_imageTitle }" alt="상품이미지" style="cursor:pointer" class="GoodsViewImg"/>
				<ul>
				<li><a><img src=".${goodsVO.goods_imageTitle }" alt="상품이미지" class="GoodsViewImgShow" style="cursor:pointer" onclick="ImageBig('0');"/></a></li>
				<li><a><img src=".${goodsImageVO.goods_imageTitleSub1 }" alt="상품이미지" class="GoodsViewImgShow" style="cursor:pointer" onclick="ImageBig('1');"/></a></li>
				<li><a><img src=".${goodsImageVO.goods_imageTitleSub2 }" alt="상품이미지" class="GoodsViewImgShow" style="cursor:pointer" onclick="ImageBig('2');"/></a></li>
				<li><a><img src=".${goodsImageVO.goods_imageTitleSub3 }" alt="상품이미지" class="GoodsViewImgShow" style="cursor:pointer" onclick="ImageBig('3');"/></a></li>
				</ul>
			</div>
			<div class="GoodsViewBodyInfo">
				<form action="GoodsBuyPage.do" method="post" onsubmit="return countCheck();">
					<a class="GoodsTitle">${goodsVO.goods_name }</a><br>
					<a class="GoodsOriginPrice" >${goodsVO.goods_price }</a>
					<a class="GoodsPrice" >${goodsVO.goods_lastprice }</a><a class="goods_A">원</a><br>
					<a class="GoodsInfo">${goodsVO.goods_content }</a><br>
					<div class="GoodsSizeDiv">
						<a class="GoodsSizeA">사이즈</a>
						<select name="GoodsSize" id="GoodsSize" class="GoodsSizeSelect">
							<option value="Null">옵션 선택</option>
							<option value="S44-55">[S/44~55]</option>
							<option value="M55-66">[M/55~66]</option>
							<option value="L66-77">[L/66~77]</option>
						</select>
					</div>
					<div class="GoodsSelect">
						<a class="bigA">사이즈</a><a class="smallA">수량</a><a class="smallA">가격</a><br>
						
						<input type="hidden" name="goods_index" value="${goodsVO.goods_index }" id="hiddenGoods_index"/>
						<input type="hidden" id="PriceH" value="${goodsVO.goods_lastprice }" />
						<input type="hidden" id="SGoodsMaxCount" value="${goodsVO.goods_countS }" />
						<input type="hidden" id="MGoodsMaxCount" value="${goodsVO.goods_countM }" />
						<input type="hidden" id="LGoodsMaxCount" value="${goodsVO.goods_countL }" />
						<input type="hidden" id="hiddenImage" value="${goodsVO.goods_imageTitle}" />
						<input type="hidden" id="hiddenGoods_name" value="${goodsVO.goods_name }" />
						<input type="hidden" id="hiddenGoods_price" value="${goodsVO.goods_price }" />
						<input type="hidden" id="hiddenMember_id" value="${memberVO.member_id }" />
						<input type="hidden" id="reply_key" value="${reply_key }" />
						
						<div class="GoodsSDiv">
							<a class="bigA">S44-55</a>
							<input type="number" id="SCount" name="goods_countS" value="0" class="smallInput" onkeyup='PriceCheck()' onchange="PriceCheck()"/>
							<input type="text" id="SPrice" value="0" class="PriceInput" />
							<a class="deleteBtn SDeleteBtn">X</a>
						</div>
						<div class="GoodsMDiv">
							<a class="bigA">M55-66</a>
							<input type="number" id="MCount" name="goods_countM" value="0" class="smallInput" onkeyup='PriceCheck()' onchange="PriceCheck()"/>
							<input type="text" id="MPrice" value="0" class="PriceInput" />
							<a class="deleteBtn MDeleteBtn">X</a>
						</div>
						<div class="GoodsLDiv">
							<a class="bigA">L66-77</a>
							<input type="number" id="LCount" name="goods_countL" value="0" class="smallInput" onkeyup='PriceCheck()' onchange="PriceCheck()"/>
							<input type="text" id="LPrice" value="0" class="PriceInput" />
							<a class="deleteBtn LDeleteBtn">X</a>
						</div>
					</div>
					<div class="GoodsCalculation">
						<a class="GoodsAllPriceA">총 상품 금액</a>
						<input type="text" id="GoodsAllPriceInput" value="0" class="GoodsAllPriceInput"><a class="GoodsWon">원</a>
					</div>
					<c:if test="${memberVO.member_id != null }" >
						<div class="GoodsBtnDiv">
							<input type="submit" class="GoodsBuyBtn" value="구입하기" />
							<a class="GoodsCartBtn" id="cartGO">장바구니</a>
						</div>	<!-- 로그인상태 -->
					</c:if>
					<c:if test="${memberVO.member_id == null }" >
						<div class="GoodsBtnDiv">
							<input type="button" class="GoodsBuyBtn" id="NoBuyBtn" value="구입하기" />
							<a class="GoodsCartBtn" id="NoCartGO">장바구니</a> 
						</div>	<!-- 노 로그인 -->
					</c:if>
				</form>
			</div>
		</div>
		<div class="GoodsViewBottom">
			<div class="margin"></div>
			<div class="GoodsViewTapBtn">
				<a class="GoodsViewTapBtnInfo">상품세부정보</a>
				<a class="GoodsViewTapBtnReply">사용자댓글</a>
				<a class="GoodsViewTapBtnReturn">배송/교환안내</a>
			</div>
			<div class="GoodsViewTapBody">
				<div class="GoodsViewTapBodyInfo">
					<div class="GoodsViewTapBodyImgDiv">
						<img src="image/goodsBuyImg1.png" alt="구매시주희사항" class="goodsNoticeImg">
					</div>	
					<div class="GoodsViewTapBodyImgDiv">
						<img src="image/goodsBuyImg2.png" alt="사이트구매해택" class="goodsNoticeImg">
					</div>
					<div class="GoodsViewTapBodyImg">
					
						<c:forEach var="gcil" items="${goodsContentImageVO }" varStatus="status">
							<img src=".${gcil.goods_ContentImage }" alt="상품사진1" class="goodsImg"/>
						</c:forEach>
						
					</div>
				</div>
				<div class="GoodsViewTapBodyReply">
					<c:import url="goods/Goods_Reply.jsp" />
				</div>
				<div class="GoodsViewTapBodyReturn">
					<a class="DeliveryTitle">배송과정</a><br>
					<a class="DeliverySubTitle">Delivery process</a><br>
					<img src="image/DeliveryProcess.PNG" alt="배송과정" class="DeliveryImg"/><br>
					<a class="DeliveryTitle">배송/교환안내</a><br>
					<a class="DeliverySubTitle">Delivery info</a><br>
					<div class="DeliverySubDiv">
						<a class="DeliverySubTitle2">배송안내</a><br>
						<a>1.기본적인 배송은 택배로 배송되며 발송 후 1~3일 정도 소요됩니다.(토,일,공휴일은 미포함)</a><br>
						<a>배송이 늦어지는 경우 송장번호로 택배사의 배송조회를 해보시기 바랍니다.</a><br>
						<a>2.저희 쇼핑몰을 이용하여 결제하시는 경우에 착불/선결제 선택이 가능하며 다른 배송수단</a><br>
						<a>(오토바이 퀵, 다마스 퀵, 용달차 등)을 이용하는 경우 발생하는 추가요금은 지불하셔야 합니다.</a><br>
						<a class="DeliverySubTitle2">반품/교환안내</a><br>
						<a>1.주문 후 제작에 들어간 이후에는 수정, 교환, 반품이 안됩니다.</a><br>
						<a>2.오배송된 경우 배송된 상품에 결함이 발생한 경우에는 환불해드립니다.</a><br>
						<a>(제품불량으로 반품요청 하실 경우 제품을 수령한 익일에 바로 연락바랍니다.)</a><br>
						<a>3.불량, 파손, 주문내역과 다른 상품이 배송된 경우 반품배송요금은 부담하지 않으셔도 됩니다.</a><br>
						<a>4.고객변심으로 인한 반품배송비(초도배송비+회수배송비)는 모두 구매자님이 부담하셔야합니다.</a><br>
						<a>*조립을 시작한 경우나 상품을 사용하신 경우에는 불량이라도 반품/교환/환불 불가</a><br>
						<a>*확실한 파손&성형불량이 아닌 이상 포장이나 보호비닐을 제거한 후에는 교환 반품 불가</a><br>
						<a>보호비닐을 제거한 후에는 사용하신 것으로 간주됩니다.</a>
						<div class="margin"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>