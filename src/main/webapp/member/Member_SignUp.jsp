<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	$("#signUpBtn").attr("disabled", true);
	
	
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
    
    $("#member_id, #member_password, #member_passwordCheck").keyup(function()
	{
    	// 아이디 중복체크와 길이체크
		var member_id = $("#member_id").val();
    	var member_idlength = $("#member_id").val().length;
    	var length = member_idlength;
    	// 비밀번호 매칭체크
    	var member_password = $("#member_password").val();
    	var member_passwordCheck = $("#member_passwordCheck").val();
    	var passLength = member_password.length;
    	
    	var checkNumber = member_password.search(/[0-9]/g);
    	var checkEnglish = member_password.search(/[a-z]/ig);
    	
		$.ajax
		({
			type : "POST",

			url : "MemberIdCheck.do",

			data : "member_id=" + member_id,

			//  dataType : "text",
    		        
			success : function(data)
    		{
    			console.log("0=중복 1은 중복x"+data);
    			if(length < 6)				// 아이디 글자수 처리
    	    	{
    	    		$("#idLengthCheck").text("글자수가 적습니다.");
    				$("#idLengthCheck").css("color","black");
        			$('#idCheck').load(document.URL +  ' #idCheck');		//일부만 새로고침
        			$("#signUpBtn").attr("disabled", true);
        			if(/^[a-zA-Z0-9]{7,13}$/.test(member_password))
        			{
        				if(checkNumber > 0 || checkEnglish > 0)
        				{
	        				if(member_password != member_passwordCheck)
	            			{
	            	    		$("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
	            				$("#passwordCheck").css("color","black");        				
	            			}
	            			else
	            			{
	            	    		$("#passwordCheck").text("비밀번호가 일치합니다.");
	            				$("#passwordCheck").css("color","black"); 
	            			}
        				}
        				else
        				{
        					$("#passwordCheck").text("영어와 숫자를 섞어서 사용해주세요.");
   	    					$("#passwordCheck").css("color","black");
        				}
        			}
        			else
        			{
        				$("#passwordCheck").text("비밀번호는 영어+숫자로7~13자로해주세요.");
       					$("#passwordCheck").css("color","black");
        			}
        			
    	    	}
    	    	else if(length > 5 && length < 13)
    	    	{
    	    		$("#idLengthCheck").text("글자수가 적당합니다.");
    	    		$("#idLengthCheck").css("color","black");
        			if(data == 1)		// 아이디 중복 처리
        			{
        				$("#idCheck").text("사용중인 아이디입니다-");
        				$("#idCheck").css("color","black");
        				$("#signUpBtn").attr("disabled", true);
        				if(/^[a-zA-Z0-9]{7,13}$/.test(member_password))
        				{
        					if(checkNumber > 0 || checkEnglish > 0)
        					{
	        					if(member_password != member_passwordCheck)
	                			{
	                	    		$("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
	                				$("#passwordCheck").css("color","black");        				
	                			}
	                			else
	                			{
	                	    		$("#passwordCheck").text("비밀번호가 일치합니다.");
	                				$("#passwordCheck").css("color","black"); 
	                			}
        					}
        					else
        					{
        						$("#passwordCheck").text("영어와 숫자를 섞어서 사용해주세요.");
       	    					$("#passwordCheck").css("color","black");
        					}
        				}
        				else
        				{
        					$("#passwordCheck").text("비밀번호는 영어+숫자로7~13자로해주세요.");
           					$("#passwordCheck").css("color","black");
        				}
            			
        			}
        			else
        			{
        				$('#idCheck').load(document.URL +  ' #idCheck');		//일부만 새로고침
        				if(/^[a-zA-Z0-9]{7,13}$/.test(member_password))
        				{
        					if(checkNumber > 0 || checkEnglish > 0)
        					{
	        					if(member_password != member_passwordCheck)
	                			{
	                	    		$("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
	                				$("#passwordCheck").css("color","black");        				
	                			}
	                			else
	                			{
	                	    		$("#passwordCheck").text("비밀번호가 일치합니다.");
	                				$("#passwordCheck").css("color","black"); 
	                				$("#signUpBtn").attr("disabled", false);
	                			}
        					}
        					else
        					{
        						$("#passwordCheck").text("영어와 숫자를 섞어서 사용해주세요.");
       	    					$("#passwordCheck").css("color","black");
        					}
        				}
        				else
        				{
        					$("#passwordCheck").text("비밀번호는 영어+숫자로7~13자로해주세요.");
           					$("#passwordCheck").css("color","black");
        				}
        				
        			}
    	    	}
    	    	else if(length > 12)
    	    	{
    	    		$("#idLengthCheck").text("글자수가 많습니다.");
    				$("#idLengthCheck").css("color","black");
        			$('#idCheck').load(document.URL +  ' #idCheck');		//일부만 새로고침
        			$("#signUpBtn").attr("disabled", true);
        			if(/^[a-zA-Z0-9]{7,13}$/.test(member_password))
        			{
        				if(checkNumber > 0 || checkEnglish > 0)
        				{
	        				if(member_password != member_passwordCheck)
	            			{
	            	    		$("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
	            				$("#passwordCheck").css("color","black");        				
	            			}
	            			else
	            			{
	            	    		$("#passwordCheck").text("비밀번호가 일치합니다.");
	            				$("#passwordCheck").css("color","black"); 
	            			}
        				}
        				else
        				{
        					$("#passwordCheck").text("영어와 숫자를 섞어서 사용해주세요.");
   	    					$("#passwordCheck").css("color","black");
        				}
        			}
        			else
        			{
        				$("#passwordCheck").text("비밀번호는 영어+숫자로7~13자로해주세요.");
       					$("#passwordCheck").css("color","black");
        			}
        			
    	    	}

    		},
			error:function()
			{
    	    	console.log("실패");
			}
		});
	});
    
  });
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="topImg">
				<img src="image/goodsBuyImg2.png" alt="회원혜택" class="signUpImg"/> <!-- 회원은 이벤트 참여가능 -->
			</div>
			<div class="signUpBody">
				<a class="title">Create Account</a>
				<form action="Member_Insert.do" method="post" name = "signUpForm" class="signUpForm" onsubmit="return check();">
					<div class="signUpFormDiv">
						<a>NAME</a><br><input type="text" name="member_name" id="name" required="required" maxlength="7"/><br>
						<a style="width:403px;">ID</a><div class="idCheck" id="idCheck" style="display:inline-block;"></div><div class="idLengthCheck" id="idLengthCheck" style="display:inline-block;"></div><br><input type="text" name="member_id" id="member_id" required="required"/><br>
						<a style="width:403px;">PASSWORD</a><div class="passwordCheck" id="passwordCheck" style="display:inline-block;"></div><br><input type="password" name="member_password" id="member_password" required="required"/><br>
						<a>PASSWORD CHECK</a><br><input type="password" name="member_passwordCheck" id="member_passwordCheck" required="required"/><br>
						<a>ADDRESS</a><br><input type="text" name="member_address" id="address" required="required"/><br>
						<a>TEL</a><br><input type="text" name="member_tel" id="tel" required="required" placeholder="- 제외하고 작성해주세요"/><br>
						<a>EMAIL</a><br><input type="text" name="member_email" id="email" required="required" /><br>
						<a>BIRTH</a><br><input type="date" name="member_birth" id="birth" required="required"/><br>
						<a>ACCOUNT_NAME</a><br><input type="text" name="account_name" id="account_name" required="required"/><br>
						<a>ACCOUNT_BANK</a><br><input type="text" name="account_bank" id="account_bank" required="required"/><br>
						<a>ACCOUNT</a><br><input type="text" name="account" id="account" required="required"/>
					</div>	
					<div class="signUpText">
						<a class="title">가입약관</a><br>
						<textarea class="signUpTextarea" readonly="readonly">Neating 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.

이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.
						
개인정보의 수집 및 이용 동의
1. 개인정보의 수집 및 이용 목적
가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담
나. 회원관리
- 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달

2. 수집하는 개인정보의 항목
<개인회원 가입>
필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일
선택항목 : 이메일 수신여부, 문자수신여부, 웹진구독여부
<기업회원 가입>
필수항목 : 아이디, 비밀번호, 담당자 이름, 담당자 전화번호, 핸드폰번호, 이메일, (법인기업의 경우 법인등록번호), 기업정보(회사명, 대표자명, 사업자등록번호, 회사전화번호, 주소, 지역, 대표업종)
선택항목 : 팩스번호, 홈페이지주소, 회사이메일주소, 창업일자, 부업종, 매출액, 수출액, 상시근로자 수, 주요생산품명, 이메일 수신여부, 문자수신여부, 이메일 수신여부, 문자수신여부, 웹진구독여부
<전문가 가입>
필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 협약사항, 지역
선택항목 : 소속기관명, 대표자명, 사업자번호, 소속기관 전화번호
전문가정보는 기업애로상담을 위한 목적으로 수집하나 보유하지 않고 비즈니스사업단으로 시스템연계 제공
<자동수집>
IP주소, 쿠키, 서비스 이용기록, 방문기록 등

3. 개인정보의 보유 및 이용기간
Neating는 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.
회원정보
- 탈퇴 후 지체없이 파기
전문가정보
- 전문가 정보는 기업애로상담을 위한 목적으로 수집하나 보유하지 않고 비즈니스사업단으로 시스템연계 제공함

4. 동의거부권 및 불이익
정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시 저희가 제공하는 서비스를 이용할 수 없습니다.
						
						</textarea><br>
						<label id="checkbox1">해당 약관에 동의합니다.<input type="checkbox" id="checkbox1" class="box" onchange="checkNotall();"/></label><br>
						<label id="checkbox2">개인정보 활용에 동의합니다.<input type="checkbox" id="checkbox2" class="box" onchange="checkNotall();"/></label><br>
						<label id="checkbox3">모든 약관에 동의합니다.<input type="checkbox" id="checkbox3" class="allCheck" onchange="checkNotall();"/></label><br>
						<input type="submit" value="회원가입하기" class="signUpBtn" id="signUpBtn"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

