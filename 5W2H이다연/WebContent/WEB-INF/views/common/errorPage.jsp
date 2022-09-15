<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<style>
body {
	background: #2E95EF;
	background-image: -moz-radial-gradient(center 45deg, circle cover, #ff7746, #ff7746);
	background-image: -webkit-gradient(radial, 50% 50%, 0, 50% 50%, 800, from(#ff7746),
		to(#efa22e));
	padding-top: 15%;
}

.img-error {
	width: 220px;
	height: 220px;
}
</style>
<meta charset="UTF-8">
<title>에러났다 이누마</title>
</head>
<body>
	<div class="container bootstrap snippets bootdey" align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="pull-right" style="margin-top: 10px;">
					<div class="col-md-10 col-md-offset-1 pull-right">
						<img class="img-error"
							src="https://bootdey.com/img/Content/fdfadfadsfadoh.png">
						<h2><%= msg %>!!!</h2>
						
						<div class="error-actions">
							<button onclick="history.back();" class="btn btn-primary btn-lg">
								<span class="glyphicon glyphicon-arrow-left">이전페이지</span> 
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>