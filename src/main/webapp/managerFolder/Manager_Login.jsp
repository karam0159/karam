<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper
{
	width:100%;
}

.wrapper .managerLogin
{
	width:1100px;
	margin:0 auto;
	margin-top:18%;
	height:300px;
}

.wrapper .managerLogin .managerLoginForm
{
	width:300px;
	margin:0 auto;
}

.wrapper .managerLogin .managerLoginForm input
{
	margin-top:5px;
	width:300px;
	height:30px;
	background-color:white;
	border:1px solid black;
	font-size:20px;
}
</style>
</head>
<body>
<div class="wrapper">
	<div class="managerLogin">
		<form action="../Manager_Login.do" method="post" class="managerLoginForm">
			<input type="text" name="manager_id"/><br>
			<input type="password" name="manager_password"/><br>
			<input type="submit" value="매니저로그인" style="cursor:pointer;"/>
		</form>
	</div>
</div>
</body>
</html>