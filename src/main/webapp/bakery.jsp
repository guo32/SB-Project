<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Bakery" %>
<%@ page errorPage="exception-no-bakery.jsp" %>
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
<script type="text/javascript">
	function addFavorite() {
		if(confirm("관심 목록에 추가하시겠습니까?"))
			document.buttonForm.submit();
		else 
			document.buttonForm.reset();
	}
</script>
<body>
	<jsp:include page="header.jsp"/> <!-- 헤더 -->
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bakery where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		rs.next(); // rs 값을 읽기 전에 next() 메소드 호출해야 함
	%>
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5"><%=rs.getString("b_name") %></h1>
			<h5>상세정보</h5>
			<p>
				<form name="buttonForm" action='./add-favorite.jsp?id=<%=rs.getString("b_id") %>' method="post">
					<a class="btn btn-secondary" href="#" onclick="addFavorite()"
					style="background-color: #409399">좋아요 ♥
					</a>
					<a class="btn btn-secondary" 
					href="./favorite.jsp"
					style="background-color: #8C775E">관심목록 &raquo;</a>	
					<a class="btn btn-secondary" 
					href="./bakerys.jsp"
					style="background-color: #8C775E">목록으로 &raquo;</a>	
				</form>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="col-md-6">
					<p><b>주소 | </b>
					<%=rs.getString("b_city") %> <%=rs.getString("b_address") %>
					</p>
					<p><b>여는 시간 | </b>
					<%=rs.getString("b_open") %>
					</p>
					<p><b>닫는 시간 | </b>
					<%=rs.getString("b_close") %>
					</p>
					<p><b>전화 번호 | </b>
					<%=rs.getString("b_number") %>
					</p>
				</div>
				
				<!-- 참고 사진 -->
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		        	<div class="col">
		          		<div class="card shadow-sm">
		            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		            			<title>Placeholder</title>
		            			<rect width="100%" height="100%" fill="#D9CDBF"/>
		            			<image href="./resources/images/<%=rs.getString("b_fileName1") %>" width="100%" height="100%"/>
		            		</svg>
		
		            		<div class="card-body">
		              			<p class="card-text"><%=rs.getString("b_name") %> 사진 1</p>
		            		</div>
		          		</div>
		        	</div>
		        	<div class="col">
		          		<div class="card shadow-sm">
		            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		            			<title>Placeholder</title>
		            			<rect width="100%" height="100%" fill="#D9CDBF"/>
		            			<image href="./resources/images/<%=rs.getString("b_fileName2") %>" width="100%" height="100%"/>
		            		</svg>
		
		            		<div class="card-body">
		              			<p class="card-text"><%=rs.getString("b_name") %> 사진 2</p>
		            		</div>
		          		</div>
		        	</div>
		        	<div class="col">
		          		<div class="card shadow-sm">
		            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		            			<title>Placeholder</title>
		            			<rect width="100%" height="100%" fill="#D9CDBF"/>
		            			<image href="./resources/images/<%=rs.getString("b_fileName3") %>" width="100%" height="100%"/>
		            		</svg>
		
		            		<div class="card-body">
		              			<p class="card-text"><%=rs.getString("b_name") %> 사진 3</p>
		            		</div>
		          		</div>
		        	</div>
		      	</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>