<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
   	<%@ include file="../../../css/notice.css" %>
</style>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../common/header.jsp" %>
		
	<!-- 본문 내용 -->
	<main class="pt-5">
		<div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>공지사항</strong>
					<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<form action="<%= request.getContextPath() %>/update.a" method="post">
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<input type="text" placeholder="제목 입력" name="title" value='<%= request.getAttribute("title")%>'>
										<!-- 미리 hidden으로 no 넘겨주기 -->
										<input type="hidden" name="no" value='<%= request.getAttribute("no")%>'> 
									</dd>
								</dl>
							</div>
							<div class="info">
								<dl>
									<dt>글쓴이</dt>
									<dd>
										<%= loginUser.getUserId() %>
									</dd>
								</dl>
							</div>
							<div class="cont">
								<textarea name="content"><%= request.getAttribute("content") %></textarea>
							</div>
						</div>
						<div class="bt_wrap">
							<input type="submit" value="저장" class="on">
							<input type="button" onclick="location.href='javascript:history.go(-1);'" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>

	<!-- footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>