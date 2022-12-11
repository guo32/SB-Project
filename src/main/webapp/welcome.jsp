<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Bakery" %>
<jsp:useBean id="bakeryDAO" class="dao.BakeryRepository" scope="session"/>
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
			<h1 class="display-5">Welcome</h1>
			<h5>숨빵에 오신 것을 환영합니다.</h5>
		</div>
	</div>
	<main>
		<%
			ArrayList<Bakery> listOfBakerys = bakeryDAO.getAllBakerys();
		%>
		
		<div class="album py-5 bg-light">
			<div class="container">
		
		    	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		    		<%
		    			for(int i = 0; i < 3; i++) {
		    			Bakery bakery = listOfBakerys.get(i);
		    		%>
		        	<div class="col">
		          		<div class="card shadow-sm">
		            		<svg class="bd-placeholder-img card-img-top" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		            			<title>Placeholder</title>
		            			<rect width="100%" height="100%" fill="#55595c"/>
		            			<image href="./resources/images/<%=bakery.getFilename1() %>" width="100%"/>
		            		</svg>
		
		            		<div class="card-body">
		            			<h3><%=bakery.getBakeryName() %></h3>
		              			<p class="card-text"><%=bakery.getAddress() %></p>
		              			<p class="card-text">open <%=bakery.getOpen() %> | close <%=bakery.getClose() %></p>
		              			<p>
					        		<a class="btn btn-secondary" 
					        			href="./bakery.jsp?id=<%=bakery.getBakeryId()%>"
					        			style="background-color: #8C775E">자세히 보기 &raquo;</a>
					        	</p>
		            		</div>
		          		</div>
		        	</div>
		        	<%
		    			}
		        	%>
		      	</div>
		    </div>
		</div>		
	</main>	
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>