<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
<html>
<head>
<title>우리떠날Car? 자주찾는질문</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<script src="resources/js/cmm/common.js"></script>
<script src="resources/js/cmm/atrk.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet"
   href="resources/fancybox/source/jquery.fancybox.css" media="all">
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm1.css">
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm2.css">
<link rel="stylesheet" href="resources/css/joinFrm/style_kr_fixcss.css">
<link rel="stylesheet" href="resources/css/joinFrm/style_kr.css">
<link rel="stylesheet" href="resources/css/joinFrm/kh-old.css">
<link rel="stylesheet" href="resources/css/sojin/style-reserv.css">
<link rel="stylesheet" href="resources/css/joinFrm/resultre.css">
<link rel="stylesheet" href="resources/css/joinFrm/tdoctor-old.css">
<link rel="stylesheet" href="resources/css/joinFrm/m2on-addon.css">

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

<link rel="stylesheet" href="resources/css/footer.css" />
</head>
<script type="text/javascript">
   $(document).ready(
         function() {
            /*
             *  Simple image gallery. Uses default settings
             */

            $('.fancybox').fancybox();

            /*
             *  Different effects
             */

            // Change title type, overlay closing speed
            $(".fancybox-effects-a").fancybox({
               helpers : {
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
               openEffect : 'none',
               closeEffect : 'none',

               helpers : {
                  title : {
                     type : 'over'
                  }
               }
            });

            // Set custom style, close if clicked, change title type and overlay color
            $(".fancybox-effects-c").fancybox({
               wrapCSS : 'fancybox-custom',
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
               padding : 0,

               openEffect : 'elastic',
               openSpeed : 150,

               closeEffect : 'elastic',
               closeSpeed : 150,

               closeClick : true,

               helpers : {
                  overlay : null
               }
            });

            /*
             *  Button helper. Disable animations, hide close button, change title type and content
             */

            $('.fancybox-buttons')
                  .fancybox(
                        {
                           openEffect : 'none',
                           closeEffect : 'none',

                           prevEffect : 'none',
                           nextEffect : 'none',

                           closeBtn : false,

                           helpers : {
                              title : {
                                 type : 'inside'
                              },
                              buttons : {}
                           },

                           afterLoad : function() {
                              this.title = 'Image '
                                    + (this.index + 1)
                                    + ' of '
                                    + this.group.length
                                    + (this.title ? ' - '
                                          + this.title : '');
                           }
                        });

            /*
             *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
             */

            $('.fancybox-thumbs').fancybox({
               prevEffect : 'none',
               nextEffect : 'none',

               closeBtn : false,
               arrows : false,
               nextClick : true,

               helpers : {
                  thumbs : {
                     width : 50,
                     height : 50
                  }
               }
            });

            /*
             *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
             */
            $('.fancybox-media').attr('rel', 'media-gallery').fancybox({
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
               $.fancybox.open([ {
                  href : '1_b.jpg',
                  title : 'My title'
               }, {
                  href : '2_b.jpg',
                  title : '2nd title'
               }, {
                  href : '3_b.jpg'
               } ], {
                  helpers : {
                     thumbs : {
                        width : 75,
                        height : 50
                     }
                  }
               });
            });

         });
</script>

<!-- 와이즈로그 -->
<script type="text/javascript">
   //document.domain = "*.kotra.or.kr";

   var nowZoom = 100; // 현재비율
   var maxZoom = 200; // 최대비율(500으로하면 5배 커진다)
   var minZoom = 80; // 최소비율

   //화면 키운다.
   function zoomIn() {
      var browser = window.navigator.userAgent;
      if (browser.indexOf('Firefox') != -1) {
         alert("컨트롤키를 누른상태에서 + 키를 누르시면 커집니다");
         return;
      }

      if (nowZoom < maxZoom) {
         nowZoom += 10; //25%씩 커진다.
      } else {
         return;
      }

      document.body.style.zoom = nowZoom + "%";
   }

   //화면 줄인다.
   function zoomOut() {
      var browser = window.navigator.userAgent;
      if (browser.indexOf('Firefox') != -1) {
         alert("컨트롤키를 누른상태에서 - 키를 누르시면 작아집니다");
         return;
      }
      if (nowZoom > minZoom) {
         nowZoom -= 10; //25%씩 작아진다.
      } else {
         return;
      }

      document.body.style.zoom = nowZoom + "%";
   }

   //화면 원래대로 
   function zoomDefault() {
      var browser = window.navigator.userAgent;
      if (browser.indexOf('MSIE') != -1) {
         nowZoom = 100;
         document.body.style.zoom = nowZoom + "%";
      }
   }
</script>

<script type="text/javascript">
   function fnTopMenuMouseOver() {
      $(".allmenu").removeClass("on");
      $(".mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      $('#family_view').hide();
      //$('#menu_view').hide();
      $('#allmenuView').hide();
      $('#mymenuView').hide();
   }

   function fnFamilyClick() {

      $(".allmenu").removeClass("on");
      $(".mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      //$('#family_view').hide();
      $('#menu_view').hide();
      $('#allmenuView').hide();
      $('#mymenuView').hide();

   }

   function fnFamilyMouseOver() {
      $(".allmenu").removeClass("on");
      $(".mymenu").removeClass("on");
      //$("#btn_family").removeClass("on");

      $('#family_view').hide();
      $('#menu_view').hide();
      $('#allmenuView').hide();
      $('#mymenuView').hide();
   }

   function fnAllMenuClick() {
      //$("#allmenu").removeClass("on");
      $(".mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      $('#family_view').hide();
      $('#menu_view').hide();
      //$('#allmenuView').hide();
      $('#mymenuView').hide();
   }

   function fnAllMenuMouseOver() {
      //$("#allmenu").removeClass("on");
      $(".mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      $('#family_view').hide();
      $('#menu_view').hide();
      $('#allmenuView').hide();
      $('#mymenuView').hide();
   }

   function fnMyMenuClick() {
      $(".allmenu").removeClass("on");
      //$(".mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      $('#family_view').hide();
      $('#menu_view').hide();
      $('#allmenuView').hide();
      //$('#mymenuView').hide();
   }

   function fnMyMenuMouseOver() {
      $(".allmenu").removeClass("on");
      //$("#mymenu").removeClass("on");
      $(".btn_family").removeClass("on");

      $('#family_view').hide();
      $('#menu_view').hide();
      $('#allmenuView').hide();
      $('#mymenuView').hide();
   }

   function fnMenuViewOver() {
      $('#menu_view').hide();
   }
</script>
<script type="text/javascript">
   //<![CDATA[
   function goMenu(param, url) {

      var frm = document.getElementById('menuForm');
      if (url != null && url != '')
         frm.action = url;
      frm.MENU_CD.value = param;

      if (url == null || url == '') {
         frm.submit();
      } else {
         if (url.indexOf("?") == -1)
            url = url + "?";
         location.href = url + "&MENU_CD=" + $('#MENU_CD').val()
               + "&TOP_MENU_CD=" + $('#TOP_MENU_CD').val()
               + "&LEFT_MENU_CD=" + $('#LEFT_MENU_CD').val()
               + "&PARENT_MENU_CD=" + $('#PARENT_MENU_CD').val()
               + "&CO_TYPE=" + $('#CO_TYPE').val()
      }

   }

   function goLanguage(url) {
      window.open(url);
   }

   var $kotraLoading = {
      show : function() {
         if (!$kotraLoading.loadingWrap.is(":visible")) {
            $kotraLoading.loadingWrap.show();
            //$(document.body).css("position","fixed");
         }
      },
      hide : function() {
         $kotraLoading.loadingWrap.hide();
         $(document.body).css("position", $kotraLoading.bodyPosition);
      },
      _init : function() {
         var loadingWrap = $("<div>").css({
            'width' : '100%',
            'height' : '100%',
            'top' : '0px',
            'position' : 'fixed',
            'z-index' : '999',
            'text-align' : 'center',
            'display' : 'none'
         });
         var loadingMask = $("<div>").css({
            'width' : '100%',
            'height' : '100%',
            'background' : '#000',
            'opacity' : '0.7'
         });
         var loadingConts = $("<div>").css({
            'width' : '400px',
            'height' : '120px',
            /*'background': '#fff',*/
            'opacity' : '1',
            'position' : 'fixed',
            'top' : 'calc(50% - 120px)',
            'left' : 'calc(50% - 200px)',
         /*'border-radius': '5px',*/
         /*'border' : '5px solid #6aabec'*/
         });
         var spinTitle = $("<h4>").css({
            'font-size' : '18px',
            'padding' : '10px 0px',
            'border-radius' : '5px 5px 0px 0px',
            'color' : '#06275a',
            'margin-bottom' : '5px',
            'margin-top' : '15px'
         });
         /*.text("잠시만 기다려 주세요");*/
         var spinnerImg = $("<img>", {
            'src' : '/images/kh_new/spinner.gif',
            'alt' : 'loading'
         }).css({
            'width' : '50px'
         });
         loadingWrap.append(loadingMask).append(
               loadingConts.append(spinTitle).append(spinnerImg));
         $kotraLoading.bodyPosition = $(document.body).css("position");
         $(document.body).append(loadingWrap);
         $kotraLoading.loadingWrap = loadingWrap;
      }
   }
   //메뉴이동시 스피너 출력
   /*
    $(function(){
    $kotraLoading._init();
    $("#left_nav ul li>a").on('click', function(){
    if($(this).attr('target') != '_blank'){
    $kotraLoading.show();
    }
    });
    })
    */
</script>
<script src="resources/js/cmm/atrk.js"></script>
<style type="text/css">
/*회원가입*/
.join01 .box02 {
   overflow: hidden;
   position: relative;
   width: 743px;
   height: 158px;
   padding: 22px 0 0 37px;
   color: #5d5d5d;
}

.join01 .box02 a {
   position: absolute;
   left: 26px;
   top: 115px;
}

.join01 .box02 a.btn {
   position: absolute;
   left: 26px;
   top: 61px;
}

.join01 .box03 {
   overflow: hidden;
   position: relative;
   width: 743px;
   height: 123px;
   padding: 22px 0 0 37px;
   color: #5d5d5d;
}

.join01 .box03 a {
   position: absolute;
   left: 26px;
   top: 85px;
}

.join01 .corporate {
   background: url(resources/images/bg_join01_1.gif) no-repeat;
}

.join01 .individual {
   background: url(resources/images/bg_join02.gif) no-repeat;
}

.join01 .membership {
   background: url(resources/images/bg_join03.gif) no-repeat;
}
</style>

<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  if (window.navigator.userAgent.indexOf("Edge") > -1) {
                     alert("죄송합니다. 엣지 브라우져에서는 이용이 원활하지 않을 수 있으니 다른 브라우져(익스플로러, 크롬, 사파리 등)를 이용해 주시면 고맙겠습니다. 조치중이오니 많은 양해 바랍니다.");
                  }
                  /* alert("금일 24일 오후 12:20까지 회원가입이 불가하오니\n고객님의 양해를 부탁드립니다."); */
               });
</script>

<script>
   /* 20200723 버튼 스크립트*/
   $(function() {
      $('button.btn_more').click(function() {
         $('div.pop_home').slideDown();
      });

      $('div.pop_home p').hover(function() {
         $(this).addClass('on');
         $(this).find('.btn_s').hide();
         $(this).find('.btn_o').show();
      });

      $('div.pop_home p').mouseout(function(e) {
         $(this).siblings('p').removeClass('on');
         $(this).siblings('p').find('.btn_o').hide();
         $(this).siblings('p').find('.btn_s').show();
      });

      $('div.home_box').hover(function() {
         var btnOn = $('div.pop_home p.on');
         btnOn.removeClass('on');
         if (btnOn) {
            btnOn.find('.btn_o').hide();
            btnOn.find('.btn_s').show();
         }
      });

      $('div.home_box .btn_close').click(function() {
         var btnOn = $('div.pop_home p.on');
         btnOn.removeClass('on');
         if (btnOn) {
            btnOn.find('.btn_o').hide();
            btnOn.find('.btn_s').show();
         }

         $('div.pop_home').slideUp();
      });
   });
</script>

<style type="text/css">
/* #write_wrap03 { width:100%; height:100%; background:url("../../images/kh/service/bg.png"); position:fixed; z-index:200; top:0; left:0; display:none; text-align:left; border:0;}
#write03 { width:460px; height:170px; border:5px solid #286dc2; padding:10px 20px 20px 20px; margin:0 auto; margin-top:270px; background:#fff; position:relative; text-align:left; font-size:14px; overflow: auto;}
 */
/*아래 추가  */
/* 맨위 */
div.new_header_19 {
   height: 46px;
   background: #efefef;
}

div.new_header_19>div {
   position: relative;
   margin: 0 auto;
   padding: 2px 10px 0;
   width: 1200px;
   box-sizing: border-box;
}

div.new_header_19 a {
   display: inline-block;
   vertical-align: top;
}

div.new_header_19 .fR a {
   position: relative;
   margin: 15px 10px 0;
   height: 12px;
   font-size: 13px;
   line-height: 12px;
   color: #666 !important;
}

div.new_header_19 .fR a:nth-child(1):after {
   content: "";
   position: absolute;
   top: 0;
   right: -10px;
   display: block;
   width: 1px;
   height: 12px;
   vertical-align: top;
   background: #b8b8b8;
}

.fL {
   padding-left: 33px;
}

div.new_header_19 a {
   display: inline-block;
   vertical-align: top;
}

div.new_header_19 .fL a {
   margin: 7px 9px 0;
}

div.new_header_19 .fL img {
   height: 26px;
}

div.new_header_19 .fL button.btn_more {
   position: static;
   margin: 5px 0 0 5px;
   padding: 0 8px;
   width: auto;
   height: 29px;
   border: 1px solid #c2c2c2;
   border-radius: 2px;
   box-sizing: border-box;
}

div.new_header_19 .fL button.btn_more span {
   display: inline-block;
   padding-right: 15px;
   font-weight: 600;
   font-size: 12px;
   line-height: 27px;
   color: #737373;
   background: url(../../images/btn_t_more.png) right center no-repeat;
}

.clear, .clear:after {
   content: "";
   display: block;
   clear: both;
}

/* 더보기 사이트  */
div.new_header_19 .pop_home {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   border-bottom: 3px solid #0092e0;
   background: #efefef;
   z-index: 200;
}

div.new_header_19 .pop_home h3 {
   margin: 0 6px;
   padding: 10px 0;
   width: 172px;
   text-align: center;
   font-size: 17px;
}

div.new_header_19>div {
   position: relative;
   margin: 0 auto;
   padding: 2px 10px 0;
   box-sizing: border-box;
}

div.new_header_19 .home_box {
   position: relative;
   margin: 0 auto;
   /* padding: 5px 0; */
   width: 1200px;
}

div.new_header_19 .home_box>div {
   padding: 10px 0;
}

div.new_header_19 h3 {
   display: inline-block;
   position: relative;
   padding: 0 25px 0 17px;
   vertical-align: top;
   font-weight: bold;
   font-size: 13px;
   line-height: 40px;
   color: #333;
}

div.new_header_19 .home_box p {
   display: inline-block;
   position: relative;
   margin: 10px 6px;
   width: 172px;
   height: 40px;
   vertical-align: top;
}

div.new_header_19 .home_box .btn_close {
   position: absolute;
   top: 0;
   right: 0;
   width: 63px;
   height: 32px;
   border: 1px solid #c2c2c2;
   box-sizing: border-box;
}

div.new_header_19 .home_box .btn_close span {
   display: inline-block;
   padding-right: 26px;
   font-weight: bold;
   font-size: 12px;
   color: #737373;
   background: url(../../images/btn_t_close.png) right center no-repeat;
}

div.new_header_19 .home_box a.btn_o strong {
   display: block;
   margin-top: 10px;
   font-size: 14px;
}

#header #nav .headNav {
   display: inline-block;
   color: #000;
   font-size: 18px;
   padding: 0px 0 0 28px;
   line-height: 30px;
}

#header #nav .headNav a {
   color: #000 !important;
}

#header #nav .headNav a.active {
   color: #4a8ac7 !important;
}

