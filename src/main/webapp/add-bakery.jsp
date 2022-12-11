<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Bakery" %>
<jsp:useBean id="bakeryDAO" class="dao.BakeryRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resources/css/main.css"/>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>SumBBang</title>
<link href="./resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<style>
	.col-12, .col-md-5, .col-sm-6 {
		margin: 10px 0;
	}
	.local {
		color: gray;
	}
</style>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Register Bakery</h1>
			<h5>가게 등록</h5>
			<a href="?language=ko" class="local">한국어</a>|<a href="?language=en" class="local">English</a>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="col-md-7 col-lg-8">
			        <h4 class="mb-3"><fmt:message key="info"/></h4>
			        <form name="addBakery" class="needs-validation" action="./process-add-bakery.jsp" 
			        	method="post" enctype="multipart/form-data">
			        	<div class="row g-3">
			          		<div class="col-12">
			              		<label for="bakeryId" class="form-label"><fmt:message key="bakeryId"/></label>
			              		<p style="color: gray; font-size: 12px"><fmt:message key="idHelp"/></p>
			              		<div class="input-group has-validation">
			                		<input type="text" class="form-control" name="bakeryId" id="bakeryId" value="bakery" required>
			              		</div>
			            	</div>	
			            	<div class="col-12">
			              		<label for="bakeryName" class="form-label"><fmt:message key="bakeryName"/></label>
			              		<div class="input-group has-validation">
			                		<input type="text" class="form-control" name="bakeryName" id="bakeryName" placeholder="가게명" required>
			              		</div>
			            	</div>
						
							<div class="col-md-5">
			              		<label for="city" class="form-label"><fmt:message key="city"/></label>
			              		<select class="form-select" name="city" id="city" required>
			                		<option value=""><fmt:message key="select"/></option>
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
			              		<label for="address" class="form-label"><fmt:message key="address"/></label>
			              		<input type="text" class="form-control" name="address" id="address" placeholder="시도를 제외한 주소" required>
			            	</div>
			
			            	<div class="col-sm-6">
			              		<label for="open" class="form-label"><fmt:message key="open"/></label>
			              		<input type="text" class="form-control" name="open" id="open" placeholder="AM/PM 12:00" required>
			            	</div>
			
			            	<div class="col-sm-6">
			              		<label for="close" class="form-label"><fmt:message key="close"/></label>
			              		<input type="text" class="form-control" name="close" id="close" placeholder="AM/PM 12:00" required>
			            	</div>
			            	
			            	<div class="col-12">
			              		<label for="bakeryNumber" class="form-label"><fmt:message key="number"/></label>
			              		<input type="text" class="form-control" name="bakeryNumber" id="bakeryNumber" placeholder="-을 포함한 전화번호" required>
			            	</div>
			            	
			            	<!-- 이미지 첨부 -->
			            	<div class="col-12">
			              		<label for="address" class="form-label"><fmt:message key="image"/></label>
			              		<input type="file" class="form-control" name="bakeryImage1" id="bakeryImage1" required>
			            	</div>
			            	<div class="col-12">			              		
			              		<input type="file" class="form-control" name="bakeryImage2" id="bakeryImage2" required>
			            	</div>
			            	<div class="col-12">			              		
			              		<input type="file" class="form-control" name="bakeryImage3" id="bakeryImage3" required>
			            	</div>
			          	</div>
			
			          	<hr class="my-4">
			
			          	<div class="form-check">
			            	<input type="checkbox" class="form-check-input" id="agree">
			            	<label class="form-check-label" for="agree"><fmt:message key="agree"/></label>
			          	</div>
			          	
			          	<hr class="my-4">
			
			          	<button class="w-100 btn btn-primary btn-lg" type="button" onclick="CheckAddBakery()" style="background-color: #409399"><fmt:message key="registerBakery"/></button>
			        </form>
				</div>
		    </div>
		</div>		
	</main>	
	</fmt:bundle>
	<jsp:include page="footer.jsp"/> <!-- 푸터 -->
</body>
</html>