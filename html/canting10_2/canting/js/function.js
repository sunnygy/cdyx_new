$(document).ready(function() {
	// 菜单
	var winh = $(document).height();
	$(".loginbg").height(winh);


	$(".language i").click(function() {
		$(this).addClass('active').siblings().removeClass('active');
	})

	$(".momule_list li").hover(function() {
		$(this).children('span').css("color", "#fff");
	}, function() {
		if ($(this).hasClass('active')) {
			$(this).children('span').css("color", "#fff");
		} else {
			$(this).children('span').css("color", "#b4b7c4");
		}
	})
	var addMenu;
	$(".momule_list").find('li').click(function(event) {
		var menuText = $(this).children('strong').children('i').html();
		addMenu = "<strong>" + menuText + "<img src='./img/delete.png'/></strong>";
		$(".hselectmenu").append(addMenu);
		$(".hselectmenu").find('img').click(function(event) {
			$(this).parent().remove();
		});
	});
	var i = 0;
	$(".btn-sure").click(function(event) {
		var znum = $(".momule_now").children('span').html();
		var ztime = $("#timeget").html();
		var mnum = $("#mnum").val();
		var mselectf = $("#mselectf").find('select').val();
		$(".toptable span").eq(0).children('i').html(znum);
		$(".toptable span").eq(1).children('i').html(ztime);
		$(".toptable span").eq(2).children('i').html(mnum);
		$(".toptable span").eq(3).children('i').html(mselectf);
		var tmenu = $("#ttnum").find('input').val();
		console.log(tmenu);
		var tmuentest = $(".hselectmenu").children('strong').html();
		var arr = new Array();
		arr = tmuentest.split('(');
		var strTable = "<tr>" + "<td class='cpr'>" + tmenu + "</td>" + "<td>" + arr[0] + "</td>" + "<td>" + 1 + "</td>" + "<td>" + '$6.50' + "</td>" + "<td>" + "<i class='iconall icontimetable'></i>" + "</td>" + "</tr>";
		$("#tshowtmenu").append(strTable);
		$("#tshowtmenu tr").each(function() {
			$(this).children().children('.icontimetable').click(function() {
				$(this).parent().parent().remove();
			})
		})
	});
	$("#checkout").click(function() {
		$(".allemncontent").hide();
		$(".allmenusd").css('margin-top', "36px");
	})
	$(".btn-cance").click(function() {
		$(".hselectmenu").html('');
	})
	var winh = $(document).height();
	$(".webg").height(winh - 179);
	$(".momule_list").height(winh - 163);
	$("#tshowtmenu tr").each(function() {
		$(this).children().children('.icontimetable').click(function() {
			$(this).parent().parent().remove();
		})
	})
	var scrTop;var momule_h;
	momule_h = $('.momule_content').height();
	console.log("momule_h:"+momule_h);
	$(".sidebar").height(winh);
	var momule_list = $(".momule_list").height();
	console.log("momule_list:"+momule_list);

	
	$(window).on('click',function(){
		momule_h = $('.momule_content').height();
		console.log(momule_h);
		if(momule_h > momule_list){
			// debugger;
			$(".sidebar").height(momule_h+200);
		}
	})

})