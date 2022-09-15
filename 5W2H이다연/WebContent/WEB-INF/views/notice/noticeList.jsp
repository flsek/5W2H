<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, announcement.model.vo.*"%>

<% 
   ArrayList<Announcement> list = (ArrayList<Announcement>)request.getAttribute("list"); 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>

<style>
      <%@ include file="../../../css/notice.css" %>
</style>

<meta charset="UTF-8">
<title>공지사항 리스트</title>
</head>
<body>
   <!-- header -->
   <%@ include file="../common/header.jsp" %>

<!-- 본문 내용 -->
	<main class="pt-5">
		<div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>공지사항</strong>
					<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<div class="board_list_wrap">
					<div class="board_list" id="list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="writer">글쓴이</div>
							<div class="date">작성일</div>
							<div class="count">조회</div>
						</div>
						<% if(list.isEmpty()){ %>
						<div align="center">
							<div>존재하는 공지사항이 없습니다.</div>
						</div>
						<%} else { %>
							<% for(Announcement a : list){ %>
								<div id="start">
									<div class="num"><%= a.getaNo() %></div>
									<div class="title"><%= a.getaTitle() %></div>
									<div class="writer"><%= a.getaWriter() %></div>
									<div class="date"><%= a.getaDate() %></div>
									<div class="count"><%= a.getaCount() %></div>
								</div>
							<%}%>
						<%} %>
					</div>
					<!-- 페이징 처리 -->
					<div class="board_page">
					<!-- 맨 처음으로 -->
						<a href="<%=request.getContextPath()%>/a_list.om?currentPage=1"
							class="bt first"><<</a> 
							<a href="<%= request.getContextPath()%>/a_list.om?currentPage=<%=pi.getCurrentPage()-1%>"
							class="bt prev" id="beforeBtn"><</a>
						<script>
		            if(<%= pi.getCurrentPage() %> <= 1){
		               $('#beforeBtn').prop('disabled', true);
		            }
		            </script>

						<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
						<% if(p == pi.getCurrentPage()){ %>
						<a class="num on" disabled><%= p %></a>
						<%} else { %>
						<a class="num"
							onclick="location.href='<%= request.getContextPath() %>/a_list.om?currentPage=<%= p %>'"><%= p %></a>
						<%} %>
						<%} %>
						<a
							href="<%= request.getContextPath()%>/a_list.om?currentPage=<%= pi.getCurrentPage()+1%>"
							class="bt next" id="afterBtn">></a>
						<script>
            if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
               $('#afterBtn').prop('disabled', true);
            }
         </script>
						<a
							href="<%=request.getContextPath()%>/a_list.om?currentPage=<%=pi.getMaxPage()%>"
							class="bt last" id="afterBtn">>></a>
					</div>
					<div class="bt_wrap">
						<%if(loginUser != null && loginUser.getAdminCk() == 1) { %>
						<input type="button" onclick="location.href='a_write.om'"
							value="등록" class="on">
						<% } %>
						<!--<a href="#">수정</a>-->
					</div>
				</div>
			</div>
		</div>
			
	</main>
	<script>
   $(function(){
      $('#list div').mouseenter(function(){
         $(this).css({'background' : '#f9f9f9', 'cursor' : 'pointer'});
      }).mouseout(function(){
         $(this).css('background', 'none');
      }).click(function(){
         var num = $(this).children().eq(0).text();
         location.href = '<%= request.getContextPath() %>/detail.a?no=' + num;
      });
   });
</script>

   <!-- footer -->
   <%@ include file="../common/footer.jsp" %>
</body>
</html>