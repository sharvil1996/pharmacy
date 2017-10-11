<%@page import="DrRAJ.Bean.StoreDetailsBean"%>
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
<title>Admin | Store Details List</title>
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
			Store Details <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Store Details</li>
		</ol>
		<br>
		<br>
		<a href="StoreDetailsInsert.jsp" name="ADD" class="btn btn-primary">ADD</a>
		<br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<%
								List<StoreDetailsBean> listOfStores = (ArrayList) request.getAttribute("listOfStores");
							%>
							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>City-State</center></th>
									<th><center>NAME</center></th>
									<th><center>Address</center></th>
									<th><center>Contact Number</center></th>
									<th><center>ACTION</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									if (listOfStores != null) {
										for (int i = 0; i < listOfStores.size(); i++) {
											StoreDetailsBean pressInfo = listOfStores.get(i);
								%>
								<tr align="center">
									<td><%=pressInfo.getCityname() + "-" + pressInfo.getStatename()%></td>
									<td><%=pressInfo.getName()%></td>
									<td><%=pressInfo.getAddress()%></td>
									<td><%=pressInfo.getContact1() + " , " + pressInfo.getContact2()%></td>
									<td><a
										href="StoreDetailsDeleteServlet?storeId=<%=pressInfo.getStoreId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp;<a
										href="StoreDetailsEditServlet?storeId=<%=pressInfo.getStoreId()%>"><img
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