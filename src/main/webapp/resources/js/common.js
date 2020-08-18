function ecatalog(docu, kd, dir, resize){
	var x = screen.width;
	var y = screen.height;
	var wname = "ecatalog";

	if(kd == "fixed"){
		x = 1024;
		y = 768;
		wname = "fixed_ecatalog";
	}
	else if(screen.width > 2880 || screen.height > 2880){
		x = 2880;
		y = 2880;
	}

	x = x - 10;
	if(navigator.userAgent.indexOf("Chrome") == -1){
		y = y - 58;
	}
	else{
		y = y - 88;
	}

	if(resize == undefined || resize == "") resize = "yes";

	property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=" + resize + ",scrollbars=no,copyhistory=no,";
	property += "width=" + x + ",height=" + y + ",left=" + 0 + ",top=" + 0;

	if(docu == "/") docu = "";
	ecawin = window.open(docu+"/ecatalog.html?Dir=", wname, property);
}
function get_divHtml(w, h, vars, alternate){
	var s = "";
	var addvars = "&stgw="+w+"&stgh="+h;
	var classid = "";

	if(navigator.appName.indexOf("Microsoft") != -1){
		var ver = getInternetExplorerVersion();
		if(ver < 10) classid = "classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\"";
	}

	s = "<object id=\"cataSwf\" "+classid+" type=\"application/x-shockwave-flash\" data=\"main.swf\" standby=\"catalog\" width=\"100%\" height=\"100%\">\n";
	s += "<param name=\"movie\" value=\"main.swf\">\n";
	s += "<param name=\"FlashVars\" value=\""+vars+addvars+"\">\n";
	s += "<param name=\"quality\" value=\"high\">\n";
	s += "<param name=\"bgcolor\" value=\"#FFFFFF\">\n";
	s += "<param name=\"allowScriptAccess\" value=\"always\">\n";
	s += "<param name=\"allowFullScreen\" value=\"true\">\n";
	s += alternate;
	s += "</object>\n";
	return s;
}
function getInternetExplorerVersion() {
	var rv = -1;
	if(navigator.appName == 'Microsoft Internet Explorer'){
		var ua = navigator.userAgent;
		var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
		if(re.exec(ua) != null)
		rv = parseFloat(RegExp.$1);
	}
	return rv;
} 
function newWindow(winSet,docu,width,height,left,top,winname){
	if(winSet == 1)
	    property = "toolbar=yes,location=no,directories=no,status=yes,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";
	else if(winSet == 2)
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no,";
	else if(winSet == 3)
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";

	property += "width=" + width +",height=" + height + ",left=" + left + ",top=" + top;
	return window.open(docu,winname,property);
}

function newLink(winSet, width, height, docu){		// link from swf
	if(winSet == 1){
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no,";
		property += "width=" + width +", height=" + height + ", left=1, top=1";
		window.open(docu, '', property);
	}
	else{	
		property = "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes,copyhistory=no,";
		property += "width=" + width +", height=" + height + ", left=1, top=1";
		window.open(docu, '', property);
	}
}

function simpleLink(docu, kd){
	if(kd == 1){
		window.location = docu;
	}
	else if(kd == 2){
		parent.location = docu;
	}
	else if(kd == 3){
		window.open(docu, '');
	}
	else if(kd == 4){
		opener.location = docu;
	}
}

function trimVal(str){
	if(str == "") return "";

	var strsum = "";
	var len = str.length;
	for(var i = 0;i < len;i++){
		var Temp = str.charAt(i);
		if(Temp != ' ' && Temp != '\n' && Temp != '\r')
			strsum += Temp;
	}

	return strsum;
}

function isNotnum(str){
	var len = str.length;
	for(var i = 0;i < len;i++){
		var Jstr = str.charAt(i);
		if(Jstr < "0" || Jstr > "9") return true;
	}
	return false;
}
