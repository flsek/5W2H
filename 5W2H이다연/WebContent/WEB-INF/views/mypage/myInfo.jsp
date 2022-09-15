<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.Users"%>
<% 
	request.setCharacterEncoding("UTF-8");
	Users user = (Users)request.getAttribute("user");
	
	String myNickName = user.getNickname();
	String myEmail = user.getEmail();
	String myAddress = user.getAddress();
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

<title>회원 정보 수정</title>
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
          <a class="nav-link" href="<%=request.getContextPath() %>/myPage.me">내 정보 보기</a>
          <a class="nav-link" style="background-color:rgba(255, 150, 0,0.6);color:white;" href="<%=request.getContextPath() %>/modifyMyInfo.om">회원 정보 수정</a>
          <a class="nav-link" href="<%=request.getContextPath() %>/modifyPwd.om">비밀번호 변경</a>
          <a class="nav-link" href="<%=request.getContextPath() %>/deleteUser.om">회원 탈퇴</a>
       </div>
       <div class="mypage-main-section">
          <div>
             <h2 class="update-title-text">회원정보 수정</h2>
             <div class="account-update-section">
                <div class="id_box">
                   <h5 class="update-user-id">회원님은 현재 "<%= user.getUserId() %>"(으)로 로그인되어있습니다.</h5>
                </div>
                <form action="<%=request.getContextPath() %>/modifyMyInfo.me" method="post">
                  <fieldset>
                     <div>
                        <b><label>닉네임</label></b><input value="<%=myNickName %>" type="text" id="nick" name="nick" onfocusout="validate3();">
                        <br><span id="nickname"></span>
                     </div>
                     <div>
                        <b><label>이메일</label></b><input value="<%=myEmail == null ? "" : myEmail.split("@")[0] %>" type="text" style="width:139px" id="email1" name="email1">@
                        <input value="<%=myEmail == null ? "" : myEmail.split("@")[1] %>" type="text" style="width:139px" id="email2" name="email2">
                     </div>
                     <div>
                        <b><label>주소</label></b><input value="<%=myAddress == null ? "" : myAddress%>" type="text" id="address" name="address">
                     </div>
                     <div class="right">
                        <a onclick="submit()" class="btn btn-sm" id="modify_btn">수정하기</a>
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
  	function submit(){
  		console.log("fssfds");
  		
  		var form = document.forms[0];
  		
  		if(form.nick.value.trim() === '') {
  			alert("빈 칸을 채워주세요!");
  			//이메일 중 하나만 비워져있으면 못 넘어감. 둘 다 비워져 있으면 넘어감. 나중에 할 것.
  		}else{
  			document.forms[0].submit();
  		}

  	}
  </script>
</body>
</html>