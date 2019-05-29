package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.HelloWorldFileRenamePolicy;
import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/member/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDirectory = getServletContext().getRealPath("/")+"upload/member/profile";
		//여기에 사용자가 업로드한 파일을 담을 것
		System.out.println("saveDirectory="+saveDirectory);
		
		//b. maxPostSize: 파일 최대 용량: 10mb
		//파일 최대 용량을 넘어서면 IOException 던진다
		int maxPostSize = 1024*1024*10;
		//c. FileRenamePolicy 객체 생성
		//FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
		//중복 파일에 대해서 넘버링을 해 줌
		//textFile.txt가 두 개라면 textFile1.txt, textFile2.txt 이런 식으로 넘버링. 안 덮어써지게.
		FileRenamePolicy policy = new HelloWorldFileRenamePolicy();
		
		//MultipartRequest 객체 생성
		MultipartRequest multiReq = new MultipartRequest(request, 
														 saveDirectory, 
														 maxPostSize,
														 "UTF-8",
														 policy);
		
		//인코딩
		request.setCharacterEncoding("UTF-8");
		//파라미터 핸들링
		String memberId = multiReq.getParameter("memberId");
		String memberName = multiReq.getParameter("memberName");
		String password = multiReq.getParameter("password");
		String question = multiReq.getParameter("question");
		String answer = multiReq.getParameter("answer");
		String gender = multiReq.getParameter("gender");
		String birth = multiReq.getParameter("birth");
		String tel = multiReq.getParameter("tel");
		String [] interests = multiReq.getParameterValues("interest");
		String interest = "";
		if(interests!=null) {
			interest = String.join(",", interests);			
		}
		
		String renamedImgName = "";
		String originalImgName = "";
		
		System.out.println("리네ㅣㅁ::"+multiReq.getFilesystemName("profile"));
		System.out.println("올진::"+multiReq.getOriginalFileName("profile"));
		
		if(multiReq.getFilesystemName("profile")==null &&
				multiReq.getOriginalFileName("profile")==null) {
			renamedImgName = "basicProfile.jpg";
			originalImgName = "basicProfile.jpg";
			
		}
		else{
			renamedImgName = multiReq.getFilesystemName("profile");
			originalImgName = multiReq.getOriginalFileName("profile");
		}
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberName(memberName);
		member.setPassword(password);
		member.setQuestion(question);
		member.setAnswer(answer);
		member.setGender(gender);
		member.setBirth(birth);
		member.setTel(tel);
		member.setInterest(interest);
		member.setRenamedImgName(renamedImgName);
		member.setOriginalImgName(originalImgName);
		
		System.out.println(member);
		
		//업무로직
		int result = new MemberService().insertMember(member);
		
		String msg = "";
		String loc = "";
		String view = "";
		
		//view단
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
