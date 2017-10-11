<%@page import="DrRAJ.Bean.PressInfoTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Press Info Type Update</title>
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
			Press Info Type <small>Update</small>
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
				<form action="PressInfoTypeUpdateServlet" method="post">

					<%
						PressInfoTypeBean pressInfoTypeBean = (PressInfoTypeBean) request.getAttribute("pressInfoTypeBean");

						if (pressInfoTypeBean != null) {
					%>
					<input type="hidden" name="pressInfoTypeId"
						value=<%=pressInfoTypeBean.getTypeId()%>> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Press Type :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control"
								value="<%=pressInfoTypeBean.getName()%>"
								name="txtPressInfoTypeName" />${pressInfoTypeName}
						</div>
					</div>
					<br /> <br /> <br /> <label class="col-sm-2 control-label"></label>
					<input type="reset" value="Reset" name="reset"
						class="btn  btn-danger">
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



















<%-- <%@page import="DrRAJ.Bean.PressInfoTypeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="PressInfoTypeUpdateServlet" method="post">
		<%
			PressInfoTypeBean pressInfoTypeBean = (PressInfoTypeBean) request.getAttribute("pressInfoTypeBean");

			if (pressInfoTypeBean != null) {
		%>


		<input type="hidden" name="pressInfoTypeId"
			value=<%=pressInfoTypeBean.getTypeId()%>>
		<table>
			<tr>
				<td>Enter PressInfoType Name</td>
				<td><input type="text" value="<%=pressInfoTypeBean.getName()%>"
					name="txtPressInfoTypeName" />${pressInfoTypeName}</td>
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