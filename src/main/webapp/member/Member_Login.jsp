<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.wrapper .height_all .Login_Background .hover:hover
	{
		text-decoration:underline;
	}
</style>
<body>

<div class="wrapper" style="height:100%;">
	<div class="height_all">
		<div class="Login_Background">
			<div class="Login_container">
				<div class="Login_container_p">
					<a class="loginTitle" style="color:black;">회원 로그인 | MEMBER`S LOGIN</a>
					<div class="graybox">
						<form action="Member_Login.do" method="post">
							<img src="./image/idicon.jpg" class="grayboximg"/><input type="text" name="member_id" id="id" placeholder="아이디를 입력하세요" required="required"/><br>
							<img src="./image/pwicon.jpg" class="grayboximg"/><input type="password" name="member_password" id="passwd" placeholder="비밀번호를 입력하세요" required="required"/><br>
							<input type="submit" value="로그인" class="loginbtn"/>
						</form><br>
					</div>
					<div class="loginbottom">
						<a>아직 회원이 아니세요?</a><a href="index.jsp?page=member/Member_SignUp.jsp" style="text-decoration:underline;">회원가입</a><br>
						<a class="hover" href="index.jsp?page=member/Member_IdSearch.jsp" style="width:100px; display:inline-block; text-align:center;">아이디찾기</a>
						<a class="hover" href="index.jsp?page=member/Member_PasswordSearch.jsp" style="">비밀번호찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>