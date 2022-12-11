<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.ReviewDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String name = (String) request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resources/css/main.css"/>
<title>SumBBang</title>
<link href="./resources/images/shop-window.svg" rel="shortcut icon" type="image/x-icon">
<style>
	.col-12 { margin-top: 10px; }
</style>
</head>
<script type="text/javascript">
	function checkForm() {
		if(!document.newWrite.name.value) {
			alert("[성명]\n성명은 비워둘 수 없습니다.");
			return false;
		}
		if(!document.newWrite.b_id.value) {
			alert("[제목]\n제목은 비워둘 수 없습니다.");
			return false;
		}
		if(!document.newWrite.content.value) {
			alert("[내용]\n내용은 비워둘 수 없습니다.");
			return false;
		}
	}
</script>
<body>
	<jsp:include page="../header.jsp"/> <!-- 헤더 -->
	<div class="jumbotron" style="background-color: #FFFFFF; color: #0D0000; padding: 2rem 2rem;">
		<div class="container">
			<h1 class="display-5">Review Bakery</h1>
			<h5>방문 후기</h5>
		</div>
	</div>
	<main>
		<div class="album py-5 bg-light">
			<div class="container">
				<form name="newWrite" action="./ReviewWriteAction.do" class="form-horizontal" method="post" onsubmit="return checkForm()">
					<div class="row g-3">
						<input name="id" type="hidden" class="form-control" value="${sessionId}">
			        	<div class="col-12">
			           		<label for="name" class="form-label">성명</label>			           		
			           		<div class="input-group has-validation">
			              		<input type="text" class="form-control" name="name" placeholder="성명">
			           		</div>
			          	</div>
			          	<div class="col-12">
			           		<label for="bakeryId" class="form-label">제목</label>			           		
			           		<div class="input-group has-validation">
			              		<input type="text" class="form-control" name="b_id" placeholder="제목">
			           		</div>
			          	</div>
			          	<div class="col-12">
			           		<label for="bakeryId" class="form-label">내용</label>			           		
			           		<div class="input-group has-validation" style="word-break: break-all">
			              		<textarea name="content" class="form-control" cols="50" rows="5"></textarea>
			           		</div>
			          	</div>
			          	
						<div class="col-12">
				          	<input class="w-100 btn btn-primary btn-lg" type="submit" 
				          	style="background-color: #409399;" value="후기 등록하기">
				          	<input class="w-100 btn btn-primary btn-lg" type="reset" 
				          	style="background-color: gray; margin-top:10px;" value="취소">
				        </div>
			        </div>
				</form>
		    </div>
		</div>		
	</main>	
	<jsp:include page="../footer.jsp"/> <!-- 푸터 -->
</body>
</html>