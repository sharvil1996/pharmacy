<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DrRAJ.DAO.ProductCategoryDAO"%>
<%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<ProductBean> categoryList = (ArrayList<ProductBean>) request.getAttribute("categoryBean");
		Gson gson = new Gson();
		String temp = gson.toJson(categoryList);
	%>

	<h4><%=temp%></h4>
</body>
</html>