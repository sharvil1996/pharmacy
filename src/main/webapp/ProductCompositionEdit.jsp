<%@page import="DrRAJ.DAO.IngredientDAO"%>
<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="DrRAJ.Bean.ProductCompositionBean"%>
<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductComposition | ProductComposition Insert</title>
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
			Product Composition <small>Update</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Product Composition</li>
		</ol>
		</section>
		<br> <br>
		<div class="col-lg-6">
			<div class="container">
				<form action="ProductCompositionUpdateServlet" method="post">
					<%
						ProductCompositionBean productCompositionBean = (ProductCompositionBean) request
								.getAttribute("productCompositionBean");

						if (productCompositionBean != null) {
					%>
					<br /> <input type="hidden" name="productCompositionId"
						value="<%=productCompositionBean.getProductCompositionId()%>">
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Product Name :</font>
						</label>

						<div class="col-lg-6">
							<select name="selProductName" class="form-control">
								<option value="0" selected="selected">Select Remedies</option>
								<%
									List<ProductBean> productList = new ProductDAO().getList();
										for (int i = 0; i < productList.size(); i++) {
											ProductBean productBean = productList.get(i);
											if (productBean.getProductId().equals(productCompositionBean.getProductId())) {
								%>
								<option value="<%=productBean.getProductId()%>"
									selected="selected"><%=productBean.getProductName()%></option>
								<%
									} else {
								%>
								<option value="<%=productBean.getProductId()%>"><%=productBean.getProductName()%></option>
								<%
									}
										}
								%>
							</select><font color="red">${product}</font>
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Ingredient Name :</font>
						</label>

						<div class="col-lg-6">
							<select name="selIngredientName" class="form-control">
								<option value="0" selected="selected">Select Remedies</option>
								<%
									List<IngredientBean> ingredientList = new IngredientDAO().select();
										for (int i = 0; i < ingredientList.size(); i++) {
											IngredientBean ingredientBean = ingredientList.get(i);
											if (ingredientBean.getIngredientsId().equals(productCompositionBean.getIngredientsId())) {
								%>
								<option value="<%=ingredientBean.getIngredientsId()%>"
									selected="selected"><%=ingredientBean.getTitle()%></option>
								<%
									} else {
								%>
								<option value="<%=ingredientBean.getIngredientsId()%>"><%=ingredientBean.getTitle()%></option>
								<%
									}
										}
								%>
							</select><font color="red">${ingredients}</font>
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Content :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtContent"><%=productCompositionBean.getCompositionContent()%></textarea>${content}
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