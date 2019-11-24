<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(document).ready(function(){

		$.ajax
		({
			type : "POST",
	
			url : "ManagerMain.ajax",
	
//			data: JSON.stringify(form),
			
            contentType: "application/json; charset=utf-8;",
	
			dataType : "json",
			
			success : function(resultMap)
			{
				console.log("성공");
				var memberCount = resultMap.memberCount;
				$("#memberCount").val(memberCount);
				var goodsCount = resultMap.goodsCount;
				$("#goodsCount").val(goodsCount);
				var boardCount = resultMap.boardCount;
				$("#boardCount").val(boardCount);
				var allPay = resultMap.allPay;
				$("#allPay").val(allPay);
				
				var pointList = resultMap.memberPointVO;

				$.each(pointList, function(index,item){
					var indexx = item.memberPoint_index;
					var rank = item.member_rank;
					var money = item.member_siteMoney;
					var date = item.reg_date;
					
					$(".memberPointDate").append("<a>"+ indexx +"</a>");
					$(".memberPointDate").append("<a>"+ rank +"</a>");
					$(".memberPointDate").append("<a>"+ money +"</a>");
					$(".memberPointDate").append("<p>"+ date +"</p>");
					$(".memberPointDate").append("<br>");
					console.log(item.member_rank);
				});
				
			},
			error:function(resultMap)
			{
		    	console.log("실패"+resultMap);
		    	alert(resultMap.count)
			}
	});

});
</script>
<style>
	.memberPointDate a
	{
		text-align:center;
		display:inline-block;
		width:100px;
		border-right:1px solid #BDBDBD;
	}
	.memberPointDate p
	{
		display:inline-block;
		padding-left:5px;
		
	}
	
</style>
</head>
<body>
<div class="wrapper">
	<div class="wrapper_p" style="marign-bottom:30px;">
		<div class="memberNumber" style="width:700px; margin:0 auto; border:1px solid #BDBDBD; margin-top:60px;">
			<a class="title" style="display:inline-block; width:700px; font-size:24px;">유저수</a>	
			<input type="text" id="memberCount" readonly="readonly"/> 명의 유저가 가입되어있습니다.
		</div>
		<div class="goodsNumber" style="width:700px; margin:0 auto; border:1px solid #BDBDBD; margin-top:60px;">
			<a class="title" style="display:inline-block; width:700px; font-size:24px;">상품수</a>	
			<input type="text" id="goodsCount" readonly="readonly"/> 개의 상품이 등록되어있습니다.
		</div>
		<div class="boardNumber" style="width:700px; margin:0 auto; border:1px solid #BDBDBD; margin-top:60px;">
			<a class="title" style="display:inline-block; width:700px; font-size:24px;">게시글수</a>	
			<input type="text" id="boardCount" readonly="readonly"/> 개의 게시글이 작성되어있습니다.
		</div>
		<div class="allPayNumber" style="width:700px; margin:0 auto; border:1px solid #BDBDBD; margin-top:60px;">
			<a class="title" style="display:inline-block; width:700px; font-size:24px;">총 매출</a>	
			총 판매액은 <input type="text" id="allPay" readonly="readonly"/> 원 입니다.
		</div>
		
		<div class="allPayNumber" style="width:700px; margin:0 auto; border:1px solid #BDBDBD; margin-top:60px;">
			<a class="title" style="display:inline-block; width:700px; font-size:24px;">회원 적립금 지급</a>	
			<form action="ManagerMemberSiteMoney.do" method="post">
				<select style="width:150px;" name="member_rank">
					<option value="Bronze">Bronze</option>
					<option value="Silver">Silver</option>
					<option value="Gold">Gold</option>
					<option value="Diamond">Diamond</option>
				</select>
				<input type="number" name="member_siteMoney"/>
				<input type="submit" value="지급" /><br>
				<div class="memberPointDate">
					<a>지급 번호</a><a>지급 랭크</a><a>지급 금액</a><a>지급 날짜</a><br>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>