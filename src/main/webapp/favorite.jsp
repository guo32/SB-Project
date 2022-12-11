<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Bakery" %>
<%@ page import="dao.BakeryRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resources/css/main.css"/>
<title>SumBBang</title>
<link href="./resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<%
	String favoriteId = session.getId();
%>
</head>
<body>
	<jsp:include page="header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Favorite Bakery</h1>
			<h5>관심 목록</h5>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<a class="btn btn-secondary" 
					href="./delete-favorite.jsp?favoriteId=<%=favoriteId %>"
					style="background-color: #409399">초기화</a>
				<div>
					<table class="table table-hover">
						<tr>
							<th>이미지</th>
							<th>가게명</th>
							<th>주소</th>
							<th>비고</th>
						</tr>
						<%
							ArrayList<Bakery> favoriteList = (ArrayList<Bakery>) session.getAttribute("favoritelist");
							if(favoriteList == null)
								favoriteList = new ArrayList<Bakery>();
							
							for(int i = 0; i < favoriteList.size(); i++) {
								Bakery bakery = favoriteList.get(i);
						%>
						<tr>
							<td><img src="./resources/images/<%=bakery.getFilename1() %>" alt="대표 이미지" width=30></td>
							<td><%=bakery.getBakeryName() %></td>
							<td><%=bakery.getAddress() %></td>
							<td><a href="./remove-favorite.jsp?id=<%=bakery.getBakeryId() %>" class="badge badge-danger">삭제</a></td>
						</tr>
						<%
							}
						%>
					</table>
					<a class="btn btn-secondary" 
					href="./bakerys.jsp"
					style="background-color: #8C775E">가게목록 &raquo;</a>	
				</div>
		    </div>
		</div>		
	</main>	
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>