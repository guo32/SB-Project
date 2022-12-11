<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resources/css/main.css"/>
<title>SumBBang</title>
<link href="./resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<jsp:include page="header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5" style="color: red">Error</h1>
			<h5>등록되지 않은 코드</h5>
		</div>
	</div>
	<main>	
		<div class="album py-5 bg-light">
			<div class="container">
				<p>등록되어 있지 않은 가게의 코드입니다.</p>
				<a class="btn btn-secondary" 
				href="./bakerys.jsp"
				style="background-color: #8C775E">목록으로 &raquo;</a>	
		    </div>
		</div>		
	</main>	
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>