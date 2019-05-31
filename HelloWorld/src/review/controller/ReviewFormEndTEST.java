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
 * Servlet implementation class ReviewFormEndTEST
 */
@WebServlet("/review/reviewFormEndTest")
public class ReviewFormEndTEST extends HttpServlet {
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
	
		//////////////////////////////////////////////////////////////////////////////////////////////////
		
		String reviewTitle = multiReq.getParameter("reviewTitle");
		String reviewWriter = multiReq.getParameter("reviewWriter");
		String reviewContent = multiReq.getParameter("reviewContent");
		int placeNo = Integer.parseInt(multiReq.getParameter("placeNo"));
		
		Review r = new Review(0, reviewWriter, placeNo, reviewTitle, reviewContent, 0, 0, 0, null);
		int reviewNo = new ReviewService().insertReview(r);
		System.out.println("reviewNo="+reviewNo);
		/////////////////////////////////////////////////////////////////////////////////////////////////
		
		String Omain = multiReq.getOriginalFileName("mainFile");
		String Rmain = multiReq.getFilesystemName("mainFile");
		System.out.println("Omain="+Omain);
		System.out.println("Rmain="+Rmain);
		
		System.out.println("reviewNo="+reviewNo);
		ReviewPhoto rp = new ReviewPhoto(0, reviewNo, 1, Omain, Rmain);
		int result = new ReviewService().insertReviewPhoto(rp);
		
		/////////////////////////////////////////////////////////////////////////////////////////////////
		
		String original = multiReq.getParameter("fileName");
		System.out.println(original);
		
		String[] strArr = original.split("&");
		
		String renamed = "";
		for(int i=0; i<strArr.length; i++) {
			renamed += RenamePolicy(strArr[i]);
			if(i < strArr.length - 1) {
				renamed += "&";
			}
		}
		System.out.println(renamed);
		System.out.println("reviewNo="+reviewNo);
		ReviewPhoto rp2 = new ReviewPhoto(0, reviewNo, 0, original, renamed);
		int result2 = new ReviewService().insertReviewPhoto(rp2);
		
		///////////////////////////////////////////////////////////////////////////////////
		
		String msg = "성공? 실패?";
		String loc = "/review/reviewView?reviewNo="+reviewNo;
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
	
	private String RenamePolicy(String original) {
		
		//확장자
		String oldName = original; //사용자가 전송한 파일이름
		String ext = "";
		int dot = oldName.lastIndexOf(".");
		if(dot > -1) {
			ext = oldName.substring(dot);
		}

		String result = original + "가나다" + ext;

		return result;
	}

}
