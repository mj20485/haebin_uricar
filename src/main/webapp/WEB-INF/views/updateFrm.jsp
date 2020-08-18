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
<title>우리떠날Car?:글수정</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section>
	<div class="content">
		<form action="boardUpdate" method="post" class="write-form"
			enctype="multipart/form-data">
			<h2 class="login-header">고객센터 글수정</h2>
			<input type="hidden" name="bid" value="${mb.mid}">
			<input type="hidden" name="board_seq" value="${board.board_seq}">
			<input type="text" name="title" class="write-input"
				value="${board.title}" required>
			<div class="category">
			<select name="category">
			<option value="차량문의">차량문의</option>
			<option value="결제문의">결제문의</option>
			<option value="우리떠날카존문의">우리떠날카존문의</option>
			<option value="기타문의">기타문의</option>
			</select>
			</div>
			<textarea name="b_content" rows="15" class="write-input ta">
				${board.b_content}</textarea>
			<div class="filebox">
				<div class="befor-file" style="margin-bottom: 20px;">
					<c:if test="${empty bfList}">
						<label style="width: 100%; margin-top:10px;">파일변경</label>
					</c:if>
					<c:if test="${!empty bfList}">
						<c:forEach var="file" items="${bfList}">
						<label style="width: 100%;"><a href="./download?sysFileName=${file.bf_sysName}">
							${file.bf_oriName}</a></label>
						</c:forEach>
					</c:if>
				</div>
				<label for="file">파일변경</label> 
				<input type="file" name="files" id="file"> 
				<input class="upload-name" value="파일선택" readonly>
				<input type="hidden" id="filecheck"	value="0" name="fileCheck" multiple>
			</div>
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