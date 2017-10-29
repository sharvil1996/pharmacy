<%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Product Category Update</title>
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
			Product Category <small>Update</small>
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
				<form action="ProductCategoryUpdateServlet" method="post">
					<%
						ProductCategoryBean productCategoryBean = (ProductCategoryBean) request.getAttribute("productCategoryBean");

						if (productCategoryBean != null) {
					%>


					<input type="hidden" name="productCategoryId"
						value=<%=productCategoryBean.getProductCategoryId()%>> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Category Name :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control"
								value="<%=productCategoryBean.getProductCategoryName()%>" name="txtProductCategoryName" />${productCategoryName}
						</div>
					</div>
					
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Category URL :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control"
								value="<%=productCategoryBean.getForwardLink()%>" name="txtProductCategoryURL" />${productCategoryURL}
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






<%-- <%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ProductCategoryUpdateServlet" method="post">
		<%
			ProductCategoryBean productCategoryBean = (ProductCategoryBean) request.getAttribute("productCategoryBean");

			if (productCategoryBean != null) {
		%>


		<input type="hidden" name="productCategoryId" value=<%=productCategoryBean.getProductCategoryId()%>>
		<table>
			<tr>
				<td>Enter ProductCategory Name</td>
				<td><input type="text" value="<%=productCategoryBean.getProductCategoryName()%>"
					name="txtProductCategoryName" />${productCategoryName}</td>
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