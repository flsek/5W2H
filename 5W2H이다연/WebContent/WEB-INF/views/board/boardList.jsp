<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, board.model.vo.*" %>
<% 
   request.setCharacterEncoding("UTF-8"); 
      ArrayList<Board> Blist = (ArrayList<Board>)request.getAttribute("Blist"); 
      ArrayList<Attachment> Flist = (ArrayList<Attachment>)request.getAttribute("Flist");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
</script>
<script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>

<style>
      <%@ include file="../../../css/boardList.css" %>

</style>
<title>게시판 리스트</title>
</head>
<body>
   <!-- header -->
   <%@ include file="../common/header.jsp"%>

   <!-- 본문 내용 -->
   <div class="main">
		<div class="gray1">
			<div class="gray1_1">
				<!-- 메인 상단 2 -->
				<div class="orange1_1">
       				<span id="My_bname">BEST PICK</span>
				</div>
						<hr class="orange1_2 hr1">
			</div>
		</div>
	</div>
      <!--       한 덩어리    -->
		<% if(Blist.isEmpty() || Flist.isEmpty()) { %>
      	사진 업따
    <% } else { %>
    	<% for(int i = Blist.size() - 1; i >= 0; i--) { %>
        	<% Board b = Blist.get(i); %>
        	<br>
				<div class="gray2">
					<div class="gray1_2">
						<div class="orange">
								<div class="orange2_2">
									<input type="hidden" value="<%= b.getBoardId() %>">
		               					<% for(int j = 0; j < Flist.size(); j++) { %>
		                  					<% Attachment a = Flist.get(j); %>
		                  						<% if(b.getBoardId() == a.getBoardId()) { %>
		                     						<img src="<%= request.getContextPath() %>/image_uploadFiles/<%= a.getChangeName() %>"class="img" width="300px" height="300px">
		                  						<% } %>
		               						<% } %>
								</div>
								
								<div class="orange2_3">
									<div class="sp" id="green2">
										<a class="list_m"><span id="name1"><%= b.getBoardTitle() %></span></a>
									</div>
									<div class="green2">
										<span class="sp" id="address">주소 : <%= b.getBoardAddress()%></span>
									</div>
									<div class="green2">
										<span class="sp" id="tel"><%= b.getBoardTel() %></span>
									</div>
									<div class="green2">
										<span class="sp" id="content"><%= b.getBoardComment() %></span>
									</div>
									<div class="green2">
										<a class="list_m"></a> 
									</div>
									<br>
									<div class="hr2">
										<hr>
									</div>
								</div>
							</div>
						</div>
					</div>
			<% } %>
		<% } %>
		<br>
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
   <script>
      $(function(){
         $('.gray2').click(function(){
            var bId = $(this).children().children().children().children().eq(0).val();
            location.href = "<%= request.getContextPath()%>/detail.bo?bId=" + bId;
         });
      });
   </script>
   <!-- footer -->
   <%@ include file="../common/footer.jsp"%>
</body>
</html>