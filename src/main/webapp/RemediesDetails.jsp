<%@page import="com.google.gson.Gson"%>
<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DrRAJ.Bean.RemediesBean"%>
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
		RemediesBean bean = (RemediesBean) request.getAttribute("remediesbean");

		ArrayList<ProductBean> list = (ArrayList<ProductBean>) new ProductDAO()
				.getAllListByRemedies(bean.getRemediesId());
		Gson gson = new Gson();
		String remedieslist = gson.toJson(list);
	%>
	
	<h3><%=remedieslist %></h3>
</body>
</html>