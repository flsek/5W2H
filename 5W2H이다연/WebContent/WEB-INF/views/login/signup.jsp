<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
      <%@ include file="../../../css/signup.css" %>
</style>
</head>
<body>
   <!-- header -->
   <%@ include file="../common/header.jsp" %>
   <main class="pt-5">
      <div class="container">
           <div class="col-12" id="loginBox">
              <div id="loginBox_in">
                 <!-- 로그인 상단 -->
                 <div id="Box"><span id="signUpName">SIGN UP</span></div><br>
                 <div id="Box_input">
                    <form method="post" action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm">
                       <fieldset>
                          <div>
                             <span class="Box_Name1">(*) 필수입력</span><br>
                          </div>
                 <!-- 아이디 -->
                          <div id="B_Id">
                             <span class="Box_Name">아이디(*)</span><br>
                             <input type="text" class="input_Box" id="input_Id" name="input_Id" placeholder="&nbsp;6~16자 영문, 숫자" autocomplete="off" onFocus="Idck();" onBlur="Idck();" onkeyup="Idck();" required>
                             <input type="button" class="btn_box2" id="idCheck" value="중복확인" onclick="ckId();">
                             <span class="warning1" id="ckId"></span>
                          </div>
                 <!-- 닉네임 -->
                          <div id="B_Nick">
                             <span class="Box_Name">닉네임(*)</span><br>
                             <input type="text" class="input_Box" id="input_Nick" autocomplete="off" onFocus="Nickck();" onBlur="Nickck();" onkeyup="Nickck();" name="nickname" required>
                             <input type="button" class="btn_box2" id="nickCheck" value="중복확인" onclick="ckNick();">
                             <span class="warning1" id="ckNick"></span>
                          </div>
                 <!-- 비밀번호 -->
                          <div id="B_Pwd">
                             <span class="Box_Name">비밀번호(*)</span><br>
                             <div id="B_Pwd1">
                                <input type="password" class="input_Box" id="input_Pwd" autocomplete="off" placeholder="&nbsp;영문, 숫자, 특수문자 8~16자" onFocus="Pwdck();" onBlur="Pwdck();" onkeyup="Pwdck();" name="userPwd" required>
                                 <span class="warning" id="ckPwd"></span>
                             </div>
                             <div id="B_Pwd2">
                                <input type="password" class="input_Box" id="input_r_Pwd" autocomplete="off" placeholder="&nbsp;비밀번호 재확인" onFocus="rPwdck1();" onBlur="rPwdck2();" onkeyup="rPwdck1();" required>
                                <span class="warning" id="ckrPwd"></span>
                             </div>
                          </div>
                 <!-- 이름 -->            
                          <div id="B_Name">
                             <span class="Box_Name">이름(*)</span><br>
                             <input type="text" class="input_Box" id="input_Name" autocomplete="off" onFocus="Nameck();" onBlur="Nameck();" onkeyup="Nameck();" name="userName" required>
                             <span class="warning" id="ckName"></span>
                          </div>
                      
               <!-- 이메일 -->
                          <div id="B_Email">
                             <span class="Box_Name">전화번호</span><br>
                           <input type="tel" class="input_Box" id="input_Phone" placeholder="&nbsp;Phone" name="phone" required>
                          </div>
<!--                이메일 -->
<!--                           <div id="B_Email"> -->
<!--                              <span class="Box_Name">이메일</span><br> -->
<!--                              <input type="email" class="input_Box" id="input_email" placeholder="&nbsp;ex) _ _ _ _ @ _ _ _ _ _ _._ _ _" name="email"> -->
<!--                           </div> -->
               <!-- 동의서 -->
                               <div>
                                  <textarea readonly="readonly" rows="4" cols="100" id="personal_Info" textarea style="resize: none;">
회사는 회원 가입시 다음과 같이 개인정보를 수집에 대한 동의를 받고 있습니다. 가입자가 아래 내용을 읽고 동의를 선택하여 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다.


아래 내용은 수집하는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간에 대한 안내이며 자세히 읽어보신 후 동의하여 주시기 바랍니다.
   
   
1. 수집하는 개인정보 및 이용 목적
   회사는 이용자가 게시물 작성을 이용하기 위하여 회원가입을 신청할 경우, 회사는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
   
   
- 수집 항목: ID, 비밀번호, 이메일 주소, 핸드폰 번호
- 수집 목적: 회원제 서비스 이용, 본인 확인 및 개인 식별, 부정 이용 방지 등 회원 관리
- 수집 항목: 이름, 생년월일, 핸드폰 번호, CI, DI
- 수집 목적: 중복 가입 방지, 부정 이용 방지, 이벤트 당첨 경품 배송
- 수집 항목: 클라이언트 정보, IP
- 수집 목적: 회원관리, 부정 이용 방지, 오류 상황 확인, 통계활용
   
2. 개인정보의 보유 및 이용기간
   회사는 회원이 회사가 제공하는 서비스를 받는 동안 회원의 개인정보를 보유합니다. 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성된 시점에서 지체없이 파기합니다.
   
   
▶ 수집 및 이용 목적이 달성된 시점   
 • 회원 가입 정보 : 회원을 탈퇴하거나 이용 계약을 해지할 때
 • 본인 확인 정보 : 본인임을 확인한 때

