<%@page import="DrRAJ.Bean.CityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | City List</title>
<link rel="icon" type="image/png" href="imgs/favicon.png"
	sizes="256x256">
<style>
td, tr, th {
	text-transform: uppercase;
}
</style>
</head>
<body>
	<%@include file="AdminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content content-header">
		<h1>
			City <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">City</li>
		</ol>
		<br>
		<br>
		<a href="CityInsert.jsp"><input type="button" value="ADD"
			name="ADD" class="btn btn-primary"></a> <br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">
							<%
								ArrayList<CityBean> list = (ArrayList<CityBean>) request.getAttribute("listOfCity");
								if (list != null && list.size() != 0) {
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>City Name</center></th>
									<th><center>Country Name</center></th>
									<th><center>Action</center></th>
								</tr>
							</thead>


							<tbody>
								<%
									for (CityBean bean : list) {
								%>
								<tr>
									<td align="center"><%=bean.getCityName()%></td>
									<td align="center"><%=bean.getStateName()%></td>
									<td align="center"><a title="Update"
										href="CityEditServlet?cityId=<%=bean.getCityId()%>"><img
											src="photos/edit.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
										title="Delete"
										href="CityDeleteServlet?cityId=<%=bean.getCityId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a> <%
 	}
 %>
								</tr>

								<%
									}

									else {
								%>

								<h1>
									<center>No Record Found....!</center>
								</h1>
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