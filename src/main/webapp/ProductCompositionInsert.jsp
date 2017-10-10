<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="DrRAJ.DAO.IngredientDAO"%>
<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Composition | Product Composition Insert</title>
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
			Product Composition <small>Insert</small>
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
				<form action="ProductCompositionInsertServlet" method="post">
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Product Name :</font>
						</label>

						<div class="col-lg-6">
							<select name="selProductName" class="form-control">
								<option value="0" selected="selected">Select Product
									Name</option>
								<%
									List<ProductBean> productList = new ProductDAO().getList();
									for (int i = 0; i < productList.size(); i++) {

										String tmp = "unselected";
										String type = request.getParameter("selProductName");
										if (type == null || type.equals("0"))
											tmp = "unselected";
										else if (productList.get(i).getProductId().equals(type))
											tmp = "selected";
								%>

								<option value=<%=productList.get(i).getProductId()%> <%=tmp%>>
									<%=productList.get(i).getProductName()%></option>
								<%
									}
								%>
							</select><font color="red">${product}</font>
						</div>

					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Ingredients Name :</font>
						</label>

						<div class="col-lg-6">
							<select name="selIngredientsName" class="form-control">
								<option value="0" selected="selected">Select
									Ingredients Name</option>
								<%
									List<IngredientBean> ingredientList = new IngredientDAO().select();
									for (int i = 0; i < ingredientList.size(); i++) {

										String tmp = "unselected";
										String type = request.getParameter("selIngredientsName");
										if (type == null || type.equals("0"))
											tmp = "unselected";
										else if (ingredientList.get(i).getIngredientsId().equals(type))
											tmp = "selected";
								%>

								<option value=<%=ingredientList.get(i).getIngredientsId()%>
									<%=tmp%>>
									<%=ingredientList.get(i).getTitle()%></option>
								<%
									}
								%>
							</select><font color="red">${ingredients}</font>
						</div>

					</div>

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Composition Content :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" name="txtContent"
								value="${txtContent}">${content}
						</div>
					</div>
					<br /> <br /> <label class="col-sm-2 control-label"></label> <input
						type="reset" value="Reset" name="reset" class="btn  btn-danger">
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="Submit" value="Add" name="submit"
						class="btn btn-success">

				</form>
			</div>
		</div>
	</div>
</body>
</html>