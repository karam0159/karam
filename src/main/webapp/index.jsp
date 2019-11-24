 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑의 즐거움 Neating</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:500&display=swap" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<link href="css/basic.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/header.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/Login.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/mainCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/Comm.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/manager.css" rel="stylesheet" type="text/css" media="all" />


<style>

	body,html
	{
		margin:0;
		padding:0;
	}
	#main
	{
		background-color:black;
		width:100%;
		margin:0 auto;
		
	}
	.miln
	{
		margin:0 auto;
		width:100%;
	}


</style>
</head>
<body>
	<c:import url="./header.jsp"/>
			
			<c:set var = "now" value="${param.page}" ></c:set>
	
			<c:if test="${param.page == null}">
				<c:set var = "now" value="main.jsp" ></c:set>
				
					<div class="miln">
						<c:import url="${now}"></c:import>
					</div>		
			
			</c:if>

			<c:if test="${param.page != null }">
			
				<div class="miln">
					<c:import url="${now}"></c:import>
				</div>		
				
			</c:if> 
	<c:if test="${param.page != 'member/Member_Login.jsp' }">		
		<c:import url="./footer.jsp"/>
	</c:if>
</body>
</html>