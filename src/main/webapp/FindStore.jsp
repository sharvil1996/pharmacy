<%@page import="DrRAJ.DAO.StoreDetailsDAO"%>
<%@page import="DrRAJ.Bean.StoreDetailsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find a Store or Practitioner | Dr. Raj Homoeo Pharmacy</title>
<%@include file="UserHeader.jsp"%>
</head>
<body>
	<%
		Gson gson = new Gson();
		ArrayList<StoreDetailsBean> mylist = new StoreDetailsDAO().getList();
		String temp = gson.toJson(mylist);
	%>
	<div class="rawdata hidden"><%=temp%></div>
	<section class="bgimage"
		style="background-image: url(imgs/homebanner.jpg);">
	<div class="blackcover opaq2"></div>
	<div class="container posrel" style="z-index: 2;">
		<br> <br> <br>
		<div class="tcenter fgwhite jumbotext text-2"
			style="margin-bottom: 40px;">Find a Store or Practitioner</div>
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
			<div class="cs7 nomargin overhidden"
				style="padding-left: 4px; padding-right: 4px;">
				<input type="text" class="textbox posrel searchbox"
					style="top: 5px;" placeholder="Search Stores" />
			</div>
			<div class="cs3 nomargin"></div>
			<div class="cs1 cx6 nomargin" style="padding-right: 2px;">
				<input type="button" class="button full active atozbutton"
					value="A to Z" />
			</div>
			<div class="cs1 cx6 nomargin" style="padding-left: 2px;">
				<input type="button" class="button full ztoabutton" value="Z to A" />
			</div>
		</div>
		<br>
		<br>
		<div class="row storeContainer">
			<!-- <div class="cs4">
					<div class="store_template borderMain">
					<div class="bold size12">Store Name, City</div>
					<div>61 Wellfield Road, Roath, Cardiff, City Name, State Name</div>
					<div>9876543210, 6547891230</div>
					</div>
				</div> -->
		</div>
	</div>
	<div class="nothingFound tcenter opaq5 hidden">
		<br> <br> <br> <br>
		<h2>
			Nothing found for "<span class="sterm"></span>"
		</h2>
		<br> <br> <br> <br>
	</div>
	</section>
	<%@include file="UserFooter.jsp"%>
	<script type="text/javascript">
		var temp = $(".rawdata").text();
		if(temp!=""){
			$(".rawdata").remove();
			var stores=$.parseJSON(temp);
			for(var store of stores){
				store.title=store.name+", "+store.cityname;
				store.address=store.address+", "+store.cityname+", "+store.statename;
				store.contact=store.contact1+", "+store.contact2;
			}
			stores.sort(function(a,b) {return (a.title> b.title) ? 1 : ((b.title> a.title) ? -1 : 0);} ); 
			for(var store of stores){
				var storetemplate="";
				storetemplate+='<div class="cs4" style="padding:0 5px;">';
				storetemplate+='<div class="store_template borderMain">';
				storetemplate+='<div class="bold size12">'+store.title+'</div>';
				storetemplate+='<div>'+store.address+'</div>';
				storetemplate+='<div>'+store.contact+'</div>';
				storetemplate+='</div>';
				storetemplate+='</div>';
				$(".storeContainer").append(storetemplate);
				store.structure=$(".storeContainer").children("div:last-child");
			}
		}
		function searchStore(){
			var term=$(".searchbox").val();
			$(".storeContainer>div").addClass("hidden");
			var count=0;
			for(var store of stores){
				if(store.title.toLowerCase().includes(term.toLowerCase())||store.address.toLowerCase().includes(term.toLowerCase())||store.contact.toLowerCase().includes(term.toLowerCase())){
					$(store.structure).removeClass("hidden");
					count++;
				}
			}
			if(count==0){
				$(".nothingFound").removeClass("hidden");
				$(".sterm").text(term);
			}
			else{
				$(".nothingFound").addClass("hidden");
			}
		}
		$(".searchbox").keyup(function(){
			searchStore();
		});
		$(".atozbutton").click(function(){
			stores.sort(function(a,b) {return (a.title> b.title) ? 1 : ((b.title> a.title) ? -1 : 0);} );
			for(var store of stores){
				$(".storeContainer").append(store.structure);
			}
			searchStore();
			$(".atozbutton").addClass("active");
			$(".ztoabutton").removeClass("active");
		});
		$(".ztoabutton").click(function(){
			stores.sort(function(a,b) {return (a.title> b.title) ? -1 : ((b.title> a.title) ? 1 : 0);} );
			for(var store of stores){
				$(".storeContainer").append(store.structure);
			}
			searchStore();
			$(".atozbutton").removeClass("active");
			$(".ztoabutton").addClass("active");
		});
	</script>
</body>
</html>