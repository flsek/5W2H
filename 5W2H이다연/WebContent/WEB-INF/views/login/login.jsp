<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
   	<%@ include file="../../../css/login.css" %>
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="../common/header.jsp" %>

	<!-- main -->
	<main class="pt-5">
		<div class="container">
			<div class="col-12" id="loginBox">
				<div id="loginBox_in">
					<form action="<%= request.getContextPath()%>/login.me" method="post">
						<fieldset>
						<div id="Box_Name">
							<span id="loginName">LOGIN</span>
						</div>
						<br> <input type="text" class="inputInfo" id="userId"
							name="userId" placeholder="아이디"><br> 
							<input type="password" class="inputInfo" id="inputPwd" name="userPwd" placeholder="비밀번호"><br>
							<a type="button" role="button"><span class="btn_box1"
								id="findId"
								onclick="location.href='<%=request.getContextPath()%>/findId.om'">아이디 찾기</span></a>
							<!-- <span class="btn_box1" id="findText">&nbsp;|&nbsp;</span> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								type="button" role="button"></a> 
							<a type="button" role="button"><span class="btn_box1"
								id="signUp"
								onclick="location.href='<%=request.getContextPath()%>/signUpForm.om'">회원가입</span></a>
							<input type="submit" class="btn_box2" id="btn_login" value="로그인">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- footer -->
	<%@ include file="../common/footer.jsp" %>
  <script>
  	var btn_login = document.getElementById('btn_login');
  	var inputId = document.getElementById('inputId');
  	var inputPwd = document.getElementById('inputPwd');
  	
  	function logbt(){
  		if(inputId.value == '' || inputId.value.length == 0){
  			alert('아이디를 입력하세요.');
  		} else if(inputPwd.value == '' || inputId.value.length == 0){
  			alert('비밀번호를 입력하세요.');
  		}
  	}
  	function findId(){
  		location.href= '<%= request.getContextPath() %>/findIdForm.me';
  	}
  	
  	function signUp(){
  		location.href= '<%= request.getContextPath() %>/signUpForm.me';
  	}
  	
  </script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>