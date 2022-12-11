<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String eFront = request.getParameter("emailFront");
	String eBack = request.getParameterValues("emailBack")[0];
	String phone = request.getParameter("phone");
	
	String birth = request.getParameter("birth");
	String email = eFront + "@" + eBack;
		
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "update member set password=?, name=?, birth=?, mail=?, phone=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, birth);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
	}

	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("result-member.jsp?msg=0");
%>