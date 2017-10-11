<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DrRAJ.Bean.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review | Review List</title>
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
			Review <small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Review</li>
		</ol>
		<br>
		<br>
		<!-- <a href="adminInsert.jsp"><input type="button" value="ADD"
			name="ADD" class="btn btn-primary"></a> --> <br>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<table id="example1"
							class="table table-bordered table-hover table-striped">

							<thead class="gujju-theme text-uppercase">
								<tr>
									<th><center>Customer Name</center></th>
									<th><center>Product Name</center></th>
									<th><center>Title</center></th>
									<th><center>Rating</center></th>
									<th><center>Description</center></th>
									<th><center>IsValid</center></th>
									<th><center>ACTION</center></th>
								</tr>
							</thead>
							<tbody>
								<%
									List<ReviewBean> listOfReview = (ArrayList) request.getAttribute("reviewList");

									if (listOfReview != null) {
										for (int i = 0; i < listOfReview.size(); i++) {
											ReviewBean review = listOfReview.get(i);
								%>

								<tr align="center">
									<td><%=review.getCustomerName()%></td>
									<td><%=review.getProductName()%></td>
									<td><%=review.getTitle()%></td>
									<td><%=review.getRating()%></td>
									<td><textarea rows="2" cols="20" disabled="disabled"><%=review.getDescription()%></textarea></td>
									<td><%=review.getIsValid()%></td>
									<td><%-- <a
										href="ReviewEditServlet?reviewId=<%=review.getReviewId()%>"><img
											src="photos/edit.ico" height="30" width="30"
											class="img-rounded" /></a>&nbsp;&nbsp; --%><a
										href="ReviewDeleteServlet?reviewId=<%=review.getReviewId()%>"><img
											src="photos/Recycle Bin.ico" height="30" width="30"
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