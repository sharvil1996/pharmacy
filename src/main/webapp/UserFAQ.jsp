<!DOCTYPE html>
<%@page import="DrRAJ.DAO.FAQDAO"%>
<%@page import="DrRAJ.Bean.FAQBean"%>
<html>
<head>
<title>FAQ on Homoeopathy | Dr. Raj Homoeo Pharmacy</title>
<%@include file="UserHeader.jsp"%>

	<section class="bgimage" style="background-image: url(imgs/homebanner.jpg);">
		<div class="blackcover opaq2"></div>
		<div class="container posrel" style="z-index: 2;">
			<br><br><br><br>
			<h3 class="tcenter bold text-2 fgwhite">Health and Homoeopathy</h3>
			<div class="tcenter fgwhite jumbotext text-2" style="margin-bottom: 40px;">FAQ on Homoeopathy</div>
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
					<h3 class="fgmain">Health and Homoeopathy</h3>
					<div class="mainSeperator full"></div>
					<a href="#" class="button white full linkButton active margin">FAQ on Homoeopathy</a>
					<a href="#" class="button white full linkButton black margin">Know Your Medicine</a>
					<a href="#" class="button white full linkButton black margin">Mind, Body & Spirit</a>
					<a href="#" class="button white full linkButton black margin">Homoeopathic Self-Help</a>
				</div>
				<div class="cs9">
					<%
						ArrayList<FAQBean> arrayList = new FAQDAO().select();
					for(int i=0;i<arrayList.size();i++){
					%>
				
					<div class="bold size11"><%=arrayList.get(i).getQuestion() %></div>
					<p class="paragraph" style="margin-top: 5px;"><%=arrayList.get(i).getAnswer() %><p>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</section>
<%@include file="UserFooter.jsp"%>
</body>
</html>