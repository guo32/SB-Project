<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Bakery" %>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id"); // 가게 코드
	// 넘어온 id 값이 없을 경우
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("bakerys.jsp");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from bakery where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	// 관심 목록
	ArrayList<Bakery> list = (ArrayList<Bakery>) session.getAttribute("favoritelist");
	// 관심 목록이 없을 경우
	if(list == null) {
		list = new ArrayList<Bakery>();
		session.setAttribute("favoritelist", list);
	}
	
	rs.next();
	String address = rs.getString("b_city") + " " + rs.getString("b_address");
	Bakery bakery = new Bakery(id, rs.getString("b_name"), address);
	bakery.setFilename1(rs.getString("b_fileName1"));
		
	Bakery sameBakery = new Bakery();
	for(int i = 0; i < list.size(); i++) {
		sameBakery = list.get(i);
		if(sameBakery.getBakeryId().equals(id)) {
			break;
		} else {
			list.add(bakery);
		}
	}
	
	if(list.size() == 0)
		list.add(bakery);
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("bakery.jsp?id=" + id);
	
%>