#header #nav .headNav a:hover {
   color: #76BBFD !important;
}

#header #nav li a.active {
   color: #29477d;
   border-bottom: 0 !important;
}

#header #nav>.head {
   position: absolute !important;
   left: 260px !important;
   top: 32px !important;
}

#header #nav li {
   display: inline-block;
   margin-left: 0px;
}

#header #nav li a {
   /* padding: 0px 20px 10px 20px !important; margin: 0px 20px 0px -20px; */
   border: 0px solid red;
}

#header #nav .headNav>.bidData {
   position: absolute;
   left: 152px;
   top: 50px;
}

#header .headBottom {
   height: 82px !important;
}

#header .headBottom .headGnb {
   position: absolute;
   left: 248px;
   top: 32px !important;
   z-index: 50;
}

#header .subNav>.contents_box>.subMenu {
   margin-left: 95px;
}

#header .headTop ul, #header .headTop li {
   float: right !important;
   margin: 4px 10px;
}

#header .headBottom .hamMenu, .search {
   top: 30px !important;
}

#header .headTop {
   height: 44px !important;
}
</style>
<script type="text/javascript" src="resources/js/common.js"></script>


<link rel="stylesheet" href="resources/css/joinFrm/joinFrm1.css" />
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm2.css" />

<form id='menuForm' action="#">
   <input type='hidden' name='MENU_CD' id='MENU_CD' value='' /> <input
      type='hidden' name='TOP_MENU_CD' id='TOP_MENU_CD' value='G1000' /> <input
      type='hidden' name='LEFT_MENU_CD' id='LEFT_MENU_CD' value='G1002' />
   <input type='hidden' name='PARENT_MENU_CD' id='PARENT_MENU_CD' value='' />
   <input type="hidden" name="sessionTimeChk" id="sessionTimeChk" value="" />
