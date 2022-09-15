<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 검사</title>
</head>
<body onload="inputValue();">
	<b>닉네임 중복 검사</b>
	<br>
	<form action="<%= request.getContextPath() %>/CheckNick.me"
		id="nickCheckForm">
		<input type="text" id="inputNick" name="inputNick"> <input
			type="submit" value="중복확인" />
	</form>

	<br>

	<%
		Integer result = (Integer)request.getAttribute("result");
		/* 처음 들어 왔을 때는 실행이 안됐을 때 이니까 아무것도 안나옴*/
		if(result != null){
			if(result == 0){
	%>
	사용 가능한 닉네임입니다.
	<% 
			} else {
	%>
	이미 사용 중인 닉네임입니다.
	<% 
			}
		}
	
	%>

	<br>
	<br>

	<input type="button" id="usedNick" value="확인">
	<input type="button" id="cancel" value="취소" onclick="window.close();">

	<script>
		function inputValue(){
			if('<%= request.getAttribute("checkedNick") %>' == 'null'){
				document.getElementById('inputNick').value = opener.document.joinForm.input_Nick.value;
			}else{
				document.getElementById("inputNick").value = '<%= request.getAttribute("checkedNick") %>';
			}	
		}
		
		document.getElementById('usedNick').onclick=function(){
			opener.document.joinForm.input_Nick.value = document.getElementById('inputNick').value;
			self.close();
		}
	</script>
</body>
</html>