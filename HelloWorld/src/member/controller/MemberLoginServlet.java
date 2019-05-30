package member.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet(urlPatterns= {"/member/login"},
			name = "MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setPassword(password);
		
		//아이디 없음 -1
		//비밀번호 틀림 0
		//로그인 성공 1
		int result = new MemberService().loginCheck(m);
		
		//header 정보 열람
		Map<String, String> headerMap = new HashMap<>();
		Enumeration<String> headerNames = request.getHeaderNames();
		//사용자가 요청한 헤더에 뭐가 왔는지 다 볼 것
		while(headerNames.hasMoreElements()) {
			String name = headerNames.nextElement();
			String value = request.getHeader(name); //key값으로 가져오는 메소드
			headerMap.put(name, value); //헤더맵에 다 집어넣기
		}
		String referer = request.getHeader("Referer"); //키값은 대소문자 구분하니 정확하게 입력
		String origin = request.getHeader("Origin");
		String url = request.getRequestURL().toString(); //리턴값이 스트링버퍼이므로 string으로 변환
		String uri = request.getRequestURI();
		
		String view = "";
		String msg = "";
		String loc = referer.replace(origin+request.getContextPath(), "");
		
		/*//로그인 성공
		if(result == 1) {
			view = "/index.jsp";
			//로그인에 성공한 회원 정보 가져오기
			Member memberLoggedIn = new MemberService().selectOne(memberId);
		
			//request의 생명줄은 응답이 끝나면 (사용자 요청 끝나면) 끝나버림 
			//request에 저장하지 않고 조금 더 목숨줄이 긴 session에 저장
			//상태 유지를 위하여 session 객체에 로그인한 사용자 정보를 담는다.
			
			//session 객체 가져오기
			//1. 세션이 있다면 해당 세션을 리턴하고 없다면 새로 생성해서 리턴
			//request.getSession(), request.getSession(true)
			//2. 세션이 있으면 해당 세션을 리턴하고 없다면 null을 리턴
			//request.getSession(false);
			HttpSession session = request.getSession();
			session.setAttribute("memberLoggedIn", memberLoggedIn); //세션도 속성 전달 가능
			//System.out.println("세션 객체 아이디: "+session.getId()); //이걸 사용자와 주고받음
			
			//현재 최대 허용시간 (초 단위)
	//					System.out.println(session.getMaxInactiveInterval());
			
			//자바코드에서 유효시간 설정 가능(초 단위): web.xml보다 우선 순위가 높다
			session.setMaxInactiveInterval(300);
			
			//로그인 성공시 아이디 저장 쿠키 처리
			System.out.println("saveId@MemberLoginServlet="+saveId);
			if(saveId != null) {
				Cookie c = new Cookie("saveId", memberId); //키 밸류 쌍으로 저장
				c.setMaxAge(7*24*60*60); //초 단위로 유효기간 설정
				c.setPath("/"); //현재 도메인 전역에서 사용하겠다는 의미
				response.addCookie(c); //사용자에게 응답 보낼 때 이 쿠키값 가지고 가서 클라이언트에게 이 쿠키 저장
			} 
			else {
				//쿠키 는 별도의 삭제 메소드 없이 maxAge값을 0으로 해서 바로 삭제하게 만듦
				Cookie c = new Cookie("saveId", memberId);
				c.setMaxAge(0); //즉시 삭제. 음수값 사용시 현재 세션 객체가 유효한 동안만 사용하겠다는 의미
				c.setPath("/");
				response.addCookie(c);
				
			}
			
			
			//redirect: 클라이언트에게 다시 요청을 보내라고 돌려보냄
			//httpStatus: 3xx
			//response.sendRedirect(request.getContextPath()); //이 주소로 다시 요청해라
			response.sendRedirect(referer); 
		}
		//로그인 실패
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			//index. contextPath를 포함시켜야 하지만 msg.jsp에서 하겠음.
			
			//비밀번호 불일치
			if(result == MemberService.WRONG_PASSWORD){
				msg = "비밀번호가 틀렸습니다.";
			} 
			//존재하지 않는 아이디
			else {
				//result == MemberService.ID_NOT_EXIST
				msg = "존재하지 않는 아이디입니다.";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			//4.view단 처리
			RequestDispatcher reqDispatcher =
					request.getRequestDispatcher(view);
			reqDispatcher.forward(request, response);
		}
		*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
