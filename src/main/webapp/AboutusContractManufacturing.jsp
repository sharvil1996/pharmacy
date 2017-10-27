<!DOCTYPE html>
<html>
<head>
	<title>Contract Manufacturing | Dr. Raj Homoeo Pharmacy</title>
	<%@include file="UserHeader.jsp" %>
	<section class="bgimage" style="background-image: url(imgs/homebanner.jpg);">
		<div class="blackcover opaq2"></div>
		<div class="container posrel" style="z-index: 2;">
			<br><br><br><br>
			<h3 class="tcenter bold text-2 fgwhite">About Us</h3>
			<div class="tcenter fgwhite jumbotext text-2" style="margin-bottom: 40px;">Contract Manufacturing</div>
			<br><br><br>
		</div>
		<div class="posab overhidden" style="z-index: 3;width: 100%;bottom: -7px;">
			<img src="imgs/bottomwhitecircle.svg" class="posrel" style="width: 120%;left: -10%"/>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="cs3 hideResponsive">
					<h3 class="fgmain">About Us</h3>
					<div class="mainSeperator full"></div>
					<a href="company-info" class="button white full linkButton black margin">Company Info</a>
					<a href="#" class="button white full linkButton black margin">Meet With The Founder</a>
					<a href="#" class="button white full linkButton black margin">Our Core Values & Mission</a>
					<a href="manufacturing-practices" class="button white full linkButton black margin">Manufacturing Practices</a>
					<a href="contract-manufacturing" class="button white full linkButton black margin">Satisfied Customers</a>
					<a href="#" class="button white full linkButton active margin">Contract Manufacturing</a>
					<a href="#" class="button white full linkButton black margin">Company Management</a>
					<a href="#" class="button white full linkButton black margin">Press Information</a>
					<a href="#" class="button white full linkButton black margin">Contact Customer Service</a>
				</div>
				<div class="cs9">
					<p class="paragraph">Dr. RAJ has been involved in the contract manufacturing of combination remedies for several years. As of today, we have already partnered with several marketing companies, those who wishes to market and sell their own brand name products but lack manufacturing expertise or capabilities. The products pass under the drug license number of Dr. RAJ from FDA Gujarat, India. All the products follow stringent quality control procedures and manufacturing processes.<p>
					<p class="paragraph">For detailed business partnerships and discussion please write to us on <a href="mailto:vyahriti28@gmail.com" class="link bold">vyahriti28@gmail.com</a> or call <a href="tel:+917228866904" class="link bold">+91-722 886 6904</a>, <a href="tel:+917069995785" class="link bold">+91-706 999 5785</a>, <a href="tel:+919426364460" class="link bold">+91-942 636 4460</a>.<p>
				</div>
			</div>
		</div>
	</section>
<%@include file="UserFooter.jsp" %>
<script type="text/javascript">
	$('.remedies').owlCarousel({
	    loop:true,
	    margin:10,
	    navigation:false,
	    pagination:false,
	    responsive:{
	        0:{
	            items:2
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:4
	        }
	    },
	    autoplay:true,
	    autoplayTimeout:4000,
	    autoplayHoverPause:true,
	    autoHeight:true
	});
	$('.testimonials').owlCarousel({
	    loop:true,
	    margin:20,
	    navigation:false,
	    pagination:false,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:2
	        },
	        1000:{
	            items:3
	        }
	    },
	    autoplay:true,
	    autoplayTimeout:10000,
	    autoplayHoverPause:true,
	    autoHeight:true
	});
	$('.knowYourMedicines').owlCarousel({
	    loop:true,
	    margin:20,
	    navigation:false,
	    pagination:false,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:2
	        },
	        1000:{
	            items:3
	        }
	    },
	    autoplay:true,
	    autoplayTimeout:5000,
	    autoplayHoverPause:true,
	    autoHeight:true
	});
</script>
</html>