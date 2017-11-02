<%@page import="DrRAJ.DAO.ProductCategoryDAO"%>
<%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<%@page import="DrRAJ.DAO.RemediesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DrRAJ.Bean.RemediesBean"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="css/design.css" />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/owl.theme.default.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/owl.theme.green.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700"
	rel="stylesheet">
</head>
<%
	ArrayList<RemediesBean> list = (ArrayList<RemediesBean>) new RemediesDAO().getList();
	ArrayList<ProductCategoryBean> productCategoryList = (ArrayList<ProductCategoryBean>) new ProductCategoryDAO()
			.getList();
%>
<body>
	<div class="mobilemenu">
		<div style="height: 55px; width: 100%;"></div>
		<div class="closebutton">
			<img src="imgs/close.svg" />
		</div>
		<div class="tcenter fgwhite links">
			<div class="whiteSeperator"></div>
			<div class="bold">Health & Homoeopathy</div>
			<div class="whiteSeperator"></div>
			<a href="#">FAQ on Homoeopathy</a> <a href="know-your-medicine">Know
				Your Medicine</a> <a href="#">Mind, Body & Spirit</a> <a href="#">Homoeopathic
				Self-Help</a>
			<div class="whiteSeperator"></div>
			<div class="bold">About Us</div>
			<div class="whiteSeperator"></div>
			<a href="company-info">Company Info</a> <a href="#">Meet With The
				Founder</a> <a href="#">Our Core Values & Mission</a> <a href="#">Manufacturing
				Practices</a> <a href="#">Satisfied Customers</a> <a href="#">Contract
				Manufacturing</a> <a href="#">Company Management</a> <a href="#">Press
				Information</a> <a href="#">Contact Customer Service</a>
			<div class="whiteSeperator"></div>
			<div class="bold">Remedies</div>
			<div class="whiteSeperator"></div>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>

			<a href="<%=list.get(i).getForwardLink()%>"><%=list.get(i).getName()%></a>
			<%
				}
			%>
			<div class="whiteSeperator"></div>
			<div class="bold">Products</div>
			<div class="whiteSeperator"></div>
			<%
				for (int i = 0; i < productCategoryList.size(); i++) {
			%>

			<a href="<%=productCategoryList.get(i).getForwardLink()%>"><%=productCategoryList.get(i).getProductCategoryName()%></a>
			<%
				}
			%>
			<div class="whiteSeperator"></div>
			<a class="bold" href="#">Homoeopathic Advice</a>
			<div class="whiteSeperator"></div>
		</div>
		<div style="height: 55px; width: 100%;"></div>
	</div>
	<header>
		<div class="container">
			<div class="navbar">
				<div class="leftnavbar">
					<div class="logo">
						<a href="#" class="inblock"><img src="imgs/logo.svg" /></a>
					</div>
				</div>
				<div class="menubutton">
					<span></span><span></span><span></span>
				</div>
				<div class="rightnavbar">
					<div class="topnavbar">
						<a class="smallLink" href="find-a-store-or-practitioner">Find
							a Store or Practitioner</a> <a class="smallButton"
							href="https://www.homeomart.com/seo_key_word?&filter_name=dr.%20raj&filter=ATTRIBU=Dr+Raj+Homoeo+Pharmacy=2=Manufacturer"
							target="_blank">Buy Online</a>
						<div class="iconTextBox">
							<input type="text" class="smallTextBox"
								placeholder="Type here to search" /> <img src="imgs/search.svg" />
						</div>
					</div>
					<div class="bottomnavbar">
						<div class="hover-dropdown">
							Health & Homoeopathy
							<div class="hover-dropdown-menu">
								<a href="#">FAQ on Homoeopathy</a> <a href="know-your-medicine">Know
									Your Medicine</a> <a href="#">Mind, Body & Spirit</a> <a href="#">Homoeopathic
									Self-Help</a>
							</div>
						</div>
						<div class="hover-dropdown">
							About Us
							<div class="hover-dropdown-menu">
								<a href="company-info">Company Info</a> <a href="#">Meet
									With The Founder</a> <a href="#">Our Core Values & Mission</a> <a
									href="#">Manufacturing Practices</a> <a href="#">Satisfied
									Customers</a> <a href="#">Contract Manufacturing</a> <a href="#">Company
									Management</a> <a href="#">Press Information</a> <a href="#">Contact
									Customer Service</a>
							</div>
						</div>
						<a class="link dropdown-button cursorPointer"
							target=".remedies-container-dropdown">Remedies</a>
						<div class="hover-dropdown">
							Products
							<div class="hover-dropdown-menu">
								<%
									for (int i = 0; i < productCategoryList.size(); i++) {
								%>

								<a href="<%=productCategoryList.get(i).getForwardLink()%>"><%=productCategoryList.get(i).getProductCategoryName()%></a>
								<%
									}
								%>
							</div>
						</div>
						<a class="link" href="#">Homoeopathic Advice</a>
					</div>
				</div>
			</div>
		</div>
		<div
			class="container container-dropdown-menu remedies-container-dropdown"
			style="opacity: 0; height: 0;">
			<div class="bgwhite" style="padding: 15px;">
				<div class="row">

					<%
						for (int i = 0; i < list.size(); i++) {
					%>

					<div class="cx3 tcenter" style="margin-bottom: 15px;">
						<a href="<%=list.get(i).getForwardLink()%>" class="link black"><%=list.get(i).getName()%></a>
					</div>
					<%
						}
					%>

				</div>
			</div>
		</div>
	</header>