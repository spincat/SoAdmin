$(function(){

	var navClosed = $.cookie("navClosed");
	if(navClosed!=null){
		if(navClosed=="true"){
			$(".container").removeClass("toggler-on").addClass("toggler-on");
		}else if(navClosed=="false"){
			$(".container").removeClass("toggler-on");
		}
	}
	//左侧导航菜单图标切换
	$(".nav-li").click(function(){
		$(this).toggleClass("on");
		$(this).children("a").children(".fa.collapse").toggleClass("on");
	}).mouseenter(function(){
		if($(".container").hasClass("toggler-on"))
			$(this).addClass("hover");
	}).mouseleave(function(){
		if($(".container").hasClass("toggler-on"))
			$(this).removeClass("hover");
	});
	$("a[data-toggle='collapse']").click(function(){
		if($(".container").hasClass("toggler-on")){
			return false;
		}
	});
	$(".sidebar-toggler").click(function(){
		$(".container.main").toggleClass("toggler-on");
		if($("div.container").hasClass("toggler-on")){
			$.cookie("navClosed","true",{expires:30,path:'/;'});
		}else{
			$.cookie("navClosed","false",{expires:30,path:'/;'});
		}
	})
	$('.nav.collapse').on('show.bs.collapse', function () {
	  $('.nav.collapse.in').collapse('hide').parent('.nav-li').removeClass('on');
	})
	$('.collapse-switch i').click(function(){
		$(this).removeClass('on');
		$(this).siblings('i').addClass('on');
	})

})

function listenShortCut(clazz){
	$('.'+clazz).click(function(){
		elem=$(this);
		url = $(this).attr("url");
		method= $(this).attr("method");
		$.getJSON(url+"&method="+method, function(json){
			if(json.result){
				$(".bb-alert").find("span").html(json.msg);
				$(".bb-alert").fadeIn();
				
				setTimeout(function(){
					$(".bb-alert").fadeOut();
				},3000);
				setTimeout(function(){
					if(method=="add"){
						elem.attr("method","del")
						elem.attr("class","icon-minus");
					}else if (method=="del"){
						elem.attr("method","add")
						elem.attr("class","icon-plus");
					}
				},3000);
				
			}
		});
	});
}

function alertDismiss(clazz,sec){
	setTimeout(function(){
		$('.'+clazz).fadeOut();
	},sec*1000);
}

$.fn.serializeObject = function()
{
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

function trim(str){
	return str.replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '');
}


//计算数组交集
function array_inter(a, b)
{
	var ai=0, bi=0;
	var result = new Array();

	while( ai < a.length && bi < b.length )
	{
		if      (a[ai] < b[bi] ){ ai++; }
		else if (a[ai] > b[bi] ){ bi++; }
		else /* they're equal */
		{
			result.push(a[ai]);
			ai++;
			bi++;
		}
	}

	return result;
}


//计算数组差集
function array_diff(array1, array2) {
	var o = {};//转成hash可以减少运算量，数据量越大，优势越明显。
	for(var i = 0, len = array2.length; i < len; i++) {
		o[array2[i]] = true;
	}

	var result = [];
	for(i = 0, len = array1.length; i < len; i++) {
		var v = array1[i];
		if(o[v]) continue;
		result.push(v);
	}
	return result;
}

jQuery.cookie = function(name, value, options) {
	if (typeof value != 'undefined') {
		options = options || {};
		if (value === null) {
			value = '';
			options = $.extend({}, options);
			options.expires = -1;
		}
		var expires = '';
		if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
			var date;
			if (typeof options.expires == 'number') {
				date = new Date();
				date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
			} else {
				date = options.expires;
			}
			expires = '; expires=' + date.toUTCString();
		}
		var path = options.path ? '; path=' + (options.path) : '';
		var domain = options.domain ? '; domain=' + (options.domain) : '';
		var secure = options.secure ? '; secure' : '';
		document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
		} else {
			var cookieValue = null;
			if (document.cookie && document.cookie != '') {
			var cookies = document.cookie.split(';');
			for (var i = 0; i < cookies.length; i++) {
				var cookie = jQuery.trim(cookies[i]);
				if (cookie.substring(0, name.length + 1) == (name + '=')) {
					cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
					break;
				}
			}
		}
		return cookieValue;
	}
};
