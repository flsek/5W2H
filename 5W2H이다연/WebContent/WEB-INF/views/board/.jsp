<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
	ArrayList<Comment> Comlist = (ArrayList<Comment>)request.getAttribute("Comlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글작성</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v6.0.0/js/all.js"></script>
<style>
   	<%@ include file="../../../css/boardReply.css" %>
</style>
</head>
<body onload="calcIframe()">
	<div class="reply">
		<div class="row line">
			<div class="col-md-10">
				<label class="btn"><i class="fa-regular fa-heart"></i></label>		
				<input type="checkbox" class="btn-check" id="write" autocomplete="off"> 
				<label class="btn anwser" for="write"><i class="fa-regular fa-comment"></i></label>		
				
					
				<div class="visible" style="display: none;">
					<form method="post" id="form" style="overflow: auto;">
						<div class="form-floating" style="margin-top: 10px;">
							<textarea class="form-control" id="floatingTextarea2" style="height: 70px; width: resize: none;" placeholder="댓글 달기..."></textarea>
							<button class="btn btn-warning" style="margin-top: 10px; float: right;">게시</button>
						</div>
					</form>

					<hr>
					
					<div class="reply-reply">
					<% if(Comlist.isEmpty()) { %>
						댓글이 없습니다
					<% } %>
						<div class="row line" style="font-size: 20px;">
							<div class="col-md-2 name">
								작성자 닉네임
								<br>
								작성 날짜
							</div>
							<div class="col-md-10">댓글 내용</div>
						</div>
					</div>
					
					
					<hr>
				</div>
				
				
			</div>
		</div>
	</div>



	<script>
	function calcIframe(){
		var iframeHeight = document.getElementsByTagName('body')[0].scrollHeight;
		console.log(iframeHeight);
		window.parent.postMessage(iframeHeight, '*');/*파일 시스템에서 테스트를 진행하여 *를 넣음. 실제 서버 동작 시 origin의 실 주소를 넣어야 함. 여기서 origin은 아마 웹 페이지를 말하는 것 같음.*/
	}
</script>
	<script>
	var anwser = document.getElementsByClassName('anwser');
	for(var i=0; i < anwser.length; i++){
		anwser[i].onclick = function(){
			var button = document.getElementById('write');
			if(button.checked === true){
				this.nextSibling.nextSibling.style.display = "none";
				calcIframe();
			}else if(button.checked === false){
				this.nextSibling.nextSibling.style.display = "block";
				calcIframe();
			}
		}
	}

</script>
<script>
	document.getElementsByClassName('svg')[0].onclick = function (){
		var color = this.style.color;
		if(color === ''){
			this.style.color = 'red';
		}else{
			this.style.color = ''
		}
	}
</script>
</body>
</html>