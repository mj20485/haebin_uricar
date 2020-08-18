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
<meta charset="UTF-8">
<title>우리떠날Car? 쿠폰</title>
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
<link type="text/css" rel="stylesheet" href="resources/css/Event/cmstyle.css">
<link rel="stylesheet" href="resources/css/footer.css" />
<script type="text/javascript">
   $(document).ready(function() {
      var chk = "${check}";

      if (chk == "2") {
         alert("글 등록 성공!");
         location.reload(true);
      }
      if (chk == "3") {
         alert("글 삭제 성공!");
         location.reload(true);
      }

      var name = "${mb.name}";
      if (name != "") {
         $('#name').html(name + '님');
         $('.suc').css('display', 'block');
         $('.bef').css('display', 'none');
      }
      if (name == "") {
         $('.suc').css('display', 'none');
         $('.bef').css('display', 'block');
      }
   });
</script>
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

<script type="text/javascript" src="resources/js/common.js"></script>
<form id='menuForm' action="#">
   <input type='hidden' name='MENU_CD' id='MENU_CD' value='' /> <input
      type='hidden' name='TOP_MENU_CD' id='TOP_MENU_CD' value='G1000' /> <input
      type='hidden' name='LEFT_MENU_CD' id='LEFT_MENU_CD' value='G1002' />
   <input type='hidden' name='PARENT_MENU_CD' id='PARENT_MENU_CD' value='' />
   <input type="hidden" name="sessionTimeChk" id="sessionTimeChk" value="" />
</form>
</head>
<body>
<header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>
   <div id="menuLeft">
            <!-- snb 시작 -->
            <dl id="left_nav" style="margin-top: 100px;">
               <dt class="">이벤트 / 쿠폰</dt>
               <dd>
                  <a href="javascript:void(0)" 
                     onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1001');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1001','http://localhost/controller/NowEventList');">이벤트
                  </a>
               </dd>
               <dd>
                  <a href="javascript:void(0)" class="on"
                     onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1002');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1002','http://localhost/controller/Coupon');">쿠폰
                  </a>
               </dd>
               
            </dl>
         </div>
   <section>
   <img src="resources/images/coupon.jpg" style="margin-left: 32%; margin-top: -17%; margin-bottom: 5%;">
</section>
<input type="submit" value="쿠폰받기" style="margin-left: 50%; margin-bottom: 5%; background-color: #004982; color:white;">
<footer>
      <jsp:include page="footer.jsp"></jsp:include>
      <!--<div class="fancybox-placeholder" style="display: none;"></div>-->
   </footer>
</body>
</html>