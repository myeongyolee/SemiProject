package mainPage.model.vo;

public class City_Img {
private int city_code;
private String city_image;

public City_Img() {}

public int getCity_code() {
	return city_code;
}
public void setCity_code(int city_code) {
	this.city_code = city_code;
}
public String getCity_image() {
	return city_image;
}
public void setCity_image(String city_image) {
	this.city_image = city_image;
}

@Override
public String toString() {
	return "City_Img [city_code=" + city_code + ", city_image=" + city_image + "]";
}

}
