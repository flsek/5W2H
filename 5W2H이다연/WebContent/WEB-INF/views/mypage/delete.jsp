<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); String pwd = (String)request.getAttribute("pwd");%>
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

<style>
      <%@ include file="../../../css/mypage.css" %>
      <%@ include file="../../../css/base.css" %>
</style>

<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
          <a class="nav-link" href="<%=request.getContextPath() %>/modifyMyInfo.om">회원 정보 수정</a>
          <a class="nav-link" href="<%=request.getContextPath() %>/modifyPwd.om">비밀번호 변경</a>
          <a class="nav-link" style="background-color:rgba(255, 150, 0,0.6);color:white;" href="<%=request.getContextPath() %>/deleteUser.om">회원 탈퇴</a>
       </div>
       <div class="mypage-main-section">
          <div>
             <h2 class="update-title-text">회원 탈퇴</h2>
             <div class="account-update-section">
             <form action="<%=request.getContextPath()%>/deleteUser.me" method="post">
               <fieldset>
                   <p><br><span style="font-family: 'Bell MT'; color: rgb(255, 150, 0);">5W2H</span> 웹사이트에서 회원님의 계정이 삭제됩니다.<br>
                      탈퇴시 개인정보 및 이용 정보가 삭제되며 복구할 수 없습니다.<br>
                      본인의 비밀번호를 입력한 후 하단의 유의사항 동의에 체크하세요.
                   </p>
                  <div>
                     <input type="password" id="pw" name="pw" class="fas fa-lock" placeholder="비밀번호" onclick="validate()">
                     <br><small id="ckPw" style="color:#d14040f2; font-weight: bold; font-size: 12px;"></small><br>
                     <textarea readonly="readonly" rows="5" cols="70" style="width:350px;">
                        시행일자: 2022년 05월
                        
                        제 1 조 목적
                        
                        이 약관은 주식회사 5W2H(이하 "회사")에서 제공하는 서비스에 접속과 사용자에 의해서 업로드 및 다운로드 되어 표시되는 모든 정보, 텍스트, 이미지 및 기타 자료를 이용하는 이용자(이하 "회원")와 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
                        
                        
                        제 2 조 약관의 게시와 효력, 개정
                        
                        이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                        ① 회사는 서비스의 가입 과정에 본 약관을 게시합니다.
                        ② 회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다.
                        ③ 회원은 회사가 전항에 따라 변경하는 약관에 동의하지 않을 권리가 있으며, 이 경우 회원은 회사에서 제공하는 서비스 이용 중단 및 탈퇴 의사를 표시하고 서비스 이용 종료를 요청할 수 있습니다. 다만, 회사가 회원에게 변경된 약관의 내용을 통보하면서 회원에게 "7일 이내 의사 표시를 하지 않을 경우 의사 표시가 표명된 것으로 본다는 뜻"을 명확히 통지하였음에도 불구하고, 거부의 의사 표시를 하지 아니한 경우 회원이 변경된 약관에 동의하는 것으로 봅니다.
                        ④ 회사는 서비스를 중단하거나 회원이 개인정보 제공 동의를 철회한 경우에는 신속하게 회원의 개인 정보를 파기합니다. 단, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법률에서 정하는 바에 따라 일정 정보는 보관할 수 있습니다.
                        ⑤ 회사는 법률에 특별한 규정이 있는 경우를 제외하고는 회원의 별도 동의 없이 회원의 계정 정보를 포함한 일체의 개인 정보를 제3자에게 공개하거나 제공하지 아니합니다.
                           </textarea>
                  </div>
                     
                   <label>
                          <input type="checkbox" name="ck" onClick="checkDisable(this.form)">
                           <span style="color:#d14040f2; font-weight: bold;">유의사항 동의</span>
                       </label>
                     <div style="text-align: center; margin-bottom:-15px;">
                              <a onclick="console.log('이거 있으면 submit 안 됨 거임.');" class="btn btn-sm" id="back_btn"><i class="fa fa-reply"></i>&nbsp;돌아가기</a>
                               <button type="submit" class="btn btn-sm" name="bt" id="detail_btn" disabled="true">&nbsp;탈퇴하기</button>
                           </div>
                  </fieldset>
               </form>
             </div>
          </div>
      </div>
   </div>
</div>
</main>

   <script>
      var pw = document.getElementById('pw');
      function validate(){
         if(pw.value == '' || pw.value.length == 0){
            ckPw.innerText= "필수 입력 항목입니다";
            pw.focus();
            return false; //왜 리턴 값이 있는지 이해가 안 감.
         } else {
            ckPw.innerText = '';
            return true;
            
         }
      }
      
      pw.onblur = validate;
      
      pw.onkeyup = validate;
      
      function checkDisable(form) {
         var pwdCheck = pw.value.trim();
         
         console.log('비밀번호 확인 : ' + pwdCheck);
         console.log('checkStatus : ' + form.ck.checked);
         
         if(pwdCheck !== ''){
            if (form.ck.checked === true) {   
                  form.bt.disabled = false;
              } else {
                  form.bt.disabled = true;
              }
         }else{
            form.bt.disabled = true;
         }
       }
   </script>
   
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
</body>
</html>