<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../dbconn.jsp" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		String[] email = rs.getString("mail").split("@");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/main.css"/>
<title>SumBBang</title>
<link href="../resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<style>
	.col-12, .col-md-5, .col-sm-6 {
		margin: 10px 0;
	}
</style>
</head>
<script type="text/javascript">
	function CheckUpdateMember() {			
		if(!document.newMember.id.value) {
			alert("[아이디]\n아이디는 비워둘 수 없습니다.");
			return false;
		}
		
		if(!document.newMember.password.value) {
			alert("[비밀번호]\n비밀번호는 비워둘 수 없습니다.");
			return false;
		}
		
		if(document.newMember.password.value != document.newMember.confirmPassword.value) {
			alert("[비밀번호 확인]\n동일한 비밀번호가 아닙니다.");
			return false;
		}
		
		if(!document.newMember.name.value) {
			alert("[성명]\n성명은 비워둘 수 없습니다.");
			return false;
		}
		
		if(!document.newMember.birth.value) {
			alert("[생년월일]\n생년월일은 비워둘 수 없습니다.");
			return false;
		}
		
		if(!document.newMember.emailFront.value) {
			alert("[이메일]\n이메일은 비워둘 수 없습니다.");
			return false;
		}
		
		if(!document.newMember.phone.value) {
			alert("[전화번호]\n전화번호는 비워둘 수 없습니다.");
			return false;
		}
	}
</script>
<body onload="init()">
<%@ include file="../header.jsp" %>
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Edit Member</h1>
			<h5>회원 수정</h5>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class = "container">
				<div class="col-md-7 col-lg-8">
			        <h4 class="mb-3">회원 정보</h4>
					<form name="newMember" action="process-update-member.jsp" class="form-horizontal" method="post" onsubmit="return CheckUpdateMember()">
						<div class="row g-3">
							<div class="col-12">
								<label class="form-label">아이디</label>
								<input type="text" name="id" class="form-control" placeholder="id" value="<%=rs.getString("id") %>">
							</div>
							<div class="col-12">
								<label class="form-label">비밀번호</label>
								<input type="password" name="password" class="form-control" placeholder="password" value="<%=rs.getString("password") %>">
							</div>
							<div class="col-12">
								<label class="form-label">비밀번호확인</label>
								<input type="password" name="confirmPassword" class="form-control" placeholder="password confirm">
							</div>
							<div class="col-12">
								<label class="form-label">성명</label>
								<input type="text" name="name" class="form-control" placeholder="name" value="<%=rs.getString("name") %>">
							</div>
							<div class="col-12">
								<label class="form-label">생년월일</label>
								<input type="text" name="birth" class="form-control" placeholder="birth" value="<%=rs.getString("birth") %>">
							</div>
							<div class="col-12">
								<label class="form-label">이메일</label>
								<div>
									<input type="text" name="emailFront" value="<%=email[0] %>">@
									<select name="emailBack" id="emailBack">
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
										<option>skuniv.ac.kr</option>
									</select>
								</div>
							</div>
							<div class="col-12">
								<label class="form-label">전화번호</label>
								<input type="text" name="phone" class="form-control" placeholder="phone" value="<%=rs.getString("phone") %>">
							</div>
							<div class="col-12">
								<input type="submit" class="w-100 btn btn-primary btn-lg" style="background-color: #409399" value="회원정보 수정하기">
							</div>
						</div>
					</form>
					<div align="right"><a href='<c:url value="/member/delete-member.jsp"/>'>회원탈퇴</a></div>
				</div>
			</div>
		</div>
	</main>
</body>
<%
	}
%>
<script type="text/javascript">
	function init() {
		setComboMailValue("${emailBack}");
	}
	
	function setComboMailValue(val) {
		var selectMail = document.getElementById('emailBack');
		
		for(i = 0, j = selectMail.length; i < j; i++) {
			if(selectMail.options[i].value == val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}		
</script>
</html>