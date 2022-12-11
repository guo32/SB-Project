<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
			<h1 class="display-5">Bakery List</h1>
			<h5>가게 목록</h5>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<%@ include file="dbconn.jsp" %>
		    	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		    		<%
		    			PreparedStatement pstmt = null;
		    			ResultSet rs = null;
		    			String sql = "select * from bakery";
		    			pstmt = conn.prepareStatement(sql);
		    			rs = pstmt.executeQuery();
		    			while(rs.next()) {
		    		%>
		        	<div class="col">
		          		<div class="card shadow-sm">
		            		<svg class="bd-placeholder-img card-img-top" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		            			<title>Placeholder</title>
		            			<rect width="100%" height="100%" fill="#D9CDBF"/>
		            			<image href="./resources/images/<%=rs.getString("b_fileName1") %>" width="100%"/>
		            		</svg>
		
		            		<div class="card-body">
		            			<h3><%=rs.getString("b_name") %></h3>
		              			<p class="card-text"><%=rs.getString("b_city") %> <%=rs.getString("b_address") %></p>
		              			<p class="card-text">open <%=rs.getString("b_open") %> | close <%=rs.getString("b_close") %></p>
		              			<p>
					        		<a class="btn btn-secondary" 
					        			href="./bakery.jsp?id=<%=rs.getString("b_id") %>"
					        			style="background-color: #8C775E">자세히 보기 &raquo;</a>
					        	</p>
		            		</div>
		          		</div>
		        	</div>
		        	<%
		    			}
		    			
		    			if(rs != null) rs.close();
		    			if(pstmt != null) pstmt.close();
		    			if(conn != null) conn.close();
		        	%>
		      	</div>
		    </div>
		</div>		
	</main>	
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>