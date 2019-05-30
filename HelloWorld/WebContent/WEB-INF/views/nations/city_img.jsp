<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "java.util.*, 
 					mainPage.model.vo.*" %>
    <script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
    <% List<City_Img>cityList = (List<City_Img>)request.getAttribute("cityList"); 
    List<City> cityNameList = (List<City>)request.getAttribute("cityNameList");
    String nationName = (String)request.getAttribute("nationName");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h2><%= nationName %></h2>  
			<br />
			<h2></h2>
			
	<%
	if((!cityList.isEmpty()) && (!cityNameList.isEmpty())){
		for(int i=0; i<cityList.size();i++){
			City_Img c= cityList.get(i);
			City cn=cityNameList.get(i); 
			{if(c.getCity_image().equals(c.getCity_image())){%>
		<tr>
			<th> <img src="<%=request.getContextPath()%><%=c.getCity_image() %>"/></th>
			<td> <%=cn.getCity_name() %></td>
			
		</tr>
		<%}
	}}}else{
	%>
	<%} %>
</body>
</html>