//콤마찍어주기
function addComma(n) {
 if(isNaN(n)){return 0;}
  var reg = /(^[+-]?\d+)(\d{3})/;   
  n += '';
  while (reg.test(n))
    n = n.replace(reg, '$1' + ',' + '$2');
  return n;
}

//특수문자 입력 방지
function IsSpec(checkStr) {
	var checkOK = "!#^*'`~☆★@$.%.&()+,-.../...........:.;[{.<>\|";

	for (i = 0;  i < checkStr.length;  i++) {
		ch = checkStr.charAt(i);
		for (j = 0;  j < checkOK.length;  j++)
			if (ch == checkOK.charAt(j)) {
				return (false);
				break;
			}					
	}
	return (true);
}

//바이트 길이 리턴
function getByteLength( str ){
    var len = 0;
    if( trim(str) == 0 ) return 0;
    if( null == str ) return 0;
    for( index = 0 ; index < str.length ; index++, len++ )
    {
        if( escape( str.substring( index, index + 1 ) ).length == 6 ) len++;
    }
    return len;
}

//좌우공백제거
function trim(str) {
	var count = str.length;
	var len = count;
	var st = 0;

	while ((st < len) && (str.charAt(st) <= ' ')) {
		st++;
	}
	while ((st < len) && (str.charAt(len - 1) <= ' ')) {
		len--;
	}

	return ((st > 0) || (len < count)) ? str.substring(st, len) : str ;
}


