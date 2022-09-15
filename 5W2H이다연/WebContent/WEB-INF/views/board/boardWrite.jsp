<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
      <%@ include file="../../../css/boardWrite.css" %>
</style>
</head>

<body class="flex-column d-flex">
   <!-- header -->
   <%@ include file="../common/header.jsp" %>

   <!-- main -->
   
   <div class="container content">
   <div class="main" align="center">
		<div class="gray1">
			<div class="gray1_1">
				<!-- 메인 상단 2 -->
				<div class="orange1_1">
       				<span id="My_bname">Write</span>
				</div>
						<hr class="orange1_2 hr1">
			</div>
		</div>
	</div>
      <form action="<%=request.getContextPath()%>/insert.bo" method="post" encType="multipart/form-data">
         <div class="row mb-4">
            <label for="colFormLabelLg2"
               class="col-sm-2 col-form-label col-form-label-lg text-end pe-5">가게명</label>
            <div class="col-sm-10">
               <input type="text" class="form-control form-control-lg"
                  id="colFormLabelLg2" placeholder="가게 이름을 입력하세요." name="title">
            </div>
         </div>

         <div class="row mb-4">
            <label
               class="col-md-2 col-form-label col-form-label-lg text-end pe-5">요일</label>
            <div
               class="btn-group btn-group-lg col-md-10 d-flex justify-content-between"
               role="group" aria-label="Basic checkbox toggle button group">
               
               <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" value="월" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck1">월</label> 
               <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" value="화" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck2">화</label> 
               <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" value="수" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck3">수</label> 
               <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" value="목" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck4">목</label> 
               <input type="checkbox" class="btn-check" id="btncheck5"autocomplete="off" value="금" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck5">금</label> 
               <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" value="토" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck6">토</label> 
               <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off" value="일" name="open"> 
               <label class="btn btn-outline-warning" for="btncheck7">일</label>
            
            </div>
         </div>

         <div class="row mb-4">
            <label for="colFormLabelLg3"
               class="col-md-2 col-form-label col-form-label-lg text-end pe-5">주소</label>
            <div class="col-md-10">
               <input type="text" class="form-control form-control-lg"
                  id="colFormLabelLg3" name="address" placeholder="주소를 입력하세요."
                  onclick="execPostCode();">
            </div>
         </div>

         <div class="row mb-4">
            <label for="colFormLabelLg4"
               class="col-md-2 col-form-label col-form-label-lg text-end pe-5">연락처</label>
            <div class="col-md-10">
               <input type="tel" class="form-control form-control-lg"
                  id="colFormLabelLg3" placeholder="가게 연락처를 입력하세요." name='tel'>
            </div>
         </div>

         <div class="row mb-4">
            <label for="colFormLabelLg4"
               class="col-sm-2 col-form-label col-form-label-lg text-end pe-5">추천메뉴</label>
            <div class="col-sm-10">
               <input type="text" class="form-control form-control-lg"
                  id="colFormLabelLg4" placeholder="추천메뉴를 입력하세요." name="food">
            </div>
         </div>

         <div class="row mb-4">
            <label for="colFormLabelLg5"
               class="col-sm-2 col-form-label col-form-label-lg text-end pe-5">가격</label>
            <div class="col-sm-3">
               <input type="number" class="form-control form-control-lg"
                  id="colFormLabelLg5" placeholder="가격을 입력하세요." name="price">
            </div>
            <div class="col-sm-7 align-self-center">
               <span style="font-size: 1.5rem;">원</span>
            </div>
         </div>

         <div class="row mb-4">
            <label for="colFormLabelLg6"
               class="col-sm-2 col-form-label col-form-label-lg text-end pe-5 align-self-center">추천하는
               이유</label>
            <div class="col-sm-10">
               <div class="form-floating" id="colFormLabelLg">
                  <textarea class="form-control" placeholder="Leave a comment here"
                     id="colFormLabelLg6" style="height: 100px; resize: none;"
                     name="comment"></textarea>
                  <label>Comments</label>
               </div>
            </div>
         </div>


         <div class="row mb-3">
            <div class="col-md-2 text-center align-self-center">
               <label class="btn btn-outline-warning mb-3" for="inputfile"
                  style="width: 60px; height: 60px;"> <svg
                     xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"
                     fill="currentColor" class="bi bi-plus-square-dotted"
                     viewBox="0 0 16 16">
                       <path
                        d="M2.5 0c-.166 0-.33.016-.487.048l.194.98A1.51 1.51 0 0 1 2.5 1h.458V0H2.5zm2.292 0h-.917v1h.917V0zm1.833 0h-.917v1h.917V0zm1.833 0h-.916v1h.916V0zm1.834 0h-.917v1h.917V0zm1.833 0h-.917v1h.917V0zM13.5 0h-.458v1h.458c.1 0 .199.01.293.029l.194-.981A2.51 2.51 0 0 0 13.5 0zm2.079 1.11a2.511 2.511 0 0 0-.69-.689l-.556.831c.164.11.305.251.415.415l.83-.556zM1.11.421a2.511 2.511 0 0 0-.689.69l.831.556c.11-.164.251-.305.415-.415L1.11.422zM16 2.5c0-.166-.016-.33-.048-.487l-.98.194c.018.094.028.192.028.293v.458h1V2.5zM.048 2.013A2.51 2.51 0 0 0 0 2.5v.458h1V2.5c0-.1.01-.199.029-.293l-.981-.194zM0 3.875v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zM0 5.708v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zM0 7.542v.916h1v-.916H0zm15 .916h1v-.916h-1v.916zM0 9.375v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zm-16 .916v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zm-16 .917v.458c0 .166.016.33.048.487l.98-.194A1.51 1.51 0 0 1 1 13.5v-.458H0zm16 .458v-.458h-1v.458c0 .1-.01.199-.029.293l.981.194c.032-.158.048-.32.048-.487zM.421 14.89c.183.272.417.506.69.689l.556-.831a1.51 1.51 0 0 1-.415-.415l-.83.556zm14.469.689c.272-.183.506-.417.689-.69l-.831-.556c-.11.164-.251.305-.415.415l.556.83zm-12.877.373c.158.032.32.048.487.048h.458v-1H2.5c-.1 0-.199-.01-.293-.029l-.194.981zM13.5 16c.166 0 .33-.016.487-.048l-.194-.98A1.51 1.51 0 0 1 13.5 15h-.458v1h.458zm-9.625 0h.917v-1h-.917v1zm1.833 0h.917v-1h-.917v1zm1.834-1v1h.916v-1h-.916zm1.833 1h.917v-1h-.917v1zm1.833 0h.917v-1h-.917v1zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"></path>
                  </svg>
               </label> <input type="file" id="inputfile" onchange="loadImg(this,1)" name="images"
                  style="position: absolute; clip: rect(0, 0, 0, 0);" multiple ="multiple"
                  accept=".png, .jpg, jpeg">
            </div>
            <div class="col-md-10" id="image-show"></div>
         </div>

         <div style="text-align: center;" class="mt-5">
            <input type="submit" class="btn btn-outline-warning btn-lg mx-auto" value="저장" >
            <input type="button" class="btn btn-outline-warning btn-lg mx-auto" onclick="location.href='<%= request.getContextPath() %>/'" value="취소">
         </div>
      </form>
   </div>

   <!-- 주소 API 가져오기 -->
