<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
    $('#signUpBtn').hover(function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    $('#pointBtn').hover(function()
    {
    	$('#pointBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('#pointBtn').stop().animate({
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
			<div class="signUpBody">
				<a class="title">Create Account</a>
				<form action="Manager_Member_Update.do" method="post" name = "signUpForm" class="signUpForm" >
					<div class="signUpFormDiv">
						<a>NAME</a><br><input type="text" name="member_name" id="name" value="${memberVO.member_name }" required="required" maxlength="7"/><br>
						<a>ID</a><br><input type="text" name="member_id" id="id" value="${memberVO.member_id }" required="required" readonly="readonly"/><br>
						<a>PASSWORD</a><br><input type="password" name="member_password" id="password" value="" /><br>
						<a>PASSWORD CHECK</a><br><input type="password" name="password_check" id="password_check" value="" /><br>
						<a>ADDRESS</a><br><input type="text" name="member_address" id="address" value="${memberVO.member_address }" required="required"/><br>
						<a>TEL</a><br><input type="text" name="member_tel" id="tel" value="${memberVO.member_tel }" required="required" placeholder="- 제외하고 작성해주세요"/><br>
						<a>EMAIL</a><br><input type="text" name="member_email" id="email" value="${memberVO.member_email }" required="required" /><br>
						<a>BIRTH</a><br><input type="date" name="member_birth" id="birth" value="${memberVO.member_birth }" required="required"/><br>
						<a>ACCOUNT_NAME</a><br><input type="text" name="account_name" id="account_name" value="${memberVO.account_name }" required="required"/><br>
						<a>ACCOUNT_BANK</a><br><input type="text" name="account_bank" id="account_bank" value="${memberVO.account_bank }" required="required"/><br>
						<a>ACCOUNT</a><br><input type="text" name="account" id="account" value="${memberVO.account }" required="required"/>
						<input type="submit" value="정보수정하기" class="signUpBtn" id="signUpBtn" style="margin-bottom:0px;"/>
						<input type="button" value="포인트주기(5000P)" class="signUpBtn" id="pointBtn" onclick="memberPoint('${memberVO.member_id}');"/>
					</div>	
					
				</form>
			</div>
		</div>
	</div>
	
	<script>
		function memberPoint(member_id)
		{
			location.href="ManagerMemberPoint.do?member_id="+member_id;
		}
	</script>
</body>
</html>

