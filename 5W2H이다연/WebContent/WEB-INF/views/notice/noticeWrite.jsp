<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
   	<%@ include file="../../../css/notice.css" %>
</style>
<meta charset="UTF-8">
<title>공지사항 등록 폼</title>
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
				<form action="<%= request.getContextPath()%>/insert.a" method="post">
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<input type="text" placeholder="제목 입력" name="title">
									</dd>
								</dl>
							</div>
							<div class="info">
								<dl>
									<dt>작성자</dt>
									<dd>
										<%= loginUser.getUserId() %>
									</dd>
								</dl>
								
							</div>
							<div class="cont">
								<textarea placeholder="내용 입력" name="content" style="resize:none;"></textarea>
							</div>
						</div>
						<div class="bt_wrap">
							<input type="submit" value="등록" class="on">
							<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
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