 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Neating 매니저모드</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>

<link href="../css/Login.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/basic.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/cssReset.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/manager.css" rel="stylesheet" type="text/css" media="all" />


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
	<c:import url="./Manager_header.jsp"/>
			
			<c:set var = "now" value="${param.page}" ></c:set>
	
			<c:if test="${param.page == null}">
				<c:set var = "now" value="Manager_main.jsp" ></c:set>
				
					<div class="miln">
						<c:import url="${now}"></c:import>
					</div>		
			
			</c:if>

			<c:if test="${param.page != null }">
			
				<div class="miln">
					<c:import url="${now}"></c:import>
				</div>		
				
			</c:if> 
	<c:import url="./Manager_footer.jsp"/>

</body>
</html>