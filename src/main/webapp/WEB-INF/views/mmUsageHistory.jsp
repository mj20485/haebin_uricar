<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>우리떠날Car?:검색이력</title>
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
});
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/style.css?after">
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
      closeEffect   : 'none',

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
         buttons   : {}
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
var check = '${check}';

if(check == '1'){
	alert("추가되었습니다.");
	location.reload(true);
}
if(check == '2'){
	alert("추가실패하였습니다.");
	location.reload(true);
}
if(check == '3'){
	alert("삭제되었습니다.");
	location.reload(true);
}
if(check == '4'){
	alert("삭제를 실패하였습니다.");
	location.reload(true);
}
});
</script>
<link type="text/css" rel="stylesheet"
	href="resources/css/sojin/mmstyle.css">
</head>
<body>
	<header>
		<jsp:include page="header2.jsp"></jsp:include>
	</header>
	<div class="cmprofile" style="margin-top: 10%;">
		<h1>
			<strong style="color:#004982;">최근 본 이력 조회</strong>
		</h1>
		<p>우리떠날Car? 이용한 이력 및 최근 결제 내용을 관리할 수 있습니다. 결제는 앱에서 가능합니다.</p>
	</div>
	<br>

	<div class="acontents">
		<div class="box01">
			<h5>
				<strong>검색차량</strong>
			</h5>
		</div>
		
			<div class="box02">
				<p>차량번호 : ${rcar.car_num}</p>
				<p>렌트위치 : ${rcar.zone}</p>
				<p>차량 : ${rcar.car_type}</p>
				<p>차종 : ${rcar.car_size}</p>
				<p>가격 : ${rcar.rent_amt}</p>
			</div>
		
		<div class="box01">
			<p>결제대기</p>
		</div>
		<div class="box01">
			<a href="#pop-inquiry" class="fancybox" style="width: 240px;">예약</a>
		</div>
		<div id="pop-inquiry" style="display:none;">
               <div class="pop-cont">
                  <h3>예약</h3>
                  <p>
                     	예약은 현재 앱에서만 가능합니다. 우리떠날Car앱을 이용해주세요.
                  </p>
               </div>
            </div>
	</div>
	
</body>

</html>