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

<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<title>우리떠날Car? 예약</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet"
   href="resources/fancybox/source/jquery.fancybox.css" media="all">
<link rel="stylesheet" href="resources/css/sojin/style-reserv.css">


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
<link rel="stylesheet" href="resources/css/reserv.css" />

<style type="text/css">
#result {
   float: left;
}


</style>
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

<script type="text/javascript">

   $(function (){
      $(".search").click(function (){
        $("#result").toggle();
     });
   });
</script>

</head>
<body>
   <header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>

   <section class="s1">
   <div class="carbox">
   <br><br>
      <dt class="r1">예약하기</dt><br><br>
        <div class="list">
            <tr>
            <select id="carSel">
               <td>차량 목록 <c:forEach var="citem" items="${rcList}">
                     
                       <!-- <option value="${citem.car_type}">${citem.car_type}</option>  -->
                       <option value="${citem.zone}">${citem.zone}</option>
                    </td>
                  </c:forEach>
                   </select>
               
            </tr><br><br>
            <div class="button-container">
         <!-- <a href="#pop-inquiry1" class="fancybox" style="width: 240px;">검색하기</a> -->
         <p id="search" href="#pop-inquiry" class="fancybox">검색하기</p>
      </div>
         </div>
      </div>

      
      <!--  <div id="sresult"> -->
      <div id="pop-inquiry" style="display: none;">
         <div class="pop-cont">
            <h3>차량 목록</h3>
            <div class="title-row" id="sresult"></div>
            <div class="write">
               <div class="paging">${paging}</div>
            </div>
         </div>
      </div>

   </section>
   <%-- <div id="pop-inquiry1" style="display: none;">
      
         <div class="title-row" id="result">
            <div id="result" class="t-no p-10">차량 번호</div>
            <div id="result" class="t-title p-30">차종</div>
            <div id="result" class="t-name p-15">제공회사</div>
            <div id="result" class="t-date p-30">위치</div>
            <div id="result" class="t-rent p-30">차량 가격</div>
         </div>
         <c:forEach var="citem" items="${rclist}">
            <div id="result" class="t-no p-10">${citem.car_num}</div>
            <div id="result" class="t-title p-30">${citem.car_type}</div>
            <div id="result" class="t-name p-15">${citem.car_cid}</div>
            <div id="result" class="t-date p-30">${citem.zone}</div>
            <div id="result" class="t-rent p-30">${citem.rent_amt}</div>
         </c:forEach>
         <div class="write">
            <div class="paging">${paging}</div>
         </div> --%>
         <!-- <div class="button-container">
            <input type="submit" value="차량 예약">
         </div> -->
      <!-- </div>
   </div> -->
   <footer>
      <jsp:include page="footer.jsp"></jsp:include>
      <!--<div class="fancybox-placeholder" style="display: none;"></div>-->
   </footer>

</body>
<script type="text/javascript">

   function openZipSearch() {
      new daum.Postcode({
         oncomplete : function(data) {
            $('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
            $('[name=zone]').val(data.address);
            $('[name=zone]').val(data.buildingName);
         }
      }).open();
   }

   $('#search').on('click', function() {
      var sel = $('#carSel').val();
      console.log(sel);

      var dataObj = {
         "zone" : sel
      };
      console.log(dataObj);

      $.ajax({

         url : "typeSearch",
         type : "post",
         data : dataObj,
         dataType: "json",
         success : function(data) {
            console.log(data);
            var str = //'<div class="title-row" id="result">'+
            '<div class="all2">'+	
            '<ul class="aall">'+
               '<li id="result" class="t-no p-10">차량 번호</li>'+
               '<li id="result" class="t-title p-20">차종</li>'+
               '<li id="result" class="t-name p-30">제공회사</li>'+
               '<li id="result" class="t-date p-40">위치</li>'+
               '<li id="result" class="t-rent p-50">차량 가격</li>'+
               '<li id="result" class="t-rent p-50">운행가격(km)</li>'+
               '</ul>'+ '</div>' ;
            var slist=data.sList;
            //var carNum = slist[0].car_num;
            //console.log(carNum);
            
            for(var i = 0; i < slist.length; i++){
               str += 
            	   '<div class="2all2">'+
            	   '<ul class="2all">'+
            	   '<li id="result" class="btn t-no p-10">'+slist[i].car_num+'</li>'+
                  '<li id="result" class="t-title p-20">'+slist[i].car_type+'</li>'+
                  '<li id="result" class="t-name p-30">'+slist[i].cid+'</li>'+
                  '<li id="result" class="t-date p-40">'+slist[i].zone+'</li>'+
                  '<li id="result" class="t-rent p-50">'+slist[i].rent_amt+'</li>'+
                  '<li id="result" class="t-rent p-50">'+slist[i].drive_amt+'</li>'+
                  '</ul>'+
                  '</div>';
            }
            
            $('#sresult').html(str);
         },
         error : function(error) {
            console.log(error);
         }
      });
      
      $(document).on('click','.btn', function(){
         var cont = $(this).text();
         location.href="./reservcar?car_num="+cont;
         console.log(cont);
      });
   });
</script>
</html>


