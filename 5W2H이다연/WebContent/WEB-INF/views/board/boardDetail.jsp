<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*, java.util.*"%>
<% 
   request.setCharacterEncoding("UTF-8"); 
   Board b = (Board)request.getAttribute("board");
   ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
   ArrayList<Comment> ComList = (ArrayList<Comment>)request.getAttribute("ComList");
   System.out.println("b : " + b);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<!-- 다연님 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- 내꺼 -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
 </script>
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>
<style>
      <%@ include file="../../../css/boardDetail.css" %>
      <%@ include file="../../../css/boardReply.css" %>
</style>
</head>
<body>
   <!-- header -->
   <%@ include file="../common/header.jsp" %>

<main>
   <div class="container" id="content-container">
      <div class="mx-auto test slideShow">
   
         <ul class="slides">
         <% for(int i = 0; i < fileList.size(); i++){ %>
            <li>
               <img src="<%= request.getContextPath() %>/image_uploadFiles/<%= fileList.get(i).getChangeName() %>">
            </li>
         <% } %>

         </ul>
      </div>
      
      <div id="text-container">
         <div class="row">
            <div class="col-md-6">
               <h1><%= b.getBoardTitle() %></h1>
            </div>
         </div>

         <div class="row">
            <div class="col-md-12" style="margin-top: 20px;">
               <span class="info">조회수 : <%= b.getBoardCount() %></span>
            </div>
            
            <%if(loginUser != null){ %>
               <%if(b.getBoardWriter().equals(loginUser.getUserId())){ %>
                  <div class="col-md-12 " style="margin-top: 20px;">
                     <input type="button" onclick="deleteBoard();" id="deleteBtn" class="btn btn-danger btn-lg mx-auto" value="삭제" >
                  </div>
               <%} %>
            <%} %>
         </div>

         <hr>
         
         <div class="row line" id="content">
            <div class="col-md-2">주소</div>
            <div class="col-md-10"><%= b.getBoardAddress() %></div>
         </div>
         <div class="row line">
            <div class="col-md-2 name">전화번호</div>
            <div class="col-md-10"><%= b.getBoardTel() %></div>
         </div>
         
         <div class="row line">
            <div class="col-md-2 name">가격대</div>
            <div class="col-md-10"><%= b.getBoardPrice() %></div>
         </div>

         <div class="row line">
            <div class="col-md-2 name">영업 요일</div>
            <div class="col-md-10"><%= b.getBoardOpen() %></div>
         </div>
         
         <div class="row line">
            <div class="col-md-2 name">식당 소개</div>
            <div class="col-md-10"><%= b.getBoardComment() %></div>
         </div>
         
         <div class="row line" style="margin-bottom: 70px;">
            <div class="col-md-2 name">메뉴</div>
            <div class="col-md-10"><%= b.getBoardMenu() %></div>
         </div>
      
      </div>
      <hr>
      
      <div class="reply">
      <div class="line">
         <div>      
            <input type="checkbox" class="btn-check" id="write" autocomplete="off"> 
            <label class="btn anwser" for="write"><i class="fa-regular fa-comment"></i></label>      
            
               
            <div class="visible" style="display: none;">
               <form method="post" id="form" style="overflow: auto;" onsubmit="return CheckNotNull();">
                  <div class="form-floating" style="margin-top: 10px;">
                     <textarea class="form-control" id="floatingTextarea2" style="height: 70px; width: resize: none;"></textarea>
                     <button type="submit" class="btn btn-warning" style="margin: 10px; margin-right: 0px; float: right;" id="in_Comment">댓글달기</button>
                  </div>
               </form>

               <hr>
               
               <div class="reply-reply">
                   <% if(ComList.isEmpty()) { %>
                      댓글이 없습니다
                   <% } else { %>
                      <input type="hidden" value="<%= b.getBoardId() %>">
                     <% for(int i = 0; i < ComList.size(); i++) { %>
                  <div class="row line" style="font-size: 20px;">
                     <div class="col-md-2 name">
                        <%= ComList.get(i).getCommentWriter() %>
                        <br>
                        <%= ComList.get(i).getCreateDate() %>
                     </div>
                     <div class="col-md-10">
                        <%= ComList.get(i).getCommentContent() %>
                     </div>
                  </div>
                  <% } %>
                <% } %>
               </div>
               
               <hr>
            </div>
         </div>
      </div>
   </div>
   </div>
   <div class="window_up" style="cursor: pointer;"
            onclick="window.scrollTo(0,0);">
            <a href="#" class="top"> <svg xmlns="http://www.w3.org/2000/svg"
                  width="50" height="50" fill="currentColor"
                  class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
              <path
                     d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
         </svg>
            </a>
         </div>
</main>
<script>

   function CheckNotNull(){
	   
	   var value = document.getElementsByTagName('textarea')[0].value.trim();
	   console.log(value);
	   
	   if(judgmentLogin()){
		   if(value === '' || value === null){
			   alert('댓글을 작성하세요.');
			   return false;
		   }else{
			   return true;
		   }
	   }else{
		   alert('로그인을 하셔야 댓글을 작성할 수 있습니다.');
		   return false;
	   }
   }
   
   
   function judgmentLogin(){   // 사용자의 로그인 상태 판별
	   var loginUser = '<%=loginUser%>';

	   if(loginUser === 'null'){
		   return false;
	   }else{
		   return true;
	   }
   }
   console.log(judgmentLogin() + "로그인 상태");
</script>
<script>
   var slides = document.getElementsByClassName('slides')[0];
   var slideImg = document.querySelectorAll('.slides li');
   var currentIdx = 0; // 현재 슬라이드 Index
   var slideCount = slideImg.length; // 슬라이드 개수
   console.log("slideCount : " +  slideCount);
   var slideWidth = 500; // 한개의 슬라이드 넓이
   var slideMargin = 100; // 슬라이드 간의 margin 값

   slides.style.width = slideWidth * slideCount + 'px';
   console.log(slides.style.width);

   function moveSlide(num) {
      slides.style.left = -num * 500 + 'px';
      currentIdx = num;
   }

   setInterval(function() {
      currentIdx = currentIdx + 1;

      if (currentIdx > slideCount - 1) {
         currentIdx = 0;
      }

      moveSlide(currentIdx);
   }, 3000);
   console.log(slides);
</script>
   <script>
   var anwser = document.getElementsByClassName('anwser');
   for(var i=0; i < anwser.length; i++){
      anwser[i].onclick = function(){
         var button = document.getElementById('write');
         if(button.checked === true){
            this.nextSibling.nextSibling.style.display = "none";
         }else if(button.checked === false){
            this.nextSibling.nextSibling.style.display = "block";
         }
      }
   }

</script>

<script>
   $(function(){
      $('#in_Comment').click(function(){

         if(CheckNotNull()){
           	var writer = '<%=b.getBoardWriter()%>';
            var bId = <%= b.getBoardId() %>;
            var content = $('#floatingTextarea2').val();

         
            $.ajax({
               url:"insertComment.bo",
               type: 'post',
               data: {writer:writer, content:content, bId:bId},
               success: function(data){
                  console.log(data);
               },
               error: function(data){
                  console.log(data);
               }
            });
         }else{
        	 console.log("로그인 하세요.");
         }
      });
   });
   
   function deleteBoard(){
      if(confirm('정말 삭제하시겠습니까?')){
         location.href = "<%= request.getContextPath() %>/delete.bo?bId=" + <%= b.getBoardId() %>;
      }
   }
</script>
</body>
</html>