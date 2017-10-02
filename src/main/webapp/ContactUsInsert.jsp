<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ContactUsInsertServlet" method="post">
		Name <input type="text" name="txtName" value="${txtName}">${name}<br>
		Email Id<input type="text" name="txtEmailId" value="${txtEmailId}">${emailId}<br>
		Query
		<textarea rows="5" cols="50" name="txtQuery">${txtQuery}</textarea>${query}
		<br> <input type="submit">
	</form>
</body>
</html>