<%@page import="DrRAJ.Bean.TestimonialBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testimonial | Testimonial Update</title>
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
			Testimonial <small>Update</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Admin</li>
		</ol>
		</section>
		<br> <br>
		<div class="col-lg-6">
			<div class="container">
				<form action="TestimonialUpdateServlet" method="post">
					<%
						TestimonialBean testimonialBean = (TestimonialBean) request.getAttribute("testimonialBean");

						if (testimonialBean != null) {

							String name = testimonialBean.getName();
							if (name == null)
								name = "";

							String photoLink = testimonialBean.getPhotoLink();
							if (photoLink == null)
								photoLink = "";

							String description = testimonialBean.getDescription();
							if (description == null)
								description = "";
					%>
					<input type="hidden" name="testimonialId"
						value=<%=testimonialBean.getTestimonialId()%>> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Testimonial Name :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" value="<%=name%>"
								name="txtTestimonialName" />${name}
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
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Description :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtDescription"><%=description%></textarea>${description}
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





<%-- <%@page import="DrRAJ.Bean.TestimonialBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="TestimonialUpdateServlet" method="post">
		<%
			TestimonialBean testimonialBean = (TestimonialBean) request.getAttribute("testimonialBean");

			if (testimonialBean != null) {

				String name = testimonialBean.getName();
				if (name == null)
					name = "";

				String photoLink = testimonialBean.getPhotoLink();
				if (photoLink == null)
					photoLink = "";

				String description = testimonialBean.getDescription();
				if (description == null)
					description = "";
		%>
		<input type="hidden" name="testimonialId"
			value=<%=testimonialBean.getTestimonialId()%>>
		<table>
			<tr>
				<td>Enter Testimonial Name</td>
				<td><input type="text" name="txtTestimonialName"
					value=<%=name%>>${name}</td>
			<tr>
			<tr>
				<td>Enter Link</td>
				<td><input type="text" name="txtPhotoLink" value=<%=photoLink%>>${photoLink}</td>
			<tr>
			<tr>
				<td>Enter Description</td>
				<td><textarea rows="5" cols="50" name="txtDescription"><%=description%></textarea>${description}</td>
			<tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
	<%
		} else {

		}
	%>
</body>
</html> --%>