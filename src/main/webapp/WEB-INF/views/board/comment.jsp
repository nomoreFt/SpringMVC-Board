 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RESTful 웹서비스 클라이언트(JSON)</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	$(function(){
		commentList();

		commentDelete();
		
		commentInsert();
	
		commentUpdate();
		
	});
	


	/* function commentUpdateFnc(cId,content){
		
		
	} */
	
	
	

	//사용자 수정 요청
	function commentUpdate() {
		//수정 버튼 클릭
		/* $('#btnUpdate').on('click',function(){ */
		$('#commentBody').on('click','#btnUpdate',function(){
			var userId = $('input:text[name="userId"]').val();
			var name = $('input:text[name="name"]').val();
			var gender = $('input:radio[name="gender"]:checked').val();
			var city = $('select[name="city"]').val();	
			$.ajax({ 
			    url: "users", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ userId: userId, name:name,gender: gender, city: city }),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function(data) { 
			        userList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	 
	
	//사용자 삭제 요청
	function commentDelete() {
		//삭제 버튼 클릭
		$('#commentBody').on('click','#btnDelete',function(){
			var bId = $(this).closest('tr').find('#hidden_bId').val();
			var cId = $(this).closest('tr').find('#hidden_cId').val();
			
			var result = confirm(bId + "글 번호  ," + cId +" 번째 댓글 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'comment/'+cId, 
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						commentList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 등록 요청
	function commentInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var userId = $('input:text[name="userId"]').val();
			var content = $('textarea#content').val();
			var bId = $('input:hidden[name="bId"]').val();
			$.ajax({ 
			    url: "commentList",  
			    type: 'POST',  
			    dataType: 'json', 
			    data: JSON.stringify({ userId: userId, content:content,bId: bId}),
			    contentType: 'application/json', 
			    mimeType: 'application/json',
			    success: function(response) {
			    	if(response.result == true) {
			    		commentList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	//사용자 목록 조회 요청
	function commentList() {
		var bId = $('input:hidden[name="bId"]').val();
		
		$.ajax({
			url:'commentList/'+bId,
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:commentListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function commentListResult(xhr) {
		console.log(xhr.data);
		$("#commentBody").empty();
		$.each(xhr.data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.userId))
			.append($('<td>').html(item.content))
			.append($('<td>').html('<button id=\'btnUpdate\'>수정</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_bId\'>').val(item.bId))
			.append($('<input type=\'hidden\' id=\'hidden_cId\'>').val(item.cId))
			.appendTo('#commentBody');
		});//each
	}//userListResult
</script>
</head>
</head>
<body>
<div class="container">
	<form id="form1"  class="form-horizontal">
		<h2>사용자 등록 및 수정</h2>
		<div class="form-group">		
		<input type="hidden" name="bId" value="${contentOne.bId}">
			<label >아이디:</label>
			<input type="text" name="userId"  readonly="readonly" value="${contentOne.bName}">
		</div>	
		<div class="form-group">
			<label>콘텐츠:</label>
			 <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
			<!-- <input type="text"  class="form-control"  name="content" > -->
		</div>	
		
	</form>
</div>		
<hr/>		
<div class="container">	
	<h2>댓글</h2>
	<table class="table text-center">
		<thead>
		<tr>
			<th class="text-center">아이디</th>
			<th class="text-center">내용</th>
		</tr>
		</thead>
		<tbody id="commentBody"></tbody>
		<tfoot>
		<div class="btn-group">      
				<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
		</div>
		</tfoot>
	</table>
</div>	
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].content + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
 
</body>
</html>
 --%>