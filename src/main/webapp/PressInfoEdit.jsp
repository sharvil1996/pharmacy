<%@page import="DrRAJ.Bean.PressInfoBean"%>
<%@page import="DrRAJ.DAO.PressInfoTypeDAO"%>
<%@page import="DrRAJ.Bean.PressInfoTypeBean"%>
<%@page import="DrRAJ.DAO.BookTypeDAO"%>
<%@page import="DrRAJ.Bean.BookTypeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | PressInfo Update</title>
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
			PressInfo <small>Update</small>
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
					PressInfoBean pressInfoBean = (PressInfoBean) request.getAttribute("pressInfoBean");

					if (pressInfoBean != null) {
				%>
				<form action="PressInfoUpdateServlet" method="post">
					<input type="hidden" name="pressInfoId"
						value="<%=pressInfoBean.getPressInfoId()%>"> <br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								Press Type</font>
						</label>
						<div class="col-lg-6">
							<select name="txtPressInfoType" class="form-control">
								<option value="0" selected="selected">Select Press Type</option>
								<%
									List<PressInfoTypeBean> pressTypeList = new PressInfoTypeDAO().getList();
										for (int i = 0; i < pressTypeList.size(); i++) {

											String tmp = "unselected";
											String type = (String) pressInfoBean.getTypeId();
											if (type == null || type.equals("0"))
												tmp = "unselected";
											else if (pressTypeList.get(i).getTypeId().equals(type))
												tmp = "selected";
								%>

								<option value=<%=pressTypeList.get(i).getTypeId()%> <%=tmp%>>
									<%=pressTypeList.get(i).getName()%></option>
								<%
									}
								%>
							</select><font color="red">${type}</font>
						</div>
					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Title :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=pressInfoBean.getTitle()%>" name="txtTitle" />${title}
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter URL
								Link :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=pressInfoBean.getLink()%>" name="txtURLLink" />${URLLink}
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
