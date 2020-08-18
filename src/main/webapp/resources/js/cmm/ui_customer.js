// JavaScript Document

$(document).ready(function(){
   $('#notice_area .notice_tab li a').on('click',function(){
       var thisNum = $('#notice_area .notice_tab li a').index(this)
       $('#notice_area .notice_tab li').removeClass('active')
       $(this).parent().addClass('active')
       $('#notice_area .notice_list>ul').hide()
       $('#notice_area .notice_list>ul').eq(thisNum).show()
       return false;
   })
   $('#left_nav>dd').each(function(){

       if($(this).find('ul').size()==0){
         $(this).find('a').eq(0).addClass('noneChild')
       }
   })

   $('#left_nav>dd>ul>li>a').each(function(){
       if($(this).hasClass('active')){
        $(this).parent().parent().show()
       }
   })
   $('#left_nav>dd>a').on('click',function(){
       $('#left_nav>dd>a').removeClass('active')
       $(this).addClass('active')
       $('#left_nav ul').each(function(){
            if($(this).prev().hasClass('active')){
                $(this).slideDown()
            } else{
                $(this).slideUp()
            }
       })
       return false;
   })
   $('.family_link .select_link a').on('click',function(){
       $('.link_list').slideToggle(200)
       return false;
   })
   $('.quick_menu>li').hover(function(){
       $(this).addClass('active')
   },function(){
       $(this).removeClass('active')
   })
   $('[data-role="tab_view"]').each(function(){
        var list = $(this);
        list.find('.btn').on('click',function(){
           var num = list.find('.btn').index(this)
           list.find('li').removeClass('active')
           $(this).parent().addClass('active')
           list.next().find($('[data-role="tab_content"]>li,[data-role="tab_content"]>div')).hide()
           list.next().find($('[data-role="tab_content"]>li,[data-role="tab_content"]>div')).eq(num).show()
           return false;
       })
   })
//   $('[data-role="tab_view"] li .btn').on('click',function(){
//        var num = $('[data-role="tab_view"] li .btn').index(this)
//       $('[data-role="tab_view"] li').removeClass('active')
//       $(this).parent().addClass('active')
//       $('[data-role="tab_content"]>li,[data-role="tab_content"]>div').hide()
//       $('[data-role="tab_content"]>li,[data-role="tab_content"]>div').eq(num).show()
//       return false;
//   })
   $('.guideArea .guideCon .closeCon').on('click',function(){
        $('.guideArea .guideCon .contents').hide()
        $('[data-role="tab_view"] li').removeClass('active')
        return false;
   })

   var tmpFunction = function(){
       var bgLayer = $('<div/>').attr('id','blockDiv').css({'width':'100%','height':'100%','background-color':'black','position': 'fixed','top':'0px'});
       $('body').append(bgLayer);
       bgLayer.fadeTo(0,0.5);

       bgLayer.click(function(){
           bgLayer.remove();
           $('body').css('position','relative');
           $('.subAllMenu .btn_close').click();
       });
   };

   $('.menu').on('click',function(){
	   if(!$(this).parent().hasClass("menuBlock")){
		   tmpFunction();
	       $('.subAllMenu').show();
	       $('body').css('position','fixed');
	       $('#header').mouseleave();//탑메뉴 닫기
//	       subNavMask.hide();

	       return false;
	   }
   });
   $('.subAllMenu .btn_all_down').on('click',function(){
       $('.subAllMenu').addClass('full');
       $('.subAllMenu .familyMenu').show();
       $('.subAllMenu .openAll').hide()
       $('.subAllMenu .moveArrow').show()
       $('.subAllMenu .btn_close.close_bottom').show()
       return false;
   })
   $('.subAllMenu .btn_all_up').on('click',function(){
       $('.subAllMenu').removeClass('full');
       $('.subAllMenu .familyMenu').not(":eq(0)").hide();
       $('.subAllMenu .openAll').show()
       $('.subAllMenu .moveArrow').hide()
       $('.subAllMenu .btn_close.close_bottom').hide()
       return false;
   })
   $('.subAllMenu .btn_close').on('click',function(){
       $('.subAllMenu').removeClass('full');
       $('.subAllMenu .familyMenu').hide();
       $('.subAllMenu .familyMenu').eq(0).show();
       $('.subAllMenu .openAll').show()
       $('.subAllMenu .moveArrow').hide()
       $('.subAllMenu .btn_close.close_bottom').hide()
       $('.subAllMenu').hide()

       $('body').css('position','relative');
       $(".familyMenu .menuList dd li.not-match").removeClass('not-match');
		$(".familyMenu .menuList dt").parent().show();
		$('.subAllMenu').removeAttr('data-prev-mode');
		$("#subAllMenuSearchKeyword").val('')

		$('#blockDiv').remove()
       return false;
   })
   $(".familyMenu .menuList dt a[data-click-go-first]").on('click',function(){
   	$(this).parent().next().find("a").eq(0).trigger('click');
   });



});
