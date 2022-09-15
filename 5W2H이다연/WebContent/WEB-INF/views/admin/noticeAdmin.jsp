<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, announcement.model.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<Announcement> announcementList = (ArrayList<Announcement>)request.getAttribute("announceList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	System.out.println("view의 announcementList : " + announcementList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 관리</title>
<style>
      <%@ include file="../../../css/admin.css" %>
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- Font Awesome Cdn Link -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
</head>
<body>
  <div class="container">
    <nav>
      <ul>
        <li><a href="<%=request.getContextPath() %>/admins.page" class="logo" style="background: none;">
          <span class="nav-item">Admin</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/admins.page">
          <i class="fas fa-user"></i>
          <span class="nav-item">회원 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/board.page">
          <i class="fas fa-database"></i>
          <span class="nav-item">게시판 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/a.page" style="background: #ffe9e1;">
          <i class="fas fa-exclamation-circle" style="color: #ff7746;"></i>
          <span class="nav-item">문의사항 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>">
          <i class="fas fa-home"></i>
          <span class="nav-item">5W2H</span>
        </a></li>

        <li><a href="<%=request.getContextPath() %>/logout.me" class="logout">
          <i class="fas fa-sign-out-alt"></i>
          <span class="nav-item">로그아웃</span>
        </a></li>
      </ul>
    </nav>


    <section class="main">
      <div class="main-top">
        <h1>공지사항 관리</h1>
      </div>

      <section class="attendance">
        <div class="attendance-list">
          <h1>공지사항 List</h1>
          <table class="table">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>상태</th>
                <th>상세보기</th>
                <th>삭제</th>
              </tr>
            </thead>
            <tbody>
            	<%for(int i=0;i<announcementList.size();i++){ %>
            		<tr>
                		<td class="noticeIds"><%=announcementList.get(i).getaNo() %></td>
                		<td><%=announcementList.get(i).getaTitle() %></td>
               		 	<td><%=announcementList.get(i).getaDate() %></td>
                		<td class="noticeStatus"><%=announcementList.get(i).getStatus() %></td>
                		<td><button class="btn" onclick="location.href='<%=request.getContextPath()%>/detail.a?no=<%=announcementList.get(i).getaNo()%>'">View</button></td>
                		<td><div class="toggleBG" onclick="toggle(event)"><button class="toggleFG"></button></div></td>
              </tr>
            	<%} %>
            </tbody>
          </table>
        </div>
      </section>
      <!-- 페이징 -->
       <div class="pagingArea" align="center">
         <!-- 맨 처음으로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/notice.page?currentPage=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/notice.page?currentPage=<%=pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button>
         <script>
            if(<%=pi.getCurrentPage() %> <= 1){
            	document.getElementById('beforeBtn').setAttribute('disabled', true);
            }
         </script>
         <!-- 숫자 페이지로 -->
         <%for(int p=pi.getStartPage();p<=pi.getEndPage();p++){ %>
         	<%if(p==pi.getCurrentPage()){ %>
         		<button class="pageButton" disabled><%=p %></button>
         	<%}else{ %>
         		<button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/notice.page?currentPage=<%=p%>'"><%=p%></button>
         	<%} %>
         <%} %>
         <!-- 다음 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath() %>/notice.page?currentPage=<%=pi.getCurrentPage()+1 %>'" id="afterBtn">&gt;</button>
         <script>
         	if(<%=pi.getCurrentPage() %> >= <%=pi.getMaxPage()%>){
         		document.getElementById('afterBtn').setAttribute('disabled', true);
         		console.log(document.getElementById('afterBtn'));
         	}
         </script>
         
         <!-- 맨 마지막으로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/notice.page?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
      </div>     
   </div>
    </section>
  </div>
  <script>
  		function deleteNotice(toggleBtn){ //선택된 id를 ajax로 전송하여, 백에서 삭제.
			var noticeIds = document.getElementsByClassName('noticeIds');
			var noticeStatus = document.getElementsByClassName('noticeStatus');
			var noticeIdNum = getNoticeIdNum(toggleBtn);
			
			$.ajax({
 				url:'deleteAnnounce.ad',
 				type: 'post',
 				data:{noticeId: noticeIds[noticeIdNum].innerHTML},
				success: function(data){
					noticeStatus[noticeIdNum].innerHTML = 'N';
				},
				error:function(data){
					console.log("에러났습니다. : " + data);
				}
 			});
		}
		
		function saveNotice(toggleBtn){
			var noticeIds = document.getElementsByClassName('noticeIds');
			var noticeStatus = document.getElementsByClassName('noticeStatus');
			var noticeIdNum = getNoticeIdNum(toggleBtn);
			
			$.ajax({
				url:'saveAnnounce.ad',
				type:'post',
				data:{noticeId: noticeIds[noticeIdNum].innerHTML},
				success: function(data){
					noticeStatus[noticeIdNum].innerHTML = 'Y';
				},
				error: function(data){
					console.log(data);
				}
			});
		}
		
		function getNoticeIdNum(toggleBtn){
			var toggleBG = document.getElementsByClassName('toggleBG');
			var noticeIds = document.getElementsByClassName('noticeIds');
			
			for(var i=0;i<toggleBG.length;i++){
				if(toggleBtn == toggleBG[i]){
					return i;
				}
			} 
		}
  </script>
  <script>
		function toggle(event){
			var toggleBG = event.currentTarget;
			var toggleFG = toggleBG.firstChild;
			
			console.log('버튼의 left : ' + toggleFG.style.left);
			
			if(toggleFG.style.left === '40px'){
				toggleBG.style.background = '#CCCCCC';
				toggleActionStart(toggleFG, 'TO_LEFT');
			}else if(toggleFG.style.left === '0px'){
				toggleBG.style.background = '#ff7746';
				toggleActionStart(toggleFG, 'TO_RIGHT');
			}
			
			setTimeout(function(){
				if(getToggleState(toggleFG)){
					console.log("켜졌습니다.");
					deleteNotice(toggleBG);
				}else{
					console.log("꺼졌습니다.");
					saveNotice(toggleBG);
				}
			}, 150);
		}

		function toggleActionStart(toggleBtn, LR){
			var intervalID = setInterval(
					function(){						
						var left = parseInt(toggleBtn.style.left.replace('px', ''));
						left += (LR == 'TO_RIGHT') ? 5 : -5;
						if(left >= 0 && left <= 40){
							toggleBtn.style.left = left + 'px';
							console.log("함수 안의 left : " + toggleBtn.style.left);
						}
					}, 10)
			setTimeout(function(){
				clearInterval(intervalID);
			}, 201);
		}
		
		function getToggleState(toggleBtn){
			if(toggleBtn.style.left === '0px'){
				return false;
			}else if(toggleBtn.style.left === '40px'){
				return true;
			}
		}
	</script>
	<script>
		var noticeStatus = document.getElementsByClassName('noticeStatus');
		var toggleFG = document.getElementsByClassName('toggleFG');
		var toggleBG = document.getElementsByClassName('toggleBG');
		
		for(var i=0;i<noticeStatus.length;i++){
			if(noticeStatus[i].innerHTML === 'Y'){
				toggleFG[i].style.left = '0px';
			}else{
				toggleBG[i].style.background = '#ff7746';
				toggleFG[i].style.left = '40px';
			}
		}
	</script>
</body>
</html>