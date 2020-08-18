<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
   var name = "${mb.name}";
   var cname = "${cm.cname}";
   if(name != "" && cname == ""){
      $('#name').html(name + '님');
      $('.suc').css('display','block');
      $('.bef').css('display','none');
      $('.com').css('display','none');
   }
   if(name == "" && cname == "") {
      $('.suc').css('display','none');
      $('.bef').css('display','block');
      $('.com').css('display','none');
   }
   if(name == "" && cname != ""){
      $('#cname').html(cname + '님');
      $('.suc').css('display','none');
      $('.bef').css('display','none');
      $('.com').css('display','block');
   }
});
</script>
<div class="header">
   <div class="left" style="width: 50%; padding: 0; margin-left: 10%;">
      <img src="resources/images/logoR.png" width="250" height="150" onclick="gohome()">
   
   <div class="left_title" style="font-size:24px; color:#004982; margin-left: 35%; margin-top: -12%;"><a href="./mypageFrm" style="text-decoration: none; color:#004982;">내정보</a></div>
   </div>
<div class="right" style="margin-top: -3%; float: right;">
   <nav class="top-right" >
      <ul>
        <li class="suc"><a href="./logout">로그아웃</a></li>
      <li class="suc"><a href="./mypageFrm">내정보</a></li>
      <li class="bef"><a href="./joinFrm">회원가입</a></li>
      <li class="bef"><a href="./login">로그인</a></li>
      <li class="suc" id="name">${name}님</li>
      <li class="com"><a href="./logout">로그아웃</a></li>
      <li class="com"><a href="./cmPage">관리</a>
      <li class="com" id="cname">${cname}님</li>
      </ul>
   </nav>
</div>

</div>
<script>
	function gohome() {
		var id = '${mb.mid}';

		if (id == '') {
			location.href = './';
		} else if (id != '') {
			location.href = './';
		}
	}
</script>