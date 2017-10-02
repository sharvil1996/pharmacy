<%@page import="DrRAJ.Bean.AdminBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Admin List</title>
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
			Admin <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		<br>
		<br>
		<a href="adminInsert.jsp"><input type="button" value="ADD"
			name="ADD" class="btn btn-primary"></a> <br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">
							<%
								ArrayList<AdminBean> list = (ArrayList<AdminBean>) request.getAttribute("adminList");
							%>

							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>First Name</center></th>
									<th><center>Last Name</center></th>
									<th><center>Email Id</center></th>
									<th><center>Action</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (AdminBean bean : list) {
								%>
								<tr align="center">
									<td><%=bean.getFirstName()%></td>
									<td><%=bean.getLastName()%></td>
									<td><%=bean.getEmailId()%></td>
									<td><a
										href="AdminDeleteServlet?adminId=<%=bean.getAdminId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a> <%-- <a
										href="AdminEditServlet?adminId=<%=bean.getAdminId()%>">Update</a> --%>
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