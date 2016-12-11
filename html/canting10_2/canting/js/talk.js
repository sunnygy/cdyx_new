$(document).ready(function() {
	// 菜单
	$(".accordion-groupa").hover(function() {
		$(this).children('.accordion-body').show(300);
		$(this).addClass('accordionbody-active');
		$(this).children().children('.icon').addClass('ion-ios-arrow-down').removeClass('ion-ios-arrow-right');
		$(this).children().children().children('strong').addClass('color_bf');
	}, function() {
		$(this).children('.accordion-body').hide();
		$(this).removeClass('accordionbody-active');
		$(this).children().children('.icon').removeClass('ion-ios-arrow-down').addClass('ion-ios-arrow-right');
		$(this).children().children().children('strong').removeClass('color_bf');
	})

	var winh = $(document).height();
	// $(".sidebar").height(winh);

	// $(window).scroll(function() {
	//     var st = $(this).scrollTop();
	// 	var winss = winh + st;
	// 	$(".sidebar").height(winss);
	// });
	getSide();
	$(window).resize(function(event) {
		getSide();
	});

	$(".orderbox").hover(function() {
			$(this).children('i').css("background", "#fff");
			$(this).children('p').css("color", "#fff");
		}, function() {
			$(this).children('i').css("background", "#ffa240");
			$(this).children('p').css("color", "#ffa240");
		})
		// 显示时间
	setInterval(function() {
			showDay();
		}, 1)
		// 

	$(".table_mangment thead").find("input").click(function() {
		$(".table_mangment tbody").find("input").prop("checked", $(this).prop("checked"));
	})
	$(".menu_hot").find("img").click(function() {
		$(this).parent().parent().remove();
	})
	$(".btn-manage").click(function(event) {
		var co = $(this).css("color");
		$(this).css("color", co)
	});



})

function preview(file) {
	var prevDiv = document.getElementById('preview');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="smzj_img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function showDay() {
	var myDate = new Date();
	var $timeget = $("#timeget");
	var m = myDate.getMonth() + 1;
	var d = myDate.getDate();
	var h = myDate.getHours();
	var mt = myDate.getMinutes();
	var hapm;
	var monthArr = new Array("January", "February", "March", "April", "May", "June", "July",
		"August", "September", "October", "November", "December");
	for (var i = 1; i < monthArr.length + 1; i++) {
		if (m == i) {
			m = monthArr[i - 1];
		}
	}
	if (h >= 0 && h < 12) {
		hapm = 'AM';
	} else {
		hapm = 'PM';
	}
	if (mt < 10) {
		mt = '0' + mt;
	}
	var timeq = m + "," + d + "," + h + ":" + mt + hapm;
	$timeget.html(timeq);
}

function getSide() {
	var winw = $(window).width();
	if (winw < 1200) {
		$("#buttonright").show();
		$("#buttonright").click(function() {
			$(".sidebar").show();
			$(".sidebar").click(function() {
				$(this).hide();
			})
		})
	}
	if (winw > 1200) {
		$(".sidebar").show();
		$("#buttonright").click(function() {
			if ($(".sidebar").css("display") == 'none') {
				$(".sidebar").show();
				$(".page-wrapper").css("margin-left", "290px");
				$(".orderbox h3").css("margin-top", "20px");
			} else {
				$(".sidebar").hide();
				$(".page-wrapper").css("margin-left", "10px");
			}
			$(".orderbox h3").css("margin-top", "34px");
		})
	}
}