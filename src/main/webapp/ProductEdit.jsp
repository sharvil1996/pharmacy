<%@page import="DrRAJ.Bean.ProductBean"%>
<%@page import="DrRAJ.DAO.ProductCategoryDAO"%>
<%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<%@page import="DrRAJ.DAO.RemediesDAO"%>
<%@page import="DrRAJ.Bean.RemediesBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product | Product Update</title>
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
			Product <small>Update</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Product</li>
		</ol>
		</section>
		<br> <br>
		<div class="col-lg-6">
			<div class="container">
				<form action="ProductUpdateServlet" method="post">
					<%
						ProductBean productBean = (ProductBean) request.getAttribute("productBean");

						if (productBean != null) {
					%>
					<input type="hidden" name="productId"
						value="<%=productBean.getProductId()%>" /> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Name :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control"
								value="<%=productBean.getProductName()%>" name="txtProductName" />${name}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Image Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getImageLink()%>" name="txtPhotoLink" />${photoLink}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Forward Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getForwardLink()%>" name="txtForwardLink" />${forwardLink}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Interaction :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getInteraction()%>}" name="txtInteraction" />${interaction}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								SideEffect :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getSideEffect()%>" name="txtSideEffect" />${sideEffect}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Contra-Indication :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getContraIndication()%>"
								name="txtContraIndication" />${contraIndication}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Ailments :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=productBean.getPurpose()%>" name="txtPurpose" />${purpose}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Description :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtDescription"><%=productBean.getDescription()%></textarea>${description}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Remedies</font>
						</label>
						<div class="col-lg-6">
							<select name="selRemedies" id="selRemedies"
								class="form-control">
								<option value="0" selected="selected">Select Remedies</option>
								<%
									List<RemediesBean> remediesList = new RemediesDAO().getList();
										for (int i = 0; i < remediesList.size(); i++) {
											RemediesBean remedyBean = remediesList.get(i);
											if (remedyBean.getRemediesId().equals(productBean.getRemediesId())) {
								%>
								<option value="<%=remedyBean.getRemediesId()%>"
									selected="selected"><%=remedyBean.getName()%></option>
								<%
									} else {
								%>
								<option value="<%=remedyBean.getRemediesId()%>"><%=remedyBean.getName()%></option>
								<%
									}
										}
								%>
							</select><font color="red">${remedies}</font>
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Product Category</font>
						</label>
						<div class="col-lg-6">
							<select name="selProductCategoryName" class="form-control">
								<option value="0" selected="selected">Select Remedies</option>
								<%
									List<ProductCategoryBean> productCategoryList = new ProductCategoryDAO().getList();
										for (int i = 0; i < productCategoryList.size(); i++) {
											ProductCategoryBean productCategoryBean = productCategoryList.get(i);
											if (productCategoryBean.getProductCategoryId().equals(productBean.getProductCategoryId())) {
								%>
								<option value="<%=productCategoryBean.getProductCategoryId()%>"
									selected="selected"><%=productCategoryBean.getProductCategoryName()%></option>
								<%
									} else {
								%>
								<option value="<%=productCategoryBean.getProductCategoryId()%>"><%=productCategoryBean.getProductCategoryName()%></option>
								<%
									}
										}
								%>
							</select><font color="red">${productCateogory}</font>
						</div>
					</div>



					<br /> <label class="col-sm-2 control-label"></label> <input
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