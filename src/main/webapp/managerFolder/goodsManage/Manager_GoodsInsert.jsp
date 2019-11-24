<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$( document ).ready( function() {
	$(".signUpBtn").attr("disabled", true);
	
    $( '.allCheck' ).click( function() {
      $( '.box' ).prop( 'checked', this.checked );
    } );
    
    $('.signUpBtn').hover(function()
    {
    	$('.signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.signUpBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    
    $("#goods_name").keyup(function()
    {
    	var goods_name = $("#goods_name").val();
    	var goods_class = $("#goods_class").val();
    	
	    $.ajax
	    ({
	    	type : "POST",

			url : "GoodsNameCheck.ajax",

			data : "goods_name=" + goods_name + "&goods_class=" + goods_class,
			
			success : function(data)
    		{
				console.log("성공");
				if(data == 1)			// 중복
				{
					$("#ajaxDiv").text("상품명이 이미 존재합니다.");
					$("#ajaxDiv").css("color","black");
					$(".signUpBtn").attr("disabled", true);
				}
				else
				{
					$("#ajaxDiv").text("");
					$("#ajaxDiv").css("color","black");
					$(".signUpBtn").attr("disabled", false);
				}
    		},
			error:function()
			{
    	    	console.log("실패");
			}
	    });
    });
    
  } );
</script>
</head>
<body>

<c:set var = "goods_class" value="${param.goods_class}"></c:set>

	<div class="wrapper">
		<div class="wrapper_p">
			<c:if test="${goods_class eq 'Tops' }">
				<a class="ManagerTitle">상품 등록(Tops)</a>
			</c:if>
			<c:if test="${goods_class eq 'Bottoms' }">
				<a class="ManagerTitle">상품 등록(Bottoms)</a>
			</c:if>
			<c:if test="${goods_class eq 'Shoes' }">
				<a class="ManagerTitle">상품 등록(Shoes)</a>
			</c:if>
			<div class="signUpBody">
				<form action="Manager_Goods_Insert.do" method="post" name = "signUpForm" class="signUpForm" enctype="multipart/form-data">
					<div class="signUpFormDiv">
						<a style="float:left; width:490px;">GOODS_NAME</a><a id="ajaxDiv" style="float:right; font-size:18px;"></a><br><input type="text" name="goods_name" id="goods_name" required="required"/><br>

						<a>GOODS_CLASS</a><br><input type="text" name="goods_class" id="goods_class" value="${goods_class }" required="required" readonly="readonly"/><br>
						
						<c:if test="${goods_class eq 'Tops' }">
							<a>GOODS_KIND</a><br><a style="font-size:22px; display:inline-block; height:50px;">T-Shirt</a><input type="radio" name="goods_kind" id="goods_kind" value="T-Shirt" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Blouse</a><input type="radio" name="goods_kind" id="goods_kind" value="Blouse" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Neat</a><input type="radio" name="goods_kind" id="goods_kind" value="Neat" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Hood</a><input type="radio" name="goods_kind" id="goods_kind" value="Hood" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Training</a><input type="radio" name="goods_kind" id="goods_kind" value="Training" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
						</c:if>
						
						<c:if test="${goods_class eq 'Bottoms' }">
							<a>GOODS_KIND</a><br><a style="font-size:22px; display:inline-block; height:50px;">Shorts</a><input type="radio" name="goods_kind" id="goods_kind" value="Shorts" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Skirts</a><input type="radio" name="goods_kind" id="goods_kind" value="Skirts" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Crops</a><input type="radio" name="goods_kind" id="goods_kind" value="Crops" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Leggings</a><input type="radio" name="goods_kind" id="goods_kind" value="Leggings" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Pants</a><input type="radio" name="goods_kind" id="goods_kind" value="Pants" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
						</c:if>
						
						<c:if test="${goods_class eq 'Shoes' }">
							<a>GOODS_KIND</a><br><a style="font-size:22px; display:inline-block; height:50px;">Sneakers</a><input type="radio" name="goods_kind" id="goods_kind" value="Sneakers" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">High Heel</a><input type="radio" name="goods_kind" id="goods_kind" value="High_Heel" required="required" style="display:inline-block;width:50px; height:50px;"/>
												 <a style="font-size:22px; display:inline-block; height:50px;">Running Shoes</a><input type="radio" name="goods_kind" id="goods_kind" value="Running_Shoes" required="required" style="display:inline-block;width:50px; height:50px;"/>
							<br>
						</c:if>
						
						<a>GOODS_IMAGE(TITLE)</a><br><input type="file" name="goods_imageTitle" id="goods_image"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB1)</a><br><input type="file" name="goods_imageTitleSub1" id="goods_image2"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB2)</a><br><input type="file" name="goods_imageTitleSub2" id="goods_image3"  required="required" /><br>
						<a>GOODS_IMAGE(TITLE_SUB3)</a><br><input type="file" name="goods_imageTitleSub3" id="goods_image4"  required="required" /><br>
						<a>GOODS_IMAGE(CONTENT)</a><br><input multiple="multiple" type="file" name="goods_ContentImage"/>
						<a>GOODS_COUNT-S</a><br><input type="number" name="goods_countS" id="goods_countS"  required="required" /><br>
						<a>GOODS_COUNT-M</a><br><input type="number" name="goods_countM" id="goods_countM"  required="required" /><br>
						<a>GOODS_COUNT-L</a><br><input type="number" name="goods_countL" id="goods_countL"  required="required" /><br>
						<a>GOODS_PRICE</a><br><input type="number" name="goods_price" id="goods_price"  required="required" /><br>
						<a>GOODS_SALE</a><br><input type="number" name="goods_sale" id="goods_sale"  required="required" /><br>
						<a>GOODS_CONTENT</a><br><input type="text" name="goods_content" id="goods_content"  required="required" /><br>
						
						<input type="submit" value="상품등록하기" class="signUpBtn"/>
					</div>	
				</form>
			</div>
		</div>
	</div>
</body>
</html>