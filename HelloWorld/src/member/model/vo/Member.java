package member.model.vo;

import java.io.Serializable;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Member implements Serializable, HttpSessionBindingListener{
	private String memberId;
	private String memberName;
	private String password;
	private String question;
	private String answer;
	private String gender;
	private String birth;
	private String tel;
	private String interest;
	private String renamedImgName;
	private String originalImgName;
	

	public Member() {
	}


	
	public Member(String memberId, String memberName, String password, String question, String answer, String gender,
			String birth, String tel, String interest, String renamedImgName, String originalImgName) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.password = password;
		this.question = question;
		this.answer = answer;
		this.gender = gender;
		this.birth = birth;
		this.tel = tel;
		this.interest = interest;
		this.renamedImgName = renamedImgName;
		this.originalImgName = originalImgName;
	}



	public String getRenamedImgName() {
		return renamedImgName;
	}
	
	public void setRenamedImgName(String renamedImgName) {
		this.renamedImgName = renamedImgName;
	}
	
	public String getOriginalImgName() {
		return originalImgName;
	}
	
	public void setOriginalImgName(String originalImgName) {
		this.originalImgName = originalImgName;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	


	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", password=" + password + ", question="
				+ question + ", answer=" + answer + ", gender=" + gender + ", birth=" + birth + ", tel=" + tel
				+ ", interest=" + interest + ", renamedImgName=" + renamedImgName + ", originalImgName="
				+ originalImgName + "]";
	}



	/**
	 * 세션 속성에서 Member 객체가 등록될 때 발생 
	 */
	
	@Override
	public void valueBound(HttpSessionBindingEvent arg0) {
		System.out.println("["+memberId+"]님이 로그인하셨습니다.");
	}

	/**
	 * 세션 속성에서 Member 객체가 삭제될 때 발생
	 * (session.invalidate 메소드 호출시)
	 */
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println("["+memberId+"]님이 로그아웃하셨습니다.");		
	}
	
}
