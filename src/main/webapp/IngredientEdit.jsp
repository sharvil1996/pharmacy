<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Ingredient Update</title>
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
			Ingredient <small>Update</small>
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
				<%
					IngredientBean bean = (IngredientBean) request.getAttribute("ingreadientBean");
					if (bean != null) {
						System.out.println(bean.getTitle() + " Title");
				%>
				<form action="IngredientUpdateServlet" method="post">
					<input type="hidden" name="ingredientId"
						value="<%=bean.getIngredientsId()%>"> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Title:</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control"
								value="<%=bean.getTitle()%>" name="txtIngredientTitle" />${ingredientTitle}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter Sub
								Title :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=bean.getSubTitle()%>" name="txtIngredientSubTitle" />${ingredientSubTitle}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Photo Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=bean.getPhotoLink()%>" name="txtIngredientPhotoLink" />${ingredientPhotoLink}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter URL
								Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=bean.getUrlLink()%>" name="txtIngredientURLLink" />${ingredientURLLink}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Description :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtIngredientDescription"><%=bean.getDescription()%></textarea>${ingredientDescription}
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










<%-- <%@page import="DrRAJ.Bean.IngredientBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		IngredientBean bean = (IngredientBean) request.getAttribute("ingreadientBean");
		if (bean != null) {
			System.out.println(bean.getTitle() + " Title");
	%>
	<form action="IngredientUpdateServlet">
		<input type="hidden" name="ingredientId"
			value="<%=bean.getIngredientsId()%>">
		<table>

			<tr>
				<td>Enter Ingredient Title</td>
				<td><input type="text" name="txtIngredientTitle"
					value="<%=bean.getTitle()%>">${ingredientTitle}</td>
			</tr>
			<tr>
				<td>Enter Ingredient SubTitle</td>
				<td><input type="text" name="txtIngredientSubTitle"
					value="<%=bean.getSubTitle()%>">${ingredientSubTitle}</td>
			</tr>
			<tr>
				<td>Enter Ingredient Description</td>
				<td><input type="text" name="txtIngredientDescription"
					value="<%=bean.getDescription()%>">${ingredientDescription}</td>
			</tr>
			<tr>
				<td>Enter Ingredient PhotoLink</td>
				<td><input type="text" name="txtIngredientPhotoLink"
					value="<%=bean.getPhotoLink()%>">${ingredientPhotoLink}</td>
			</tr>
			<tr>
				<td>Enter Ingredient URLLink</td>
				<td><input type="text" name="txtIngredientURLLink"
					value="<%=bean.getUrlLink()%>">${ingredientURLLink}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
			</tr>
		</table>
	</form>
	<%
		} else {

		}
	%>
</body>
</html> --%>