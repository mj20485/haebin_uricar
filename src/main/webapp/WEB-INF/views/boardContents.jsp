<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content="">
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<title>우리떠날Car?:고객센터</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/style.css?after">
<link rel="stylesheet" href="resources/css/sojin/style-boardContents.css">
<link rel="stylesheet" href="resources/css/fancybox/jquery.fancybox.css"
	media="all">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

</head>
<script type="text/javascript">
$(document).ready(function() {
	/*
	 *  Simple image gallery. Uses default settings
	 */

	$('.fancybox').fancybox();

	/*
	 *  Different effects
	 */

	// Change title type, overlay closing speed
	$(".fancybox-effects-a").fancybox({
		helpers: {
			title : {
				type : 'outside'
			},
			overlay : {
				speedOut : 0
			}
		}
	});

	// Disable opening and closing animations, change title type
	$(".fancybox-effects-b").fancybox({
		openEffect  : 'none',
		closeEffect	: 'none',

		helpers : {
			title : {
				type : 'over'
			}
		}
	});

	// Set custom style, close if clicked, change title type and overlay color
	$(".fancybox-effects-c").fancybox({
		wrapCSS    : 'fancybox-custom',
		closeClick : true,

		openEffect : 'none',

		helpers : {
			title : {
				type : 'inside'
			},
			overlay : {
				css : {
					'background' : 'rgba(238,238,238,0.85)'
				}
			}
		}
	});

	// Remove padding, set opening and closing animations, close if clicked and disable overlay
	$(".fancybox-effects-d").fancybox({
		padding: 0,

		openEffect : 'elastic',
		openSpeed  : 150,

		closeEffect : 'elastic',
		closeSpeed  : 150,

		closeClick : true,

		helpers : {
			overlay : null
		}
	});

	/*
	 *  Button helper. Disable animations, hide close button, change title type and content
	 */

	$('.fancybox-buttons').fancybox({
		openEffect  : 'none',
		closeEffect : 'none',

		prevEffect : 'none',
		nextEffect : 'none',

		closeBtn  : false,

		helpers : {
			title : {
				type : 'inside'
			},
			buttons	: {}
		},

		afterLoad : function() {
			this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
		}
	});


	/*
	 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
	 */

	$('.fancybox-thumbs').fancybox({
		prevEffect : 'none',
		nextEffect : 'none',

		closeBtn  : false,
		arrows    : false,
		nextClick : true,

		helpers : {
			thumbs : {
				width  : 50,
				height : 50
			}
		}
	});

	/*
	 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
	*/
	$('.fancybox-media')
		.attr('rel', 'media-gallery')
		.fancybox({
			openEffect : 'none',
			closeEffect : 'none',
			prevEffect : 'none',
			nextEffect : 'none',

			arrows : false,
			helpers : {
				media : {},
				buttons : {}
			}
		});

	/*
	 *  Open manually
	 */

	$("#fancybox-manual-a").click(function() {
		$.fancybox.open('1_b.jpg');
	});

	$("#fancybox-manual-b").click(function() {
		$.fancybox.open({
			href : 'iframe.html',
			type : 'iframe',
			padding : 5
		});
	});

	$("#fancybox-manual-c").click(function() {
		$.fancybox.open([
			{
				href : '1_b.jpg',
				title : 'My title'
			}, {
				href : '2_b.jpg',
				title : '2nd title'
			}, {
				href : '3_b.jpg'
			}
		], {
			helpers : {
				thumbs : {
					width: 75,
					height: 50
				}
			}
		});
	});


});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#upbtn').hide();
	$('#delbtn').hide();
	var mid = '${mb.mid}';
	var bid = '${board.bid}';

	if(mid == bid){
		$('#upbtn').show();
		$('#delbtn').show();
	}
	
	var chk = '${check}';
	
	if(chk == '1'){
		alert("자신의 글이 아니면 수정할 수 없습니다.");
		location.reload(true);
	}
	if(chk == '2'){
		alert("수정되었습니다.");
		location.reload(true);
	}
	if(chk == '3'){
		alert("수정을 실패하였습니다.");
		location.reload(true);
	}
	if(chk == '4'){
		alert("삭제를 실패하였습니다.");
		location.reload(true);
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
					<div class="write-form">
						<h2 class="login-header">${board.title}</h2>
						<table>
							<tr height="30">
								<td width="60" align="center" style="color: #004982; background-color: #F9F9F9;">번호</td>
								<td>${board.board_seq}</td>
								<td align="center" style="color: #004982; background-color: #F9F9F9;">작성자</td>
								<td width="150" style="margin-right:2% ">${board.bid}</td>
								<td align="center" style="color: #004982; background-color: #F9F9F9;">등록일</td>
								<td width="200">${board.reg_date}</td>

							</tr>
							<tr height="30">
								<td style="color: #004982; background-color: #F9F9F9;"align="center">제목</td>
								<td>${board.title}</td>
							</tr>
							<tr height="200">
								<td style="color: #004982;"align="center"">내용</td>
								<td colspan="5" style=" background-color: #F9F9F9;">${board.b_content}</td>
							</tr>
							<tr style="margin-top:3%;">
								<th style="font-size: 9.3pt;">첨부파일</th>
								<td colspan="5"><c:if test="${empty bfList}">
							첨부된 파일이 없습니다.
						</c:if> <c:if test="${!empty bfList}">
										<c:forEach var="file" items="${bfList}">
											<a href="./download?sysFileName=${file.bf_sysName}">${file.bf_oriName}</a>
										</c:forEach>
									</c:if></td>
							</tr>
							<c:if test="${!empty bfList}">
				<tr>
					<c:forEach var="f" items="${bfList}">
					<c:if test="${fn:contains(f.bf_sysName, '.jpg')}">
					<td colspan="6">
						<img src="resources/upload/${f.bf_sysName}" width="100">
					</td>
					</c:if>
					</c:forEach>
				</tr>
				</c:if>
							<tr>
								<td colspan="6" align="right" style="margin-top: 2%;">
									<button class="btn-write" id="upbtn"
										onclick="location.href='./updateFrm?board_seq=${board.board_seq}'">수정</button>
									<button class="btn-write" id="delbtn"
										onclick="goDelete(${board.board_seq},'${mb.mid}','${board.bid}')">삭제</button>
									<button class="btn-sub"
										onclick="location.href='./list?pageNum=${pageNum}'">목록으로가기</button>
								</td>
							</tr>
						</table>

						<form name="rFrm" id="rFrm" class="write-form">
							<textarea rows="3" class="write-input ta" name="r_content"
								id="comment" placeholder="댓글을 적어주세요~"></textarea>
							<input type="hidden" name="mid" value="${mb.mid}">
							<input class="btn-write1" type="button" value="댓글전송"
								onclick="replyInsert(${board.board_seq})"
								style="width: 100%; margin-bottom: 30px;">
						</form>
						<div class="write-form" style="margin-left: 0px;">
							<table style="width: 100%; margin-bottom: 5%;">
								<tr align="center" height="30">
									<td width="20%">작성자</td>
									<td width="50%">내용</td>
									<td width="30%">시간</td>
								</tr>
							</table>
							<!-- rTable에 댓글 리스트만 Ajax로 처리위해 -->
							<table id="rTable" style="width: 100%">
								<c:forEach var="r" items="${rList}">
									<tr height="25" align="center">
										<td width="20%">${r.mid}</td>
										<td width="50%">${r.r_content}</td>
										<td width="30%">${r.r_date}</td>
									</tr>
								</c:forEach>

							</table>

						</div>
					</div>
			</div>
		</section>
		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<!-- 
resources 경로의 사용
MemberController와 연결되는 jsp에서는
src="resources/하위폴더나 파일...",
BoardController와 연결되는 jsp에서는
src="../resources/하위폴더나 파일..."로 작성.
 -->
<script type="text/javascript">
function replyInsert(board_seq){
	//form의 데이터를 가져와서 json으로 변환
	var replyFrm = $('#rFrm').serializeObject();
	//추가 데이터 : 게시글번호, 작성자(로그인) id
	replyFrm.board_seq = board_seq;
	//세션에 저장한 로그인 회원 정보에서 id 추출
	
	console.log(replyFrm);
	
	$.ajax({
		url: "replyInsert",//요청 url(uri)
		type: "post",//전송 방식(get, post)
		data: replyFrm,//전송할 데이터
		dataType: "json",//데이터의 형식
		success: function(data){
			//목록 전체를 하나의 문자열로 만들어서
			//한꺼번에 id가 rTable인 태그(요소)의
			//innerHTML에 출력.
			var rlist = '';
			var dlist = data.rList;
			for(var i = 0; i < dlist.length; i++){
				rlist += '<tr height="25" align="center">'
				+'<td width="20%">'+ dlist[i].mid +'</td>'
				+'<td width="50%">'+ dlist[i].r_content +'</td>'
				+'<td width="30%">'+ dlist[i].r_date +'</td></tr>'
			}
			$('#rTable').html(rlist);
		},
		error: function(error){
			alert("댓글 입력 실패");
		}
	});
	
	$('#comment').val('');//댓글창 지우기
}

function goDelete(board_seq, mid, bid){
	if(mid != bid){
		alert("본인이 작성한 글이 아니면 삭제할 수 없습니다.");
		return;
	}
	var del = confirm("정말로 삭제 하시겠습니까?");
	if(del == true){
		location.href='./delete?board_seq=' + board_seq;
	}
	else{
		alert("취소되었습니다.");
	}
}
</script>
</html>