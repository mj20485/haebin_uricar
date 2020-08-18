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
<title>일반회원 내정보보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
});
</script>
<link type="text/css" rel="stylesheet" href="resources/css/sojin/mmstyle.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<style>
section {
   width: 960px;
   height: 1220px;
   margin: 10px auto;
}

div.button {
   float: left;
   margin: 0px 20px;
}

div.img, div.tx {
   width: 80px;
   height: 80px;
   vertical-align: top;
   margin-bottom: 10px;
}

div.img {
   float: left;
}

div.tx {
   float: right;
}
</style>

</head>
<body>
<header>
   <jsp:include page="header2.jsp"></jsp:include>
   </header>
   <section>

      <div class="box22">
         <strong>우리떠날Car 프로필</strong><br /> <br />
         <div class=img>
            <img src="resources/images/user.png" width="70px" height="70px">
         </div>
         
         <div class="tx">
            <strong><p>이름</p></strong> <c:forEach var="mb" items="${mList}"><p>${mb.name}</p></c:forEach>
         </div>
         
         <br/>
         <div class="button1"><a href="./mmProfile">
            <input type="submit" value="수정"></a>
         </div>
      </div>


      <div class="box22">
         <strong>신용카드</strong><br /> <br />
         <p style="color: gray">현재 설정해 놓은 신용카드를 수정 및 추가할 수 있습니다.</p>
         <br/>
         <button type="button" class="button" onclick="location.href='./mmCardSet'">설정하기
         </button>
      </div>
      <div class="box22">
         <strong>사용이력 조회</strong><br /> <br />
         <p style="color: gray">내가 이용한 이력 및 최근 결제 내용을 조회할 수 있습니다.</p>
         <br/>
         <div class="button"><a href="./mmUsageHistory">
            <input type="submit" value="조회하기"></a>
         </div>
      </div>
      <div class="box22">
         <strong>회원탈퇴</strong><br /> <br />
         <p style="color: gray">우리떠날Car?의 서비스를 이용할 수 없습니다.</p>
         <br/>
         <div class="button">
            <input type="submit" value="탈퇴하기">
         </div>
      </div>
   </section>
</body>
</html>