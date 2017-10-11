<%@page import="DrRAJ.Bean.PressInfoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DrRAJ.Bean.PressInfoTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | PressInfo List</title>
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
			Press Info <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Press Info</li>
		</ol>
		<br>
		<br>
		<a href="PressInfoInsert.jsp" name="ADD" class="btn btn-primary">ADD</a>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<%
								List<PressInfoBean> listOfPressInfo = (ArrayList) request.getAttribute("listOfPressInfo");
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Title</center></th>
									<th><center>NAME</center></th>
									<th><center>Link</center></th>
									<th><center>ACTION</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									if (listOfPressInfo != null) {
										for (int i = 0; i < listOfPressInfo.size(); i++) {
											PressInfoBean pressInfo = listOfPressInfo.get(i);
								%>
								<tr align="center">
									<td><%=pressInfo.getTitle()%></td>
									<td><%=pressInfo.getPressTypeName()%></td>
									<td><%=pressInfo.getLink()%></td>
									<td><a
										href="PressInfoDeleteServlet?pressInfoId=<%=pressInfo.getPressInfoId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp;<a
										href="PressInfoEditServlet?pressInfoId=<%=pressInfo.getPressInfoId()%>"><img
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