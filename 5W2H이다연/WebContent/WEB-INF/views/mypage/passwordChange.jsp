<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String userId = (String)request.getAttribute("userId");
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
   	<%@ include file="../../../css/base.css" %>
</style>

<meta charset="UTF-8">
<title>비밀번호 변경</title>
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
			 <a class="nav-link" href="myPage.me">내 정보 보기</a>
			 <a class="nav-link" href="modifyMyInfo.om">회원 정보 수정</a>
			 <a class="nav-link" style="background-color:rgba(255, 150, 0,0.6);color:white;" href="">비밀번호 변경</a>
			 <a class="nav-link" href="deleteUser.om">회원 탈퇴</a>
		 </div>
 		<div class="mypage-main-section">
 			<div>
 				<h2 class="update-title-text">비밀번호 변경</h2>
 				<div class="account-update-section">
 					<div class="id_box">
 						<h5 class="update-user-id">회원님은 현재 "<%=userId %>"(으)로 로그인되어있습니다.</h5>
 					</div>
 					<form action="<%=request.getContextPath()%>/modifyPwd.me" method="post">
						<fieldset>
						<div class="row mb-2">
  							<label for="newPwd" class="col-sm-3 col-form-label col-form-label-sm">새로운 비밀번호</label>
  							<div class="col-sm-9">
    							<input type="password" class="form-control form-control-sm" id="newPwd" name="newPwd">
    							<span id="warningPwd" class="mt-1 float-start fw-light" style="font-size: 0.5rem;"></span>
  							</div>
						</div>

						<div class="row mb-2">
  							<label for="newPwdCheck" class="col-sm-3 col-form-label col-form-label-sm">비밀번호 확인</label>
  							<div class="col-sm-9">
    							<input type="password" class="form-control form-control-sm" id="newPwdCheck">
    							<span id="warningCheckPwd" class="mt-1 float-start fw-light" style="font-size: 0.5rem;"></span>
  							</div>
						</div>
							
						<div class="right">
							<a onclick="submit()" class="btn btn-sm" id="change_btn">변경하기</a>
							<a onclick="history.go(-1)" class="btn btn-sm" id="back_btn">돌아가기</a>					
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
  <footer class="container py-5 footer">
    <hr>
    <div class="row pt-4">
      <div class="col-12 col-md">
        	<p style="font-family: 'Bell MT'; color: rgb(255, 150, 0);">5W2H</p>
        <small class="d-block mb-3 text-muted">&copy; 2022-05</small>
      </div>
      <div class="col-6 col-md fs15">
        <h5>Features</h5>
        <ul class="list-unstyled">
          <li><a class="link-secondary text-decoration-none" href="#">Cool stuff</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Random feature</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Team feature</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Stuff for developers</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Another one</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Last time</a></li>
        </ul>
      </div>
      <div class="col-6 col-md fs15">
        <h5>Resources</h5>
        <ul class="list-unstyled">
          <li><a class="link-secondary text-decoration-none" href="#">Resource name</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Resource</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Another resource</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Final resource</a></li>
        </ul>
      </div>
      <div class="col-6 col-md fs15">
        <h5>Resources</h5>
        <ul class="list-unstyled">
          <li><a class="link-secondary text-decoration-none" href="#">Business</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Education</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Government</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Gaming</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5>About</h5>
        <ul class="list-unstyled">
          <li><a class="link-secondary text-decoration-none" href="#">Team</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Locations</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Privacy</a></li>
          <li><a class="link-secondary text-decoration-none" href="#">Terms</a></li>
        </ul>
      </div>
    </div>
  </footer>
  <script>

  	var newPwd = document.getElementById('newPwd');
  	var checkNewPwd = document.getElementById('newPwdCheck');
  	var warningPwd = document.getElementById('warningPwd');
  	var warningCheckPwd = document.getElementById('warningCheckPwd');
  	var pwdRegExp = /^[a-zA-Z0-9~!@#*]{8,16}$/;

  	newPwd.onblur = function WriteNewPwd(){
  		if(newPwd.value.trim() === ''){
  			newPwd.focus();
  			warningPwd.innerHTML = '새로운 비밀번호를 입력하세요.';
  		}else{
  			warningPwd.innerHTML = '';

  			if(newPwd.value.trim() === checkNewPwd.value.trim()){
  				warningCheckPwd.innerHTML = ''
  			}else{
  				warningCheckPwd.innerHTML = '새로운 비밀번호와 다릅니다.'
  			}
  		}
  	}

  	checkNewPwd.onfocus = function(){
  		warningCheckPwd.innerHTML = '';

  		if(newPwd.value.trim() === ''){
  			this.blur();
  			newPwd.focus();
  			warningPwd.innerHTML = '새로운 비밀번호를 입력하세요.';
  		}
  	}

  	checkNewPwd.onblur = function(){
  		if(checkNewPwd.value.trim() === ''){
  			warningCheckPwd.innerHTML = '새로운 비밀번호를 입력하세요.';
  		}else{
  			if(!pwdRegExp.test(checkNewPwd.value)){
  				warningCheckPwd.innerHTML = '영문, 숫자, 특수문자(~ ! @ # * 만 사용가능)를 포함한 8~16자';
  			}else{
				if(newPwd.value !== checkNewPwd.value){
  					warningCheckPwd.innerHTML = '새로운 비밀번호와 다릅니다.';
  				}else{
  					warningCheckPwd.innerHTML = '';
  				}
  			}
  		}
  	}
  </script>
  <script>
  	function submit(){
  		if(newPwd.value.trim() !== newPwdCheck.value.trim()){
  			alert("비밀번호가 다릅니다. 다시 입력해주세요.");
  			newPwd.value = ''
  			newPwd.focus();
  		}else if(newPwd.value.trim() === '' || newPwdCheck.value.trim() === ''){
  			alert("비밀번호를 입력해주세요.")
  		}else if(!pwdRegExp.test(checkNewPwd.value)){
  			alert("영문, 숫자, 특수문자(~ ! @ # * 만 사용가능)를 포함한 8~16자에 맞게 입력해주세요.");
  		}
  		else{
  			document.forms[0].submit();	
  		}
  	}
  </script>
</body>
</html>