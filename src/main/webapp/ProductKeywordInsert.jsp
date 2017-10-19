<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Product Keyword Insert</title>
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
			Product Keyword <small>Insert</small>
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
				<form action="ProductKeywordInsertServlet" method="post">
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter Key
								word :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" value="${txtKeyword}"
								name="txtKeyword" />${keyWord}
						</div>
					</div>


					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Product
								:</font>
						</label>
						<div class="col-lg-6">
							<select name="productId" class="form-control" id="productId">
								<option value="0">Select Product</option>
								<%
									List<ProductBean> listOfProduct = new ProductDAO().getList();

									if (listOfProduct != null) {
										for (ProductBean t : listOfProduct) {
											String s = t.getProductName();
											if (t.getProductId().equals(request.getAttribute("productId"))) {
								%>
								<option value="<%=t.getProductId()%>" selected="selected"><%=s%></option>
								<%
									} else {
								%>
								<option value="<%=t.getProductId()%>"><%=s%></option>
								<%
									}
										}
									}
								%>
							</select> <font color="red">${product}</font>
						</div>
					</div>
					<br /> <br /> <br /> <br /> <label
						class="col-sm-2 control-label"></label> <input type="reset"
						value="Reset" name="reset" class="btn  btn-danger">
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="Submit" value="Add" name="submit"
						class="btn btn-success">

				</form>
			</div>
		</div>
	</div>
</body>
</html>

















