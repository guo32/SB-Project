<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Bakery" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id"); // 가게 코드
	// 넘어온 id 값이 없을 경우
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("bakerys.jsp");
		return;
	}
		
	// 관심 목록
	ArrayList<Bakery> list = (ArrayList<Bakery>) session.getAttribute("favoritelist");
				
	Bakery sameBakery = new Bakery();
	for(int i = 0; i < list.size(); i++) {
		sameBakery = list.get(i);
		if(sameBakery.getBakeryId().equals(id)) {
			list.remove(sameBakery);
		}
	}
		
	response.sendRedirect("favorite.jsp");
	
%>