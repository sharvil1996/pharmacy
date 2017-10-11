<%@page import="DrRAJ.Bean.BookBean"%>
<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Book List</title>
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
			Book <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		<br>
		<br>
		<a href="BookInsert.jsp" name="ADD" class="btn btn-primary">ADD</a>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<%
								ArrayList<BookBean> list = (ArrayList<BookBean>) request.getAttribute("listOfBook");
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Name</center></th>
									<th><center>Author</center></th>
									<th><center>Type</center></th>
									<th><center>ISBN</center></th>
									<th><center>PhotoLink</center></th>
									<th><center>URLLink</center></th>
									<th><center>Description</center></th>
									<th><center>Action</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (BookBean bean : list) {
								%>
								<tr align="center">
									<td><%=bean.getName()%></td>
									<td><%=bean.getAuthor()%></td>
									<td><%=bean.getType()%></td>
									<td><%=bean.getIsbn()%></td>
									<td><%=bean.getPhotolink()%></td>
									<td><%=bean.getUrllink()%></td>
									<td><textarea disabled="disabled"><%=bean.getDescription()%></textarea></td>
									<td><a
										href="BookEditServlet?bookId=<%=bean.getBookId()%>"><img
											src="photos/edit.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp; <a
										href="BookDeleteServlet?bookId=<%=bean.getBookId()%>"><img
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