<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    
  } );
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="signUpBody">
				<a class="title">Password Search</a>
				<form action="Member_Password_Change.do" method="post" name = "signUpForm" class="signUpForm" >
					<div class="signUpFormDiv">
						<h4 style="color:white;">⊙ 현재 입력된 이메일로 메일이 전송됩니다.</h4><br>
						<h4 style="color:white;">⊙ 가입 시 작성된 이름과 이메일 또한 아이디가 일치해야합니다.</h4><br>
						
						<a>ID</a><br><input type="text" name="member_id" id="member_id"  required="required"/>
						<a>NAME</a><br><input type="text" name="member_name" id="member_name"  required="required"/>
						<a>EMAIL</a><br><input type="text" name="member_email" id="member_email"  required="required"/><input type="button" id = "Emailbtn" value="이메일인증" style="width:100px;  border:0px; margin-top:10px; margin-left:2px; color:white; background-color:black;"/><br>
						<a>EMAIL CHECK</a><br><input type="text" name="member_emailcheck" id="member_emailcheck" required="required"/><input type="button" value="이메일체크" id="checkBtn" style="width:100px;  border:0px; margin-top:10px; margin-left:2px; color:white; background-color:black; display:none;" /><br>
						
						<div class="passwordNone" style="display:none;">
							<a class="title" style="font-size:24px; width:700px; text-align:center;">Password Change</a><br>
							<div class="passwordCheck" id="passwordCheck" style="display:inline-block; width:700px; text-align:center; font-size:20px; margin:0 auto; margin-top:20px;"></div><br>
							<a>PASSWORD</a><br><input type="password" name="member_password" id="member_password"  required="required"/>
							<a>PASSWORD CHECK</a><br><input type="password" name="member_passwordcheck" id="member_passwordCheck"  required="required"/>
						</div>
						<input type="hidden" name="authNum" id="authNum" value="" />
						<input type="hidden" name="count" id="count" value="1" />						
						
						<input type="submit" value="비밀번호 변경" class="signUpBtn" id="submitBtn"/>
					</div>	
					
					
					
				</form>
			</div>
		</div>
	</div>
	<script>
	$( document ).ready( function() 
	{
		$("#submitBtn").attr("disabled", true);
		
		$("#Emailbtn").click(function()
	    {
			alert("이메일로 문자를 전송하였습니다.");
			$("#checkBtn").css("display","inline-block");
			
	    	var email = $("#member_email").val();
	    	var name = $("#member_name").val();
	    	var uploadData = "member_email="+email+"&member_name="+name;
	    	
	    	$.ajax
	    	({
	    		type : "POST",
	
		        url : "Member_ID_EmailCheck.do",
	
		        data : uploadData,
	
		      //  dataType : "text",
		        
	    		success : function(authNum)
	    		{
	    			console.log("성공");
	    			$("#authNum").val(authNum);
	    			$('#authNum').load(document.URL +  ' #authNum');		//일부만 새로고침
	    			
	    		},
	    		error:function()
	    		{
	    			console.log("실패");
	    		}
	    	});
   		 });
	
		
		$("#checkBtn").click(function(){
			var count = parseInt(document.getElementById("count").value);
			var email = $("#member_email").val();
			var emailcheck = $("#member_emailcheck").val();
			var authNum = $("#authNum").val();
			
			if(emailcheck == authNum)
			{
				alert("이메일 인증이 완료되었습니다.");
				$(".passwordNone").css("display","inline-block");
				
				// 비밀번호 매칭
				$("#member_password, #member_passwordCheck").keyup(function()
				{
			    	//비밀번호 체크
			    	var member_password = $("#member_password").val();
			    	var member_passwordCheck = $("#member_passwordCheck").val()
			    	
			    	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,13}$/;
    				$("#submitBtn").attr("disabled", true);
    				if(passwordRules.test(member_password))
    				{
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
    				}
    				else
    				{
    					$("#passwordCheck").text("특수문자와+영문+숫자로7~13자로해주세요.");
       					$("#passwordCheck").css("color","black");
       					$("#submitBtn").attr("disabled", true);
    				}
				});
			}
			else
			{
				if(count == 3)
				{
					alert("인증 횟수가 초과되었습니다. 재인증받아주세요.");
					$("#checkBtn").css("display","none");
				}
				else
				{
					alert("이메일 인증이 실패하였습니다. ("+count+"/3)");
					count = count+1;
					$("#count").val(count);
				}
			}
			
		});
	
	});
	</script>
</body>
</html>