function onlyNumberInput() // 숫자만 입력 가능 (onKeyDown 이벤트)
{
	var code = window.event.keyCode;
	if ((code > 32 && code < 48) || (code > 57 && code < 65) || (code > 90 && code < 97) || (code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46){
		window.event.returnValue = true;
		return;
	}
	window.event.returnValue = false;
}

function formCheckValidation(form, formName, minLength, maxLength)
{
	
	
	form.value = trim(form.value);
	var formValueLength = getByteLength(form.value);

	//alert("입력폼길이 : " + formValueLength + "\n최대길이 : " + maxLength);
	if(minLength>0){
		if(formValueLength < minLength){
			alert(formName + "을(를) 입력해 주시기 바랍니다.");
			return false;
		}
	}	
	
	//alert("입력폼길이 : " + formValueLength + "\n최대길이 : " + maxLength);
	if(formValueLength > maxLength){
		alert("'"+formName + "' 을(를) (영문기준)최대 " + maxLength + "자, (한글기준)최대 "+ (parseInt(maxLength)/2) +"자 까지 입력 하실 수 있습니다.");
		form.select();
		return false;
	}
	
	return true;
}


function formCheckValidation2(value, formName, minLength, maxLength)
{
	
	
	//form.value = trim(form.value);
	var formValueLength = getByteLength(value);

	//alert("입력폼길이 : " + formValueLength + "\n최대길이 : " + maxLength);
	if(minLength>0){
		if(formValueLength < minLength){
			alert(formName + "항목은(는) 반드시 입력하셔야 합니다.");
			return false;
		}
	}	
	
	//alert("입력폼길이 : " + formValueLength + "\n최대길이 : " + maxLength);
	if(formValueLength > maxLength){
		alert("'"+formName + "' 항목은(는) (영문기준)최대 " + maxLength + "자, (한글기준)최대 "+ (parseInt(maxLength)/2) +"자 까지 입력하실수 있습니다.");
		//form.select();
		return false;
	}
	
	return true;
}

function chr_byte(chr){
    if(escape(chr).length > 4)      return 2;
    else                            return 1;
}

function cutStr(str, limit){
    var tmpStr = str;
    var byte_count = 0;
    var len = str.length;
    var dot = "";
    
    for(i=0; i<len; i++){
        byte_count += chr_byte(str.charAt(i)); 
        if(byte_count == limit-1){
            if(chr_byte(str.charAt(i+1)) == 2){
                tmpStr = str.substring(0,i+1);
                dot = "...";
            }
            else {
                if(i+2 != len) dot = "...";
                tmpStr = str.substring(0,i+2);
            }
            break;
        }
        else if(byte_count == limit){
            if(i+1 != len) dot = "...";
            tmpStr = str.substring(0,i+1);
            break;
        }
    }
    
    //return (tmpStr+dot);
    return tmpStr;
}

function setCookie(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ today.toGMTString() + ";";
}

// 쿠키구하기
var is_pop = "";
function getCookie(name) {
	cookie = document.cookie;
	name = name + "=";
	idx = cookie.indexOf(name);
	if (cookie && idx >= 0) {

		tmp = cookie.substring(idx, cookie.length);
		deli = tmp.indexOf(";");
		if (deli > 0) {
			return tmp.substring(name.length, deli);
			//is_pop = tmp.substring(name.length, deli);
		} else {
			return tmp.substring(name.length);
			//is_pop = tmp.substring(name.length);
		}
	}
	//alert(is_pop);
}



//***************************************************************
//영문자인지 확인한다.
//***************************************************************

function isAlpha(val) {
	var keyword = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	var len = val.length;
	for (i = 0; i < len; i++) {
		if (keyword.indexOf(val.substring(i, i + 1).toUpperCase()) < 0) {
			return false;
		}
	}
	return true;
}

//***************************************************************
//영문자 및 숫자인지 확인한다.
//***************************************************************

function isAlphaNumeric(value) {
	var keyword = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	var len = value.length;
	for (i = 0; i < len; i++) {
		if (keyword.indexOf(value.substring(i, i + 1)) < 0) {
			return false;
		}
	}
	return true;
}

//***************************************************************
//영문자소문자 및 숫자인지 확인한다.
//***************************************************************

function isAlphaLowerNumeric(value) {
	var keyword = "0123456789abcdefghijklmnopqrstuvwxyz";

	for (var inx = 0; inx < value.length; inx++) {
    if (keyword.indexOf(value.charAt(inx)) != -1)
        return true;
 }
 return false;
}

//***************************************************************
//정수값인지 확인한다.
//***************************************************************

function isNumber(numberValue) {
	for (i = 0; i < numberValue.length; i++) {
		str = numberValue.charCodeAt(i);
		if (str < 48 || str > 57)
			return false;
	}
	return true;
}

//***************************************************************
//특수문자를 포함하는지 확인한다.
//***************************************************************

function containsSpecial(val) {
	var special = "`~!@#$%^&*()-_=+\\|[]{};:'\"<>,./?";

	for (var i=0; i < val.length; i++) {
    if (special.indexOf(val.charAt(i)) > -1) {
			return true;
	   } else {
			continue;
	   }
 }
 return false;
}

//***************************************************************
//공백문자를 포함하는지 확인한다.
//***************************************************************

function containsSpace(value) {
	var blank_pattern = /[\s]/g;
	if (blank_pattern.test(value)) {
		return true;
	} else {
		return false;
	}
}

//***************************************************************
//영문자, 숫자, 특수기호로만 구성되는지 확인한다.
//***************************************************************

function validPassword(val) {
	var valid = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-_=+\\|[]{};:'\"<>,./?";

	for (i = 0; i < val.length; i++) {
		if (valid.indexOf(val.charAt(i)) == -1) {
			return false;
		}
	}
	return true;
}

//***************************************************************
//일부 특수기호 입력 제한
//***************************************************************

function validPassword2(val) {
	var valid = "()<>";

	for (i = 0; i < val.length; i++) {
		if (valid.indexOf(val.charAt(i)) > -1) {
			return false;
		}
	}
	return true;
}

//***************************************************************
//정수값을 포함하는지 확인한다.
//***************************************************************

function includeNumber(numberValue) {
	var flag = false;
	for (i = 0; i < numberValue.length; i++) {
		str = numberValue.charCodeAt(i);
		if (str >= 48 && str <= 57) {
			flag = true;
		}
	}
	return flag;
}

//***************************************************************
//영문자를 포함하는지 확인한다.
//***************************************************************

function includeAlpha(val) {
	var flag = false;
	var keyword = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	var len = val.length;
	for (i = 0; i < len; i++) {
		if (keyword.indexOf(val.substring(i, i + 1).toUpperCase()) > -1) {
			flag = true;
		}
	}
	return flag;
}