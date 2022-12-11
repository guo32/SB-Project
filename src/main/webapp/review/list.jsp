<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.ReviewDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	List reviewList = (List) request.getAttribute("reviewlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
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
<script type="text/javascript">
	function checkForm() {
		if(${sessionId == null}) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		}
		location.href = "./ReviewWriteForm.do?id=<%=sessionId%>";
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
				<form action='<c:url value="./ReviewListAction.do"/>' method="post">
					<div>
						<div class="text-right">
							<span class="badge badge-success">전체 <%=total_record%>건</span>
						</div>
					</div>
					<div style="padding-top: 50px">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회</th>
								<th>작성자</th>
							</tr>
							<%
								for(int j = 0; j < reviewList.size(); j++) {
									ReviewDTO notice = (ReviewDTO) reviewList.get(j);
							%>
							<tr>
								<td><%=notice.getNum() %></td>
								<td><a href="./ReviewViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getB_id()%></a></td>
								<td><%=notice.getRegist_day()%></td>
								<td><%=notice.getHit()%></td>
								<td><%=notice.getName()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
					<div align="center">
						<c:set var="pageNum" value="<%=pageNum %>"/>
						<c:forEach var="i" begin="1" end="<%=total_page %>">
							<a href="<c:url value='./ReviewListAction.do?pageNum=${i}'/>">
								<c:choose>
									<c:when test="${pageNum==i}">
										<font color="4C5317"><b> [${i}]</b></font>
									</c:when>
									<c:otherwise>
										<font color="4C5317"> [${i}]</font>
									</c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</div>
					<div align="left">
						<table>
							<tr>
								<td width="100%" align="left">&nbsp;&nbsp;
									<select name="items" class="txt" style="height: 36px">
										<option value="b_id">제목</option>
										<option value="content">본문</option>
										<option value="name">작성자</option>
									</select>
									<input name="text" type="text" style="height: 36px"/>
									<input type="submit" id="btnAdd" class="btn btn-primary" value="검색"/>
								</td>
								<td width="100%" align="right">
									<a href="#" onclick="checkForm(); return false;" 
									class="btn btn-secondary"
									style="background-color: #409399">후기 작성하기 &raquo;</a>
								</td>
							</tr>
						</table>
					</div>
				</form>
		    </div>
		</div>		
	</main>	
	<jsp:include page="../footer.jsp"/> <!-- 푸터 -->
</body>
</html>