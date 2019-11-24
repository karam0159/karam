<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<script>
	function check()
	{
		var chk1 = document.signUpForm.checkbox1.checked;
		var chk2 = document.signUpForm.checkbox2.checked;
		
		if(!chk1)
		{
			alert("약관1에 동의해주세요.");
			return false;
		}
		else if(!chk2)
		{
			alert("약관2에 동의해주세요.");
			return false;
		}
		else if(chk1 && chk2)
		{
			return true;
		}
	}
	
	function checkNotall()
	{
		var chk1 = document.signUpForm.checkbox1.checked;
		var chk2 = document.signUpForm.checkbox2.checked;
		
		if(!chk1 || !chk2)
		{
			document.signUpForm.checkbox3.checked=false;
		}
	}
	
</script>
<script>
$( document ).ready( function() {
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
    
 // 비밀번호 매칭
	$("#member_password, #member_passwordCheck").keyup(function()
	{
    	//비밀번호 체크
    	var member_password = $("#member_password").val();
    	var member_passwordCheck = $("#member_passwordCheck").val()
    	if(member_password != member_passwordCheck)
    	{
    		$("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
			$("#passwordCheck").css("color","black");
			$("#submitBtn").attr("disabled", true);
    	}
    	else
    	{
    		$("#passwordCheck").text("비밀번호가 일치합니다.");
			$("#passwordCheck").css("color","black");
			$("#submitBtn").attr("disabled", false);
    	}
	});
    
  });
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="topImg">
				<div class="imgList">
					<a href="BuyGoodsList.do?page=1&member_id=${memberVO.member_id }"><img src="image/icon/buyListGo.png" alt="회원혜택" class="signUpImg2"/></a> <!-- 내 구매목록 -->
					<a href="CartList.do?page=1&member_id=${memberVO.member_id }"><img src="image/icon/cartGo.png" alt="회원혜택" class="signUpImg2"/></a> <!-- 장바구니 -->
					<c:if test="${memberVO.member_rank eq 'bronze' }">
						<img src="image/rank/bronze.png" alt="회원등급(브론즈)" class="signUpImg2" style="width:245px;"/>		<!-- 회원등급 -->
					</c:if>
					<c:if test="${memberVO.member_rank eq 'silver' }">
						<img src="image/rank/silver.png" alt="회원등급(실버)" class="signUpImg2" style="width:245px;"/>		<!-- 회원등급 -->
					</c:if>
					<c:if test="${memberVO.member_rank eq 'gold' }">
						<img src="image/rank/gold.png" alt="회원등급(골드)" class="signUpImg2" style="width:245px;"/>		<!-- 회원등급 -->
					</c:if>
					<c:if test="${memberVO.member_rank eq 'diamond' }">
						<img src="image/rank/diamond.png" alt="회원등급(다이아몬드)" class="signUpImg2" style="width:245px;"/>		<!-- 회원등급 -->
					</c:if>															
					<a href="index.jsp?page=member/Member_PasswordMatch.jsp"><img src="image/icon/out.png" alt="회원혜택" class="signUpImg2" style="width:245px;"/></a> <!-- 회원탈퇴-->
				</div>
			</div>
			<div class="signUpBody">
				<a class="title">Create Account</a>
				<form action="Member_Update.do" method="post" name = "signUpForm" class="signUpForm" >
					<div class="signUpFormDiv">
						<a>NAME</a><br><input type="text" name="member_name" id="name" value="${memberVO.member_name }" required="required" maxlength="7"/><br>
						<a>ID</a><br><input type="text" name="member_id" id="id" value="${memberVO.member_id }" required="required" readonly="readonly"/><br>
						<a style="width:473px;">PASSWORD</a><div class="passwordCheck" id="passwordCheck" style="display:inline-block;"></div><br><input type="password" name="member_password" id="member_password" value="" required="required"/><br>
						<a>PASSWORD CHECK</a><br><input type="password" name="password_check" id="member_passwordCheck" value=""required="required"/><br>
						<a>ADDRESS</a><br><input type="text" name="member_address" id="address" value="${memberVO.member_address }" required="required"/><br>
						<a>TEL</a><br><input type="text" name="member_tel" id="tel" value="${memberVO.member_tel }" required="required" placeholder="- 제외하고 작성해주세요"/><br>
						<a>EMAIL</a><br><input type="text" name="member_email" id="email" value="${memberVO.member_email }" required="required" /><br>
						<a>BIRTH</a><br><input type="date" name="member_birth" id="birth" value="${memberVO.member_birth }" required="required"/><br>
						<a>ACCOUNT_NAME</a><br><input type="text" name="account_name" id="account_name" value="${memberVO.account_name }" required="required"/><br>
						<a>ACCOUNT_BANK</a><br><input type="text" name="account_bank" id="account_bank" value="${memberVO.account_bank }" required="required"/><br>
						<a>ACCOUNT</a><br><input type="text" name="account" id="account" value="${memberVO.account }" required="required"/>
						<input type="submit" value="정보수정하기" class="signUpBtn"/>
					</div>	
					
					
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>

