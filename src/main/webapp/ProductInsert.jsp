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
<title>Product | Product Insert</title>
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
			Product <small>Insert</small>
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
				<form action="ProductInsertServlet" method="post">
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Name :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" value="${txtProductName}"
								name="txtProductName" />${name}
						</div>
					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Image Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control imagetester" type="text" value="${txtPhotoLink}"
								name="txtPhotoLink" target=".imagetarget"/>${photoLink}
						</div>
						<div class="col-md-3">
							<img src="" alt="Image not found" class="imagetarget"
								style="max-height: 200px; max-width: 200px;" />
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Product Forward Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text" value="${txtForwardLink}"
								name="txtForwardLink" />${forwardLink}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Interaction :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text" value="${txtInteraction}"
								name="txtInteraction" />${interaction}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								SideEffect :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text" value="${txtSideEffect}"
								name="txtSideEffect" />${sideEffect}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Contra-Indication :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="${txtContraIndication}" name="txtContraIndication" />${contraIndication}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Ailments :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text" value="${txtPurpose}"
								name="txtPurpose" />${purpose}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Description :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtDescription">${txtDescription}</textarea>${description}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Remedies</font>
						</label>
						<div class="col-lg-6">
							<select name="selRemedies" class="form-control">
								<option value="0" selected="selected">Select Remedies</option>
								<%
									List<RemediesBean> remediesList = new RemediesDAO().getList();
									for (int i = 0; i < remediesList.size(); i++) {

										String tmp = "unselected";
										String type = request.getParameter("selRemedies");
										if (type == null || type.equals("0"))
											tmp = "unselected";
										else if (remediesList.get(i).getRemediesId().equals(type))
											tmp = "selected";
								%>

								<option value=<%=remediesList.get(i).getRemediesId()%> <%=tmp%>>
									<%=remediesList.get(i).getName()%></option>
								<%
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
								<option value="0" selected="selected">Select Product
									Category</option>
								<%
									List<ProductCategoryBean> productCategoryList = new ProductCategoryDAO().getList();
									for (int i = 0; i < productCategoryList.size(); i++) {

										String tmp = "unselected";
										String type = request.getParameter("selProductCategoryName");
										if (type == null || type.equals("0"))
											tmp = "unselected";
										else if (productCategoryList.get(i).getProductCategoryId().equals(type))
											tmp = "selected";
								%>

								<option
									value=<%=productCategoryList.get(i).getProductCategoryId()%>
									<%=tmp%>>
									<%=productCategoryList.get(i).getProductCategoryName()%></option>
								<%
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
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$("body").on("change leave input",".imagetester",function(){
	var target=$($(this).attr("target"));
	target.attr("src",$(this).val());
});
var link=$(".imagetester").val();
if(link!=""){
	$(".imagetarget").attr("src",link);
}
</script>
</html>