<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="announcement.model.vo.Announcement"%>
<% 
   Announcement a = (Announcement)request.getAttribute("a");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>
      <%@ include file="../../../css/notice.css" %>
</style>

<title>공지사항 클릭 시</title>
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
            <form action="a_update.om" id="detailForm"name="detailForm" method="post">
               <div class="board_view_wrap">
                  <div class="board_view">
                     <div class="title">
                        <%= a.getaTitle() %>
                        <input type="hidden" name="title" value="<%= a.getaTitle() %>">
                     </div>
                     <div class="info">
                        <dl>
                           <dt>번호</dt>
                           <dd>
                           <%= a.getaNo() %>
                           <input type="hidden" name="no" value="<%= a.getaNo() %>">
                           </dd>
                        </dl>
                        <dl>
                           <dt>작성자</dt>
                           <dd><%= a.getaWriter() %></dd>
                        </dl>
                        <dl>
                           <dt>작성일</dt>
                           <dd>
                              <%= a.getaDate() %>
                              <input type="hidden" name="date" value="<%= a.getaDate()%>"></td>
                           </dd>
                        </dl>
                        <dl>
                           <dt>조회</dt>
                           <dd>
                              <%= a.getaCount() %>
                           </dd>
                        </dl>
                     </div>
                     <div class="cont">
                        <%= a.getaContent() %>
                        <input type="hidden" name="content" value="<%= a.getaContent()%>">
                     </div>
                  </div>
                  <div class="bt_wrap">
                  <%if(loginUser != null && loginUser.getAdminCk() == 1) { %>
                     <input type="submit" value="수정">
                     <input type="button" value="삭제" onclick="deleteA();" class="on">
                  <%} %>
                     <input type="button" onclick="location.href='a_list.om'" value="목록">
                  </div>
               </div>
            </form>
         </div>
      </div>
   </main>
   <script>
      function deleteA(){
         var bool = confirm('정말 삭제하시겠습니까?');
         if(bool){
            location.href='<%=request.getContextPath()%>/delete.a?no='+ <%=a.getaNo()%>;
         }
      }
   </script>
   <!-- footer -->
   <%@ include file="../common/footer.jsp" %>
</body>
</html>