<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	System.out.println("boardList : " + boardList); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>게시판 관리</title>
<style>
      <%@ include file="../../../css/admin.css" %>
</style>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <li><a href="<%=request.getContextPath() %>/board.page" style="background: #ffe9e1;">
          <i class="fas fa-database" style="color: #ff7746;"></i>
          <span class="nav-item">게시판 관리</span>
        </a></li>
        <li><a href="<%=request.getContextPath() %>/notice.page">
          <i class="fas fa-exclamation-circle"></i>
          <span class="nav-item">공지사항 관리</span>
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
        <h1>게시판 관리</h1>
      </div>

      <section class="attendance">
        <div class="attendance-list">
          <h1>게시판 List</h1>
          <table class="table">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>상태</th>
                <th>상세보기</th>
                <th>댓글</th>
                <th>삭제</th>
              </tr>
            </thead>
            <tbody>
            	<%for(int i=0;i<boardList.size();i++){ %>
              		<tr>
                		<td class="boardIds"><%=boardList.get(i).getBoardId() %></td>
                		<td><%=boardList.get(i).getBoardTitle() == null ? "-" : boardList.get(i).getBoardTitle()%></td>
                		<td><%=boardList.get(i).getBoardWriter() == null ? "-" : boardList.get(i).getBoardWriter()%></td>
                		<td><%=boardList.get(i).getCreateDate() == null ? "-" : boardList.get(i).getCreateDate()%></td>
                		<td class="boardStatus"><%=boardList.get(i).getStatus()%></td>
                		<td><button class="btn" onclick="location.href='<%=request.getContextPath()%>/detail.bo?bId=<%=boardList.get(i).getBoardId()%>'">View</button></td> <!-- 나중에 게시판 디테일 서블릿과 연결 -->
                		<td><button class="btn commentBtn" onclick="getComments(this);">View</button></td>
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
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/board.page?currentPage=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/board.page?currentPage=<%=pi.getCurrentPage()-1 %>'" id="beforeBtn">&lt;</button>
         <script>
         	if(<%=pi.getCurrentPage()%> <= 1){
         		document.getElementById('beforeBtn').setAttribute("disabled", true);
         	} 
         </script>
         <!-- 숫자 페이지로 -->
         <%for(int p=pi.getStartPage();p<=pi.getEndPage();p++){ %>
         	<%if(p == pi.getCurrentPage()){%>
         		<Button class="pageButton" disabled><%=p %></Button>
         	<%}else{ %>
         		<button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/board.page?currentPage=<%=p%>'"><%=p%></button>
         	<%} %>
         <%} %>
         <!-- 다음 페이지로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/board.page?currentPage=<%=pi.getCurrentPage()+1%>'" id="afterBtn">&gt;</button>
         <script>
            if(<%=pi.getCurrentPage()%> >= <%=pi.getMaxPage()%>){
            	document.getElementById('afterBtn').setAttribute("disabled", true);
            }
         </script>
         
         <!-- 맨 마지막으로 -->
         <button class="pageButton" onclick="location.href='<%=request.getContextPath()%>/board.page?currentPage=<%=pi.getMaxPage()%>'">&gt;&gt;</button>
      </div>   
   </div>
    </section>
  </div>
  		<div>
  			<div class="modal">
  				<i class="fas fa-times" onclick="closeModal()"></i>
  				<div class="modal-content">
   				<table class="table">
            		<thead>
              			<tr>
                			<th nowrap>댓글 번호</th>
                			<th nowrap>내용</th>
                			<th nowrap>글 번호</th>
                			<th nowrap>작성자</th>
                			<th nowrap>만든 날짜</th>
                			<th nowrap>수정 날짜</th>
                			<th nowrap>상태</th>
                			<th nowrap>삭제</th>
              			</tr>
            		</thead>
            	</table>
            	</div>
   			</div>
   		</div>
  <script>
  	var table = document.getElementsByClassName('table')[1];
    var modal = document.getElementsByClassName('modal')[0];
  
  	function getComments(btn){
  		
  		var boardIds = document.getElementsByClassName('boardIds');
		var btns = document.getElementsByClassName('commentBtn');
		var boardIdNum = 0;
		
		modal.parentNode.classList.toggle('modal__background'); //모달 배경 어둡게
		modal.style.display = 'block';
		
  		for(var i=0;i<btns.length;i++){
  			if(btn === btns[i]){
  				boardIdNum = i;
  				break;
  			}
  		}
  		
		$.ajax({
  			url:'selectComments.ad',
  			type:'post',
  			data:{boardId: boardIds[boardIdNum].innerHTML},
  			async: false, //동기식으로 처리하기 위함.
  			success: function(data){
  				var notFirst = document.getElementsByClassName('notFirst');
  				var length = notFirst.length;
  				
  				for(var i=0;i<length;i++){	//notFirst를 class 속성으로 갖는 요소들을 다 지워준다.
					table.removeChild(notFirst[0]);
				}
	  				
	  			console.log(data);
	  				
	  			if(data.length !== 0){
	  				for(var i=0;i<data.length;i++){
	  					var tr = document.createElement('tr');
	  					
	  					tr.classList.add('notFirst');
	  					
	  					for(var j in data[i]){
	  						var td = document.createElement('td');
	  						
	  						if(j === 'commentId'){
	  							td.classList.add('replyIds');
	  						}else if(j === 'status'){
	  							td.classList.add('replyStatus');
	  						}
	  						
	  						td.innerHTML = data[i][j];
	  						tr.append(td);
	  					}
	  					
	  					var toggle = document.createElement('td');
	  					toggle.innerHTML = '<div class="toggleBG replyToggle" onclick="toggle(event)"><button class="toggleFG btnCircle"></button></div>';
	  					//이건 하드코딩 밖에 답이 없었다...
	  					tr.append(toggle);
	  					table.append(tr);
	 				
	  				}
	  			}else{
	  				var tr = document.createElement('tr');
	  				var td = document.createElement('td');
	  				
	  				tr.classList.add('notFirst');
	  				
	  				td.colSpan = 8;
	  				td.innerHTML = "댓글이 없습니다.";
	  				
	  				tr.append(td);
	  				table.append(tr);
	  			}
  			},
  			error:function(data){
  				console.log(data);
  			}
  		});
		
			var replyStatus = document.getElementsByClassName('replyStatus');
	  		var replyToggle = document.getElementsByClassName('replyToggle');
	  		var btnCircle = document.getElementsByClassName('btnCircle');
	 
			if(replyStatus !== null && btnCircle !== null && replyToggle !== null){
	  			for(var i=0;i<replyStatus.length;i++){
	  				if(replyStatus[i].innerHTML === 'Y'){
	  					btnCircle[i].style.left = '0px';
	  					console.log("0px");
	  				}else{
	  					replyToggle[i].style.background = '#ff7746';
	  					btnCircle[i].style.left = '40px';
	  				}
	  			}
			}
			
  	}
  	
  	
	function closeModal(){
		modal.parentNode.classList.toggle('modal__background');
  		modal.style.display = "none";
  	}
  </script>
  <script>
  		function deleteBoard(toggleBtn){ //선택된 id를 ajax로 전송하여, 백에서 삭제.
			var boardIds = document.getElementsByClassName('boardIds');
			var boardStatus = document.getElementsByClassName('boardStatus');
			var boardIdNum = getIdNum(toggleBtn);
			
			$.ajax({
 				url:'deleteBoard.ad',
 				type: 'post',
 				data:{boardId: boardIds[boardIdNum].innerHTML},
				success: function(data){
					boardStatus[boardIdNum].innerHTML = 'N';
				},
				error:function(data){
					console.log("에러났습니다. : " + data);
				}
 			});
		}
		
		function saveBoard(toggleBtn){
			var boardIds = document.getElementsByClassName('boardIds');
			var boardStatus = document.getElementsByClassName('boardStatus');
			var boardIdNum = getIdNum(toggleBtn);
			
			$.ajax({
				url:'saveBoard.ad',
				type:'post',
				data:{boardId:boardIds[boardIdNum].innerHTML},
				success: function(data){
					boardStatus[boardIdNum].innerHTML = 'Y';
				},
				error: function(data){
					console.log(data);
				}
			});
		}

		function getIdNum(toggleBtn){
			var toggleBG = document.getElementsByClassName('toggleBG');
			
			for(var i=0;i<toggleBG.length;i++){
				if(toggleBtn == toggleBG[i]){
					return i;
				}
			} 
		}
  </script>
  <script>
  	/* -------댓글 관련 ajax-------- */
  	function deleteReply(toggleBtn){
  		var replyStatus = document.getElementsByClassName('replyStatus');
  		var replyIds = document.getElementsByClassName('replyIds');
  		var replyIdNode = toggleBtn.parentNode.parentNode.firstChild;
  		var replyIdNum = 0;
  		
  		for(var i=0;i<replyIds.length;i++){
  			if(replyIdNode === replyIds[i]){
  				replyIdNum = i;
  				break;
  			}
  		}
		
		$.ajax({
			url:'deleteReply.ad',
			type:'post',
			data:{replyId:replyIds[replyIdNum].innerHTML},
			success: function(data){
				console.log("data : " + data);
				replyStatus[replyIdNum].innerHTML = 'N';
			},
			error: function(data){
				console.log(data);
			}
		});
  	}
  	
  	function saveReply(toggleBtn){
  		var replyStatus = document.getElementsByClassName('replyStatus');
  		var replyIds = document.getElementsByClassName('replyIds');
  		var replyIdNode = toggleBtn.parentNode.parentNode.firstChild;
  		var replyIdNum = 0;
  		
  		for(var i=0;i<replyIds.length;i++){
  			if(replyIdNode === replyIds[i]){
  				replyIdNum = i;
  				break;
  			}
  		}
		
		$.ajax({
			url:'saveReply.ad',
			type:'post',
			data:{replyId:replyIds[replyIdNum].innerHTML},
			success: function(data){
				replyStatus[replyIdNum].innerHTML = 'Y';
			},
			error: function(data){
				console.log(data);
			}
		});
  	}
  </script>
  <script>
		function toggle(event){
			var toggleBG = event.currentTarget;
			var toggleFG = toggleBG.firstChild;
			
			console.log('버튼의 left : ' + toggleFG.style.left);
			
			if(toggleFG.style.left === ''){
				toggleFG.style.left = '0px';
			}
			
			if(toggleFG.style.left === '40px'){
				toggleBG.style.background = '#CCCCCC';
				toggleActionStart(toggleFG, 'TO_LEFT');
			}else if(toggleFG.style.left === '0px'){
				toggleBG.style.background = '#ff7746';
				toggleActionStart(toggleFG, 'TO_RIGHT');
			}
			
			setTimeout(function(){
				if(toggleBG.classList.contains('replyToggle')){ //댓글 모달창에서 클릭한 것인지 확인
					if(getToggleState(toggleFG)){
						console.log("켜졌습니다.");
						deleteReply(toggleBG);
					}else{
						console.log("꺼졌습니다.");
						saveReply(toggleBG);
					}	
				}else{
					if(getToggleState(toggleFG)){
						console.log("켜졌습니다.");
						deleteBoard(toggleBG);
					}else{
						console.log("꺼졌습니다.");
						saveBoard(toggleBG);
					}	
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
		var boardStatus = document.getElementsByClassName('boardStatus');
		var toggleFG = document.getElementsByClassName('toggleFG');
		var toggleBG = document.getElementsByClassName('toggleBG');
		
		for(var i=0;i<boardStatus.length;i++){
			if(boardStatus[i].innerHTML === 'Y'){
				toggleFG[i].style.left = '0px';
			}else{
				toggleBG[i].style.background = '#ff7746';
				toggleFG[i].style.left = '40px';
			}
		}
	</script>
</body>
</html>