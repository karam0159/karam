<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function()
{
	$('.goodsNav').hover(function(){
		$('.managerBoardNavtops').stop().animate({
			height:'90px',
		},300);
		$('.managerBoardNavtops').css('border','1px solid black');
		$('.managerBoardNavtops').css('border-top','0');
	},
	function()
	{
		$('.managerBoardNavtops').stop().animate({
			height:'0px',
		},300);
		$('.managerBoardNavtops').css('border','0');
	}
	);
	
	$('.managerBoardNavtops').hover(function(){
		$('.managerBoardNavtops').stop().animate({
			height:'90px'
		},300);
		$('.managerBoardNavtops').css('border','1px solid black');
		$('.managerBoardNavtops').css('border-top','0');
	},
	function()
	{
		$('.managerBoardNavtops').stop().animate({
			height:'0px'
		},300);
		$('.managerBoardNavtops').css('border','0');
	}
	);
	
	////////////////////////////
	$('.boardNav').hover(function(){
		$('.managerBoardNavboard').stop().animate({
			height:'90px',
		},300);
		$('.managerBoardNavboard').css('border','1px solid black');
		$('.managerBoardNavboard').css('border-top','0');
	},
	function()
	{
		$('.managerBoardNavboard').stop().animate({
			height:'0px',
		},300);
		$('.managerBoardNavboard').css('border','0');
	}
	);
	
	$('.managerBoardNavboard').hover(function(){
		$('.managerBoardNavboard').stop().animate({
			height:'90px'
		},300);
		$('.managerBoardNavboard').css('border','1px solid black');
		$('.managerBoardNavboard').css('border-top','0');
	},
	function()
	{
		$('.managerBoardNavboard').stop().animate({
			height:'0px'
		},300);
		$('.managerBoardNavboard').css('border','0');
	}
	);
	
	
});
</script>
</head>
<body>
<div class="wrapper">
	<div class="wrapper_p">
		<div class="mangerHeader">
			<a class="headerTitle" href="Manager_index.jsp">NEATING MANAGER</a>
			<ul>
				<li><a href="Manager_Member_Manage.do?page=1">회원관리</a></li>
				<li class="goodsNav"><a href="Manager_GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All">상품관리</a></li>
				<li class="boardNav"><a href="Manager_Board_SelectList.do?page=1&board_class=QnA">게시글관리</a></li>
				<li><a href="BuyGoodsList.do?page=1&member_id=All">입금확인</a></li>
				<li><a href="../index.do">Home</a></li>
			</ul>
			<div class="managerBoardNavDiv">
				<ul class="managerBoardNavtops" style="margin-left:415px;">
					<li><a href="Manager_GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All">Tops</a></li>
					<li><a href="Manager_GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=All">Bottoms</a></li>
					<li><a href="Manager_GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=All">Shoes</a></li>
				</ul>
			</div>
			<div class="managerBoardNavDiv">
				<ul class="managerBoardNavboard" style="margin-left:588px;">
					<li><a href="Manager_Board_SelectList.do?page=1&board_class=QnA">QnA</a></li>
					<li><a href="Manager_Board_SelectList.do?page=1&board_class=Review">Review</a></li>
					<li><a href="Manager_Board_SelectList.do?page=1&board_class=Event">Event</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="managerHeaderBorder"></div>
</div>
</body>
</html>