<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="DrRAJ.DAO.IngredientDAO"%>
<%@page import="DrRAJ.DAO.BlogDAO"%>
<%@page import="DrRAJ.Bean.BlogBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sub Blog | Sub Blog Insert</title>
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
			Sub Blog <small>Insert</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="AdminDashBoard.jsp"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">Sub Blog</li>
		</ol>
		</section>
		<br> <br>
		<div class="col-lg-6">
			<div class="container">
				<form action="SubBlogInsertServlet" method="post">
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Blog Name :</font>
						</label>

						<div class="col-lg-6">
							<select name="selBlogName" class="form-control">
								<option value="0" selected="selected">Select Blog Name</option>
								<%
									List<BlogBean> blogList = new BlogDAO().getList();
									for (int i = 0; i < blogList.size(); i++) {

										String tmp = "unselected";
										String type = request.getParameter("selBlogName");
										if (type == null || type.equals("0"))
											tmp = "unselected";
										else if (blogList.get(i).getBlogId().equals(type))
											tmp = "selected";
								%>

								<option value=<%=blogList.get(i).getBlogId()%> <%=tmp%>>
									<%=blogList.get(i).getBlogTitle()%></option>
								<%
									}
								%>
							</select><font color="red">${blog}</font>
						</div>

					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter Sub
								Blog Title :</font>
						</label>

						<div class="col-lg-6">
							<input type="text" class="form-control" name="txtTitle"
								value="${txtTitle}">${title}
						</div>
					</div>

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter Sub
								Blog Content :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtContent">${txtContent}</textarea>${content}
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