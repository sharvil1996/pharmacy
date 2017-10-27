<!DOCTYPE html>
<%@page import="DrRAJ.Bean.ReviewBean"%>
<%@page import="DrRAJ.Bean.IngredientBean"%>
<%@page import="DrRAJ.Bean.ProductDosageBean"%>
<%@page import="DrRAJ.Bean.PriceBean"%>
<%@page import="DrRAJ.Bean.ProductCompositionBean"%>
<%@page import="DrRAJ.DAO.ProductDAO"%>
<%@page import="DrRAJ.Bean.ProductIndicationBean"%>
<%@page import="DrRAJ.Bean.ProductBean"%>
<html>
<head>
<%
	ProductBean bean = (ProductBean) request.getAttribute("bean");
	if (bean != null) {
%>
<title>
	<%=bean.getProductName()%> | Dr. Raj Homoeo Pharmacy
</title>
<%@include file="UserHeader.jsp"%>
<section class="bgimage"
	style="background-image: url(imgs/homebanner.jpg);">
	<div class="blackcover opaq2"></div>
	<div class="container posrel" style="z-index: 2;">
		<br> <br> <br>
		<h3 class="tcenter bold text-2 fgwhite"><%=bean.getRemediesName()%></h3>
		<div class="tcenter fgwhite jumbotext text-2"
			style="margin-bottom: 40px;"><%=bean.getProductName()%></div>
		<br> <br>
	</div>
	<div class="posab overhidden"
		style="z-index: 3; width: 100%; bottom: -7px;">
		<img src="imgs/bottomwhitecircle.svg" class="posrel"
			style="width: 120%; left: -10%" />
	</div>
</section>
<section>
	<div class="container">
		<div class="row">
			<div class="cm5 tcenter">
				<img src="imgs/product_sample.png" class="imgResponsive"
					style="max-height: 400px;">
			</div>
			<div class="cm7">
				<h2 style="margin-bottom: 5px;"><%=bean.getProductName()%></h2>
				<p class="paragraph" style="margin-top: 0;"><%=bean.getDescription() %></p>
				<span class="bold size15 line15">Indication</span>
				<div class="mainSeperator full dotted"></div>
				<div class="checkList">
				
					<%
					ArrayList<ProductIndicationBean> indicationList = new ProductDAO().getIndication(bean.getProductId());
					for(int i=0;i<indicationList.size();i++){
					%>
					<div class="item">
						<img src="imgs/done.svg" />
						<p class="paragraph"><%=indicationList.get(i).getIndication() %></p>
					</div>
					<%
						} 
					%>
					
					
				</div>
				<a href="<%=bean.getForwardLink() %>" class="button responsive">Buy Now</a>
			</div>
		</div>
		<div class="row">
			<div class="cs6 nomargin">
				<span class="bold size15 line15">Composition</span><br>
				<div class="mainSeperator full dotted"></div>
				<table class="paragraph" cellspacing="0" cellpadding="0"
					style="margin-bottom: 15px;">
					<%
					ArrayList<ProductCompositionBean> compositionList = (ArrayList<ProductCompositionBean>)new ProductDAO().getComposition(bean.getProductId());
					if(compositionList.size()==0){
						%>
						<tr>
						<td>No Composition</td>
					</tr>
						<%
					}
					else{
					for(int i=0;i<compositionList.size();i++){
					%>
					<tr>
						<td><%=compositionList.get(i).getIngredientsName() %></td>
						<td><%=compositionList.get(i).getCompositionContent() %></td>
					</tr>
					<%
						}}
					%>
	
				</table>
				<!-- <p class="paragraph">
					<span class="bold">Excipient</span><span class="tab"></span>q.s. to
					100 ml.<br> In Syrup Base<br> Aqua Distillate<br>
					Alcohol Content<span class="tab"></span>9% v/v
				</p> -->
			</div>
			<div class="cs6 nomargin">
				<span class="bold size15 line15">Packaging</span>
				<div class="mainSeperator full dotted"></div>
				<table class="paragraph" cellspacing="0" cellpadding="0"
					style="margin-bottom: 15px;">
					<%
					ArrayList<PriceBean> priceList = (ArrayList<PriceBean>)new ProductDAO().getPrice(bean.getProductId());
					if(priceList.size()==0){
						%>
						<tr>
						<td>No Packaging</td>
					</tr>
						<%
					}
					else{
					for(int i=0;i<priceList.size();i++){
					%>
					<tr>
						<td><%=priceList.get(i).getPackageSize()%></td>
						<td><span class="tab"></span></td>
						<td>Rs. <%=priceList.get(i).getPrice() %></td>
					</tr>
					<%
						}}
					%>
					
				</table>
				<span class="bold size15 line15">Dosage</span>
				<div class="mainSeperator full dotted"></div>
				<p class="paragraph" style="margin-top: 5px;">
					<!-- <span class="bold">Children :</span> 1 Tablespoon 2-3 times a day
					or as directed by the physician. <br> <span class="bold">Babies
						:</span> 1 Teaspoon 2-3 times a day or as directed by the physician. -->
						
					<%
					ArrayList<ProductDosageBean> dosageList =(ArrayList<ProductDosageBean>) new ProductDAO().getDosage(bean.getProductId());
					if(dosageList.size()==0){
						%>
						<tr>
						<td>No Dosage</td>
					</tr>
						<%
					}
					else{
					for(int i=0;i<dosageList.size();i++){
					%>
					<tr>
						<td><%=dosageList.get(i).getContent() %></td>
					</tr>
					<%
						}}
					%>	
				</p>
				<span class="bold size15 line15">Interaction</span>
				<div class="mainSeperator full dotted"></div>
				<p class="paragraph" style="margin-top: 5px;"><%=bean.getInteraction()%></p>
				<span class="bold size15 line15">Side Effects</span>
				<div class="mainSeperator full dotted"></div>
				<p class="paragraph" style="margin-top: 5px;"><%=bean.getSideEffect()%></p>
				<span class="bold size15 line15">Contra-indication</span>
				<div class="mainSeperator full dotted"></div>
				<p class="paragraph" style="margin-top: 5px;"><%=bean.getContraIndication()%></p>
			</div>
		</div>
	</div>
</section>
<section class="bgmain">
	<div class="container noowldots">
		<h2 class="fgwhite tcenter">What's Inside</h2>
		<br> <br>
		<div class="owl-carousel owl-theme knowYourMedicines">
		
			<%
					ArrayList<IngredientBean> ingredientList =(ArrayList<IngredientBean>) new ProductDAO().getIngredient(bean.getProductId());
					if(ingredientList.size()==0){
						%>
						<tr>
						<td>No Ingredient</td>
					</tr>
						<%
					}
					else{
					for(int i=0;i<ingredientList.size();i++){
					%>
					<div class="item tcenter">
				<div class="bgwhite inblock knowYourMedicine">
					<img src="<%=ingredientList.get(i).getPhotoLink() %>" />
					<h3><%=ingredientList.get(i).getTitle() %></h3>
					<h4><%=ingredientList.get(i).getSubTitle() %></h4>
					<p><%=ingredientList.get(i).getDescription() %></p>
				</div>
			</div>
					<%
						}}
					%>	
		</div>
	</div>
</section>
<section>
<%
	ArrayList<ReviewBean> reviewList =(ArrayList<ReviewBean>) new ProductDAO().getReview(bean.getProductId());
%>
	<div class="container">
		<h2 class="tcenter" style="margin-bottom: 30px;">Reviews</h2>
		<div class="row">
			<div class="cs6 tleft responsive" style="margin-bottom: 10px;">
				<h3 style="top: 5px;" class="posrel"><%=reviewList.size()%> Review(s)</h3>
			</div>
			<div class="cs6 tright" style="margin-bottom: 10px;">
				<button type="button" class="button responsive reviewbutton">Write
					a Review</button>
			</div>
		</div>
		<div class="reviewForm hidden"
			style="padding: 30px 0; max-width: 900px; margin: 0 auto;">
			<h3 class="tcenter" style="margin-bottom: 20px;">Write a Review</h3>
			<label class="label">Name</label> <input type="text" class="textbox" name="txtCustomerName"/>
			<label class="label">Ratings</label>
			<div class="ratingBlock input" style="margin-bottom: 10px;">
				<span class="item"><img src="imgs/stare.svg" /></span><span
					class="item"><img src="imgs/stare.svg" /></span><span class="item"><img
					src="imgs/stare.svg" /></span><span class="item"><img
					src="imgs/stare.svg" /></span><span class="item"><img
					src="imgs/stare.svg" /></span> <input type="text" value="0" name="txtRating">
			</div>
			<label class="label">Title of Review</label> <input type="text"
				class="textbox" name="txtTitle" /> <label class="label">Body of Review</label>
			<textarea type="text" class="textbox" rows="4" name="txtDescription"></textarea>
			<input type="hidden" name="txtProductId" value=<%=bean.getProductId() %>>
			<div class="tcenter">
				<button type="button" class="button responsive uppercase">Submit
					Review</button>
			</div>
		</div>
		<%
					if(reviewList.size()==0){
						%>
						<tr>
						<td>No Review</td>
					</tr>
						<%
					}
					else{
					for(int i=0;i<reviewList.size();i++){
					%>
					<div class="commentBlock">
			<div class="ratingBlock" value="<%=reviewList.get(i).getRating()%>"></div>
			&nbsp;<span class="name"><%=reviewList.get(i).getCustomerName()%></span> <br>
			<div class="title"><%=reviewList.get(i).getTitle()%></div>
			<p class="description"><%=reviewList.get(i).getDescription()%></p>
		</div>
					<%
						}}
					%>	
	</div>
</section>
<%@include file="UserFooter.jsp"%>
<script type="text/javascript">
	$('.knowYourMedicines').owlCarousel({
		loop : true,
		margin : 20,
		navigation : false,
		pagination : false,
		responsive : {
			0 : {
				items : 1
			},
			600 : {
				items : 2
			},
			1000 : {
				items : 3
			}
		},
		autoplay : true,
		autoplayTimeout : 5000,
		autoplayHoverPause : true,
		autoHeight : true
	});
	$(".reviewbutton").click(function() {
		$(".reviewForm").toggleClass("hidden");
	});
</script>
<%
	} else {
%>
	<h3>Error Page</h3>
<%
	}
%>

</html>