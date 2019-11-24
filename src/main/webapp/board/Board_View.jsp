<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE html>
<html>
<head>
 <script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$( document ).ready( function() {
    $('#signUpBtn').hover(function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('#signUpBtn').stop().animate({
    		backgroundColor:'white',
    		color:'black'
    	},300);
    });
    
    
    $('#deleteBtn').hover(function()
  	{
		$('#deleteBtn').stop().animate({
		backgroundColor:'black',
		color:'white'
	},300);
  	    			
    },
    function()
    {
	   	$('#deleteBtn').stop().animate({
   		backgroundColor:'white',
   		color:'black'
   	},300);
    }); 
    
    $('#listBtn').hover(function()
  	{
		$('#listBtn').stop().animate({
		backgroundColor:'black',
		color:'white'
	},300);
  	    			
    },
    function()
    {
	   	$('#listBtn').stop().animate({
   		backgroundColor:'white',
   		color:'black'
   	},300);
    }); 
    
  } );
</script>
</head>
<body>

<c:set var = "board_class" value="${param.board_class}" ></c:set>

	<div class="wrapper">
		<div class="wrapper_p">
			<c:if test="${boardVO.board_class eq 'QnA' }">
				<a class="ManagerTitle">게시글 (QnA)</a>
			</c:if>
			<c:if test="${boardVO.board_class eq 'Review' }">
				<a class="ManagerTitle">게시글 (Review)</a>
			</c:if>
			<c:if test="${boardVO.board_class eq 'Event' }">
				<a class="ManagerTitle">게시글 (Event)</a>
			</c:if>
			<div class="signUpBody">
				<form action="Board_UpdateView.do?board_index=${boardVO.board_index }" method="post" name = "signUpForm" class="signUpForm" enctype="multipart/form-data">
					<div class="signUpFormDiv">
						<a>BOARD_TITLE</a><br><input type="text" name="board_title" id="board_title" value="${boardVO.board_title }" required="required" readonly="readonly"/><br>
						
						<a>BOARD_CLASS</a><br><input type="text" name="board_class" id="board_class" value="${boardVO.board_class }" required="required" readonly="readonly"/><br>
						
						<a>BOARD_CONTENT</a><br>
						<div contentEditable="false" style="width:700px; padding-bottom:200px; border:1px solid black;">
							<img src="./image/main/mainImage700.png" alt="사이트이미지" />
						 	<c:if test="${boardVO.board_image != null}">
						 		<img src=".${boardVO.board_image }" alt="이미지" style="width:250px; display:block; margin:0 auto;"/>
							</c:if>
							<p>${boardVO.board_content }</p><br>
						</div>
						
					<!-- manager ->	<input type="hidden" value="${memberVO.member_id }" name="member_id" /> -->
							<input type="hidden" name="board_index" value="${boardVO.board_index }" />
							<input type="hidden" value="admin" name="member_id" />
						<c:if test="${boardVO.member_id eq memberVO.member_id && boardVO.board_class ne 'Event' }">
							<input type="submit" value="글수정하기" class="signUpBtn" id="signUpBtn" style="margin-bottom:20px;"/>
							<input type="button" value="글삭제하기" class="signUpBtn" id="deleteBtn" style="margin-top:20px; margin-bottom:20px;" onclick="boardDeleteGo('${boardVO.board_index}','${boardVO.board_class}');"/>
							<input type="button" value="목록으로" class="signUpBtn" id="listBtn" style="margin-top:20px; margin-bottom:150px;" onclick="boardListGo('${boardVO.board_class}');"/>
						</c:if>
						<c:if test="${boardVO.member_id ne memberVO.member_id && boardVO.board_class ne 'Event' }" >
							<input type="button" value="목록으로" class="signUpBtn" id="listBtn" style="margin-top:20px; margin-bottom:150px;" onclick="boardListGo();"/>
						</c:if>
					</div>	
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var oEditors = [];
	$(function(){
	      nhn.husky.EZCreator.createInIFrame({
	          oAppRef: oEditors,
	          elPlaceHolder: "txtContent", //textarea에서 지정한 id와 일치해야 합니다. 
	          //SmartEditor2Skin.html 파일이 존재하는 경로
	          sSkinURI: "smartEditor/SmartEditor2Skin.html",  
	          htParams : {
	              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseToolbar : true,             
	              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseVerticalResizer : true,     
	              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	              bUseModeChanger : true,         
	              fOnBeforeUnload : function(){
	                   
	              }
	          }, 
	          fOnAppLoad : function(){
	              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	             // oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
	          },
	          fCreator: "createSEditor2"
	      });
	      
	      //저장버튼 클릭시 form 전송
	      $("#save").click(function(){
	          oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#signUpForm").submit();
	      });    
	});
	 
	</script>
	<script>
  		function boardDeleteGo(board_index,board_class)
  		{
  			if(confirm("정말 삭제하시겠습니까?"))
  			{
  				location.href = "Board_Delete.do?board_index="+board_index+"&board_class="+board_class;
  			}
  			else
  			{
  				return;
  			}
	  		
  		}
  		
  		function boardListGo(board_class)
  		{
  			location.href= "Board_SelectList.do?page=1&board_class="+board_class;
  		}
  		
</script>
</body>
</html>