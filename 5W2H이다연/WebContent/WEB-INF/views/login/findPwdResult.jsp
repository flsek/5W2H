<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.*, users.model.dao.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String findPwd = (String)request.getAttribute("findPwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
   	<%@ include file="../../../css/findPWD.css" %>
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inconsolata&family=Permanent+Marker&display=swap" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../common/header.jsp" %>
	<!-- main -->
	<main class="pt-5">
		<div class="container">
	  		<div class="row-12" id="h_N">
	  			<a type="button" role="button" onclick="location.href='<%= request.getContextPath() %>/findId.om'"><span id="findId"><span id="findId">아이디</span></a>
	  			<span id="findText" >&nbsp;|&nbsp;</span>
	  			<a type="button" role="button" onclick="location.href='<%= request.getContextPath() %>/findPWD.om'"><span id="findPwd">비밀번호 찾기</span></a>
	  		</div>
	  		<div class="row-12" id="h_N"><hr></div>
	  		<div class="col-12" id="findPwdText_box"><span id="findPwdText">비밀번호 찾기</span></div>
	  		<div class="col-12" id="findBox">
	  			<div id="findBox_in">
	  				<div id="findBox_Guide1">회원님의 비밀번호를 찾았습니다!</div>
	  				<div id="findBox_info">
	  				<form name="findPwd" method = "POST" action="<%=request.getContextPath()%>/findPwd.me">
	  					<fieldset>
	  						회원님의 비밀번호는 <h1>"<%= findPwd %>"</h1> 입니다.
		  				</fieldset>
	  				</form>
	  				</div>
	  			</div>
	  		</div>
	    </div>
	</main>
 	<!-- footer -->
	<%@ include file="../common/footer.jsp" %>
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
</body>
</html>