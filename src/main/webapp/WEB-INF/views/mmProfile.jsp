<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta property="og:type" content="website">
<meta property="og:title" content="[우리떠날CAR: 마이페이지]">
<meta property="og:description"
   content="안전한 로그인을 위해 주소창의 URL과 자물쇠 마크를 확인하세요!">
<meta property="og:image"
   content="https://ssl.pstatic.net/sstatic/search/common/og_v3.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="1200">
<title>일반회원 정보수정</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script type="text/javascript">
$(document).ready(function(){
   var name = "${mb.name}";
   if(name != ""){
   $('#name').html(name + '님');
   $('.suc').css('display','block');
   $('.bef').css('display','none');
   }
   if(name == "") {
      $('.suc').css('display','none');
      $('.bef').css('display','block');
   }
   
   var msg = '${msg}';

   if(check == '1'){
   	alert("수정을 성공하였습니다.");
   	location.reload(true);
   }
   if(check == '2'){
   	alert("수정을 실패하였습니다.");
   	location.reload(true);
   }
});
</script>
<link type="text/css" rel="stylesheet" href="resources/css/sojin/mmstyle.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<header>
	<jsp:include page="header2.jsp"></jsp:include>
</header>
   <section>
      <div class="cmprofile">
         <h1>
            <strong>프로필 수정</strong>
         </h1>
         <p>우리떠날 Car? 대표 프로필과 주소를 수정할 수 있습니다.</p>
      </div>
      <br>

      <div class="acontents">

         <div class="box1">
            <h5>
               <strong>프로필 사진</strong>
            </h5>
         </div>

         <div class="box2">
            <div class="user">
               <img src="user.png" width="90" height="90">
            </div>
            <div class="profile-font">
               <input type="submit" value="사진변경">
               <input type="button" value="삭제">
            </div>
         </div>
      </div>

      <div class="acontents">
         <div class="box3">

            <h5>
               <strong>비밀번호 변경</strong>
            </h5>

         </div>
		<form name="mmProfile" action="new_pwd" method="post">
		<input type="hidden" name ="mid" value="${mb.mid}">
         <div class="box4">
            <div class="profile-font">
               <p style="font-size: 10px;">안전한 비밀번호로 내정보를 보호하세요.</p>
               <p style="font-size: 10px; color: red;">다른 아이디/사이트에서 사용한 적 없는
                  비밀번호 이전에 사용한 적 없는 비밀번호가 안전합니다.</p>
               <div><input type="password" name="password" id="password_1" size="32" placeholder="새 비밀번호">
               <span>8~15자리의 영문,숫자,특수문자의 입력이 가능합니다.</span></div> <br>
               <div><input type="password" size="32" id="password_2" placeholder="새 비밀번호 확인"><span
                     id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> <span
                     id="alert-danger"
                     style="display: none; color: #d92742; font-weight: bold;">비밀번호가
                        일치하지 않습니다.</span></div>

               <input type="submit" value="수정" style="margin-left: 250px;">
               <input type="reset" value="수정취소">
            </div>
         </div>
		</form>
		</div>


         <div class="acontents">
            <div class="box31">

               <h5>
                  <strong>주소</strong>
               </h5>
            </div>

            <div class="box41">
               <div class="profile-font">
                  <p>${mb.address}</p>
                  <form name="mmProfile" action="new_address" method="post">
                  <input type="hidden" name ="mid" value="${mb.mid}">
                       변경주소 : <input type="text" name="address" requried/>
                  <button type="button" style="margin-left: 520px;" onclick="openZipSearch()">검색</button>
                  <input type="submit" value="수정완료">
                  </form>
               </div>
            </div>

            <div class="box3">
               <h5>
                  <strong>휴대전화</strong>
               </h5>
            </div>
            <div class="box4">
               <div class="profile-font">
                  <p>
                     <strong>${mb.phone} </strong>
                  </p>
                  <p style="font-size: 10px; color: gray;">아이디 비밀번호 찾기 등 본인확인이
                     필요한 경우 쓰는 우리떠날Car로부터 알림을 받을 때 사용할 휴대전화입니다.</p>
                  
                  <p>
                     <strong>변경할 휴대전화</strong>
                  </p>
                  <form name="mmProfile" action="new_phone" method="post">
                  <input type="hidden" name="mid" value="${mb.mid}">
                  <input type="text" name="phone" id="phone" size="50" />
                  <input type="submit" value="수정완료" style="margin-left: 120px;">
                  <input type="reset" value="수정취소">
                  </form>
               </div>
            </div>

            <div class="box55">
               <h5>
                  <strong>이메일</strong>
               </h5>
            </div>

            <div class="box66">
               <div class="profile-font">
                  <p>
                     <strong> ${mb.email} </strong>
                  </p>
                  <p style="font-size: 10px; color: gray;">우리떠날Car 서비스 변경/개편/종료
                     프로모션 등 안내에 사용할 이메일 주소입니다.</p>
                  <p style="font-size: 11px;">
                     <input type="checkbox">우리떠날Car의 이벤트 등 프로모션 관련 안내 메일을
                     수신하겠습니다.
                  </p>
                  <p>
                     <strong>변경할 이메일</strong>
                  </p>
                  <form name="mmProfile" action="new_email" method="post">
                  <input type="hidden" name ="mid" value="${mb.mid}">
                  <input type="text" name="email" id="email" size="50" />
                  <input type="submit" value="수정">
                  <br>
                  <p style="font-size: 10px; color: blue;">일치시 (이메일 주소가 현재 회원정보와
                     일치합니다. 변경할 이메일을 입력해 주세요.)</p>
                  <p style="font-size: 10px; color: red;">불일치시 (연락처 이메일을 정확하게
                     입력해 주세요.)</p>
                  </form>
               </div>
            </div>
         </div>

         <center>
            <input class="btn-write2" type="button" value="뒤로가기"
						onclick="location.href='./mypageFrm'">
         </center>
   </section>
</body>
<script>
function openZipSearch() {
    new daum.Postcode({
       oncomplete : function(data) {
          $('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
          $('[name=address]').val(data.address);
          $('[name=address]').val(data.buildingName);
       }
    }).open();
 }
   $('.pw').focusout(function() {
      var pwd1 = $("#password_1").val();
      var pwd2 = $("#password_2").val();

      if (pwd1 != '' && pwd2 == '') {
         null;
      }
      else if (pwd1 != "" || pwd2 != "") {
         if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'inline-block');
            $("#alert-danger").css('display', 'none');
         } else {
            alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요");
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'inline-block');
         }

      }
   });
</script>
</html>