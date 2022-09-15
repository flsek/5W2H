<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	  				<div id="findBox_Guide1">회원정보에 등록한 휴대전화로 인증</div>
	  				<div id="findBox_Guide2">회원정보에 등록한 아이디와 휴대전화 번호가 같아야, 비밀번호를 찾을 수 있습니다.</div><br>
	  				<div id="findBox_info">
	  				<form name="findPwd" method = "POST" action="<%=request.getContextPath()%>/findPwd.me">
	  					<fieldset>
	  						<div class="info_box1">
	  							<p><label class="box1_text">아이디</label></p>
	  							<label class="box1_text">휴대전화</label>
	  						</div>
	  						<div class="info_box2">
				  				<input type="text" class="inputInfo" id="in_Id" placeholder="&nbsp;아이디" required name="userId"><br>
								<input type="text" class="inputInfo" id="in_Phone" name="phone" maxlength="13" placeholder="&nbsp;-없이 입력하세요" required onkeyup = "addH(this);"><br>			  				
							</div>
			  					<input type="submit" class="btn_box" id="btn_cf" value="확인">
			  					<input type="button" class="btn_box" id="btn_cn" value="취소" onclick="location.href='<%= request.getContextPath() %>'"><br>
		  				</fieldset>
	  				</form>
	  				</div>
	  			</div>
	  		</div>
	    </div>
	</main>
	<script>
	function addH(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";
		
	  if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
 </script> 
 	<!-- footer -->
	<%@ include file="../common/footer.jsp" %>
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
</body>
</html>