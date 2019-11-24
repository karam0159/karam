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
		<c:if test="${goods_class eq 'Tops' }">			
			<a class="ManagerTitle">상품 관리(Tops)</a>
		</c:if>	
		<c:if test="${goods_class eq 'Bottoms' }">			
			<a class="ManagerTitle">상품 관리(Bottoms)</a>
		</c:if>	
		<c:if test="${goods_class eq 'Shoes' }">			
			<a class="ManagerTitle">상품 관리(Shoes)</a>
		</c:if>	
		<c:if test="${goods_class eq 'Search' }">
			<a class="ManagerTitle">상품 검색(Search)</a>
		</c:if>
			
			<form action="ManagerGoodsSearch.do?page=1" method="post" style="float:left; margin-bottom:10px;">
				<input type="text" name="goods_name" placeholder="상품명검색"/>
				<input type="submit" value="검색" />
			</form>
			<a href="Manager_index.jsp?page=goodsManage/Manager_GoodsInsert.jsp?goods_class=${goods_class }" style="float:right; text-align:center;width:70px; height:23px; line-height:23px; display:inline-block; background-color:white; border:1px solid black; ">상품 등록</a>
			<div class="both" style="clear:both;"></div>			
			<div class="managerTable">
				<div class="tr">
					<a class="small">상품번호</a>
					<a class="small">상품이름</a>
					<a class="normal">상품가격</a>
					<a class="highlong">상품내용</a>
					<a class="small">판매량</a>
				</div>	
				<c:if test="${fn:length(goodsList) == 0}">
					<div class="td">
						<a class="small">0</a>
						<a class="small">0</a>
						<a class="normal">0</a>
						<a class="highlong">0</a>
						<a class="small">0</a>
					</div>
				</c:if>		
				
				<c:if test="${fn:length(goodsList) > 0}">
					<c:forEach var="gl" items="${goodsList}" varStatus="status">
						<div class="td">
							<a class="small" href="Goods_SelectOne.do?goods_index=${gl.goods_index}">${gl.goods_index }</a>
							<a class="small" href="Goods_SelectOne.do?goods_index=${gl.goods_index}">${gl.goods_name }</a>
							<a class="normal" href="Goods_SelectOne.do?goods_index=${gl.goods_index}">${gl.goods_price }</a>
							<a class="highlong" href="Goods_SelectOne.do?goods_index=${gl.goods_index}">${gl.goods_content }</a>
							<a class="small" href="Goods_SelectOne.do?goods_index=${gl.goods_index}">${gl.goods_sellcount }</a>
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
							<li style="float:left;"><a href="Manager_GoodsSelectList.do?page=${startPage - 9}&goods_class=${goods_class}&goods_kind=All" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="ManagerGoodsSearch.do?page=${startPage - 9}&goods_name=${goods_name}" style="float:left; position:relative; ">이전으로</a></li>
						</c:if>
					</c:if>
					<c:set var="i" value = "5"/>
					<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
						<c:if test="${status.count <= 9 }">
							<c:if test="${searchPoint == null }">
								<li style="float:left;"><a href="Manager_GoodsSelectList.do?page=${i}&goods_class=${goods_class}&goods_kind=All" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>
							<c:if test="${searchPoint != null }">
								<li style="float:left;"><a href="ManagerGoodsSearch.do?page=${i}&goods_name=${goods_name}" style="float:left; position:relative; ">[${i}]</a></li>
							</c:if>							
						</c:if>
						
					</c:forEach>
						<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
						<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
					<c:if test="${ endeqpage > eqpage }">
						<c:if test="${searchPoint == null }">
							<li style="float:left;"><a href="Manager_GoodsSelectList.do?page=${startPage+9}&goods_class=${goods_class}&goods_kind=All" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
						</c:if>
						<c:if test="${searchPoint != null }">
							<li style="float:left;"><a href="ManagerGoodsSearch.do?page=${startPage+9}&goods_name=${goods_name}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
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