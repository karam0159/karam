<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<a class="ManagerTitle">회원관리</a>
			<form action="MemberSearch.do?page=1" method="post" style="margin-bottom:10px;">
				<input type="text" name="member_id" id="memberIdSearch" placeholder="회원아이디검색"/>
				<input type="submit" value="검색" />
			</form>
			<div class="managerTable">
				<div class="tr">
					<a class="small">회원번호</a>
					<a class="small">회원명</a>
					<a class="normal">회원아이디</a>
					<a class="long">주소</a>
					<a class="small">구매수</a>
					<a class="small">총구매량</a>
				</div>	
			<c:forEach var="msl" items="${memberSelectList}" varStatus="status">
				<div class="td">
					<a class="small" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.member_index }</a>
					<a class="small" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.member_name }</a>
					<a class="normal" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.member_id }</a>
					<a class="long" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.member_address }</a>
					<a class="small" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.sell_count }</a>
					<a class="small" href="Manager_Member_Select.do?member_id=${msl.member_id}">${msl.member_gold }</a>
				</div>	
			</c:forEach>
				
			</div>
			
			<div class="pagenum">
				<div class="pagenum_loc">
				<div class="paging" style="text-align:center;">
				<ul style="display:inline-block; list-style:none;">
					<c:if test="${page > 9}">
						<c:if test="${searchPoint == null }">
							<li style="float:left;"><a href="Manager_Member_Manage.do?page=${startPage - 9}" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="MemberSearch.do?page=${startPage - 9}&member_id=${member_id}" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>		
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<c:if test="${searchPoint == null }">
								<li style="float:left;"><a href="Manager_Member_Manage.do?page=${i}" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>
							<c:if test="${searchPoint != null }">
								<li style="float:left;"><a href="MemberSearch.do?page=${i}&member_id=${member_id}" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>
						</c:if>
						
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
						<c:if test="${searchPoint == null }">
							<li style="float:left;"><a href="Manager_Member_Manage.do?page=${startPage+9}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="MemberSearch.do?page=${startPage+9}&member_id=${member_id}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
						</c:if>
					</c:if>
				</ul>
				</div>
				
				</div>
			</div>
			
			
		</div>
	</div>
</body>
</html>