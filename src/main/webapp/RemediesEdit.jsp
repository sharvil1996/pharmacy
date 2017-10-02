<%@page import="DrRAJ.Bean.RemediesBean"%>
<%@page import="DrRAJ.Bean.TestimonialBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Remedies Update</title>
<noscript>
	<div style="color: #FF0000">Please enable java script</div>
</noscript>
<script type="text/javascript" src="javaScript/mainscript.js"></script>
<link rel="icon" href="photos/daiict.png" />
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<div style="margin-top: -850px; margin-left: 250px;">
		<section class="content-header">
		<h1>
			Remedies <small>Update</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="adminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		</section>
		<br> <br>
		<div class="col-lg-6">
			<div class="container">
				<form action="RemediesUpdateServlet" method="post">
					<%
						RemediesBean remediesBean = (RemediesBean) request.getAttribute("remediesBean");

						if (remediesBean != null) {

							String name = remediesBean.getName();
							if (name == null)
								name = "";

							String photoLink = remediesBean.getPhotolink();
							if (photoLink == null)
								photoLink = "";
					%>
					<input type="hidden" name="remediesId"
						value=<%=remediesBean.getRemediesId()%>> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Testimonial Name :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" value="<%=name%>"
								name="txtRemediesName" />${name}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Image Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text" value="<%=photoLink%>"
								name="txtPhotoLink" />${photoLink}
						</div>
					</div>
					<br /> <br /> <label class="col-sm-2 control-label"></label> <input
						type="reset" value="Reset" name="reset" class="btn  btn-danger">
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="Submit" value="Add" name="submit"
						class="btn btn-success">

				</form>
				<%
					} else {

					}
				%>
			</div>
		</div>
	</div>
</body>
</html>



