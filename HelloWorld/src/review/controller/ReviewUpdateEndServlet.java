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
 * Servlet implementation class ReviewUpdateEndServlet
 */
@WebServlet("/review/reviewUpdateEnd")
public class ReviewUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//enctype=multipart/form-data로 전송했는지 여부검사
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "파일 업로드 오류: 관리자에게 문의하세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//MultipartRequest객체 생성
		/*MultipartRequest(HttpServletRequest request,String saveDirectory,int maxPostSize,String encoding,FileRenamePolicy policy)*/
		String saveDirectory = getServletContext().getRealPath("/upload/review");
		
		int maxPostSize = 1024*1024*10;
		
		FileRenamePolicy policy = new HelloMVCFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", policy);
		
		//------------------------------------------------------------
		
		int reviewNo = Integer.parseInt(multiReq.getParameter("reviewNo"));
		String reviewTitle = multiReq.getParameter("reviewTitle");
		String reviewWriter = multiReq.getParameter("reviewWriter");
		String reviewContent = multiReq.getParameter("reviewContent");
		
		Review rv = new Review();
		rv.setReviewNo(reviewNo);
		rv.setPlaceTitle(reviewTitle);
		rv.setMemberId(reviewWriter);
		rv.setReviewContent(reviewContent);
		
		int result = new ReviewService().updateReview(rv);
		
		//===============================================================
		
		int mainPhoto = 0;
		
		String newFileName = "";
		String renamedNewFileName = "";
		
		//수정 시, 새로 추가한 이미지파일 및 기존에 업로드한 이미지 파일들
		for(int i=0; i<9; i++) {
			if(multiReq.getOriginalFileName("file_"+i)!=null) {
			newFileName += multiReq.getOriginalFileName("file_"+i);
			renamedNewFileName += multiReq.getFilesystemName("file_"+i);
			}
			else {
				newFileName += "없음";
				renamedNewFileName += "없음";
			}
			if(i<8) {
				newFileName += "&";
				renamedNewFileName += "&";
			}
		}
		System.out.println("newFileName@updateendServlet="+newFileName);
		System.out.println("renamedNewFileName@updateendServlet="+renamedNewFileName);
	
		
		String originalFile = "";
		String renamedoriginalFile = "";
		for(int i=0; i<9; i++) {
			if(multiReq.getParameter("originalFileNameOld_"+i)!=null 
					&& !multiReq.getParameter("originalFileNameOld_"+i).equals("") ) {
				originalFile += multiReq.getParameter("originalFileNameOld_"+i);
				renamedoriginalFile += multiReq.getParameter("renamedFileNameOld_"+i);
			}
			else {
				originalFile += "없음";
				renamedoriginalFile += "없음";
			}
			if(i<8) {
				originalFile += "&";
				renamedoriginalFile += "&";
			}
		}
		System.out.println("originalFile@updateendServlet="+originalFile);
		System.out.println("renamedoriginalFile@updateendServlet="+renamedoriginalFile);
		
		//새로 등록한 대표사진
		String newOriginalMain = multiReq.getOriginalFileName("upFile");
		String newRenamedMain = multiReq.getFilesystemName("upFile");
		
		System.out.println("=========================================");
		System.out.println("새로등록한 메인사진 :" + newOriginalMain);
		System.out.println("새로등록한 메인사진renamed :" + newRenamedMain);
		System.out.println("=========================================");
		
		String finalOriginalFileName = newOriginalMain +"&"+ newFileName +"&"+ originalFile;
		String finalrenamedFileName = newRenamedMain +"&"+ renamedNewFileName +"&"+ renamedoriginalFile;
		
		System.out.println("쿼리보내기마지막1="+finalOriginalFileName);
		System.out.println("쿼리보내기마지막2="+finalrenamedFileName);
		
		ReviewPhoto rp = new ReviewPhoto();
		rp.setReviewNo(reviewNo); // 등록하는 글번호
		rp.setOriginalPhotoName(finalOriginalFileName);
		rp.setRenamedPhotoName(finalrenamedFileName);
		
		int total = new ReviewService().deleteReviewPhoto(reviewNo); // 전체싹지우고 
		int total2 = new ReviewService().insertReviewPhoto(rp, (mainPhoto)); // 새로 저장
		
		//=========================================================================
		
		String msg = "";
		String loc = "";
		String view = "/WEB-INF/views/common/msg.jsp";
		if(result>0) {
			msg = "수정 성공";
			loc = "/review/reviewView?reviewNo="+reviewNo;
		}
		else {
			msg = "수정 실패";
			loc = "/review/reviewList";
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
