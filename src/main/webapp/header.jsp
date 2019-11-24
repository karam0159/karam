<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<script>
$(document).ready(function()
{
	// nav hover 일때 슬라이드 다운
	$('.headerNav').hover(function()
	{
		$('.header_whiteBack').stop().animate({
			height:'400px'
		},300);
		
		$('.header_blackBack').css('height', '100%');
		$('.header_whiteBack').css('border-bottom', '1px solid black');
		$('.header_blackBack').css('display', 'block');
		
	},
	function()
	{
		$('.header_whiteBack').stop().animate({
			height:'0px'
		},300);
		
		$('.header_blackBack').css('height', '0');
		$('.header_whiteBack').css('border-bottom', '0px solid black');
	});
	
	// nav hover 제외시 슬라이드 업
	$('.header_whiteBack').hover(function()
	{
		$('.header_whiteBack').stop().animate({
			height:'400px'
		},0);
		
		$('.header_blackBack').css('height', '100%');
		$('.header_whiteBack').css('border-bottom', '1px solid black');
	},
	function()
	{
		$('.header_whiteBack').stop().animate({
			height:'0px'
		},300);
		
		$('.header_blackBack').css('height', '0');
		$('.header_whiteBack').css('border-bottom', '0px solid black');
	});	
	
	// 서치 박스 hover 제외시 슬라이드 업
	$('.header_whiteBackInSearch').hover(function()
	{
		$('.header_whiteBackInSearch').stop().animate({
			height:'400px'
		},0);
		
		$('.header_blackBack').css('height', '100%');
		$('.header_whiteBackInSearch').css('border-bottom', '1px solid black');
	},
	function()
	{
		$('.header_whiteBackInSearch').removeClass('a');
		
		$('.header_whiteBackInSearch').stop().animate({
			height:'0px'
		},300);
		
		
		$('.header_blackBack').css('height', '0');
		$('.header_whiteBackInSearch').css('border-bottom', '0px solid black');
	});	

	
	// 서치버튼 클릭시 슬라이드 다운
	$(".navSearchImg").click(function(){
		if($('.header_whiteBackInSearch').hasClass('a')) {

			$('.header_whiteBackInSearch').animate({height:0},300).removeClass('a');
			$('.header_whiteBackInSearch').css('border-bottom', '0px solid black');
			$('.header_blackBack').css('height', '0');
		} else { 
			$('.header_whiteBackInSearch').animate({height:400},300).addClass('a');
			$('.header_whiteBackInSearch').css('border-bottom', '1px solid black');
			$('.header_blackBack').css('height', '100%');
		}
	});
	

	
	    $('.headerNavTwo').hover(function()
		{
			if($('.header_whiteBackInSearch').hasClass('a')) 
			{
				$('.header_whiteBackInSearch').animate({height:0},300);
				$('.header_whiteBackInSearch').css('border-bottom', '0px solid black');
				$('.header_blackBack').css('height', '0');
			}
		},
		function()
		{
			$('.header_whiteBackInSearch').removeClass('a');
		});	
	


});
</script>
<style>
	body,html
	{
		height:100%;
	}
</style>
</head>
<body>
<div class="header_top">
	<div class="header_topFixed">
	</div>
</div>
		
<div class="header_blackBack">
</div>

	<div class="wrapper">
		<div class="header">
			<a href="index.do"><img src="./image/logo2.png" class="headerLogo" alt="logo" ></a>
			<ul class="headerNav">
				<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Best">BEST</a></li>
				<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All">TOPS</a></li>
				<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=All">BOTTOMS</a></li>
				<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=All">SHOES</a></li>
				<li><a href="Board_SelectList.do?page=1&board_class=QnA">COMMUNITY</a></li>
			</ul>
			<c:choose>
				<c:when test="${memberVO.member_id != null}">
					<ul class="headerNavTwo_Login">
						<li class="loginNav"><a>${memberVO.member_name}님</a></li>
						<li class="loginNav"><a href="Member_MyPage.do?member_id=${memberVO.member_id}">마이페이지</a></li> 
						<li class="loginNav"><a href="Member_Logout.do">로그아웃</a></li> 
						<li class="nomargin"><a href="#"><img src="image/icon/search_cut.png" alt="검색" class="navSearchImg"></a></li>
					</ul>
				</c:when>
					
				<c:otherwise>
					<ul class="headerNavTwo">
						<li class="loginNav"><a href="index.jsp?page=member/Member_Login.jsp">로그인</a></li>
						<li class="nomargin"><a href="#"><img src="image/icon/search_cut.png" alt="검색" class="navSearchImg"></a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
		<div class="header_whiteBack">
			<div class="header_whiteBackIn">
				<div class="header_Nav" style="border-right:1px solid black;">
					<ul>
						<li class="ulTitle"><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Best" class="aTitle">Best</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Best">Tops</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Best">Bottoms</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Best">Shoes</a>
					</ul>
				</div>
				<div class="header_Nav header_NavFirst">
					<ul>
						<li class="ulTitle"><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All" class="aTitle">TOPS</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=T-Shirt">T-Shirt</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Blouse">Blouse</a>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Neat">Neat</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Hood">Hood</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=Training">Training</a></li>
					</ul>
				</div>
				<div class="header_Nav">
					<ul>
						<li class="ulTitle"><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=All" class="aTitle">Bottoms</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Shorts">Shorts</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Skirts">Skirts</a>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Crops">Crops</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Leggings">Leggings</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=Pants">Pants</a></li>
					</ul>
				</div>
				<div class="header_Nav">
					<ul>
						<li class="ulTitle"><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=All" class="aTitle">SHOSE</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Sneakers">Sneakers</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Shoes">Shoes</a></li>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=High_Hell">High Heel</a>
						<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=Running_Shoes">Running Shoes </a></li>
					</ul>	
				</div>	
				<div class="header_Nav">
					<ul style="border:0;">
						<li class="ulTitle"><a href="Board_SelectList.do?page=1&board_class=QnA" class="aTitle">COMMUNITY</a></li>
						<li><a href="Board_SelectList.do?page=1&board_class=QnA">Q & A</a></li>
						<li><a href="Board_SelectList.do?page=1&board_class=Review">Review</a></li>
						<li><a href="Board_SelectList.do?page=1&board_class=Event">Event</a>
					</ul>	
				</div>											
			</div>
		</div>
		<div class="header_whiteBackInSearch">
			<div class="header_whiteBackInSearchIn">
				<form action="GoodsSearch.do?page=1" method="post" class="header_whiteBackForm">
					<input type="text" name="goods_name" id="searchbox" class="searchbox" placeholder="Search for product."/>
					<input type="image" id="search" class="searchBtn" src="image/icon/search.png" alt="검색버튼"/>
					<a style="margin-top:35px;" href="GoodsSearch.do?page=1&goods_name=블라우스">블라우스</a><br>
					<a href="GoodsSearch.do?page=1&goods_name=셔츠">셔츠</a><br>
					<a href="GoodsSearch.do?page=1&goods_name=청바지">청바지</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>