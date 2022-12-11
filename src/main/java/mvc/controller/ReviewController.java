package mvc.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import mvc.model.ReviewDAO;
import mvc.model.ReviewDTO;

public class ReviewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/ReviewListAction.do")) {
			requestReviewList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./review/list.jsp");
			rd.forward(request, response);
		} else if(command.equals("/ReviewWriteForm.do")) {
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./review/writeForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/ReviewWriteAction.do")) {
			requestReviewWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReviewListAction.do");
			rd.forward(request, response);
		} else if(command.equals("/ReviewViewAction.do")) {
			requestReviewView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReviewView.do");
			rd.forward(request, response);
		} else if(command.equals("/ReviewView.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("./review/view.jsp");
			rd.forward(request, response);
		} else if(command.equals("/ReviewUpdateAction.do")) {
			requestReviewUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReviewListAction.do");
			rd.forward(request, response);
		} else if(command.equals("/ReviewDeleteAction.do")) {
			requestReviewDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ReviewListAction.do");
			rd.forward(request, response);
		}
	}
	
	public void requestReviewList(HttpServletRequest request) {
		ReviewDAO dao = ReviewDAO.getInstance();
		List<ReviewDTO> reviewlist = new ArrayList<ReviewDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record = dao.getListCount(items, text);
		reviewlist = dao.getReviewList(pageNum, limit, items, text);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("reviewlist", reviewlist);
	}
	
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		ReviewDAO dao = ReviewDAO.getInstance();
		String name = dao.getLoginNameById(id);
		request.setAttribute("name", name);
	}
	
	public void requestReviewWrite(HttpServletRequest request) {
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO review = new ReviewDTO();
		
		review.setId(request.getParameter("id"));
		review.setName(request.getParameter("name"));
		review.setB_id(request.getParameter("b_id"));
		review.setContent(request.getParameter("content"));
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("b_id"));
		System.out.println(request.getParameter("content"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		
		review.setHit(0);
		review.setRegist_day(regist_day);
		review.setIp(request.getRemoteAddr());
		
		dao.insertReview(review);
	}
	
	public void requestReviewView(HttpServletRequest request) {
		ReviewDAO dao = ReviewDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		ReviewDTO review = new ReviewDTO();
		review = dao.getReviewByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("review", review);
	}
	
	public void requestReviewUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewDAO dao = ReviewDAO.getInstance();
		
		ReviewDTO review = new ReviewDTO();
		review.setNum(num);
		review.setName(request.getParameter("name"));
		review.setB_id(request.getParameter("b_id"));
		review.setContent(request.getParameter("content"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		
		review.setHit(0);
		review.setRegist_day(regist_day);
		review.setIp(request.getRemoteAddr());
		
		dao.updateReview(review);
	}
	
	public void requestReviewDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewDAO dao = ReviewDAO.getInstance();
		dao.deleteReview(num);
	}
	
}
