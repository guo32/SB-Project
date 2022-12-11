package mvc.model;

import java.sql.*;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ReviewDAO {
	
	private static ReviewDAO instance;
	
	private ReviewDAO() {}
	
	public static ReviewDAO getInstance() {
		if(instance == null)
			instance = new ReviewDAO();
		return instance;
	}
	// 후기 개수 반환
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql;
		
		if(items == null && text == null)
			sql = "select count(*) from review";
		else
			sql = "select count(*) from review where " + items + " like '%" + text + "%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
		} catch(Exception ex) {
			System.out.println("getListCount() 예외 발생 : " + ex);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		return x;
	}
	
	public ArrayList<ReviewDTO> getReviewList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null)
			sql = "select * from review order by num desc";
		else
			sql = "select * from review where " + items + " like '%" + text + "%'";
		
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review = new ReviewDTO();
				review.setNum(rs.getInt("num"));
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setB_id(rs.getString("b_id"));
				review.setContent(rs.getString("content"));
				review.setRegist_day(rs.getString("regist_day"));
				review.setHit(rs.getInt("hit"));
				review.setIp(rs.getString("ip"));
				list.add(review);
				
				if(index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
		} catch(Exception ex) {
			System.out.println("getReviewList() 예외 발생 : " + ex);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		return list;
	}
	
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		String sql = "select * from member where id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
			return name;
		} catch(Exception ex) {
			System.out.println("getLoginNameById() 예외 발생 : " + ex);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		return null;
	}
	
	public void insertReview(ReviewDTO review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into review values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getNum());
			pstmt.setString(2, review.getId());
			pstmt.setString(3, review.getName());
			pstmt.setString(4, review.getB_id());
			pstmt.setString(5, review.getContent());
			pstmt.setString(6, review.getRegist_day());
			pstmt.setInt(7, review.getHit());
			pstmt.setString(8, review.getIp());			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("insertReview() 예외 발생 : " + ex);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "select hit from review where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int hit = 0;
			
			if(rs.next()) hit = rs.getInt("hit") + 1;
			
			sql = "update review set hit = ? where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("updateHit() 예외 발생 : " + ex);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	public ReviewDTO getReviewByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDTO review = null;
		
		updateHit(num);
		String sql = "select * from review where num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				review = new ReviewDTO();
				review.setNum(rs.getInt("num"));
				review.setId(rs.getString("id"));
				review.setName(rs.getString("name"));
				review.setB_id(rs.getString("b_id"));
				review.setContent(rs.getString("content"));
				review.setRegist_day(rs.getString("regist_day"));
				review.setHit(rs.getInt("hit"));
				review.setIp(rs.getString("ip"));
			}
			
			return review;
		} catch(Exception ex) {
			System.out.println("getReviewByNum() 예외 발생 : " + ex);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	public void updateReview(ReviewDTO review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update review set name=?, b_id=?, content=? where num=?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, review.getName());
			pstmt.setString(2, review.getB_id());
			pstmt.setString(3, review.getContent());
			pstmt.setInt(4, review.getNum());
			pstmt.executeUpdate();
			
			conn.commit();
		} catch(Exception ex) {
			System.out.println("updateReview() 예외 발생 : " + ex);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	public void deleteReview(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from review where num=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("deleteReview() 예외 발생 : " + ex);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

}
