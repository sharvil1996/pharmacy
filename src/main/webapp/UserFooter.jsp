<%@page import="java.util.ArrayList"%>
<%@page import="DrRAJ.DAO.ProductCategoryDAO"%>
<%@page import="DrRAJ.Bean.ProductCategoryBean"%>
<footer class="bggrey">
	<div class="container tcenter" style="padding-bottom: 10px;">
		<a href="#"><img src="imgs/logo.svg" style="height: 70px;" /></a><br>
		<br>
		<div class="row">
			<div class="cm4">
				<a href="#" class="link inblock bold line15">Health &
					Homoeopathy</a><br> <a href="#" class="link black line15">FAQ
					on Homoeopathy</a><br> <a href="know-your-medicine" class="link black line15">Know
					Your Medicine</a><br> <a href="#" class="link black line15">Mind,
					Body & Spirit</a><br> <a href="#" class="link black line15">Homoeopathic
					Self-Help</a>
			</div>
			<div class="cm4">
				<a href="company-info" class="link inblock bold line15">About Us</a><br>
				<a href="#" class="link black line15">Company Info</a><br> <a
					href="#" class="link black line15">Meet With The Founder</a><br>
				<a href="#" class="link black line15">Our Core Values & Mission</a><br>
				<a href="#" class="link black line15">Manufacturing Practices</a><br>
				<a href="#" class="link black line15">Satisfied Customers</a><br>
				<a href="#" class="link black line15">Contract Manufacturing</a><br>
				<a href="#" class="link black line15">Company Management</a><br>
				<a href="#" class="link black line15">Press Information</a><br>
				<a href="#" class="link black line15">Contact Customer Service</a>
			</div>
			<div class="cm4">

				<%
					ArrayList<ProductCategoryBean> beans = (ArrayList<ProductCategoryBean>) new ProductCategoryDAO().getList();
					for (int i = 0; i < beans.size(); i++) {
				%>
				<a href="<%=beans.get(i).getForwardLink()%>"
					class="link inblock bold line15"><%=beans.get(i).getProductCategoryName()%></a><br>
				<%
					}
				%>

				<br> <a href="#" class="link inblock bold line15">Find a
					Store or Practitioner</a><br> <a href="#"
					class="link inblock bold line15">Downloads</a>
			</div>
		</div>
		<span class="fggrey" style="font-size: 0.8em;">&copy; Copyright
			2017 Dr. Raj Homoeo Pharmacy. All rights reserved.</span>
	</div>
</footer>
</body>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/code.js"></script>