<%@page import="DrRAJ.Bean.RemediesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DrRAJ.Bean.TestimonialBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Remedies List</title>
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
			Remedies <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		<br>
		<br>
		<a href="RemediesInsert.jsp"><input type="button" value="ADD"
			name="ADD" class="btn btn-primary"></a> <br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>NAME</center></th>
									<th><center>Link</center></th>
									<th><center>ACTION</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									List<RemediesBean> listOfRemedies = (ArrayList) request.getAttribute("listOfRemedies");

									if (listOfRemedies != null) {
										for (int i = 0; i < listOfRemedies.size(); i++) {
											RemediesBean remediesBean = listOfRemedies.get(i);
								%>

								<tr align="center">
									<td><%=remediesBean.getName()%></td>
									<td><%=remediesBean.getPhotolink()%></td>
									<td><a
										href="RemediesDeleteServlet?remediesId=<%=remediesBean.getRemediesId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp;<a
										href="RemediesEditServlet?remediesId=<%=remediesBean.getRemediesId()%>"><img
											src="photos/edit.ico" height="30" width="30"
											class="img-rounded" /></a></td>
								</tr>
								<%
									}
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