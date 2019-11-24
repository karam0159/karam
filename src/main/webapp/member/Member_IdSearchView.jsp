<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<div class="signUpBody">
				<a class="title">ID SEARCH</a>
				<div class="signUpFormDiv">
					<h3 style="color:white;">※ 입력하신 이름과 이메일에 일치하는 아이디 검색 완료</h3><br>
					<div class="searchViewBox" style="width:400px; height:200px; border:1px solid black; margin:0 auto; margin-bottom:30px;">
						<a style="width:400px; margin-top: 80px;display:inline-block; text-align:center;">회원님의 아이디 : [ ${member_id } ]</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>