회원이 서비스 이용 계약을 해지하거나 제명당한 경우라고 할지라도 서비스 이용의 혼선 방지, 권리남용 및 악용 방지, 명예훼손 등 권리 침해와 관련한 분쟁 및 수사 협조 의뢰에 대비하기 위한 목적으로 약관에 명시된 60일동안 이용자의 개인정보를 보유합니다. 이때에 해당 회원의 개인정보는 개인정보 보호를 위하여 별도로 분리하여 보관, 관리합니다.   
                                   </textarea>
                               </div>
               <!-- 회원가입 버튼 -->
                               <div class="Box_ck">
                                  <input type="checkbox" id="ck_btn" name="ck" onClick="checkDisable(this.form)">
                                   <span id="ck_Name">개인정보 수집 및 이용 동의</span>
                                   <input type="submit" class="btn_box1" id="btn_signUp" name="bt" value="회원가입" disabled="true" onclick="signUp();">
                               </div>
                       </fieldset>
                    </form>
                 </div>
              </div>
           </div>
       </div>
   </main>
   <!-- footer -->
   <%@ include file="../common/footer.jsp" %>
   
 <script>
		document.getElementById('idCheck').onclick = function(){
			window.open('checkIdForm.me', 'idCheckForm', 'width=300, height=200');
		}
		
		document.getElementById('nickCheck').onclick = function(){
			window.open('CheckNickForm.me', 'nickCheckForm', 'width=300, height=200');
		}
		
	</script>

  
  <script>
   function checkDisable(form) {
        if (form.ck.checked == true) {
            form.bt.disabled = false;
        } else {
            form.bt.disabled = true;
        }
    }
  </script>
  
  <script>
     var Id = document.getElementById("input_Id");
     var Nick = document.getElementById("input_Nick");
     var Pwd = document.getElementById("input_Pwd");
     var R_Pwd = document.getElementById("input_r_Pwd");
     var Name = document.getElementById("input_Name");
     var Phone = document.getElementById("input_Phone");
     var Ck_Phone = document.getElementById("input_ck_Phone");
     var Email = document.getElementById("input_email");
   
     var ckId = document.getElementById("ckId");
     var ckNick = document.getElementById("ckNick");
     var ckPwd = document.getElementById("ckPwd");
     var ckrPwd = document.getElementById("ckrPwd");
     var checkOk = false;
     var ckName = document.getElementById("ckName");
     
     var idval = /^[a-zA-Z0-9]{6,16}$/;
     var Nickval = /^[a-zA-Z0-9가-힣]{3,10}$/;
     var Pwdval = /^[a-zA-Z0-9~!@#*]{8,16}$/;
     var Nameval = /^[a-zA-Z가-힣]{2,30}$/;
     var Emailval=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
     var Phoneval = /^(01[016789]{1})[-][0-9]{4}[-][0-9]{4}$/;
   
//      var spcval = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
//      var korval = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
     
     /* 아이디 유효성 검사 - 완 */
     function Idck(){
      if(!idval.test(Id.value)){
         ckId.innerText = '6~16자 영문, 숫자';
      } else if(idval.test(Id.value)){
         ckId.innerText = '';
      } 
   }
     
     /* 닉네임 유효성 검사 - 완 */
     function Nickck(){
      if(!Nickval.test(Nick.value)){
         ckNick.innerText = '3~10자, 필수 입력사항입니다.';
      } else if(Nickval.test(Nick.value)){
         ckNick.innerText = '';
      } 
   }  
     /* 비밀번호 유효성 검사 - 완 */
     function Pwdck(){
      if(!Pwdval.test(Pwd.value)){
         ckPwd.innerText = '영문, 숫자, 특수문자(~ ! @ # * 만 사용가능)를 포함한 8~16자';
      } else if(Pwdval.test(Pwd.value)){
         ckPwd.innerText = '';
      } 
   } 
     /* 비밀번호 재확인 검사 - 완 */
     function rPwdck1(){
      if(Pwd.value == R_Pwd.value){
         ckrPwd.innerText = '';
         checkOk = true;
      } else if(Pwd.value != R_Pwd.value) {
         ckrPwd.innerText = '비밀번호가 일치하지 않습니다.';
         checkOk = false;
      }
   }
   function rPwdck2(){
      if(checkOk == true){
         ckrPwd.innerText = '';
      } else if(checkOk == false ) {
         if(Pwd.value.length > 8 && R_Pwd.value == '') {
            ckrPwd.innerText = '비밀번호를 한 번 더 입력하세요.';
         } else{
            ckrPwd.innerText = '비밀번호가 일치하지 않습니다.';
         }
      }            
   }
   /* 이름 검사 - 완 */
   function Nameck(){
      if(!Nameval.test(Name.value)){
         ckName.innerText = '이름을 입력하세요.';
      } else if(Nameval.test(Name.value)){
         ckName.innerText = '';
      } 
   } 

   function signUp(){
      if(!Phoneval.test(Phone.value) && !Emailval.test(Email.value) && Phone.value != '' && Phone.value.length > 0 && Email.value != '' && Email.value.length > 0){
         alert("휴대폰 번화와 이메일의 형식이 올바르지 않습니다.");
      } else if(!Phoneval.test(Phone.value) && Phone.value != '' && Phone.value.length > 0){
         alert("휴대폰 번호 형식이 올바르지 않습니다.");
      } else if(!Emailval.test(Email.value) && Email.value != '' && Email.value.length > 0){
         alert("이메일 형식이 올바르지 않습니다.");
      } else if((Phoneval.test(Phone.value) && Phone.value != '' && Phone.value.length > 0)
            || (Emailval.test(Email.value) && Email.value != '' && Email.value.length > 0)
            || (Phone.value == '' && Phone.value.length == 0 && Email.value == '' && Email.value.length == 0)){
         alert("축하합니다! 회원가입이 성공했습니다.")
      }
   }

   
   </script>
  
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>