<%@page import="DrRAJ.Bean.ContactUsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ContactUs | ContactUs List</title>
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
			ContactUs <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">ContactUs</li>
		</ol>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">
							<%
								ArrayList<ContactUsBean> list = (ArrayList<ContactUsBean>) request.getAttribute("contactUsList");
							%>

							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Name</center></th>
									<th><center>Email Id</center></th>
									<th><center>Query</center></th>
									<th><center>Action</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									for (ContactUsBean bean : list) {
								%>
								<tr align="center">
									<td><%=bean.getName()%></td>
									<td><%=bean.getEmailId()%></td>
									<td><%=bean.getQuery()%></td>
									<td><a
										href="ContactUsDeleteServlet?contactUsId=<%=bean.getContactUsId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a> <%-- <a
										href="ContactUsEditServlet?contactUsId=<%=bean.getContactUsId()%>">Update</a> --%>
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