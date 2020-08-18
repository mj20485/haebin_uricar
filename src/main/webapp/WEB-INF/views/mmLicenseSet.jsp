<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<html>
<head>
<title>우리떠날Car?</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content>
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/style.css?after">
<link rel="stylesheet" href="resources/css/fancybox/jquery.fancybox.css" media="all">
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet" href="resources/fancybox/source/jquery.fancybox.css?v=2.1.7" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.7"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet" href="resources/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet" href="resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

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

<body>
<header>
   <jsp:include page="header2.jsp"></jsp:include>
   </header>
   <div class="cmprofile">
      <h1>
         <strong>운전면허증 설정</strong>
      </h1>
      <p>우리떠날 Car?에서 사용중인 운전면허증 정보입니다.
      <p>운전면허증을 수정 또는 변경할 수 있습니다.
   </div>
   <br>
   <div class="acontents">
      <div class="box5">

         <h5>
            <strong>운전면허증 설정</strong>
         </h5>

      </div>

      <div class="box6">

         <table boder="" bgcolor="#FFFFFF" cellspacing="1">
            <FORM>
            <tr>
               <td>면허 종류</td>
               <td><input type="text" size="20" /></td>
            </tr>

            <tr>
               <td>면허증 갱신기간</td>
               <td><input type="text" size="20" /></td>
            </tr>
            <tr>
               <td>등록번호</td>
               <td><input type="text" size="20" /></td>
            </tr>
            <tr>
               <td>조건</td>
               <td><input type="text" size="20" /></td>
            </tr>



            </FORM>
         </table>
         <center>
         <button type="submit">수정취소</button>
         <button type="submit">수정완료</button>
         </center>
      </div>
   </div>

</body>
</html>