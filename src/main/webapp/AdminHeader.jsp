<!DOCTYPE html>
<%@page import="DrRAJ.Bean.AdminBean"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Dr. RAJ | Dashboard</title>

<noscript>
	<meta HTTP-EQUIV="Refresh" CONTENT="0;URL=JavaScriptErrorPage.jsp">
</noscript>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="css/_all-skins.min.css">
<link rel="stylesheet" href="css/dataTables.bootstrap.css">

<link rel="icon" href="photos/daiict.png" />
</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
	<%
		AdminBean adminBeanHeader = (AdminBean) session.getAttribute("adminBean");

		if (adminBeanHeader != null) {
	%>
	<div class="wrapper">
		<header class="main-header">
			<a href="AdminDashBoard.jsp" class="logo"> <span
				class="logo-mini"><b></b>RAJ</span> <span class="logo-lg"><b>Dr.
						Raj Homeopathy</b></span>
			</a>
			<nav class="navbar navbar-static-top" role="navigation">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"></a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa-user fa"></i> <%=adminBeanHeader.getEmailId()%> <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu" style="border-color: black;">
								<li class="user-header"><img src="photos/daiict_main.png"
									class="img-circle" alt="User Image">
									<p>
										<%=adminBeanHeader.getFirstName() + " " + adminBeanHeader.getLastName()%></p></li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="ChangePassword.jsp" class="btn btn-default btn-flat">Change
											Password</a>
									</div>

									<div class="pull-right">
										<a href="AdminLogoutServlet" class="btn btn-default btn-flat">Sign
											out</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar" style="min-height: 900px;">
			<section class="sidebar">
				<div class="user-panel">
					<div class="pull-left image">
						<img src="photos/daiict_main.png" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
							&emsp;
							<%=adminBeanHeader.getFirstName()%>
						</p>
						<a href=""><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class=" treeview"><a href="AdminDashBoard.jsp"> <i
							class="fa fa-dashboard"></i> <span>Dashboard</span> <!--<i class="fa fa-angle-left pull-right"></i>-->
					</a></li>




					<!-- -----------------------------------Products-------------------------------   -->
					<li class="treeview"><a href="ProductListServlet"> <i
							class="fa fa-question-circle"></i> <span>Products</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">


							<!-- -----------------------------------Products > Product List--------------------------------->

							<li class="treeview"><a href="ProductListServlet"> <i
									class="fa fa-plus-square"></i> <span>Product </span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="ProductListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>

							<!-- -----------------------------------Products > Product Category-------------------------------   -->

							<li class="treeview"><a href="ProductCategoryListServlet">
									<i class="fa fa-plus-square"></i> <span>Product Category</span>
									<i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductCategoryInsert.jsp"><i
											class="fa fa-gg"></i> Insert </a></li>
									<li><a href="ProductCategoryListServlet"><i
											class="fa fa-gg"></i> List</a></li>
								</ul></li>



							<!-- -----------------------------------Product Indication-------------------------------   -->

							<li class="treeview"><a href="ProductIndicationListServlet">
									<i class="fa fa-plus-square"></i> <span>Product
										Indication</span> <i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductIndicationInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="ProductIndicationListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>

							<!-- -----------------------------------Dosage Category-------------------------------   -->

							<!-- <li class="treeview"><a href="DosageCategoryListServlet">
									<i class="fa fa-plus-square"></i> <span>Dosage Category</span>
									<i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="DosageCategoryInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="DosageCategoryListServlet"><i
											class="fa fa-gg"></i> List</a></li>
								</ul></li> -->

							<!-- -----------------------------------Product Dosage-------------------------------   -->

							<li class="treeview"><a href="ProductDosageListServlet">
									<i class="fa fa-plus-square"></i> <span>Product Dosage</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductDosageInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="ProductDosageListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>

							<!-- -----------------------------------Product Indication-------------------------------   -->

							<li class="treeview"><a href="ProductCompositionListServlet">
									<i class="fa fa-plus-square"></i> <span>Product
										Composition</span> <i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductCompositionInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="ProductCompositionListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>


							<!-- -----------------------------------Product Related Product-------------------------------   -->

							<li class="treeview"><a href="ReletedProductListServlet">
									<i class="fa fa-plus-square"></i> <span>Related Product</span>
									<i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="RelatedProductInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="ReletedProductListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>

							<!-- -----------------------------------Remedies-------------------------------   -->

							<li class="treeview"><a href="RemediesListServlet"> <i
									class="fa fa-plus-square"></i> <span>Remedies</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="RemediesInsert.jsp"><i class="fa fa-gg"></i>
											Add </a></li>
									<li><a href="RemediesListServlet"><i class="fa fa-gg"></i>
											List </a></li>
								</ul></li>

							<!-- -----------------------------------Ingredients-------------------------------   -->

							<li class="treeview"><a href="IngredientListServlet"> <i
									class="fa fa-plus-square"></i> <span>Ingredients</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="IngredientInsert.jsp"><i class="fa fa-gg"></i>
											Add </a></li>
									<li><a href="IngredientListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>






							<!-- -----------------------------------Product Price-------------------------------   -->

							<li class="treeview"><a href="PriceListServlet"> <i
									class="fa fa-plus-square"></i> <span>Product Price</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="PriceInsert.jsp"><i class="fa fa-gg"></i>
											Add </a></li>
									<li><a href="PriceListServlet"><i class="fa fa-gg"></i>
											List </a></li>
								</ul></li>

							<!-- -----------------------------------Product Keyword-------------------------------   -->

							<li class="treeview"><a href="ProductKeywordListServlet">
									<i class="fa fa-plus-square"></i> <span>Product Keyword</span>
									<i class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="ProductKeywordInsert.jsp"><i
											class="fa fa-gg"></i> Add </a></li>
									<li><a href="ProductKeywordListServlet"><i
											class="fa fa-gg"></i> List </a></li>
								</ul></li>



							<!-- -----------------------------------Product Review-------------------------------   -->

							<li class=" treeview"><a href="ReviewListServlet"> <i
									class="fa fa-comment"></i> <span>Product Review</span>
							</a></li>


						</ul></li>




					<!-- -----------------------------------Products close-------------------------------   -->


					<!-- <li class="treeview"><a href="AdminListServlet"> <i
							class="fa fa-user-secret"></i> <span>Admin Management</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="AdminInsert.jsp"><i class="fa fa-user-plus"></i>
									Insert</a></li>
							<li><a href="AdminListServlet"><i class="fa fa-users"></i>
									List</a></li>
						</ul></li> -->

					<li class=" treeview"><a href="AdminListServlet"> <i
							class="fa fa-comment"></i> <span>Admin</span>
					</a></li>


					<li class="treeview"><a href="BookListServlet"> <i
							class="fa fa-pencil-square-o"></i> <span>Book's Details</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">


							<!-- -----------------------------------Book > BookList--------------------------------->

							<li class="treeview"><a href="BookListServlet"> <i
									class="fa fa-plus-square"></i> <span>Book</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="BookInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="BookListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>


							<!-- -----------------------------------Book > Book Keyword List--------------------------------->

							<li class="treeview"><a href="BookKeywordListServlet"> <i
									class="fa fa-plus-square"></i> <span>Book Keyword</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="BookKeywordInsert.jsp"><i
											class="fa fa-gg"></i> Insert </a></li>
									<li><a href="BookKeywordListServlet"><i
											class="fa fa-gg"></i> List</a></li>
								</ul></li>

							<!-- -----------------------------------Book > Book Type List--------------------------------->

							<li class="treeview"><a href="BookTypeListServlet"> <i
									class="fa fa-plus-square"></i> <span>Book Type</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="BookTypeInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="BookTypeListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>


						</ul></li>

					<!-- -----------------------------------Store Management-------------------------------   -->


					<li class="treeview"><a href="StoreListServlet"> <i
							class="fa fa-question-circle"></i> <span>Place and Cities</span>
							<i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">


							<!-- -----------------------------------Store > StoreList--------------------------------->

							<li class="treeview"><a href="StoreDetailsListServlet">
									<i class="fa fa-plus-square"></i> <span>Store</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="StoreDetailsInsert.jsp"><i
											class="fa fa-gg"></i> Insert </a></li>
									<li><a href="StoreDetailsListServlet"><i
											class="fa fa-gg"></i> List</a></li>
								</ul></li>


							<!-- -----------------------------------Store > State--------------------------------->

							<li class="treeview"><a href="StateListServlet"> <i
									class="fa fa-plus-square"></i> <span>State</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="StateInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="StateListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>

							<!-- -----------------------------------Store > City--------------------------------->

							<li class="treeview"><a href="CityListServlet"> <i
									class="fa fa-plus-square"></i> <span>City</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="CityInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="CityListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>


						</ul></li>



					<!-- -----------------------------------Store Management close-------------------------------   -->

					<li class="treeview"><a href="BookListServlet"> <i
							class="fa fa-pencil-square-o"></i> <span>Press Info
								Details</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">



							<!-- -----------------------------------Press > Press Info--------------------------------->

							<li class="treeview"><a href="StoreListServlet"> <i
									class="fa fa-plus-square"></i> <span>Press Info</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="PressInfoInsert.jsp"><i class="fa fa-gg"></i>
											Insert </a></li>
									<li><a href="PressInfoListServlet"><i class="fa fa-gg"></i>
											List</a></li>
								</ul></li>

							<!-- -----------------------------------Press > Press Type--------------------------------->

							<li class="treeview"><a href="PressTypeListServlet"> <i
									class="fa fa-plus-square"></i> <span>Press Type</span> <i
									class="fa fa-angle-left pull-right"></i>
							</a>
								<ul class="treeview-menu">
									<li><a href="PressInfoTypeInsert.jsp"><i
											class="fa fa-gg"></i> Insert </a></li>
									<li><a href="PressTypeInfoListServlet"><i
											class="fa fa-gg"></i> List</a></li>
								</ul></li>



						</ul></li>


					<li class="treeview"><a href="AdminListServlet"> <i
							class="fa fa-user-secret"></i> <span>Company Information</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="CompanyManagementInsert.jsp"><i
									class="fa fa-user-plus"></i> Insert</a></li>
							<li><a href="CompanyManagementListServlet"><i
									class="fa fa-users"></i> List</a></li>
						</ul></li>


					<li class="treeview"><a href="AdminListServlet"> <i
							class="fa fa-user-secret"></i> <span>Testimonial</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="TestimonialInsert.jsp"><i
									class="fa fa-user-plus"></i> Insert</a></li>
							<li><a href="TestimonialListServlet"><i
									class="fa fa-users"></i> List</a></li>
						</ul></li>


					<li class=" treeview"><a href="ReviewListServlet"> <i
							class="fa fa-comment"></i> <span>Review</span>
					</a></li>
					<!-- <li class="treeview"><a href="FeedbackListServlet"> <i
							class="fa fa-comment"></i> <span>Feedback</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="feedbackByCourseSelection.jsp"><i
									class="fa fa-gg"></i> Feedback List</a></li>
							<li><a href="DateFeedbackCounterListServlet"><i
									class="fa fa-gg"></i> Feedback Counter List</a></li>
						</ul></li> -->

					<li class=" treeview"><a href="ContactUsListServlet"> <i
							class="fa fa-comment"></i> <span>Query List</span>
					</a></li>

				</ul>
			</section>
		</aside>
		<div class="content-wrapper" style="min-height: 900px; height: 900px;">
			<section class="content-header">
				<h1>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>
				</h1>
				<!--  <ol class="breadcrumb">
            <li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
          </ol>   -->
			</section>
		</div>
	</div>

	<div>

		<script src="javaScript/jQuery-2.1.4.min.js"></script>
		<script src="javaScript/bootstrap.min.js"></script>
		<script src="javaScript/jquery.slimscroll.min.js"></script>
		<script src="javaScript/fastclick.min.js"></script>
		<!-- <script src="javaScript/app.min.js"></script> -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.3.11/js/app.min.js"></script>

		<script src="javaScript/demo.js"></script>
		<script src="javaScript/datatables/jquery.dataTables.min.js"></script>
		<script src="javaScript/datatables/dataTables.bootstrap.min.js"></script>
		<script type="text/javascript" src="javaScript/jquery-ui.js"></script>
		<script>
			$(function() {
				$("#example1").DataTable();
				$('#example2').DataTable({
					"paging" : true,
					"lengthChange" : false,
					"searching" : false,
					"ordering" : true,
					"info" : true,
					"autoWidth" : false
				});
			});
		</script>

	</div>
	<%
		} else {

			request.setAttribute("msgLogin", "Please Login To Continue");
			response.sendRedirect("login.jsp");

		}
	%>
</body>
</html>
