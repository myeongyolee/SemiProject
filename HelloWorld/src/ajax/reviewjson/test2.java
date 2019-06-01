package ajax.reviewjson;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class test2
 */
@WebServlet("/test/testCheck2")
public class test2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int g_count = Integer.parseInt(request.getParameter("g_count"));
		int p_count = Integer.parseInt(request.getParameter("p_count"));
		int del_count = Integer.parseInt(request.getParameter("del_count"));
		
		System.out.println("g_Count="+g_count);
		
		JSONArray jsonArr = new JSONArray();
		
		JSONObject jsonUser = new JSONObject();
		jsonUser.put("number", g_count);
		jsonUser.put("ptag", p_count);
		jsonUser.put("del_count", del_count);
		
		jsonArr.add(jsonUser);
		System.out.println("jsonArr="+jsonArr);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonArr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
