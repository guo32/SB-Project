<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	//String realFolder = "C:\\upload";
	String realFolder = application.getRealPath("/resources/images");
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String bakeryId = multi.getParameter("bakeryId");
	String name = multi.getParameter("bakeryName");
	String city = multi.getParameter("city");
	String address = multi.getParameter("address");
	String number = multi.getParameter("bakeryNumber");
	String open = multi.getParameter("open");
	String close = multi.getParameter("close");
	
	Enumeration files = multi.getFileNames();
	
	String file3 = (String)files.nextElement();
	String filename3 = multi.getFilesystemName(file3);
	
	String file2 = (String)files.nextElement();
	String filename2 = multi.getFilesystemName(file2);
	
	String file1 = (String)files.nextElement();
	String filename1 = multi.getFilesystemName(file1);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into bakery values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bakeryId);
	pstmt.setString(2, name);
	pstmt.setString(3, city);
	pstmt.setString(4, address);
	pstmt.setString(5, number);
	pstmt.setString(6, open);
	pstmt.setString(7, close);
	pstmt.setString(8, filename1);
	pstmt.setString(9, filename2);
	pstmt.setString(10, filename3);
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("bakerys.jsp");
	
%>