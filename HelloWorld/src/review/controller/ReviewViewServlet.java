package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewPhoto;

/**
 * Servlet implementation class ReviewViewServlet
 */
@WebServlet("/review/reviewView")
public class ReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo")); 
		
		Review rv = new ReviewService().selectOne(reviewNo); // 해당 리뷰글가지고오기
		List<ReviewComment> commentList = new ReviewService().selectReviewComment(reviewNo); // 해당리뷰글 댓글가져오기
		List<ReviewPhoto> list = new ReviewService().selectPhoto(reviewNo); // 해당 리뷰글의 이미지파일 가져오기
		
		request.setAttribute("rv", rv);
		request.setAttribute("list", list);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("/WEB-INF/views/review/reviewView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
