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
<script type="text/javascript" src="./resources/js/validation2.js"></script>
<title>SumBBang</title>
<link href="./resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<style>
	.col-12, .col-md-5, .col-sm-6 {
		margin: 10px 0;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Update Bakery</h1>
			<h5>가게 수정</h5>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String bakeryId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from bakery where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bakeryId);
		rs = pstmt.executeQuery();
		if(rs.next()) {
	%>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="col-md-7 col-lg-8">
			        <h4 class="mb-3">가게 정보</h4>
			        <form name="updateBakery" class="needs-validation" action="./process-update-bakery.jsp" 
			        	method="post" enctype="multipart/form-data">
			        	<div class="row g-3">
			          		<div class="col-12">
			              		<label for="bakeryId" class="form-label">가게 코드</label>
			              		<p style="color: gray; font-size: 12px">bakery와 숫자 네자리를 조합하여 입력하세요.</p>
			              		<div class="input-group has-validation">
			                		<input type="text" class="form-control" name="bakeryId" id="bakeryId" value='<%=rs.getString("b_id") %>' required>
			              		</div>
			            	</div>	
			            	<div class="col-12">
			              		<label for="bakeryName" class="form-label">가게명</label>
			              		<div class="input-group has-validation">
			                		<input type="text" class="form-control" name="bakeryName" id="bakeryName" value='<%=rs.getString("b_name") %>' placeholder="가게명" required>
			              		</div>
			            	</div>
						
							<div class="col-md-5">
			              		<label for="city" class="form-label">시도</label>
			              		<select class="form-select" name="city" id="city" required>
			                		<option value="">선택</option>
			                		<option value="서울">서울</option>
			                		<option value="부산">부산</option>
			                		<option value="대구">대구</option>
			                		<option value="인천">인천</option>
			                		<option value="광주">광주</option>
			                		<option value="대전">대전</option>
			                		<option value="울산">울산</option>
			                		<option value="세종">세종</option>
			                		<option value="경기">경기</option>
			                		<option value="강원">강원</option>
			                		<option value="충청">충청</option>
			                		<option value="전라">전라</option>
			                		<option value="경상">경상</option>
			                		<option value="제주">제주</option>
			              		</select>
			            	</div>
						
			            	<div class="col-12">
			              		<label for="address" class="form-label">주소</label>
			              		<input type="text" class="form-control" name="address" id="address" value='<%=rs.getString("b_address") %>' placeholder="시도를 제외한 주소" required>
			            	</div>
			
			            	<div class="col-sm-6">
			              		<label for="open" class="form-label">여는 시간</label>
			              		<input type="text" class="form-control" name="open" id="open" value='<%=rs.getString("b_open") %>' placeholder="AM/PM 12:00" required>
			            	</div>
			
			            	<div class="col-sm-6">
			              		<label for="close" class="form-label">닫는 시간</label>
			              		<input type="text" class="form-control" name="close" id="close" value='<%=rs.getString("b_close") %>' placeholder="AM/PM 12:00" required>
			            	</div>
			            	
			            	<div class="col-12">
			              		<label for="bakeryNumber" class="form-label">전화 번호</label>
			              		<input type="text" class="form-control" name="bakeryNumber" id="bakeryNumber" value='<%=rs.getString("b_number") %>' placeholder="-을 포함한 전화번호" required>
			            	</div>
			            	
			            	<!-- 이미지 첨부 -->
			            	<div class="col-12">
			              		<label for="address" class="form-label">이미지</label>
			              		<input type="file" class="form-control" name="bakeryImage1" id="bakeryImage1" required>
			            	</div>
			            	<div class="col-12">			              		
			              		<input type="file" class="form-control" name="bakeryImage2" id="bakeryImage2" required>
			            	</div>
			            	<div class="col-12">			              		
			              		<input type="file" class="form-control" name="bakeryImage3" id="bakeryImage3" required>
			            	</div>
			            	<!-- 등록되어 있는 이미지 -->
			            	<div class="col-12">
			            		<label for="image" class="form-label">등록된 이미지</label>
			            		<%
			            			if(rs.getString("b_fileName1") == null && rs.getString("b_fileName2") == null && rs.getString("b_fileName3") == null) {
			            				out.println("<p style='color: gray'>등록된 이미지가 없습니다.</p>");
			            			}
			            			if(rs.getString("b_fileName1") != null) {
			            		%>
					        	<div class="col">
					          		<div class="card shadow-sm">
					            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
					            			<title>Placeholder</title>
					            			<rect width="100%" height="100%" fill="#D9CDBF"/>
					            			<image href="./resources/images/<%=rs.getString("b_fileName1") %>" width="100%" height="100%"/>
					            		</svg>
					
					            		<div class="card-body">
					              			<p class="card-text">등록된 <%=rs.getString("b_name") %> 사진 1</p>
					            		</div>
					          		</div>
					        	</div>
					        	<%
			            			}
			            			if(rs.getString("b_fileName2") != null) {
					        	%>
					        	<div class="col">
					          		<div class="card shadow-sm">
					            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
					            			<title>Placeholder</title>
					            			<rect width="100%" height="100%" fill="#D9CDBF"/>
					            			<image href="./resources/images/<%=rs.getString("b_fileName2") %>" width="100%" height="100%"/>
					            		</svg>
					
					            		<div class="card-body">
					              			<p class="card-text">등록된 <%=rs.getString("b_name") %> 사진 2</p>
					            		</div>
					          		</div>
					        	</div>
					        	<%
			            			}
			            			if(rs.getString("b_fileName3") != null) {
					        	%>
					        	<div class="col">
					          		<div class="card shadow-sm">
					            		<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
					            			<title>Placeholder</title>
					            			<rect width="100%" height="100%" fill="#D9CDBF"/>
					            			<image href="./resources/images/<%=rs.getString("b_fileName3") %>" width="100%" height="100%"/>
					            		</svg>
					
					            		<div class="card-body">
					              			<p class="card-text">등록된 <%=rs.getString("b_name") %> 사진 3</p>
					            		</div>
					          		</div>
					        	</div>
					        	<%
			            			}
					        	%>
					      	</div>
			          	</div>
			          	
			          	<hr class="my-4">
			          	<button class="w-100 btn btn-primary btn-lg" type="button" onclick="CheckUpdateBakery()" style="background-color: #409399">정보 수정하기</button>
			        </form>
				</div>
		    </div>
		</div>		
	</main>
	<%
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>	
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>