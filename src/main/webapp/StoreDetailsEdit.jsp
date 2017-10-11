<%@page import="DrRAJ.Bean.StoreDetailsBean"%>
<%@page import="DrRAJ.DAO.CityDAO"%>
<%@page import="DrRAJ.Bean.CityBean"%>
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
<title>Admin | Store Details Insert</title>
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
			Store Details <small>Insert</small>
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
				<%
					StoreDetailsBean storeDetailsBean = (StoreDetailsBean) request.getAttribute("storeBean");

					if (storeDetailsBean != null) {
				%>
				<form action="StoreDetailsUpdateServlet" method="post">
				<input type="hidden" name="storeId" value="<%=storeDetailsBean.getStoreId() %>">
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Store Name :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=storeDetailsBean.getName()%>" name="txtStoreName" />${name}
						</div>
					</div>
					<br />


					<div class="row">
						<label class="col-sm-2"> <font size="+1">Select
								City </font>
						</label>
						<div class="col-lg-6">
							<select name="txtCityId" class="form-control">
								<option value="0" selected="selected">Select City</option>
								<%
									List<CityBean> cityBeans = new CityDAO().getList();
										for (int i = 0; i < cityBeans.size(); i++) {

											String tmp = "unselected";
											String type = (String) storeDetailsBean.getCityId();
											if (type == null || type.equals("0"))
												tmp = "unselected";
											else if (cityBeans.get(i).getCityId().equals(type))
												tmp = "selected";
								%>

								<option value=<%=cityBeans.get(i).getCityId()%> <%=tmp%>>
									<%=cityBeans.get(i).getCityName()%></option>
								<%
									}
								%>
							</select><font color="red">${city}</font>
						</div>
					</div>
					<br />

					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Address :</font>
						</label>

						<div class="col-lg-6">
							<textarea class="form-control" rows="5" cols="50"
								name="txtAddress"><%=storeDetailsBean.getAddress()%></textarea>${address}
						</div>
					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Contact Number 1 :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=storeDetailsBean.getContact1()%>" name="txtCN1" />${CN1}
						</div>
					</div>
					<br />
					<div class="row">
						<label class="col-sm-2"> <font size="+1">Enter
								Contact Number 2 :</font>
						</label>

						<div class="col-lg-6">
							<input class="form-control" type="text"
								value="<%=storeDetailsBean.getContact2()%>" name="txtCN2" />${CN2}
						</div>
					</div>
					<br /> <br /> <br /> <br /> <label
						class="col-sm-2 control-label"></label> <input type="reset"
						value="Reset" name="reset" class="btn  btn-danger">
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
