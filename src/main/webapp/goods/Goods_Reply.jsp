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
	<div class="replyInput">
		<c:if test="${memberVO.member_id != null }">
			<form action ="#" method="post">
				<input type="text" value="${memberVO.member_id }" id="replyMember_id" name="member_id" style="width:250px; height:30px; margin:2px 0px 2px 45px;" readonly="readonly"/>
				<input type="text" placeholder="댓글을 입력해주세요." name="reply_content" id="reply_Content" style="width:650px; height:30px;"/> 
				<input type="hidden" value="${goodsVO.goods_index }" id="goods_index" value="goods_index"  />       
				<input type="button" value="댓글작성" id="replyBtn" onclick="replyInsert()" style="width:100px; height:33px; border:1px solid black; background-color:white;" />
			</form>
		</c:if>
		<c:if test="${memberVO.member_id == null }">
			<a style="display:inline-block; width:1100px; text-align:center;">로그인해주세요.</a>
		</c:if>
	</div>
	<div class="replyBody" id="replyBody">
		<c:forEach var="rl" items="${replyVOList }" varStatus="status">
			<form action="#" method="post">
				<div class="reply">
					<input type="text" value="${rl.member_id }" name="member_id" style="width:200px; height:30px; margin:2px 0px 2px 45px; float:left;"  readonly="readonly"/>
					<input type="text" value="${rl.reply_content }" name="reply_content" id="reply_content_${rl.reply_index }" style="width:650px; margin-left:3px;  height:30px; margin-top:2px; float:left;" readonly="readonly"/>
					<c:if test="${rl.member_id eq memberVO.member_id }">
						<div class="replyUpdateBtn" id="updateBtn_${rl.reply_index }" style="float:left; width:60px;">
							<input type="button" onclick="replyUpdateBtn('${rl.reply_index}')" value="수정하기" style="border:1px solid black; margin-top:2px; background-color:white; width:80px;"/>
						</div>
						<div class="replyUpdate" id = "updateNone_${rl.reply_index }" style="float:left; width:145px; margin-top:2px; display:none;">
							<input type="button" onclick="replyUpdate('${rl.reply_index}')" value="수정" style="border:1px solid black; background-color:white; width:50px;"/>
							<input type="button" onclick = "replyDelete('${rl.reply_index}')" value="삭제" style="border:1px solid black; background-color:white; width:50px;"/>
							<a onclick="replyUpdateBtnNone('${rl.reply_index }')" style="cursor:pointer;">X</a>
						</div>        
					</c:if>	  				
				</div>
			</form>
		</c:forEach>
	
	<input type="hidden" value="${memberVO.member_id }" id="member_id" />
	
	<div class="margin"></div>
	
	<div class="pagenum">
		<div class="pagenum_loc">
			<div class="paging" style="text-align:center;">
			<ul style="display:inline-block; list-style:none;">
				<c:if test="${page > 9}">
					<li style="float:left;"><a href="ReplySelectList.do?page=${startPage - 9}&goods_index=${goods_index}" style="float:left; position:relative; ">이전으로</a></li>
				</c:if>
				<c:set var="i" value = "5"/>
				<c:forEach begin="${startPage }"  end="${endPage }" var = "i" varStatus="status" step="1">
					<c:if test="${status.count <= 9 }">
						<li style="float:left;"><a href="ReplySelectList.do?page=${i}&goods_index=${goods_index}" style="float:left; position:relative; ">[${i}]</a></li>
					</c:if>
					
				</c:forEach>
					<fmt:parseNumber var="eqpage" value="${((page / 10) + 1)}" integerOnly="true"/>
					<fmt:parseNumber var="endeqpage" value="${endPage /10 + 1}" integerOnly="true"/>
				<c:if test="${ endeqpage > eqpage }">
						<li style="float:left;"><a href="ReplySelectList.do?page=${startPage+9}&goods_index=${goods_index}" style="float:left; position:relative; ">다음으로</a>	</li><!-- 페이지는 페이지가 움직임 -->
				</c:if>
			</ul>
			</div>
		</div>
	</div>
	</div>
	
</div>
<script>
	function replyUpdateBtn(reply_index)
	{
		$("#updateNone_"+reply_index).css("display","inline-block");
		$("#updateBtn_"+reply_index).css("display","none");
		$("#reply_content_"+reply_index).removeAttr("readonly");

	}
	
	function replyUpdateBtnNone(reply_index)
	{
		$("#updateNone_"+reply_index).css("display","none");
		$("#updateBtn_"+reply_index).css("display","inline-block");
		$("#reply_content_"+reply_index).attr("readonly",true);
	}
	
	function replyInsert()
	{
		var member_id = $("#replyMember_id").val();
		var reply_content = $("#reply_Content").val();
		var goods_index = $("#goods_index").val();
		
		$.ajax
		({
			type : "POST",

			url : "ReplyInsert.ajax",

			data : "member_id=" + member_id + "&reply_content=" + reply_content + "&goods_index=" + goods_index,

			//  dataType : "text",
    		        
			success : function(data)
    		{
				console.log("성공 1이면 성공 0 이면 실패"+data);
				$('#replyBody').load(document.URL +  ' #replyBody');		//일부만 새로고침
    		},
			error:function()
			{
    	    	console.log("실패");
			}
		});
    		
	}
	
	function replyUpdate(reply_index)
	{
		var reply_content = $("#reply_content_"+reply_index).val();
		var member_id = $("#member_id").val();
		
		$.ajax
		({
			type : "POST",

			url : "ReplyUpdate.ajax",

			data : "member_id=" + member_id + "&reply_content=" + reply_content + "&reply_index=" + reply_index,

			//  dataType : "text",
    		        
			success : function(data)
    		{
				console.log("성공 1이면 성공 0 이면 실패"+data);
				$('#replyBody').load(document.URL +  ' #replyBody');		//일부만 새로고침
    		},
			error:function()
			{
    	    	console.log("실패");
			}
		});
    		
	}
	
	function replyDelete(reply_index)
	{
		if(confirm("정말 삭제하시겠습니까?"))
		{
			
			var member_id = $("#member_id").val();
			
			$.ajax
			({
				type : "POST",
	
				url : "ReplyDelete.ajax",
	
				data : "member_id=" + member_id + "&reply_index=" + reply_index,
	
				//  dataType : "text",
	    		        
				success : function(data)
	    		{
					console.log("성공 1이면 성공 0 이면 실패"+data);
					$('#replyBody').load(document.URL +  ' #replyBody');		//일부만 새로고침
	    		},
				error:function()
				{
	    	    	console.log("실패");
				}
			});
		}
		else
		{
			return;
		}
    		
	}	
	</script>
</body>
</html>