</form>

<script src="resources/js/cmm/ui_customer.js"></script>

<link rel="stylesheet" href="resources/css/sojin/style-FAQ.css" />

<script type="text/javascript">
   function doDisplay1() {
      var con = document.getElementById("a");
      if (con.style.display == 'none') {
         con.style.display = 'block';
      } else {
         con.style.display = 'none'
      }
   }
</script>

<script type="text/javascript">
   function doDisplay2() {
      var con = document.getElementById("a2");
      if (con.style.display == 'block') {
         con.style.display = 'none';
      } else {
         con.style.display = 'block'
      }
   }
</script>


<script type="text/javascript">
   function doDisplay3() {
      var con = document.getElementById("a3");
      if (con.style.display == 'block') {
         con.style.display = 'none';
      } else {
         con.style.display = 'block'
      }
   }
</script>


<script type="text/javascript">
   function doDisplay4() {
      var con = document.getElementById("a4");
      if (con.style.display == 'block') {
         con.style.display = 'none';
      } else {
         con.style.display = 'block'
      }
   }
</script>


</head>

<body>

	
	
   <header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>

	<div id="menuLeft" style="margin-top: 50px;">
				<!-- snb 시작 -->
				<dl id="left_nav">
					<dt class="">고객센터</dt>
					<dd>
						<a href="javascript:void(0)" 
							onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1001');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1001','http://localhost/controller/cuCenter');">고객센터
						</a>
					</dd>
					<dd>
						<a href="javascript:void(0)" class="on"
							onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1002');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1002','http://localhost/controller/FAQ');">자주찾는질문
						</a>
					</dd>
				</dl>
			</div>

   <div class="FAQ">

      <div class="main" style="padding-left: 20%;">
         <b>자주찾는질문</b>
      </div>

   </div>

   <div class="writing">

      <div class="akwsk">

         <div id="article">
            <a href="javascript:doDisplay1();">차량 반납 방법 알려주세요.</a>
         </div>
         <div id="a">
            <p>위 사항 중 한가지라도 처리되지 않아 반납이 지연되는 경우 반납실패 문자가 발송되며 안내에 따라 다시 한번
               반납처리를 해 주시면 됩니다.</p>
            <p>반납지연 시 대여요금+패널티가 추가로 발생되오니 문제발생 즉시 고객센터로 연락주시기 바랍니다.</p>
            <p>하기 반납 가능 조건을 확인 해 주세요 반납조건이 맞지 않을 경우 반납 실패 사유가 알림톡 또는 문자메시지를
               통해 사유가 발송됩니다. 정상적인 상태임에도 반납이 불가능 할 경우 번거로우시더라도
               고객센터(080-2000-3000)으로 연락 주시어 조치 방법에 대한 안내를 받아보시길 권유 드립니다.</p>
            <p>* 존 위치 확인 : 정상 위치 반납 준수 ㄴ 그린존 위치를 다시 한번 확인 해 주세요 (존에 따라,
               시작/반납 위치가 상이 할 수 있습니다)</p>
            <p>* 시동 상태 확인 : 시동 OFF 상태 ㄴ 가(반) 시동 상태에서는 반납불가</p>
            <p>* 도어 상태 : 차량문이 정상적으로 닫혀 있고 잠금된 상태 ㄴ 뒷문 + 트렁크 열림 상태 필수 확인 *
               충전기 연결 및 충전상태 (전기차에 한 함) ㄴ 전기차의 경우 차고지에 배치되어 있는 완속 충전기를 연결해주셔야 정상
               반납이 가능 합니다. + 개인용품 및 쓰레기 수거, 분실물 체크 + 반납처리 후 1~2분 내에 반납처리 완료 문자
               수신상태 확인</p>
         </div>
      
         <div id="article">
            <a href="javascript:doDisplay2();">차량에 주유는 어떻게 하나요?</a>
         </div>
         <div id="a2">
            <p id="red">차량 내 배치된 주유카드로 주유를 진행하고 있습니다.</p>
            <p>
               <mark>주유카드는 운전석 대쉬보드 왼쪽에 위치하고 있습니다.</mark>
            </p>

            <p>주유카드 사용 후에는 반드시 원래 위치로 삽입하여 주시기 바라며 분실/파손 시 별도의 페널티+발생 실비가
               부과될 수 있는 점 참고 부탁 드립니다.</p>

            <p>반드시 회사에서 지정한 차량에 배치된 주유카드를 통해 결제되어야 하며 다른 차량의 주유, 기타 비용을 결제 할
               수 없습니다.</p>

            <p>부득이한 사정으로 카에 배치된 주유카드를 이용하지 못할 경우, 주유 전 반드시 고객센터로 연락하여 회사측에
               허가를 받아야 합니다.</p>

            <p>회원 개인 카드/현금으로 결제된 주유비는 영수증 없는 경우 또는 결제 후 3개월이 초과한 경우 환불이 불가능
               합니다.</p>
         </div>
      
         <div id="article">
            <a href="javascript:doDisplay3();">사고 접수 과정 알려주세요.</a>
         </div>
         <div id="a3">
         <p id="red">사고 발생 즉시 고객센터(080-2000-3000)로 사고 접수를 진행 해주세요.</p>
 
