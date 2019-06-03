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

/**
 * Servlet implementation class ReviewListServelt
 */
@WebServlet("/review/reviewList")
public class ReviewListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리뷰게시판테이블에서 정보가지고 와서
		//reviewList.jsp에 넘겨 화면에 보여주기
		int cPage = 1;
		try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			
		}
		
		int numPerPage = 5;
		try {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			
		}
		List<Review> list = new ReviewService().selectAll(cPage, numPerPage);
		
		// -------------------------- 컨텐츠영역 종료 -----------------------------//
		
		// -------------------------- 페이징바 영역시작  ---------------------------//
		//전체컨텐츠수
		int totalContent = new ReviewService().countAll();
		//전체페이지수
		int totalPage = totalContent%numPerPage==0?totalContent/numPerPage:(totalContent/numPerPage)+1;
		//페이지바 size
		int pageBarSize = 5;
		//pageNo
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		String pageBar = "";
		
		//[이전]
		if(pageNo == 1) {

		} else {
			pageBar += "<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}

		//[pageNo]
		while(pageNo<=pageEnd && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>";
			} else {
				pageBar += "<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo)+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}

		//[다음]
		if(pageNo > totalPage) {

		} else {
			pageBar += "<a href='"+request.getContextPath()+"/review/reviewList?cPage="+(pageNo)+"'>[다음]</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		
		//view단 처리
		request.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
