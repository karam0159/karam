<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

<link href="css/slideShow.css" rel="stylesheet" type="text/css" media="all" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function()
	{
//		$.noConflict(true);				// ajax 사용오류제거

		$('.bxSlider').bxSlider({
			auto:true,  // 자동으로 애니메이션 시작
			speed:500,  // 애니메이션 속도
			pause:5000, // 애니메이션 유지시간(1000 -> 1초)
			mode:'horizontal',  // 슬라이드 모드(fade, horizontal, vertical)
			autoControls:true,	// 시작 및 중지버튼 보여짐
			pager:true,		// 페이징 표시 보여짐
			captions:true,		//이미지 위에 텍스트 넣을 수 있음
		});	
		
	});
</script>
</head>
<body>
<div class="mainSlideShow" style="width:100%; height:600px; margin-bottom:20px;">
	<ul class="bxSlider" style="width:100%; height:600px;">
		<li><a href="GoodsSelectList.do?page=1&goods_class=Tops&goods_kind=All"><img src="image/main/main1.jpg" alt="슬라이드쇼이미지" style="width:100%; height:600px;"/></a></li>	
		<li><a href="GoodsSelectList.do?page=1&goods_class=Bottoms&goods_kind=All"><img src="image/main/main2.jpg" alt="슬라이드쇼이미지" style="width:100%; height:600px;"/></a></li>
		<li><a href="GoodsSelectList.do?page=1&goods_class=Shoes&goods_kind=All"><img src="image/main/main3.jpg" alt="슬라이드쇼이미지" style="width:100%; height:600px;"/></a></li>			
	</ul>
</div>
</body>
</html>