<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../dbconn.jsp" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, rs.getString("id"));
		pstmt.executeUpdate();
%>
	<c:import var="url" url="logout-member.jsp"/>
	<c:redirect url="result-member.jsp"/>
<%
	}
%>