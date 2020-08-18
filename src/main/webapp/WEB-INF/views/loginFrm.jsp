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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta property="og:type" content="website">
<meta property="og:title" content="[우리떠날CAR: 로그인]">
<meta property="og:description"
   content="안전한 로그인을 위해 주소창의 URL과 자물쇠 마크를 확인하세요!">
<meta property="og:image"
   content="https://ssl.pstatic.net/sstatic/search/common/og_v3.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="1200">
<title>우리떠날Car:로그인</title>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet"
   href="resources/fancybox/source/jquery.fancybox.css" media="all">

<link rel="stylesheet" type="text/css"
   href="resources/css/loginFrm/style.css">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   var msg = "${msg}";
   console.log(msg);
   if(msg != ""){
      alert(msg);
      location.reload(true);
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
</head>
<body class="chrome">
   <div class="theme_txt" id="theme_txt_message">
      <p>
         <strong>안전한 우리떠날Car? 로그인을 위해 주소창의 URL과 자물쇠 마크를 확인하세요!</strong>
      </p>
   </div>
   <div id="wrap">
      <div id="u_skip">
         <a href="/" id="u_skip_anchor"><span>홈으로 바로가기</span></a>
      </div>
      <!-- header -->
      <a href="./"><img src="resources/images/logoR.png" style="width: 20%;
    height: 25%;
    margin-left: 40%;
    margin-top: 5%;"></a>
      <div id="container">
         <!-- content -->
         <div id="content">
            <div class="title" aria-live="assertive">
               <p></p>
            </div>
            <form id="frmNIDLogin" name="frmNIDLogin" target="_top"
               AUTOCOMPLETE="off" action="access" method="post">
               <input type="hidden" id="localechange" name="localechange" value="">
               <input type="hidden" name="encpw" id="encpw" value=""> <input
                  type="hidden" name="enctp" id="enctp" value="1"> <input
                  type="hidden" name="svctype" id="svctype" value="1"> <input
                  type="hidden" name="smart_LEVEL" id="smart_LEVEL" value="1">
               <input type="hidden" name="bvsd" id="bvsd" value=""> <input
                  type="hidden" name="encnm" id="encnm" value=""> <input
                  type="hidden" name="locale" id="locale" value="ko_KR"> <input
                  type="hidden" name="url" id="url"
                  value="https://localhost/controller/loginFrm">

               <fieldset class="login_form">
                  <legend class="blind">로그인</legend>
                  <div class="id_area">
                     <div class="input_row" id="id_area">
                        <span class="input_box"> <label for="id"
                           id="label_id_area" class="lbl" style="display:block;"></label> 
                           <input type="text" id="id" name="mid" accesskey="L" placeholder="아이디" class="int"
                           maxlength="41" value="">
                        </span>
                     </div>
                     <div class="error" id="err_empty_id" style="display: none"
                        aria-live="assertive"></div>
                  </div>
                  <div class="pw_area">
                     <div class="input_row" id="pw_area">
                        <span class="input_box"> <label for="pw"
                           id="label_pw_area" class="lbl"></label> <input
                           type="password" id="pw" name="password" placeholder="비밀번호"
                           class="int" maxlength="16">
                        </span>
                        <div class="ly_v2" id="err_capslock" style="display: none;">
                           <div class="ly_box">
                              <p>
                                 <strong>Caps Lock</strong>이 켜져 있습니다.
                              </p>
                           </div>
                           <span class="sp ly_point"></span>
                        </div>
                     </div>
                     <div class="error" id="err_empty_pw" style="display: none"
                        aria-live="assertive"></div>
                  </div>

                  <input type="submit" title="로그인" alt="로그인" value="로그인"
                     class="btn_global" id="log.login">
                     
                  <a href="./finding_id">아이디찾기</a>
                  <a href="./finding_pw">비밀번호찾기</a>
               </fieldset>
            </form>
         </div>
      </div>
      <!-- footer -->
      <footer>
         <jsp:include page="footer.jsp"></jsp:include>
         <!--<div class="fancybox-placeholder" style="display: none;"></div>-->
      </footer>
      <!-- //footer -->
   </div>
   <input type="hidden" id="nclicks_nsc" name="nclicks_nsc"
      value="nid.login_kr">
   <input type="hidden" id="nid_buk" name="nid_buk" value="exist">
   <input type="hidden" id="ncaptchaSplit" name="ncaptchaSplit"
      value="none">
   <input type="hidden" id="id_error_msg" name="id_error_msg"
      value="아이디를 입력해주세요.">
   <input type="hidden" id="pw_error_msg" name="pw_error_msg"
      value="비밀번호를 입력해주세요.">
   <input type="hidden" id="locale" name="locale" value="ko_KR">
   <input type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
   <script type="text/javascript"
      src="resources/js/loginFrm/bvsd.1.3.4.min.js"></script>
   <script type="text/javascript"
      src="resources/js/loginFrm/common200417.js"></script>
   <script type="text/javascript"
      src="resources/js/loginFrm/default200417.js"></script>
   <div id="nv_stat" style="display: none;">20</div>
</body>
</html>