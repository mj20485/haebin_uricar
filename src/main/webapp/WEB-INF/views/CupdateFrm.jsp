<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<title>우리떠날Car?:차량수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/sojin/updateFrm.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet"
	href="resources/fancybox/source/jquery.fancybox.css" media="all">
<!-- Add jQuery library -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript"
	src="resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet"
	href="resources/fancybox/source/jquery.fancybox.css?v=2.1.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.7"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet"
	href="resources/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet"
	href="resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
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
</head>
<body>
<div class="wrap">
	<header>
	<jsp:include page="header3.jsp"></jsp:include>
	</header>
	<section>
	<div class="content">
		<form action="boardUpdate" method="post" class="write-form"
			enctype="multipart/form-data">
			<h2 class="login-header">자동차 수정</h2>
			<input type="hidden" name="car_seq" value="${car.car_seq}">
			<input type="hidden" name="car_size" value="${car.car_size}">
			<input type="text" name="title" class="write-input"
				value="${car.car_type}" required>
			<div class="category">
			<select name="car_size">
			<option value="소형">소형</option>
			<option value="준중형">준중형</option>
			<option value="중형">중형</option>
			<option value="대형">대형</option>
			</select>
			</div>
			<textarea name="car_option" rows="15" class="write-input ta">
				${car.car_option}</textarea>
			
			<div class="btn-area">
				<input class="btn-write" type="submit" value="수정">
				<input class="btn-write" type="reset" value="취소">
				<input class="btn-write" type="button" value="목록으로가기"
					onclick="javascript:history.back();">
			</div>
		</form>
	</div>
	</section>
	<footer>
	<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>