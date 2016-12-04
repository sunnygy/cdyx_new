$(document).ready(function(){
	// 菜单
	var winh = $(document).height();
	$(".loginbg").height(winh);
	// $(window).resize(function() {
	// 	var winh = $(document).height();
	// 	$(".loginbg").height(winh);
	// });

	$(".language i").click(function(){
		$(this).addClass('active').siblings().removeClass('active');
	})
})

