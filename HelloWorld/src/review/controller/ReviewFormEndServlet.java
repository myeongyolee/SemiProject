package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.HelloMVCFileRenamePolicy;
import review.model.service.ReviewService;
import review.model.vo.Review;
import review.model.vo.ReviewPhoto;

/**
 * Servlet implementation class ReviewFormEndServlet
 */
@WebServlet("/review/reviewFormEnd")
public class ReviewFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "파일 업로드 오류: 관리자에게 문의하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//a.파일저장경로
		String saveDirectory = getServletContext().getRealPath("/")+"upload/review";
		
		//b.파일최대용량:10mb
		//파일최대용량을 넘어서면 IOException을 던진다
		int maxPostSize = 1024*1024*10;
				
		//c.FileRenamePolicy객체 생성
		FileRenamePolicy policy = new HelloMVCFileRenamePolicy();
				
		//MultipartRequest객체생성
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", policy);
		
		// -------------------------------------------------------------------------------//
		
		//리뷰작성정보
		String reviewTitle = multiReq.getParameter("reviewTitle");
		String reviewWriter = multiReq.getParameter("reviewWriter");
		String reviewContent = multiReq.getParameter("reviewContent");
		int placeNo = Integer.parseInt(multiReq.getParameter("placeNo"));
		
		System.out.println(reviewTitle);
		System.out.println(reviewWriter);
		System.out.println(reviewContent);
		System.out.println(placeNo);
		
		Review rv = new Review();
		rv.setPlaceTitle(reviewTitle);
		rv.setMemberId(reviewWriter);
		rv.setReviewContent(reviewContent);
		rv.setPlaceNo(placeNo);
		
		int reviewNo = new ReviewService().insertReview(rv);

		//이미지파일
		int mainPhoto = Integer.parseInt(multiReq.getParameter("mainPhoto"));
		System.out.println("메인사진 몇번?"+mainPhoto);
		
		String originalfileName = "";
		String renamedfileName = "";
		
		for(int i=0; i<9; i++) {
			if(multiReq.getOriginalFileName("file_"+i)!=null) {
				originalfileName += multiReq.getOriginalFileName("file_"+i);
				renamedfileName += multiReq.getFilesystemName("file_"+i);
			}
			else {
				originalfileName += "없음";
				renamedfileName += "없음";
			}
			if(i<8) {
				originalfileName += "&";
				renamedfileName += "&";
			}
		}
		
		System.out.println("originalfileName@servlet="+originalfileName);
		System.out.println("renamedfileName@servlet="+renamedfileName);
		
		ReviewPhoto rp = new ReviewPhoto();
		rp.setReviewNo(reviewNo); // 등록하는 글번호
		rp.setOriginalPhotoName(originalfileName);
		rp.setRenamedPhotoName(renamedfileName);
		
		int result = new ReviewService().insertReviewPhoto(rp, mainPhoto);
		
		// ---------------------------------------------------------//
		
		//view
		String msg = "";
		String loc = "/review/reviewList";
		if(reviewNo>0) {
			msg = "성공";
			loc = "/review/reviewView?reviewNo="+reviewNo;
		} else {
			msg = "실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