<p>차량 및 기타 파손된 시설물이 있는 경우
소유자 연락처와 차량 번호를 확인 해주시고
차량,기물 파손 사진은 꼭 촬영 후 아래 경로를 통해 등록 부탁 드립니다.</p>


<p>* APP > 고객센터  > 사고접수 센터 > 사고차량 선택, 하기 내용기입
 * 사고일시
 * 사고경위
 * 사고사진</p>
 
<p>사고 발생 후 차량 운행은 안전을 위해 불가하며,
견인 처리 또는 그린존으로 반납 해주셔야 합니다.
사고 발생 시점부터 종료까지 회원 상태는 일시정지로
변경되며 차량 예약 및 이용이 불가능합니다. (사전예약 자동취소)</p>

<p>만약 사고 발생 후 고객센터 사고 신고 없이
상대방과 합의하시거나 현장을 떠나신 경우 
사고 면책 적용 및 상대방에 대한
보험 접수는 어려울 수 있으니 유의해 주시기 바랍니다.</p></div>
      
         <div id="article">
            <a href="javascript:doDisplay4();">분실물이 발생했을 때에는 어떻게 해야하나요?</a>
         </div>
         <div id="a4">
         <b>차량 반납이 완료된 이후 10분 간 "분실물 찾기" 스마트키를 통해 분실물 회수가 가능합니다.</b>


