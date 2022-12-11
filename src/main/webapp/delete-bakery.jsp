<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bakeryId = request.getParameter("id");
		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from bakery";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from bakery where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bakeryId);
		pstmt.executeUpdate();
	} else 
		out.println("일치하는 가게가 없습니다.");
	
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("edit-bakery.jsp");
	
%>