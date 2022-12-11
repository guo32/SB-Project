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
	
	// 가입 날짜, 시간
	java.util.Date currentDatetime = new java.util.Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, birth);
	pstmt.setString(5, email);
	pstmt.setString(6, phone);
	pstmt.setTimestamp(7, timestamp);
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("result-member.jsp?msg=1");
	
%>