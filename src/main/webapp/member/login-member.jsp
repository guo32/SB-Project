<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/main.css"/>
<title>SumBBang</title>
<link href="../resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<style>
	.form-floating, button {
		margin: 10px 0;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Login</h1>
			<h5>회원 로그인</h5>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container" align="center">
				<div class="col-md-5 col-md-offset-5">
				  <form class="form-signin" action="process-login-member.jsp" method="post">
				  	<h3 class="form-signin-heading">Please sign in</h3>
				  	<%
						String error = request.getParameter("error");
						if(error != null) {
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해주세요.");
							out.println("</div>");
						}
					%>
				    <div class="form-floating">
				      <input type="text" class="form-control" name="id" placeholder="아이디" required>
				    </div>
				    <div class="form-floating">
				      <input type="password" class="form-control" name="password" placeholder="비밀번호">
				    </div>
				    <button class="w-100 btn btn-lg btn-primary" type="submit" style="background-color: #409399">로그인</button>
				  </form>
				</div>
		    </div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"/> <!-- 푸터 -->
</body>
</html>