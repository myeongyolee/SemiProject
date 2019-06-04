/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.40
 * Generated at: 2019-06-04 06:12:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.review;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.*;

public final class reviewForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/views/common/header.jsp", Long.valueOf(1559628733195L));
    _jspx_dependants.put("/WEB-INF/views/common/footer.jsp", Long.valueOf(1559402842000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("member.model.vo");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	String visit = (String)request.getAttribute("visit");	

	//쿠키 관련 처리
	Cookie[] cookies = request.getCookies();
	boolean saveIdFlag = false;
	String memberIdSaved = "";
	
	if(cookies != null){
		for(Cookie c: cookies){
			String key = c.getName();
			String value = c.getValue();
			if("saveId".equals(key)){
				saveIdFlag = true;
				memberIdSaved = value;
			}
		}
	}
	if(memberLoggedIn != null){
	System.out.println(memberLoggedIn.getAnswer().replaceAll(" ", "").replaceAll("\\p{Z}", ""));
	}
	System.out.println("멤버로그드인=="+memberLoggedIn);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/common.css\" />\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.4.0.js\"></script>\r\n");
      out.write("<script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("$(function(){\r\n");
      out.write("\t");

	if(visit!=null && "first".equals(visit)){
	
      out.write("\r\n");
      out.write("\t\t$(\"#menubar\").css(\"right\",\"0px\");\r\n");
      out.write("\t\t$(\"#menubar\").css(\"display\",\"inline\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t");

		visit = "none";
	}
	
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t/* 메뉴바 클릭 이벤트 */\r\n");
      out.write("\t$(\"#menu_img\").click(function(){\r\n");
      out.write("\t\t$(\"#menubar\").animate({'right':'0px'},300,'linear');\r\n");
      out.write("\t\t$(\"#menubar\").css(\"display\",\"inline\");\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#menubar-close\").click(function(){\r\n");
      out.write("\t\t$(\"#menubar\").animate({'right':'-290px'},300, function(){\r\n");
      out.write("\t\t\t$(\"#menubar\").css(\"display\",\"none\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#chat-close\").click(function(){\r\n");
      out.write("\t\t$(\"#chat-container\").css({'display':'none'});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("$(function() {\r\n");
      out.write("\t $(\"#chat-container\").draggable();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function chatFunction(){\r\n");
      out.write("\t  var x = document.getElementById(\"chat-container\");\r\n");
      out.write("\t  if (x.style.display === \"none\") {\r\n");
      out.write("\t    x.style.display = \"block\";\r\n");
      out.write("\t  } else {\r\n");
      out.write("\t    x.style.display = \"none\";\r\n");
      out.write("\t  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function findMember(){\r\n");
      out.write("\t//아이디, 비밀번호 찾기 팝업 생성\r\n");
      out.write("\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/member/findMember\";\r\n");
      out.write("\tvar title = \"findMember\";\r\n");
      out.write("\tvar spec = \"width=500px, height=800px, left=500px, top=100px\";\r\n");
      out.write("\t\t\r\n");
      out.write("\tvar popup = open(url, title, spec); \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"container\">\r\n");
      out.write("\t<!-- 헤더 -->\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t<div id=\"header-container\" class=\"header\">\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(request.getContextPath());
      out.write("\">\r\n");
      out.write("\t\t\t<img id=\"logo_img\" src=\"");
      out.print(request.getContextPath());
      out.write("/images/logo.png\"/>\r\n");
      out.write("\t\t\t<span>HelloWorld</span>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<img id=\"chat_img\" src=\"");
      out.print(request.getContextPath());
      out.write("/images/chat.png\" onclick=\"chatFunction();\"/>\r\n");
      out.write("\t\t\t<img id=\"menu_img\" src=\"");
      out.print(request.getContextPath());
      out.write("/images/menu.png\"/>\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- 채팅화면 -->\r\n");
      out.write("        <div id=\"chat-container\">\r\n");
      out.write("            <span id=\"chat-title\">1:1 문의하기</span>\r\n");
      out.write("            <span id=\"chat-close\">x</span>\r\n");
      out.write("            <div id=\"msg-container\">\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅dodododd앵웅doddodododod</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">웅앵웅</ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div id=\"input\">\r\n");
      out.write("                <input type=\"text\"/>\r\n");
      out.write("                <button>전송</button>\r\n");
      out.write("            </div>        \r\n");
      out.write("        </div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- 메뉴바 -->\r\n");
      out.write("\t<div id=\"menubar\">\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<span id=\"menubar-close\">X</span>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- 로그인 메뉴/폼 -->\r\n");
      out.write("\t\t<div class=\"login-container\">\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\t\t");
if(memberLoggedIn == null){ 
      out.write("\r\n");
      out.write("\t\t\t<form action=\"");
      out.print(request.getContextPath() );
      out.write("/member/login\" \r\n");
      out.write("\t\t\t\t  id=\"loginfrm\"\r\n");
      out.write("\t\t\t\t  method=\"post\"\r\n");
      out.write("\t\t\t\t  onsubmit=\"loginSubmit();\"\r\n");
      out.write("\t\t\t\t  >\r\n");
      out.write("\t\t\t\t<span class=\"text\">로그인이 필요합니다.</span>\r\n");
      out.write("\t\t\t\t<br /><br />\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"");
      out.print(request.getContextPath());
      out.write("/images/userid.png\"/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   name=\"memberId\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   id=\"memberId\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   placeholder=\"   ID\"\r\n");
      out.write("\t\t\t\t\t\t\t\t   value=\"");
      out.print(saveIdFlag?memberIdSaved:"" );
      out.write("\"/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td rowspan=\"2\">\r\n");
      out.write("\t\t\t\t\t\t\t<input id=\"login_btn\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   type=\"submit\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   value=\"로그인\"/>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><img src=\"");
      out.print(request.getContextPath());
      out.write("/images/key.png\"/></td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   name=\"password\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   id=\"password\"\r\n");
      out.write("\t\t\t\t\t\t\t\t   placeholder=\"   PASSWORD\" />\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"checkbox\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   name=\"saveId\" \r\n");
      out.write("\t\t\t\t\t\t\t\t   id=\"saveId\"\r\n");
      out.write("\t\t\t\t\t\t\t\t   ");
      out.print(saveIdFlag?"checked":"");
      out.write("/>\r\n");
      out.write("\t\t\t\t\t\t\t<label id=\"saveId\">아이디 저장</label>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t<br />\r\n");
      out.write("\t\t\t&nbsp;\r\n");
      out.write("\t\t\t<input type=\"button\" value=\"아이디/비밀번호찾기\"\r\n");
      out.write("\t\t\t\t   class=\"membermenu\"\r\n");
      out.write("\t\t\t\t   onclick=\"findMember();\"/>\r\n");
      out.write("\t\t\t<input type=\"button\" value=\"회원가입\"\r\n");
      out.write("\t\t\t\t   class=\"membermenu\"\r\n");
      out.write("\t\t\t\t   onclick=\"location.href='");
      out.print(request.getContextPath());
      out.write("/member/memberEnroll'\"/>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t");

		}
		else{
		
      out.write("\r\n");
      out.write("\t\t\t<table id='logged-in'>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"profile-div\">\r\n");
      out.write("\t\t\t\t\t\t<img id=\"profile-viewer_\"\r\n");
      out.write("\t\t\t\t\t \t\t src=\"");
      out.print(request.getContextPath());
      out.write("/upload/member/profile/");
      out.print(memberLoggedIn.getRenamedImgName());
      out.write("\" \r\n");
      out.write("\t\t\t\t\t \t\t width=\"120px\" height=\"120px\"/>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(memberLoggedIn.getMemberName());
      out.write("님!<br>반갑습니다</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input type='button' \r\n");
      out.write("\t\t\t\t\t\t\t   value='My Page'\r\n");
      out.write("\t\t\t\t\t\t\t   onclick=\"location.href='");
      out.print(request.getContextPath());
      out.write("/member/memberMyPage?memberId=");
      out.print(memberLoggedIn.getMemberId());
      out.write("'\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input type='button'\r\n");
      out.write("\t\t\t\t\t\t\t   value='LogOut'\r\n");
      out.write("\t\t\t\t\t\t\t   onclick=\"location.href='");
      out.print(request.getContextPath());
      out.write("/member/Logout'\"/>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");

		}
		
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"loginCheck\" id=\"loginCheck\" value=\"0\"/>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 로그인 메뉴/폼 끝 -->\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<script>\r\n");
      out.write("\t\tfunction loginSubmit(){\r\n");
      out.write("\t\t\tif($(\"#memberId\").val().trim().length == 0){\r\n");
      out.write("\t\t\t\talert(\"아이디를 입력하세요.\");\r\n");
      out.write("\t\t\t\t$(\"#memberId\").focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif($(\"#password\").val().trim().length == 0){\r\n");
      out.write("\t\t\t\talert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("\t\t\t\t$(\"#password\").focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<!-- 메뉴목록 -->\r\n");
      out.write("\t\t<div id=\"menu\">\r\n");
      out.write("\t\t\t<ul id=\"menu-list1\">\r\n");
      out.write("\t\t\t");
if(memberLoggedIn != null) {
      out.write("\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("\">일정보기</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<ul id=\"menu-list2\">\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("\">찜리스트</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<ul id=\"menu-list3\">\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("\">내글보기</a></li>\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<ul id=\"menu-list4\">\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/review/reviewForm\">리뷰쓰기</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<ul id=\"menu-list5\">\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("\">문의사항</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t<ul id=\"menu-list6\">\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath());
      out.write("/notice/noticeList\">공지사항</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- 메뉴바 끝 -->\r\n");
      out.write("\t\r\n");
      out.write("\t<section id=\"content\">\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/reviewForm.css\" />\r\n");
      out.write("<title>리뷰 쓰기</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<br />\r\n");
      out.write("<section id=\"review-container\">\r\n");
      out.write("\t<br />\r\n");
      out.write("\t<h2>Review</h2>\r\n");
      out.write("\t<br /><hr /><br />\r\n");
      out.write("\t\r\n");
      out.write("\t<form action=\"");
      out.print(request.getContextPath());
      out.write("/review/reviewFormEnd\" \r\n");
      out.write("\t\t  method=\"post\" \r\n");
      out.write("\t\t  id=\"reviewForm\"\r\n");
      out.write("\t\t  enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t<table id=\"tbl-board\">\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><span class=\"review-span\">카테고리</span></th>\r\n");
      out.write("   \t\t\t\t<td>\r\n");
      out.write("   \t\t\t\t\t <select class=\"\" \r\n");
      out.write("   \t\t\t\t\t \t\t id=\"reviewCategory-select\" \r\n");
      out.write("   \t\t\t\t\t \t\t name=\"placeNo\">\r\n");
      out.write("     \t\t\t\t\t <option value=\"1\" selected=\"selected\">맛집</option>\r\n");
      out.write("     \t\t\t\t\t <option value=\"2\">쇼핑</option>\r\n");
      out.write("     \t\t\t\t\t <option value=\"3\">휴양</option>\r\n");
      out.write("     \t\t\t\t\t <option value=\"4\">레져</option>\r\n");
      out.write("     \t\t\t\t\t <option value=\"5\">역사</option>\r\n");
      out.write("    \t\t\t\t</select>\r\n");
      out.write("    \t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><span class=\"review-span\">장소</span></th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\"\r\n");
      out.write("\t\t\t\t\t\t   name=\"reviewPlace\" />\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><span class=\"review-span\">제목</span></th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" \r\n");
      out.write("\t\t\t\t\t\t   name=\"reviewTitle\"/>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" \r\n");
      out.write("\t\t\t\t\t\t   name=\"reviewWriter\"\r\n");
      out.write("\t\t\t\t\t\t   value=\"");
      out.print(memberLoggedIn.getMemberId());
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>\r\n");
      out.write("\t\t\t\t\t<span class=\"review-span\">사진</span>\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<div id=\"reviewImg-container\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"reviewImg-div-1\"\r\n");
      out.write("\t\t\t\t\t\t\t class=\"reviewImg-div\"\r\n");
      out.write("\t\t\t\t\t\t\t onclick=\"openFileReviewImg(1);\">\r\n");
      out.write("\t\t\t\t\t\t\t<img id=\"reviewImg-viewer-1\"\r\n");
      out.write("\t\t\t\t\t\t\t\t width=\"100px\" height=\"100px\"\r\n");
      out.write("\t\t\t\t\t\t\t\t src=\"");
      out.print(request.getContextPath());
      out.write("/images/plus.png\"/>\r\n");
      out.write("\t\t\t\t\t\t</div><input type=\"file\" \r\n");
      out.write("\t\t\t\t\t\t\t   name=\"reviewImg-1\" \r\n");
      out.write("\t\t\t\t   \t\t\t   id=\"reviewImg-1\"\r\n");
      out.write("\t\t\t\t   \t\t\t   style=\"display:none\"\r\n");
      out.write("\t\t\t\t   \t\t\t   onchange=\"loadReviewImg(this, 1)\"/></div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><span class=\"review-span\">내용</span></th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<textarea name=\"reviewContent\" \r\n");
      out.write("\t\t\t\t\t\t\t  id=\"reviewContent\" \r\n");
      out.write("\t\t\t\t\t\t\t  cols=\"30\" rows=\"10\">\r\n");
      out.write("\t\t\t\t\t</textarea>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>\r\n");
      out.write("\t\t\t\t\t<span class=\"review-span\">평가</span>\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<span class=\"star-input\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"input\">\r\n");
      out.write("\t\t\t\t\t    \t<input type=\"radio\" name=\"star-input\" value=\"1\" id=\"p1\">\r\n");
      out.write("\t\t\t\t\t    \t<label for=\"p1\">&nbsp;&nbsp;너무 별로였어요<i class=\"fa fa-frown-o\" aria-hidden=\"true\"></i></label>\r\n");
      out.write("\t\t\t\t\t    \t<input type=\"radio\" name=\"star-input\" value=\"2\" id=\"p2\">\r\n");
      out.write("\t\t\t\t\t    \t<label for=\"p2\">&nbsp;&nbsp;그냥 그랬어요<i class=\"fa fa-frown-o\" aria-hidden=\"true\"></i></label>\r\n");
      out.write("\t\t\t\t\t    \t<input type=\"radio\" name=\"star-input\" value=\"3\" id=\"p3\">\r\n");
      out.write("\t\t\t\t\t    \t<label for=\"p3\">&nbsp;&nbsp;가성비 괜찮았어요<i class=\"fa fa-meh-o\" aria-hidden=\"true\"></i></label>\r\n");
      out.write("\t\t\t\t\t    \t<input type=\"radio\" name=\"star-input\" value=\"4\" id=\"p4\">\r\n");
      out.write("\t\t\t\t\t    \t<label for=\"p4\">&nbsp;&nbsp;좋았어요<i class=\"fa fa-smile-o\" aria-hidden=\"true\"></i></label>\r\n");
      out.write("\t\t\t\t\t    \t<input type=\"radio\" name=\"star-input\" value=\"5\" id=\"p5\">\r\n");
      out.write("\t\t\t\t\t    \t<label for=\"p5\">&nbsp;&nbsp;정말 좋았어요<i class=\"fa fa-smile-o\" aria-hidden=\"true\"></i></label>\r\n");
      out.write("\t\t\t\t\t  \t</span>\r\n");
      out.write("\t\t\t\t\t  \t<output for=\"star-input\"><b></b></output>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" \r\n");
      out.write("\t\t\t\t\t\t   value=\"취소\"\r\n");
      out.write("\t\t\t\t\t\t   onclick=\"location.href='");
      out.print(request.getContextPath());
      out.write("'\"/>\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" \r\n");
      out.write("\t\t\t\t\t\t   value=\"등록\" \r\n");
      out.write("\t\t\t\t\t\t   onclick=\"return validate();\"/>\r\n");
      out.write("\t\t\t\t</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("</section>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$(\"#deleteProfile\").click(function(){\r\n");
      out.write("\t\t$(\"#profile-viewer\").attr(\"src\", \"");
      out.print(request.getContextPath());
      out.write("/upload/member/profile/nonProfile.png\");\r\n");
      out.write("\t\t$(\"#profile\").val(\"\");\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function openFileReviewImg(num){\r\n");
      out.write("\tvar n = num;\r\n");
      out.write("\tvar f = $(\"#reviewImg-\"+n);\r\n");
      out.write("\t\r\n");
      out.write("\tif($(\"#reviewImg-viewer-\"+n).prop(\"src\") ==\"http://localhost:9090/helloworld/images/plus.png\"){\r\n");
      out.write("\t\t$(\"#reviewImg-\"+n).click();\r\n");
      out.write("\t}\r\n");
      out.write("\telse{\r\n");
      out.write("\t\t$(\"#reviewImg-viewer-\"+n).attr(\"src\", \"");
      out.print(request.getContextPath());
      out.write("/images/plus.png\");\r\n");
      out.write("\t\t$(\"#reviewImg-\"+n).val(\"\");\r\n");
      out.write("\t\t$(\"#reviewImg-\"+n).click();\r\n");
      out.write("\t/* \t$(\"div#reviewImg-div-\"+n).remove();\r\n");
      out.write("\t\t$(\"input#reviewImg-\"+n).remove(); */\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("function loadReviewImg(f, num){\r\n");
      out.write("\tvar n = num;\r\n");
      out.write("\tconsole.log(f.files);\r\n");
      out.write("\tconsole.log(f.files[0]);\r\n");
      out.write("\t\r\n");
      out.write("\tif(f.files && f.files[0]){\r\n");
      out.write("\t\tvar reader = new FileReader();\r\n");
      out.write("\t\treader.readAsDataURL(f.files[0]);\r\n");
      out.write("\t\treader.onload = function(){\r\n");
      out.write("\t\t\t$(\"#reviewImg-viewer-\"+n).attr(\"src\", reader.result);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif($(\"input#reviewImg-\"+n)[0] == $(\"#reviewImg-container>input:last\")[0]){\r\n");
      out.write("\t\t\taddReviewDiv(n);\t\t\r\n");
      out.write("\t\t}\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function addReviewDiv(num){\r\n");
      out.write("\tvar n = num;\r\n");
      out.write("\t\r\n");
      out.write("\tif(n >= 10){\r\n");
      out.write("\t\talert(\"사진은 열 장까지 첨부 가능합니다.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\telse{\r\n");
      out.write("\t\tvar html = \"<div id='reviewImg-div-\"+(n+1)+\"'\";\r\n");
      out.write("\t\thtml += \"class='reviewImg-div'\";\r\n");
      out.write("\t\thtml += \"onclick='openFileReviewImg(\"+(n+1)+\");'>\";\r\n");
      out.write("\t\thtml += \"<img id='reviewImg-viewer-\"+(n+1)+\"'\";\r\n");
      out.write("\t\thtml += \"width='100px' height='100px'\";\r\n");
      out.write("\t\thtml += \"src='");
      out.print(request.getContextPath());
      out.write("/images/plus.png'/></div>\";\r\n");
      out.write("\t\thtml += \"<input type='file' name='reviewImg-\"+(n+1)+\"'\";\r\n");
      out.write("\t\thtml += \"id='reviewImg-\"+(n+1)+\"'\";\r\n");
      out.write("\t\thtml += \"style='display:none'\";\r\n");
      out.write("\t\thtml += \"onchange='loadReviewImg(this, \"+(n+1)+\");''/>\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"div#reviewImg-container\").append(html);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" /* 별 평점 주기 */\r\n");
      out.write("var starRating = function(){\r\n");
      out.write("var $star = $(\".star-input\"),\r\n");
      out.write("    $result = $star.find(\"output>b\");\r\n");
      out.write("\t\r\n");
      out.write("  \t$(document)\r\n");
      out.write("\t.on(\"focusin\", \".star-input>.input\", \r\n");
      out.write("\t\tfunction(){\r\n");
      out.write("   \t\t $(this).addClass(\"focus\");\r\n");
      out.write(" \t})\r\n");
      out.write("\t\t \r\n");
      out.write("\t   \t.on(\"focusout\", \".star-input>.input\", function(){\r\n");
      out.write("\t    \tvar $this = $(this);\r\n");
      out.write("\t    \tsetTimeout(function(){\r\n");
      out.write("\t      \t\tif($this.find(\":focus\").length === 0){\r\n");
      out.write("\t       \t\t\t$this.removeClass(\"focus\");\r\n");
      out.write("\t     \t \t}\r\n");
      out.write("\t   \t\t}, 100);\r\n");
      out.write("\t \t })  \r\n");
      out.write("\t\t    .on(\"change\", \".star-input :radio\", function(){\r\n");
      out.write("\t\t    \t$result.text($(this).next().text());\r\n");
      out.write("\t\t  \t})\r\n");
      out.write("\t\t\t    .on(\"mouseover\", \".star-input label\", function(){\r\n");
      out.write("\t\t\t    \t$result.text($(this).text());\r\n");
      out.write("\t\t\t    })\r\n");
      out.write("\t\t\t\t    .on(\"mouseleave\", \".star-input>.input\", function(){\r\n");
      out.write("\t\t\t\t    \tvar $checked = $star.find(\":checked\");\r\n");
      out.write("\t\t\t\t    \t\tif($checked.length === 0){\r\n");
      out.write("\t\t\t\t     \t \t\t$result.text(\"\");\r\n");
      out.write("\t\t\t   \t\t \t} else {\r\n");
      out.write("\t\t\t     \t \t\t$result.text($checked.next().text());\r\n");
      out.write("\t\t\t    \t\t}\r\n");
      out.write("  \t});\r\n");
      out.write("};\r\n");
      out.write("\r\n");
      out.write("starRating();\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t</section>\r\n");
      out.write("\t\t<footer>\r\n");
      out.write("\t\t\t<p>&lt;ⓒ  copyright 2019. <strong>HelloWorld</strong>. All rights reserved.&gt;</p>\r\n");
      out.write("\t\t</footer>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
