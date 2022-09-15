<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.Users"%>

<% 
   request.setCharacterEncoding("UTF-8"); 
   Users loginUser = (Users)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>
   <style>
          <%@ include file="../../../css/main.css" %>
   </style>
   
   <title>메인 화면</title>
</head>
<body>
<header>
    <div class="wrap">
      <div class="intro_bg">
        <div class="header">
            <% if(loginUser != null){ %>
              <div class="dropdown">
                <i class="fas fa-grip-lines dropbtn"></i>
                  <div class="dropdown-content">
                 <a href="<%=request.getContextPath() %>/boardWrite.om">글쓰기</a>
               </div>
          </div>
          <%} %>
          
          <div class="searchArea">
            <form>
              <input type="search">
              <input class="span">
            </form>
            
              <h1 class="title1">5W2H</h1>
          </div>
          
          <ul class="nav">
          <% if(loginUser == null){ %>
            <li><a href="<%=request.getContextPath() %>/signUpForm.om" class="lo">회원가입</a></li>
            <li><a href="<%=request.getContextPath() %>/loginForm.om" class="lo">로그인</a></li>
          <%} else{ %>
            <li><a href="<%=request.getContextPath() %>/logout.me" class="lo">로그아웃</a></li>
            <li><a href="<%=request.getContextPath() %>/myPage.me" class="lo">마이페이지</a></li>
            <% if(loginUser.getAdminCk()==1) {%>
            <li><a href="<%=request.getContextPath() %>/admins.page" class="lo">관리자</a></li>
            <% } %>
            <% } %>
            <li><a href="<%=request.getContextPath() %>/a_list.om" class="lo">공지사항</a></li>
          
       
          </ul>
        </div>
        <div class="intro_text" style="background-color: rgba(0,0,0,0.4)">
          <h1 class="title_contents">솔직한 리뷰, 믿을 수 있는 평점!</h1>
        </div>
      </div>
      </div>
</header>

	<!-- 본문 내용 -->
	<main>
		<ul class="amount">

			<li>
				<div>
					<div class="contents1">Our Best Pick</div>
					<div class="result"></div>
				</div>
			</li>
		</ul>

		<div class="main_text0">
			<h1></h1>
			<div class="center_line1">
				<div class="area_name_R">
					<a href="<%=request.getContextPath()%>/list.bo"> <span
						class="btn_box1">맛집 리스트 더보기</span>
					</a>
				</div>


				<ul class="icons">
					<li class="area_photo_L">
						<div class="Pimg row">
							<img src="images/in.jpg">
						</div>
					</li>
					<li class="area_photo_L">
						<div class="Pimg">
							<img src="images/k.png">
						</div>
					</li>
					<li class="area_photo_L">
						<div class="Pimg">
							<img src="images/d.jpg">
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="main_text1">
			<h1>SERVICE</h1>
			<div class="contents1">정확한 리뷰를 미식가들에게 제공합니다.</div>
			<div class="service">
				<div class="food_photo">
					<img src="images/crab.jpg">
				</div>
				<div class="contents2">
					<h2>어디서 본거 아니야?</h2>
					여기에 나온 정보가 어디서 본 것 같은 분들이 계실거예요. <br> 왜냐하면 여기 정보는 망고플레이트에서
					맛집이라고 검색해서 나온 이미지인데, <br> 평점 높은 애들을 저희 팀원들이 가져온거니까요.(땡큐) <br>
					<br> 사진 게시판에 넣을 사진들 보니까 배고프네요. <br> KH 과정이 끝나면 혼자 여행갈건데,
					도움이 많이 될 것 같아요. <br> 사실 여기 부분은 사진 게시판 list를 받아오려고 했는데, <br>
					계속 java.lang.NullPointerException이 떠서, 이렇게 아무말 대잔치하고 있습니다. <br>
					<br> 얼마 전까지 다 완성할 수 있다는 믿음이 컸는데, <br> 곧 발표여서... 일단 제가 알아서
					꾸미고 있답니다~_~ <br> 이런 사태가 또 발생하지 않도록, 파이널 프로젝트 전까지 열심히 복습해야겠어요!<br>
				</div>
			</div>
		</div>
		<div class="main_text2">
			<ul>
				<li>
					<div>
						<h1>CONTACT</h1>
					</div>
					<div>우리에게 더 맛있는 맛집을 알려주세요</div>
				</li>
				<li></li>
			</ul>
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
		</div>
	</main>


	<!-- footer -->
   <%@ include file="../common/footer.jsp" %>
</body>
</html>