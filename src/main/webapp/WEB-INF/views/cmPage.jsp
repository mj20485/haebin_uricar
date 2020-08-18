<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업정보</title>
<link type="text/css" rel="stylesheet" href="resources/css/cmstyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/style.css">

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
<link type="text/css" rel="stylesheet" href="resources/css/Event/cmstyle.css">
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


</head>
<form id='menuForm' action="#">
   <input type='hidden' name='MENU_CD' id='MENU_CD' value='' /> <input
      type='hidden' name='TOP_MENU_CD' id='TOP_MENU_CD' value='G1000' /> <input
      type='hidden' name='LEFT_MENU_CD' id='LEFT_MENU_CD' value='G1002' />
   <input type='hidden' name='PARENT_MENU_CD' id='PARENT_MENU_CD' value='' />
   <input type="hidden" name="sessionTimeChk" id="sessionTimeChk" value="" />
</form>
<body>
   <header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>
   
   
   
   
      <div class="box8" style="width: 350px; height: 200px; border: 1px solid #BDBDBD; margin-top: 5%; margin-left: 5%; margin-bottom: 5%;">
         <img src="resources/images/cminfobox1.png">
         <button onclick="location.href='./cmProfile'">수정</button>
      </div>

      <div class="box9" style="width: 350px; height: 200px; border: 1px solid #BDBDBD; margin-top: 5%; margin-left: 5%; margin-bottom: 5%;">
         <img src="resources/images/cmcar.png">
         <button onclick="location.href='./carList'">차량관리</button>
      </div>
      

      <footer>
      <jsp:include page="footer.jsp"></jsp:include>
      <!--<div class="fancybox-placeholder" style="display: none;"></div>-->
   </footer>   
   
</body>

</html>