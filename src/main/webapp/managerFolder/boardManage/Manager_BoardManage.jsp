<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="wrapper_p">
			<c:if test="${board_class eq 'QnA' }">
				<a class="ManagerTitle">게시글 관리(QnA)</a>
			</c:if>	
			<c:if test="${board_class eq 'Review' }">
				<a class="ManagerTitle">게시글 관리(Review)</a>
			</c:if>	
			<c:if test="${board_class eq 'Event' }">
				<a class="ManagerTitle">게시글 관리(Event)</a>
			</c:if>	
			<c:if test="${board_class eq 'Search' }">
				<a class="ManagerTitle">게시글 검색(Search)</a>
			</c:if>				
			
			<form action="BoardTitleSearch.do?page=1" method="post" style="float:left; margin-bottom:10px;">
				<input type="text" name="board_title" placeholder="글제목검색"/>
				<input type="submit" value="검색" />
			</form>
			<a href="Manager_index.jsp?page=boardManage/Manager_BoardInsert.jsp?board_class=${board_class}" style="float:right; text-align:center;width:70px; height:23px; line-height:23px; display:inline-block; background-color:white; border:1px solid black; ">글 작성</a>
			<div class="both" style="clear:both;"></div>
			<div class="managerTable">
				<div class="tr">
					<a class="small">글번호</a>
					<a class="small">작성자</a>
					<a class="highlong">글제목</a>
					<a class="normal">작성일</a>
					<a class="small">조회수</a>
				</div>	
			<c:if test="${fn:length(boardList) == 0}">		
				<div class="td">
					<a class="small">0</a>
					<a class="small">0</a>
					<a class="highlong">0</a>
					<a class="normal">0</a>
					<a class="small">0</a>
				</div>	
			</c:if>		
				
				
			<c:if test="${fn:length(boardList) > 0}">		
				<c:forEach var="bl" items="${boardList }" varStatus="status">
					<div class="td">
						<a class="small" href="Board_SelectOne.do?board_index=${bl.board_index}">${bl.board_index }</a>
						<a class="small" href="Board_SelectOne.do?board_index=${bl.board_index}">${bl.member_id }</a>
						<a class="highlong" href="Board_SelectOne.do?board_index=${bl.board_index}">${bl.board_title }</a>
						<a class="normal" >${bl.reg_date }</a>
						<a class="small" >${bl.readcount }</a>
					</div>	
				</c:forEach>	
			</c:if>
				
			</div>
			<div class="pagenum">
				<div class="pagenum_loc">
				<div class="paging" style="text-align:center;">
				<ul style="display:inline-block; list-style:none;">
					<c:if test="${page > 9}">
						<c:if test="${searchPoint == null }">
							<li style="float:left;"><a href="Manager_Board_SelectList.do?page=${startPage - 9}&board_class=${board_class}" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="BoardTitleSearch.do?page=${startPage - 9}&board_title=${board_title}" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>						
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<c:if test="${searchPoint == null }">
								<li style="float:left;"><a href="Manager_Board_SelectList.do?page=${i}&board_class=${board_class}" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>
							<c:if test="${searchPoint != null }">
								<li style="float:left;"><a href="BoardTitleSearch.do?page=${i}&board_title=${board_title}" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>							
						</c:if>
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
						<c:if test="${searchPoint == null }">
							<li style="float:left;"><a href="Manager_Board_SelectList.do?page=${startPage+9}&board_class=${board_class}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="BoardTitleSearch.do?page=${startPage+9}&board_title=${board_title}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
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