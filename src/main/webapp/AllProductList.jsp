<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
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
		Gson gson = new Gson();
		ArrayList<ProductBean> list = (ArrayList<ProductBean>) new ProductDAO().getList();
		String jsonCartList = gson.toJson(list);
	%>
	<h3>
		<%=jsonCartList %>
	</h3>
</body>
</html>