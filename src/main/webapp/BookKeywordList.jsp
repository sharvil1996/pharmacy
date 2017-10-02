<%@page import="DrRAJ.Bean.BookKeywordBean"%>
<%@page import="DrRAJ.Bean.BookBean"%>
<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Book Keyword List</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="icon" href="photos/daiict.png" />
<style>
td, tr, th {
	/*text-transform: uppercase;*/
	
}
</style>
</head>
<body>
	<%@include file="AdminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content content-header">
		<h1>
			Book Keyword<small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		<br>
		<br>
		<a href="BookKeywordInsert.jsp" name="ADD" class="btn btn-primary">ADD</a>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<%
								ArrayList<BookKeywordBean> list = (ArrayList<BookKeywordBean>) request.getAttribute("listOfBookKeyword");
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Keyword</center></th>
									<th><center>Book Name</center></th>
									<th><center>Author</center></th>
									<th><center>ISBN</center></th>

									<th><center>Action</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (BookKeywordBean bean : list) {
								%>
								<tr align="center">
									<td><%=bean.getKeyword()%></td>
									<td><%=bean.getBookName()%></td>
									<td><%=bean.getAuthor()%></td>
									<td><%=bean.getIsbn()%></td>
									<td><a
										href="BookKeywordEditServlet?bookKeywordId=<%=bean.getBookKeywordId()%>"><img
											src="photos/edit.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp; <a
										href="BookKeywordDeleteServlet?bookKeywordId=<%=bean.getBookKeywordId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
</body>
</html>