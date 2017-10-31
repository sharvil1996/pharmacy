$(".hover-dropdown").mouseenter(function(){
	openHoverDropdown($(this));
}).mouseleave(function(){
	closeHoverDropdown($(this));
});
function openHoverDropdown(target){
	target.children(".hover-dropdown-menu").css({"opacity":"0","top":"180%"});
	target.children(".hover-dropdown-menu").css({"display":"inline-block"});
	setTimeout(function(){
		target.children(".hover-dropdown-menu").css({"opacity":"1","top":"100%"});
	},50);
}
function closeHoverDropdown(target){
	target.children(".hover-dropdown-menu").css({"opacity":"0","top":"180%"});
	setTimeout(function(){
		target.children(".hover-dropdown-menu").css({"display":"none"});
	},300);
}
$(".menubutton").click(function(){
	$(".mobilemenu").addClass("open");
	$("body").css("overflow","hidden");
});
$(".mobilemenu .closebutton").click(function(){
	$(".mobilemenu").removeClass("open");
	$("body").css("overflow","auto");
});
$(".dropdown-button").mouseenter(function(){
	target=$($(this).attr("target"));
	target.css("display","block");
	setTimeout(function(){
		target.css("opacity","1");
	},50);
}).mouseleave(function(){
	target=$($(this).attr("target"));
	setTimeout(function(){
			if(!target.hasClass("in")){
			target.css("opacity","0");
			setTimeout(function(){
				target.css("display","none");
			},350);
		}
	},300);
});
$("body").on("mouseenter",".container-dropdown-menu",function(){
	target=$(this);
	target.addClass("in");
	target.css("display","block");
	setTimeout(function(){
		target.css("opacity","1");
	},50);
}).on("mouseleave",".container-dropdown-menu",function(){
	target=$(this);
	target.removeClass("in");
	setTimeout(function(){
		target.css("opacity","0");
		setTimeout(function(){
			target.css("display","none");
		},350);
	},300);
})
$(".ratingBlock.input .item").mouseenter(function(){
	var ind=$(this).index()+1;
	$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/stare.svg");
	$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/stare.svg");
	$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/stare.svg");
	$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/stare.svg");
	$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");
	$(this).children("img").attr("src","imgs/starf.svg");
	if(ind==2){
		$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
	}
	if(ind==3){
		$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
	}
	if(ind==4){
		$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/starf.svg");
	}
	if(ind==5){
		$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/starf.svg");
		$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/starf.svg");
	}
}).mouseleave(function(){
	if($(this).siblings("input").val()=="0"||$(this).siblings("input").val()==""){
		$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/stare.svg");
		$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/stare.svg");
		$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/stare.svg");
		$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/stare.svg");
		$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");
	}
	else{
		var val=$(this).siblings("input").val();
		if(val==1){
			$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");		
		}
		if(val==2){
			$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");		
		}
		if(val==3){
			$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/stare.svg");
			$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");		
		}
		if(val==4){
			$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/stare.svg");		
		}
		if(val==5){
			$(this).parent().children(".item:nth-child(1)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(2)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(3)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(4)").children("img").attr("src","imgs/starf.svg");
			$(this).parent().children(".item:nth-child(5)").children("img").attr("src","imgs/starf.svg");		
		}
	}
}).click(function(){
	var ind=$(this).index()+1;
	$(this).siblings("input").val(ind);
});
if($(".ratingBlock")[0]){
	$(".ratingBlock").each(function(){
		if(!$(this).hasClass("input")){
			var value=$(this).attr("value");
			for(var i=0;i<value;i++){
				$(this).append("<span class='item'><img src='imgs/starf.svg'/></span>");
			}
			for(var i=value;i<5;i++){
				$(this).append("<span class='item'><img src='imgs/stare.svg'/></span>");
			}
		}
	});
}
function callAjax(url, executor) {
    $.ajax({
        url: url,
        success: function (data) {
            executor(data);
        }
    });
}