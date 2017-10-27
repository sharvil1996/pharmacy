<!DOCTYPE html>
<html>
<head>
	<title>Company Info | Dr. Raj Homoeo Pharmacy</title>
	<%@include file="UserHeader.jsp" %>
	<section class="bgimage" style="background-image: url(imgs/homebanner.jpg);">
		<div class="blackcover opaq2"></div>
		<div class="container posrel" style="z-index: 2;">
			<br><br><br><br>
			<h3 class="tcenter bold text-2 fgwhite">About Us</h3>
			<div class="tcenter fgwhite jumbotext text-2" style="margin-bottom: 40px;">Company Info</div>
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
					<a href="company-info" class="button white full linkButton active margin">Company Info</a>
					<a href="#" class="button white full linkButton black margin">Meet With The Founder</a>
					<a href="#" class="button white full linkButton black margin">Our Core Values & Mission</a>
					<a href="manufacturing-practices" class="button white full linkButton black margin">Manufacturing Practices</a>
					<a href="#" class="button white full linkButton black margin">Satisfied Customers</a>
					<a href="#" class="button white full linkButton black margin">Contract Manufacturing</a>
					<a href="#" class="button white full linkButton black margin">Company Management</a>
					<a href="#" class="button white full linkButton black margin">Press Information</a>
					<a href="#" class="button white full linkButton black margin">Contact Customer Service</a>
				</div>
				<div class="cs9">
					<p class="paragraph">The journey with a vision "to serve" the community began 30 years ago, by Dr. RajLakshmi Joshi, when she started practicing as a homoeopath in Ahmedabad Gujarat, India. Even today she provides her honorary services at no cost to a charitable trust Shree Vallabh Sadan Haveli - Vaishnav Temple in Ahmedabad, Gujarat. At the trust, she has been practicing homoeopathy since 25 years, to benefit the underprivileged with low cost homoeopathic medicines.  Her persistent hard work and service to the community paid off in 10 years and she got renowned by being the first, leading lady homoeopath, in the metropolitan city.</p>
					<p class="paragraph">She earned her name with her power to heal patients those suffering from primary sterility, secondary sterility, extreme depression, as well as autism. Dr. RajLakshmi believes in treating an individual as a 'whole' (mind, body, and spirit), not just the disease. She shared similar vision with her husband Chandramauli Joshi and together in the year 1995, they founded one of the leading homoeopathic manufacturing companies in India, Dr. RAJ Homoeo Pharmacy.  Founders' vision "to serve", is still one of the core values of Dr. RAJ. And, we still follow the belief of Dr. RajLakshmi that "a treatment includes empowering a person as a 'whole', and not just curing the disease".</p>
					<p class="paragraph">So as to deliver the good health and well-being in the community, and after many years of experience, research, and collaborations with the pharmaceutical experts, Dr. RAJ has been equipped to formulate accurate and effective remedies for wide range of ailments, bringing healing to the world. Since almost 25 years, we have been manufacturing finest quality and result oriented homoeopathic remedies. We give utmost importance to our product quality, efficacy, and safety while maintaining products' healing properties enriched within them. We achieve our desired quality by standardizing production processes, being equipped with pharmaceutical grade machineries, and modern analytical technology. Dr. RAJ is a GMP certified by FDA, and ISO 9001:2015 certified by TUV Nord. We take pride in our product and process quality and in conveying a message to all our customers, practitioners, or retail partners to use our products with superior confidence.<p>
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