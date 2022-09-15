<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, users.model.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<Users> userList = (ArrayList<Users>)request.getAttribute("userList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>회원 관리</title>
<style>
      <%@ include file="../../../css/admin.css" %>
</style>
<style>
	<%@ include file="../../../js/jquery-3.6.0.min.js" %>
</style>
  <!-- Font Awesome Cdn Link -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.14/dist/sweetalert2.all.min.js"></script>
</head>
<body>
  <div class="container">
    <nav>
      <ul>
        <li><a href="<%=request.getContextPath() %>/admins.page" class="logo" style="background: none;">
          <span class="nav-item">Admin</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/admins.page" style="background: #ffe9e1;">
          <i class="fas fa-user" style="color: #ff7746;"></i>
          <span class="nav-item">회원 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/board.page">
          <i class="fas fa-database"></i>
          <span class="nav-item">게시판 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/notice.page">
          <i class="fas fa-exclamation-circle"></i>
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
        <h1>회원 관리</h1>
      </div>

      <section class="attendance">
        <div class="attendance-list">
          <h1>회원 List</h1>
          <table class="table">
            <thead>
              <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>상태</th>
                <th>탈퇴일</th>

                <th>삭제</th>
              </tr>
            </thead>
            <tbody>
            	<%for(int i=0;i<userList.size();i++){ %>
            		<tr class="row1">
                		<td class="userId"><%=userList.get(i).getUserId() %></td>
                		<td><%=userList.get(i).getUserName() %></td>
               		 	<td><%=userList.get(i).getNickname() %></td>
                		<td class="userStatus"><%=userList.get(i).getStatus() %></td>
                		<td class="deleteDate"><%=userList.get(i).getDeleteDate() == null ? "-" : userList.get(i).getDeleteDate()%></td>
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
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/admins.page?currentPage=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/admins.page?currentPage=<%=pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button>
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
         		<button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/admins.page?currentPage=<%=p%>'"><%=p%></button>
         	<%} %>
         <%} %>
         <!-- 다음 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath() %>/admins.page?currentPage=<%=pi.getCurrentPage()+1 %>'" id="afterBtn">&gt;</button>
         <script>
         	if(<%=pi.getCurrentPage() %> >= <%=pi.getMaxPage()%>){
         		document.getElementById('afterBtn').setAttribute('disabled', true);
         		console.log(document.getElementById('afterBtn'));
         	}
         </script>
         
         <!-- 맨 마지막으로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/admins.page?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
      </div>   
   </div>
    </section>
  </div>
  
   <script>
      
   </script>
   <script>
   		var btn = document.getElementsByClassName('btn');
   		var deleteDate = document.getElementsByClassName('deleteDate');
   		
      
   		function deleteUser(toggleBtn){ //선택된 id를 ajax로 전송하여, 백에서 삭제.
   			var userIds = document.getElementsByClassName('userId');
   			var userStatus = document.getElementsByClassName('userStatus');
			var userIdNum = getUserIdNum(toggleBtn);
   			
   			$.ajax({
	   				url:'deleteUser.ad',
	   				type: 'post',
	   				data:{userId: userIds[userIdNum].innerHTML},
					success: function(data){
						userStatus[userIdNum].innerHTML = 'N';
						deleteDate[userIdNum].innerHTML = data;
					},
					error:function(data){
						console.log("에러났습니다. : " + data);
					}
	   			});
   		}
   		
   		function saveUser(toggleBtn){
   			var userIds = document.getElementsByClassName('userId');
   			var userStatus = document.getElementsByClassName('userStatus');
			var userIdNum = getUserIdNum(toggleBtn);
   			
   			$.ajax({
   				url:'saveUser.ad',
   				type:'post',
   				data:{userId:userIds[userIdNum].innerHTML},
   				success: function(data){
   					userStatus[userIdNum].innerHTML = 'Y';
   					deleteDate[userIdNum].innerHTML = "-";
   				},
   				error: function(data){
   					console.log(data);
   				}
   			});
   		}
   		
   		function getUserIdNum(toggleBtn){
   			var toggleBG = document.getElementsByClassName('toggleBG');
   			var userIds = document.getElementsByClassName('userId');
   			
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
					deleteUser(toggleBG);
				}else{
					console.log("꺼졌습니다.");
					saveUser(toggleBG);
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
		var userStatus = document.getElementsByClassName('userStatus');
		var toggleFG = document.getElementsByClassName('toggleFG');
		var toggleBG = document.getElementsByClassName('toggleBG');
		
		for(var i=0;i<userStatus.length;i++){
			if(userStatus[i].innerHTML === 'Y'){
				toggleFG[i].style.left = '0px';
			}else{
				toggleBG[i].style.background = '#ff7746';
				toggleFG[i].style.left = '40px';
			}
		}
	</script>
</body>
</html>