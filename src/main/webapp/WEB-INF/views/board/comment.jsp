<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
   

   function commentModify(cId,bId){
       var content2 = $("textarea#content2").val(); 
      var result = confirm(content2 +  " 로 댓글을 수정하시겠습니까?");
      
      if(result){
      $.ajax({ 
          url: "commentModify",  
          type: 'POST',  
          dataType: 'json', 
          data: JSON.stringify({ cId: cId, content:content2,bId: bId}),
          contentType: 'application/json', 
          mimeType: 'application/json',
          success: function(response) {
             if(response.result == true) {
                commentList();
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status111: "+status+" er:"+message);
          } 
       });
      }
   }//저장 버튼 클릭시 작동
   

   //사용자 수정 요청
   function commentUpdate() {
      //수정 버튼 클릭
      $('#commentBody').on('click','#btnUpdate',function(){
         var bId = $(this).closest('tr').find('#hidden_bId').val();
         var cId = $(this).closest('tr').find('#hidden_cId').val();
         var userId = $(this).closest('tr').find('#hidden_userId').val();
         var content = $(this).closest('tr').find('#hidden_content').val();
         var htmls = '<td>'+userId+'</td>';
          htmls += "<td><textarea style=\"width: 500px\" rows=\"3\" cols=\"30\" id=\"content2\" name=\"content\" placeholder="+content+"></textarea></td>";
           htmls += "<td><button  class = \"btn btn-success\" onclick=\"commentModify("+cId+","+bId+")\">저장</button></td>";
          htmls += "<td><button  class = \"btn btn-default\" onclick=\"commentList()\">취소</button></td>"; 
         $(this).closest('tr').html(htmls);
      
      });//수정 버튼 클릭
   }//commentUpdate
    
   
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
         $('<tr id = '+item.cId+'>')
         .append($('<td>').html(item.userId))
         .append($('<td>').html(item.content))
         .append($('<td>').html('<button class = "btn btn-default" id=\'btnUpdate\'>수정</button>'))
         .append($('<td>').html('<button  class = "btn btn-danger" id=\'btnDelete\'>삭제</button>'))
         .append($('<input type=\'hidden\' id=\'hidden_bId\'>').val(item.bId))
         .append($('<input type=\'hidden\' id=\'hidden_cId\'>').val(item.cId))
         .append($('<input type=\'hidden\' id=\'hidden_content\'>').val(item.content))
         .append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.userId))
         .appendTo('#commentBody');
      });//each
   }//userListResult
</script>
</head>
</head>

<body>
<div class="container">
   <form id="form1"  class="form-horizontal">
      <div class="form-group">      
      <input type="hidden" name="bId" value="64">
         <label >아이디:</label>
         <input type="text" name="userId"  readonly="readonly" value="ㄱ">
      </div>   
      <div class="form-group">
         <label>콘텐츠:</label>
          <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
		 <input type="button"  class="btn btn-primary pull-right" value="등록"  id="btnInsert" /> 
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
           
      </div>
      </tfoot>
   </table>
</div>   
</body>
</html>
   
</body>
</html>