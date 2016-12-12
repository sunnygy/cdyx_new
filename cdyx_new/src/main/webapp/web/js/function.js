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
		var menuArry=new Array();
		$(this).children("input").each(function(i,n){
			menuArry[i]=$(n).val();
		});
		var hiddenStr="<input type='hidden'  value='"+menuArry[0]+"'/><input type='hidden'  value='"+menuArry[1]+"'/><input type='hidden'  value='"+menuCode+"'/>";
		addMenu = "<div class='hselectmenu pull-right row'><strong class='col-md-8'>" + menuText + "</strong><li class='col-md-2' '>  份数:"+$("#menuNum").val()+"</li>"+"<img class='col-md-2' src='/web/img/delete.png'/>"+hiddenStr+"</div>";
		$("#choosed").append(addMenu);
		$("#menuCode").val(menuCode);
		$(".hselectmenu").find('img').click(function(event) {
			$(this).parent().remove()
			$("#menuCode").val("");
		});
	});
	var i = 0;
	$(".btn-sure").click(function(event) {
		/*var znum = $(".momule_now").children('span').html();
		var ztime = $("#timeget").html();
		var mnum = $("#mnum").val();
		var mselectf = $("#mselectf").find('select').val();
		var tmenu = $("#ttnum").find('input').val();
		var tmuentest = $(".hselectmenu").children('strong').html();
		var arr = new Array();
		arr = tmuentest.split('(');*/
		$(".hselectmenu").each(function(i,n){

			var inputChildren=$(n).children("input");

			var currentMenuId=$(inputChildren[0]).val();
			var currentMenuPrice=$(inputChildren[1]).val();
			var currentMenuCode=$(inputChildren[2]).val();
		    var memuText=$(n).children("strong").html();
			var menuNum=$(n).children("li").html();
			var arrTemp = new Array();
			arrTemp=menuNum.split(":");
			var strTable = "<tr>" + "<td class='cpr'>" +currentMenuCode + "</td>" + "<td>" +memuText+ "</td>" + "<td>" + arrTemp[1] + "</td>" + "<td>" + '$'+parseFloat(currentMenuPrice).toFixed(2)+ "</td>" + "<td>" + "<i class='iconall icontimetable'></i>" + "</td>" + "</tr>";
			$("#tshowtmenu").append(strTable);

		});


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

	});
	$(".btn-cance").click(function() {
		$(".hselectmenu").html('');
		$("#menuCode").val("");

	});
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

	$(".sidebar").height(winh);
	var momule_list = $(".momule_list").height();


	
	$(window).on('click',function(){
		momule_h = $('.momule_content').height();
		if(momule_h > momule_list){
			// debugger;
			$(".sidebar").height(momule_h+200);
		}
	})

})