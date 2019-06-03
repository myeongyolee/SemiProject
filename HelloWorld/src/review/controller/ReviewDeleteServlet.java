package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.ReviewPhoto;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/review/reviewDelete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		
		//존재하는 사진 찾아서 저장소에서 삭제하기
		List<ReviewPhoto> list = new ReviewService().selectPhoto(reviewNo);
		String saveDirectory = getServletContext().getRealPath("/upload/review");
		for(ReviewPhoto rp : list) {
			boolean bool = new File(saveDirectory+"/"+rp.getRenamedPhotoName()).delete();
		}
		
		
		int result = new ReviewService().deleteReview(reviewNo); // 리뷰테이블 삭제
		int result_1 = new ReviewService().deleteReviewPhoto(reviewNo); // 리뷰사진테이블 삭제
		
		
		request.setAttribute("msg", "삭제완료");
		request.setAttribute("loc", "/review/reviewList");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
