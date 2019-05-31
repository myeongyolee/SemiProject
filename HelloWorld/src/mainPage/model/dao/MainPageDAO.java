package mainPage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mainPage.model.vo.City;
import mainPage.model.vo.City_Img;
import mainPage.model.vo.Nation;

public class MainPageDAO {
private Properties prop = new Properties();
    
    public MainPageDAO() {
        String fileName = getClass()
                         .getResource("/sql/MainPage/mainPage.properties")
                         .getPath();
//        AjaxDAO의 클래스 객체로부터 getResource 메소드 호출. getPath는 절대경로를 호출하기 위해
        
        try {
            prop.load(new FileReader(fileName));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	public List<Nation> searchNation(Connection conn, String srchNation) {
	List<Nation> list= null;
	PreparedStatement pstmt= null;
	ResultSet rset = null;
	Nation n =null;
	String sql = prop.getProperty("searchNation");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, '%'+ srchNation+'%');
		rset= pstmt.executeQuery();
		list=new ArrayList<Nation>();
		while(rset.next()) {
			n = new Nation();
			n.setNational_name(rset.getString("national_name"));
			list.add(n);
		}
	
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	return list;
	}
	//해당 국가 도시 img 불러오기
	public List<City_Img> selectCities(Connection conn, String nid) {
		List<City_Img> cityList= null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCities");
		//System.out.println("nid @ DAO == " + nid);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nid);
			rset= pstmt.executeQuery();
			cityList=new ArrayList<City_Img>();
			while(rset.next()) {
				City_Img c = new City_Img();
				c.setCity_image(rset.getString("city_img"));
				cityList.add(c);
			}
			//System.out.println("cityList@DAO ==" + cityList );
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		return cityList;
	}
	//이미지에 매칭될 도시 이름 가져오기
	public List<City> selectCityNames(Connection conn, String nid) {
		List<City> cityNameList= null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCityNames");
		//System.out.println("nid @ DAO == " + nid);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nid);
			rset= pstmt.executeQuery();
			cityNameList=new ArrayList<City>();
			while(rset.next()) {
				City c = new City();
				c.setCity_name(rset.getString("city_name"));
				cityNameList.add(c);
			}
			//System.out.println("cityNameList@DAO ==" + cityNameList );
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		return cityNameList;
	}

}
