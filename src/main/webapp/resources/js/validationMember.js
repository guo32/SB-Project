function CheckAddMember() {	
	
	var userId = document.getElementById("userId"); // 아이디
	var password = document.getElementById("userPassword"); // 비밀번호
	var confirmPassword = document.getElementById("confirmPassword"); // 비밀번호 확인
	var userName = document.getElementById("userName"); // 이름
	var birth = document.getElementById("birth"); // 생년월일
	var emailFront = document.getElementById("emailFront"); // 이메일 앞부분
	var phone = document.getElementById("phone"); // 전화번호
	
	var agree = document.getElementById("agree");
	
	if(userId.value == "" || userId.value == null) {
		alert("[아이디]\n아이디는 비워둘 수 없습니다.");
		userId.select();
		userId.focus();
		return false;
	}
	
	if(password.value == "" || password.value == null) {
		alert("[비밀번호]\n비밀번호는 비워둘 수 없습니다.");
		password.select();
		password.focus();
		return false;
	}
	
	if(confirmPassword.value != password.value) {
		alert("[비밀번호 확인]\n비밀번호는 동일해야 합니다.");
		confirmPassword.select();
		confirmPassword.focus();
		return false;
	}
	
	if(userName.value == "" || userName.value == null) {
		alert("[성명]\n성명은 비워둘 수 없습니다.");
		userName.select();
		userName.focus();
		return false;
	}
	
	if(emailFront.value == "" || emailFront.value == null) {
		alert("[이메일]\n이메일은 비워둘 수 없습니다.");
		emailFront.select();
		emailFront.focus();
		return false;
	}
	
	// 전화 번호 검사
	if(!check(/^\d{3}-(?:\d{3}|\d{4})-\d{4}$/, phone, "[전화 번호]\n형식을 확인해주세요.\n입력 가능한 형식은 다음과 같습니다.\n1) oo-ooo-oooo\n2) oo-oooo-oooo\n3) ooo-ooo-oooo\n4) ooo-oooo-oooo\n5) oooo-ooo-oooo\n6) oooo-oooo-oooo"))
		return false;
			
	// 동의 검사
	if(agree.checked != true) {
		alert("동의가 필요합니다.");
		agree.focus;
		return false;
	}
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newMember.submit();
}