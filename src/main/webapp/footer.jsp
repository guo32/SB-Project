<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">&copy; 2018301502 구도경, WebServer Computing</p>

    <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
    	<c:choose>
            <c:when test="${empty sessionId}">
            	<li><a href='<c:url value="/member/login-member.jsp"/>' class="nav-link px-2 text-muted">로그인</a></li>
            	<li><a href='<c:url value="/member/add-member.jsp"/>' class="nav-link px-2 text-muted">회원가입</a></li>
            </c:when>
            <c:otherwise>
            	<li class="nav-link px-2 text-muted"><%=sessionId %>님</li>
            	<li><a href='<c:url value="/member/logout-member.jsp"/>' class="nav-link px-2 text-muted">로그아웃</a></li>
            	<li><a href='<c:url value="/member/update-member.jsp"/>' class="nav-link px-2 text-muted">회원수정</a></li>
            </c:otherwise>
        </c:choose>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">문의</a></li>
    </ul>
  </footer>
</div>