<p>- 경로 :
APP > 차량 반납 > 반납 화면 내 "분실물 찾기" 스마트키
APP > 메뉴 > 예약 확인 > 과거 내역 > 상세 내역 > "분실물 찾기" 스마트키</p>

<p>*  회원 상태가 미납/사고/부정 사용등으로 정지인 경우 분실물 찾기 스마트키 이용이 불가 합니다. (고객센터 연락 후 진행 필요)
*  10분이 경과되어 분실물 찾기 스마트키 비활성화 된 경우 직접 차량 예약 후 분실물을 회수 해주세요(예약 취소/환불 불가)
*  그린존에 방문하여 분실물 회수가 어려우신 경우 고객센터로 연락주시면 물품회수에 도움 드리겠습니다. (단, 발생 실비 청구)</p>


<p>이전 사용자의 분실물 습득 및 회수 시
분실물 크기의 따라 [보조석 서랍] or [트렁크] 에 보관 후
고객센터 or 1:1문의 게시판에 전달 주시길 바랍니다.</p>


<p id="red">[주의]
우리떠날카에서는 발생되는 분실 물품의 배상 책임이 없습니다.</p></div>
      
      </div>
   </div>




   <footer>
      <jsp:include page="footer.jsp"></jsp:include>
      <!--<div class="fancybox-placeholder" style="display: none;"></div>-->
   </footer>



</body>
</html>