package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.ReviewComment;

/**
 * Servlet implementation class ReviewCommentInsertServlet
 */
@WebServlet("/review/reviewCommentInsert")
public class ReviewCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int reviewRef = Integer.parseInt(request.getParameter("reviewRef"));
		String reviewCommentWriter = request.getParameter("reviewCommentWriter");
		int reviewCommentLevel = Integer.parseInt(request.getParameter("reviewCommentLevel"));
		int reviewCommentRef = Integer.parseInt(request.getParameter("reviewCommentRef"));
		String reviewCommentContent = request.getParameter("reviewCommentContent");
		System.out.println("reviewCommentContent@servlet="+reviewCommentContent);
		
		ReviewComment rc = new ReviewComment(0, reviewRef, reviewCommentWriter, reviewCommentRef, reviewCommentLevel, reviewCommentContent, null);
		
		int result = new ReviewService().insertReviewComment(rc);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";
		String loc = "/review/reviewView?reviewNo="+reviewRef;
		
		if(result>0) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
