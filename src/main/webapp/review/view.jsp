<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.ReviewDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ReviewDTO notice = (ReviewDTO) request.getAttribute("review");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
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
				<form name="newUpdate" action="./ReviewUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
					<div class="row g-3">
			        	<div class="col-12">
			           		<label for="bakeryId" class="form-label">성명</label>			           		
			           		<div class="input-group has-validation">
			              		<input type="text" class="form-control" name="name" value="<%=notice.getName()%>">
			           		</div>
			          	</div>
			          	<div class="col-12">
			           		<label for="bakeryId" class="form-label">제목</label>			           		
			           		<div class="input-group has-validation">
			              		<input type="text" class="form-control" name="b_id" value="<%=notice.getB_id()%>">
			           		</div>
			          	</div>
			          	<div class="col-12">
			           		<label for="bakeryId" class="form-label">내용</label>			           		
			           		<div class="input-group has-validation" style="word-break: break-all">
			              		<textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
			           		</div>
			          	</div>
			          	<div class="col-12" style="margin-top: 15px">
			          		<div class="col-sm-offset-2 col-sm-10 ">
								<c:set var="userId" value="<%=notice.getId()%>" />
								<table>
									<tr>
										<td><a href="./ReviewListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary">목록</a></td>
										<c:if test="${sessionId==userId}">
											<td><a href="./ReviewDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a></td> 
											<td><input type="submit" class="btn btn-success" value="수정"></td>
										</c:if>
									</tr>
								</table>								
							</div>
			          	</div>
			        </div>
				</form>
		    </div>
		</div>		
	</main>	
	<jsp:include page="../footer.jsp"/> <!-- 푸터 -->
</body>
</html>