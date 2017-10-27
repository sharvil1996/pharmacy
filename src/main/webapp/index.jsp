<!DOCTYPE html>
<%@page import="DrRAJ.DAO.TestimonialDAO"%>
<%@page import="DrRAJ.Bean.TestimonialBean"%>
<html>
<head>
	<title>Dr. Raj Homoeo Pharmacy | Nature to Safe & Sure Care</title>
	<%@include file="UserHeader.jsp" %>
	<section class="bgimage" style="background-image: url(imgs/homebanner.jpg);">
		<div class="blackcover opaq2"></div>
		<div class="container posrel" style="z-index: 2;">
			<br><br><br>
			<div class="tcenter fgwhite jumbotext text-2" style="margin-bottom: 40px;">Nature to Safe<br>and Sure Cure</div>
			<br><br><br>
		</div>
		<div class="posab overhidden" style="z-index: 3;width: 100%;bottom: -7px;">
			<img src="imgs/bottomwhitecircle.svg" class="posrel" style="width: 120%;left: -10%"/>
		</div>
		<div class="posab" style="bottom: -120px;width: 100%;z-index: 4;">
			<div class="container noowldots" style="padding-bottom: 0;padding-top: 0;">
				<div class="owl-carousel owl-theme remedies">
					
					<%
						for(int i=0;i<list.size();i++){
					%>
				
				    <div class="item tcenter">
				    	<a href="#" class="inblock fgblack homeRemedies">
					    	<img src="<%=list.get(i).getPhotolink()%>"/>
					    	<h4><%=list.get(i).getName() %></h4>
				    	</a>
				    </div>
				<%
						}
				%>
				</div>
			</div>
		</div>
	</section>
	<div>
		<div class="tcenter" style="margin-top: 160px;">
			<a href="#" class="button uppercase card-1">All Remedies</a>
		</div>
		<br><br>
	</div>
	<section class="bgmain">
		<div class="container noowldots">
			<h2 class="fgwhite tcenter">Know Your Medicine</h2><br><br>
			<div class="owl-carousel owl-theme knowYourMedicines">
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
				<div class="item tcenter">
					<div class="bgwhite inblock knowYourMedicine">
						<img src="imgs/1j1image.svg"/>
						<h4>Medicine Name</h4>
						<p>Suspendisse aliquet metus tellus, at auctor sapien interdum at. Nullam dictum arcu dui. Maecenas non mollis dolor.</p>
					</div>
				</div>
			</div>
			<div class="tcenter" style="margin-top: 40px;">
				<a href="#" class="button uppercase white">Know More</a>
			</div>
		</div>
	</section>
	<section class="bgimage" style="background-image: url(imgs/aboutusbanner.jpg);background-attachment: inherit;">
		<div class="container">
			<br><br>
			<div class="row">
				<div class="cm6 nomargin tcenter">
					<h1 class="fgwhite" style="margin-bottom: 10px;">We're Making Medicine Healthier and Purer</h1>
					<p class="fgwhite nomargin" style="font-size: 1.4em;">We're on a mission to bring cleaner, more effective medicines to children and families.</p><br>
					<a href="#" class="button uppercase">More About Us</a>
				</div>
			</div>
			<br>
		</div>
	</section>
	<section>
		<div class="container">
			<h2 class="tcenter">Testimonials</h2><br><br>
			<div class="owl-carousel owl-theme testimonials">
			
				<%
					ArrayList<TestimonialBean> testimonialBeans = (ArrayList<TestimonialBean>)new TestimonialDAO().getList();
					for(int i=0;i<testimonialBeans.size();i++){
				%>
			
			    <div class="item tcenter">
			    	<div class="bggrey inblock testimonial">
				    	<img src="<%=testimonialBeans.get(i).getPhotoLink() %>" />
				    	<h4><%=testimonialBeans.get(i).getName() %></h4>
				    	<p class="quote">
				    		&ldquo;<%=testimonialBeans.get(i).getDescription()%>&rdquo;
				    	</p>
				    </div>
			    </div>
			    <%
					}
			    %>
			</div>
		</div>
	</section>
	<%@include  file="UserFooter.jsp" %>
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