<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>   
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script src = "http://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>                  
<script type="text/javascript" src="../smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<script>
$( document ).ready( function() {
    $( '.allCheck' ).click( function() {
      $( '.box' ).prop( 'checked', this.checked );
    } );
    
    $('.signUpBtn').hover(function()
    {
    	$('.signUpBtn').stop().animate({
    		backgroundColor:'black',
    		color:'white'
    	},300);
    			
    },
    function()
    {
    	$('.signUpBtn').stop().animate({
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
			<c:if test="${board_class eq 'QnA' }">
				<a class="ManagerTitle">게시글 등록(QnA)</a>
			</c:if>
			<c:if test="${board_class eq 'Review' }">
				<a class="ManagerTitle">게시글 등록(Review)</a>
			</c:if>
			<c:if test="${board_class eq 'Event' }">
				<a class="ManagerTitle">게시글 등록(Event)</a>
			</c:if>
			<div class="signUpBody">
				<form action="Manager_Board_Insert.do" method="post" name = "signUpForm" id="signUpForm" class="signUpForm" enctype="multipart/form-data">
					<div class="signUpFormDiv">
						<a>BOARD_TITLE</a><br><input type="text" name="board_title" id="board_title" required="required" maxlength="40"/><br>
						
						<a>BOARD_CLASS</a><br><input type="text" name="board_class" id="board_class" value="${board_class }" required="required" readonly="readonly"/><br>
						
						<a>BOARD_CONTENT</a><br>
						<!--  <input type="text" name="board_content" id="board_content"  required="required" /><br>-->
						<textarea id="txtContent" name="board_content" rows="10" cols="100" maxlength="500" style="width:698px;height:50px;font-size:20px;"></textarea><br>

						<a>BOARD_IMAGE</a><br><input type="file" name="board_image" id="board_image"  /><br>
					<!-- manager ->	<input type="hidden" value="${memberVO.member_id }" name="member_id" /> -->
							<input type="hidden" value="admin" name="member_id" />
						<input type="submit" id="save" value="글등록하기" class="signUpBtn"/>
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
          sSkinURI: "../smartEditor/SmartEditor2Skin.html",  
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


</body>
</html>