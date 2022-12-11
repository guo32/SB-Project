<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

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
	ResultSet rs = null;
	
	String sql = "select * from bakery where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bakeryId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		// 수정된 이미지 파일이 존재
		if(filename1 != null || filename2 != null || filename3 != null) {
			sql = "update bakery set b_name=?, b_city=?, b_address=?, b_number=?, b_open=?, b_close=?";
			if(filename1 != null)
				sql += ", b_fileName1=?";
			if(filename2 != null) 
				sql += ", b_fileName2=?";
			if(filename3 != null)
				sql += ", b_fileName3=?";
			sql += " where b_id=?";
			
			// 이미지 개수에 따라 가게 코드의 위치가 변경됨
			int idIndex = 8;
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, name);
			pstmt.setString(2, city);
			pstmt.setString(3, address);
			pstmt.setString(4, number);
			pstmt.setString(5, open);
			pstmt.setString(6, close);
			if(filename1 != null) {
				pstmt.setString(7, filename1);
				if(filename2 != null) {
					pstmt.setString(8, filename2);
					idIndex++;
					if(filename3 != null) {
						pstmt.setString(9, filename3);
						idIndex++;
					}
				} else if(filename3 != null) {
					pstmt.setString(8, filename3);
					idIndex++;
				}				
			} else if(filename2 != null) {
				pstmt.setString(7, filename2);
				if(filename3 != null) {
					pstmt.setString(8, filename3);
					idIndex++;
				}
			} else if(filename3 != null) {
				pstmt.setString(7, filename3);
			}
			pstmt.setString(idIndex, bakeryId);
			pstmt.executeUpdate();
		} else { // 수정된 이미지 없음
			sql = "update bakery set b_name=?, b_city=?, b_address=?, b_number=?, b_open=?, b_close=? where b_id=?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, name);
			pstmt.setString(2, city);
			pstmt.setString(3, address);
			pstmt.setString(4, number);
			pstmt.setString(5, open);
			pstmt.setString(6, close);
			pstmt.setString(7, bakeryId);
			pstmt.executeUpdate();
		}
	}	
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("edit-bakery.jsp");
	
%>