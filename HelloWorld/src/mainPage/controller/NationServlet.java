package mainPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainPage.model.service.MainPageService;
import mainPage.model.vo.City;
import mainPage.model.vo.City_Img;

/**
 * Servlet implementation class NationServlet
 */
@WebServlet("/nationToCity")
public class NationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//검색어 파라미터 핸들링
		String nid = request.getParameter("nid");
		//로직 부분
		List<City_Img> cityList = null;
		List<City> cityNameList = null;
		cityList = new MainPageService().selectCities(nid);
		cityNameList = new MainPageService().selectCityNames(nid);
		String view = "";
		String loc = "";
		String msg = "";
		if((cityList!=null)&&(cityNameList != null)) {
			view = "/WEB-INF/views/nations/city_img.jsp";
			request.setAttribute("cityList", cityList);
			request.setAttribute("cityNameList", cityNameList);
			request.setAttribute("nationName", nid);
		}else {
			view = "/WEB-INF/views/common/msg.jsp";
			loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		 request.getRequestDispatcher(view).forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
