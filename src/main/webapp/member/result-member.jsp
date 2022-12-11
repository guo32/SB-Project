<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/main.css"/>
<script type="text/javascript" src="../resources/js/validationMember.js"></script>
<title>SumBBang</title>
<link href="../resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<%
				String msg = request.getParameter("msg");
			
				if(msg != null) {
					if(msg.equals("0"))
						out.println("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
					else if(msg.equals("1"))
						out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				} else {
					out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				}
			%>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>