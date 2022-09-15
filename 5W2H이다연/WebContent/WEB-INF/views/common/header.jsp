<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.model.vo.Users"%>
    
<% 
	request.setCharacterEncoding("UTF-8"); 
	Users loginUser = (Users)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더이니라</title>
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
<style>
   	<%@ include file="../../../css/base.css" %>
</style>
</head>
<body>
	<!-- header -->
	<header  style="background-color: black;">
		<nav class="navbar navbar-expand-md navbar-light bg-#1f1f1f border-bottom">
			<div class="container-fluid px-md-4" style="width: 2000px">
				<div class="d-flex w-100 navbar-collapse">
					<div>
						<a href="<%=request.getContextPath()%>/"
							style="text-decoration: none;" class="logo"> <span
							class="psize">5W2H</span>
						</a>
					</div>
					<div class="login"
						style="font-family: 'GowunDodum-Regular'; text-align: right;">
						<%
							if (loginUser == null) {
						%>
						<a type="button" role="button"
							href="<%=request.getContextPath()%>/loginForm.om" class="lo"
							style="text-decoration: none;"> <span class="fs15 fw500">로그인</span></a>
						<a type="button" role="button"
							href="<%=request.getContextPath()%>/signUpForm.om" class="lo"
							style="text-decoration: none;"> <span class="fs15 fw500">회원가입</span></a>
						<%
							} else {
						%>
						<a type="button" role="button"
							href="<%=request.getContextPath()%>/logout.me" class="lo"
							style="text-decoration: none;"> <span class="fs15 fw500">로그아웃</span></a>
						<a type="button" role="button"
							href="<%=request.getContextPath()%>/myPage.me" class="lo"
							style="text-decoration: none;"> <span class="fs15 fw500">마이페이지</span></a>
							<% if(loginUser.getAdminCk() == 1){ %>
							<a type="button" role="button"
								href="<%=request.getContextPath()%>/admins.page" class="lo"
								style="text-decoration: none;"> <span class="fs15 fw500">관리자</span></a>
							<% } %>
						<% } %>

						<a type="button" role="button"
							href="<%=request.getContextPath()%>/a_list.om" class="lo"
							style="text-decoration: none;"> <span class="fs15 fw500">공지사항</span></a>
					</div>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>