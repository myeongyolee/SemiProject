package mainPage.model.vo;

public class Nation {
	private int national_code;
	private String national_name;
	
	public Nation() {}
	
	public int getNational_code() {
		return national_code;
	}
	public void setNational_code(int national_code) {
		this.national_code = national_code;
	}
	public String getNational_name() {
		return national_name;
	}
	public void setNational_name(String national_name) {
		this.national_name = national_name;
	}

	@Override
	public String toString() {
		return national_name;
	}
	
	
}
