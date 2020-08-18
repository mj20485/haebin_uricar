/* inner html 을 위한 함수 변경 momenti */
$(document).on('click','.accordion',function(e){
	e.preventDefault();
	$(this).toggleClass('active');

	var panel = $(this).next();
	if ( $(this).hasClass('active') ) {
		panel.slideDown(200);
		$(this).children('span').addClass('chg');
	} else {
		panel.slideUp(200);
		$(this).children('span').removeClass('chg');
	}
});
