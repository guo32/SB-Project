function CheckUpdateBakery() {
	
	var bakeryId = document.getElementById("bakeryId");
	var name = document.getElementById("bakeryName");
	var city = document.getElementById("city");
	var address = document.getElementById("address");
	var number = document.getElementById("bakeryNumber");
	var open = document.getElementById("open");
	var close = document.getElementById("close");
	
	// 가게 코드 검사
	if(!check(/^bakery[0-9]{4}$/, bakeryId, "[가게 코드]\nbakery와 숫자 네자리를 조합하여 입력하세요.\n코드는 bakery로 시작해야만 합니다."))
		return false;
	
	// 가게명 검사
	if(name.value == "" || name.value == null) {
		alert("[가게명]\n가게명은 비워둘 수 없습니다.");
		name.select();
		name.focus();
		return false;
	}
	
	// 시도 검사
	if(city.value == "") {
		alert("[시도]\n시도를 선택해주세요.");
		city.focus();
		return false;
	}
	
	// 주소 검사
	if(address.value == "" || address.value == null) {
		alert("[주소]\n주소는 비워둘 수 없습니다.");
		address.select();
		address.focus();
		return false;
	}	
	
	// 여는 시간 검사
	if(!check(/^(AM|PM)\s(?:\d{1}|\d{2}):\d{2}$/, open, "[여는 시간]\n형식을 확인해주세요.\n입력 가능한 형식은 다음과 같습니다.\n1) AM 1:00\n2) AM 01:00\n3) PM 1:00\n4) PM 01:00\nAM은 오전, PM은 오후입니다."))
		return false;
		
	// 닫는 시간 검사
	if(!check(/^(AM|PM)\s(?:\d{1}|\d{2}):\d{2}$/, close, "[닫는 시간]\n형식을 확인해주세요.\n입력 가능한 형식은 다음과 같습니다.\n1) AM 1:00\n2) AM 01:00\n3) PM 1:00\n4) PM 01:00\nAM은 오전, PM은 오후입니다."))
		return false;	
	
	// 전화 번호 검사
	if(!check(/^(?:\d{2}|\d{3}|\d{4})-(?:\d{3}|\d{4})-\d{4}$/, number, "[전화 번호]\n형식을 확인해주세요.\n입력 가능한 형식은 다음과 같습니다.\n1) oo-ooo-oooo\n2) oo-oooo-oooo\n3) ooo-ooo-oooo\n4) ooo-oooo-oooo\n5) oooo-ooo-oooo\n6) oooo-oooo-oooo"))
		return false;	
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.updateBakery.submit();
}