<script src=http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false></script>
<script>   
   function execPostCode() {
      daum.postcode.load(function() {
         new daum.Postcode({
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               
               // 각 주소의 노출 규칙에 따라 주소를 조합
               // 내려오는 변수가 값이 없을 땐 공백('')값을 가지므로, 이를 참고
               var addr = ''; // 주소 변수
               
               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
               if(data.userSelectedType == 'R'){
                  // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
               } else {
                  // 사용자가 지번 주소를 선택했을 경우
                  addr = data.jibunAddress;
               }
               
               // 주소 정보를 해당 필드에 넣음.
               document.getElementById('colFormLabelLg3').value = addr;
               
               // 커서를 주소 필드로 이동
               document.getElementById("colFormLabelLg3").focus();
               
            }
         }).open();

      });
   }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

   /*파일 선택 시, 사진 미리 보기 기능*/
   var input = document.getElementById('inputfile');

   input.addEventListener('change', function(){

      files = this.files;
      console.log(files);
      var show = document.getElementById('image-show');

      while(show.hasChildNodes()){ //이벤트 발생 때마다 files 속성은 새로고침이 되니, files 속성을 따라 div 태그를 비워 준다.
         show.removeChild(show.firstChild);
         show.classList.remove('four-picture');
      }

      if(files.length === 4){ // 4장을 넣으면 꽉 차도록 해주는 클래스를 추가해준다.
         show.className += ' four-picture';
      }

      if(files.length > 4) {
         alert("사진은 최대 4장까지 넣을 수 있습니다.");
         return;
      }else{
         
         for(var i=0;i<files.length;i++){ 

            var newImage = document.createElement("img");

            if(files[i].type === 'image/png' || files[i].type === 'image/jpg' || files[i].type === 'image/jpeg'){
               newImage.setAttribute("class", "img rounded");

               newImage.src = URL.createObjectURL(files[i]);

               show.appendChild(newImage);
            }else{
               alert('확장자명이 PNG, JPG, JPEG인 파일을 선택해주세요.');
               return;
            }

            if(files.length === 4){ //4장을 넣을 시 margin을 넣으면 삐죽 튀어나오므로 margin 없애줌.
               newImage.style.marginRight = 0 + 'px';
            }
         }
      }
   });
</script>
   <!-- footer -->
   <%@ include file="../common/footer.jsp" %>
</body>
</html>