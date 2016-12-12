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
		var menuCode =$(this).children("span").html();
		addMenu = "<strong class='col-md-10'>" + menuText + "</strong>"+"<img class='col-md-2' src='./img/delete.png'/>";
		$(".hselectmenu").find("strong:first-child").remove();
		$(".hselectmenu").find("img:first-child").remove();
		$(".hselectmenu").append(addMenu);
		$("#menuNum").val(menuCode);
		$(".hselectmenu").find('img').click(function(event) {
			$(this).prev().remove();
			$(this).remove();
			$("#menuNum").val("");
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
	$("#allmenu").click(function() {
		
		   var allmenuStyle=$(this).attr("style");		   
		   
		 
		
		if(allmenuStyle.indexOf("margin-top")>0){
				
				$(".allmenusd").css('margin-top',"");
				$(".allemncontent").show();
				
			
			}else{
					$(".allemncontent").hide();
					$(".allmenusd").css('margin-top', "36px");
				
			}
	
	})
	$(".btn-cance").click(function() {
		$(".hselectmenu").html('');
		$("#menuNum").val("");
		
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