<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.Users"%>

<%
	request.setCharacterEncoding("UTF-8");

	Users user = (Users)request.getAttribute("user");
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
<meta charset="UTF-8">
<style>
   	 <%@ include file="../../../css/mypage.css" %>
</style>
<meta charset="UTF-8">
<title>내 정보 보기</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../common/header.jsp" %>

<!-- 본문 내용 -->
<main class="pt-5">
<div class="container">
    <div class="col-12">
      <h1 class="h2" style="color: rgb(255,127,80);">MyPage</h1>
    </div>
    <div class="col-12 d-flex justify-content-between">
      <div>개인 정보 관리</div>
    </div>
    <hr>
	 <div class="mypage-section">
		 <div class="mypage-list-section">
			 <a class="nav-link" style="background-color:rgba(255, 150, 0,0.6);color:white;" href="<%=request.getContextPath() %>/myPage.me">내 정보 보기</a>
			 <a onclick="submit()" class="nav-link">회원 정보 수정</a>
			 <a class="nav-link" href="<%=request.getContextPath() %>/modifyPwd.om">비밀번호 변경</a>
			 <a class="nav-link" href="<%=request.getContextPath() %>/deleteUser.om">회원 탈퇴</a>
		 </div>
 		<div class="mypage-main-section">
 			<div>
 				<h2 class="update-title-text">내 정보 보기</h2>
 				<div class="account-update-section left">
 					<form method="post" action="<%=request.getContextPath() %>/modifyMyInfo.om">
						<fieldset>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">아이디</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getUserId() %>
									</div>
									<input type="hidden" id="myId" name="myId" value="<%=user.getUserId() %>"><br>
								</div>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">이름</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getUserName() %>
									</div>
									<input type="hidden" id="myName" name="myName" value="<%=user.getUserName()%>"><br>
								</div>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">닉네임</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getNickname()%>
									</div>
									<input type="hidden" id="myNickName" name="myNickName" value="<%=user.getNickname()%>"><br>
								</div>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">연락처</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getPhone() == null ? "-" : user.getPhone() %>
									</div>
									<input type="hidden" id="myPhone" name="myPhone" value="<%=user.getPhone() == null ? "-" : user.getPhone() %>"><br>
								</div>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">이메일</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getEmail() == null ? "-" : user.getEmail() %>
									</div>
									<input type="hidden" style="width:139px" id="myEmail" name="myEmail" value="<%=user.getEmail() == null ? "-" : user.getEmail() %>"><br>
								</div>
								<div class="row">
									<div class="col-md-6">
										<b><label class="text-center">주소</label></b>
									</div>
									<div class="col-md-6">
										<%=user.getAddress() == null ? "-" : user.getAddress() %>
									</div>
									<input type="hidden" id="MyAddress" name="myAddress" value="<%=user.getAddress() == null ? "-" : user.getAddress() %>">
								</div>
						</fieldset>
					</form>
 				</div>
 			</div>
		</div>
  	</div>
  </div>
</main>

<!-- footer -->
  <footer>
    <div class="footer">
        <div>5W2H</div>
        <div>
          CEO. 박신우 <br>
          Addr. 서울특별시 강남구 강남구 테헤란로14길 6 <br>
          02-1544-9970<br>
          COPYRIGHT 2022. 5W2H. ALL RIGHT RESERVED.
        </div>
      </div>
  </footer>
  <script>
  	//a 태그를 누르면 submit 실행
  	function submit(){
  		document.getElementsByTagName('form')[0].submit();
  	}
  </script>
</body>
</html>