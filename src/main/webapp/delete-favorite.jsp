<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Bakery" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("favoriteId");
	// 넘어온 id 값이 없을 경우
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("favorite.jsp");
		return;
	}
		
	session.invalidate();
		
	response.sendRedirect("favorite.jsp");
	
%>