<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>친구찾기 / Friends</title>
<!-- Core CSS -->
<script src="https://unpkg.com/feather-icons"></script>
<link rel="stylesheet" href="resources/template/assets/css/app.css">
<link rel="stylesheet" href="resources/template/assets/css/core.css">
<link rel="icon" type="image/png"
	href="resources/template/assets/img/favicon.png" />
<link
	href="resources/template/assets/nicelabel/css/jquery-nicelabel.css"
	rel="stylesheet">
<script src="resources/template/assets/nicelabel/js/jquery.min.js"></script>
<script src="resources/template/assets/nicelabel/js/jquery.nicelabel.js"></script>
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css"
	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
</head>
<style>
.navbar-v1 {
    height: auto;
}
.navbar-item.is-icon .icon-link svg {
    width: 20px;
    height: 20px;
    stroke: #777;
    stroke-width: 2px;
}
.options-nav.no-shadow {
    margin-top: 11px;
}
.options-nav {
	position: fixed;
	left: 0;
	width: 100%;
	height: 50px;
	background: #fff;
	border-bottom: 1px solid #e8e8e8;
	-webkit-box-shadow: 0 0 8px 0 rgb(0 0 0/ 12%);
	box-shadow: 0 0 8px 0 rgb(0 0 0/ 12%);
	z-index: 5;
	-webkit-transition: all .3s;
	transition: all .3s;
}
.filters-panel {
	position: fixed;
	top: 107px;
	left: 0;
	height: calc(100% - 107px);
	width: 420px;
	background: #fff;
	border-right: 1px solid #e0e0e0;
	-webkit-transform: translateX(-100%);
	transform: translateX(-100%);
	-webkit-transition: all .3s;
	transition: all .3s;
	z-index: 2;
}
.friends-wrapper {
	position: relative;
	margin: 0 auto;
	top: 0px;
	padding: 0 6%;
	min-height: calc(100vh - 280px);
}
.main-container.has-sidebar {
	width: calc(98% - 150px);
	margin-left: 300px;
}
.friends-wrapper.has-sidebar .card-row .friend-card {
	width: calc(25.3% - 16px);
	margin-left: 0;
}
.friends-wrapper .card-row {
	margin-top: 20px;
	margin-left: 20px;
	padding-bottom: 60px;
}
.friends-wrapper {
	position: relative;
	margin: 0 0%;
	top: 0px;
	padding: 0 6%;
	min-height: calc(100vh - 280px);
}
.filters-panel .panel-inner .filter-block {
	padding: 5px;
	margin-left: 15px;
	overflow: auto;
}
.filters-panel .panel-inner {
	padding-left: 19px;
	padding-right: 12px;
	font-size: 0.9rem;
	padding-top: 14px;
	padding-bottom: 40px;
}
.filters-panel::-webkit-scrollbar {
	width: 0 !important;
	display: none;
}
.search-label {
	font-size: 0.9rem;
	font-weight: 500;
	margin-right: 21px;
}
.topic-label>.left {
	float: left;
}
.topic-label>.right {
	float: right;
	display: inline-block;
	margin-bottom: 15px;
}
.topic-list {
	overflow: auto;
	height: 150px;
	-ms-overflow-style: none;
	margin-top: 15px;
}
.topic-list::-webkit-scrollbar {
	display: inline-block;
	width: 0 !important;
	display: none;
}
.text-nicelabel+label {
	display: inline-block;
	font-size: 14px;
	padding: 1px 4px 5px 6px;
	background-color: rgba(0, 140, 186, 1);
	color: #b3b3b3;
	border-radius: 2rem;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	transition: all 0.2s;
	-moz-user-select: none;
	-webkit-user-select: none;
}
.img-container .flag {
	position: absolute;
	bottom: 0;
	left: inherit;
	height: 30px;
	width: 30px;
	border-radius: 50%;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	box-shadow: 0 14px 26px -12px rgb(61 112 178/ 42%), 0 4px 23px 0px
		rgb(0 0 0/ 12%), 0 8px 10px -5px rgb(61 112 178/ 20%) !important;
	transform: rotate(0);
	transition: all .3s;
	cursor: pointer;
	z-index: 1;
}
.location-info {
	position: absolute;
	right: 6%;
	top: 75%;
	text-align: right;
	background-color: #797979c4;
	padding: 6px;
	border-radius: 0.5rem;
	color: white;
}
.friend-name {
	font-size: 1.2rem;
	color: #393a4f !important;
	font-weight: 600;
}
.friend-location {
	color: #9b9b9b;
	font-size: 0.85rem;
}
.control.has-icons-left .icon.is-left {
	left: 32px;
	padding-bottom: 10px;
}
.control.has-icons-left .input, .control.has-icons-left .select select {
	padding-left: 2.5em;
	height: 29px;
}
.dropdown.is-spaced .dropdown-menu {
    -webkit-box-shadow: 0px 5px 16px rgb(0 0 0 / 5%);
    box-shadow: 0px 5px 16px rgb(0 0 0 / 5%);
    border-color: #e8e8e8;
    padding-top: 14px;
    min-width: 280px;
}
.select:not(.is-multiple) {
	height: 25px;
	font-size: small;
}
.div-margin {
	margin-bottom: 18px;
	margin-top: 7px;
}
.input {
	font-size: .9rem;
	height: 28px;
	width: 42px;
	-webkit-transition: all .3s;
	transition: all .3s;
	border-radius: 142px;
}
.append-label {
	display: inline-block;
	font-size: 14px;
	padding: 1px 9px 2px 9px;
	border-radius: 2rem;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	transition: all 0.2s;
	-moz-user-select: none;
	-webkit-user-select: none;
	background-color: #6ba4e9;
	color: white;
	margin-left: 10px;
}
#append-op {
	margin-top: 20px;
}
#append-dop {
	margin-top: 20px;
}
.no-result {
	min-height: calc(100vh - 280px);
	min-width: -webkit-fill-available;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}
#friendSearch {
	float: right;
}
.title {
	padding-top: 11px;
	padding-bottom: 11px;
}
.field label {
	font-size: .9rem;
}
.radio {
	margin-left: 5px;
}
.load-more-wrap {
	padding: 40px 0;
	POSITION: relative;
	right: 50%;
	left: 42%;
}
input.input.textFilter-input {
    width: 250px;
}
.spanCnt{
	font-weight: 600;
    color: #828282;
    margin: 0px 2px 0px 4px;
}
.divCnt{
	margin-top: 14px;
}
small {
    font-size: .875em;
}

.radio-label { margin-right: 10px; }

.search-title { font-size: 1.4rem }

</style>
<script>
$(document).ready(function() {
	var locale = '${locale}';

	//검색 옵션 
	 $('#friendSearch').on('click',function() {
		 var gender = $('input[name=genderval]:checked').val();
		 var dgender = $('input[name=dgenderval]:checked').val();
		 var country_op= $("#append-op").children();
		 var discountry_op = $("#append-dop").children();
		 var country= "";
		 var discountry ="";
		 var lan = $("#language1-val option:selected").val();
		 var topic = "";
		 var distopic = "";
	
		 $("input[name=topic-label]:checked").each(function() {topic += $(this).val() + ","; });
		 $("input[name=dtopic-label]:checked").each(function() {distopic += $(this).val()+ ",";});
		
		 country_op.each(function(i,v){country += v.id + ",";});
		 discountry_op.each(function(i,v){discountry += v.id.substr(3) + ",";});
		 
		 $('#gender').val(gender);
		 $('#dgender').val(dgender);
		 $('#country').val(country);
		 $('#dcountry').val(discountry);
		 $('#language1').val(lan);
		 $('#topic').val(topic);
		 $('#dtopic').val(distopic);
		 $('#frm').submit();
	 });
	
	// 국가 드롭다운 
	 $('#show-filters').on('click',function() {
	 var url = '${pageContext.request.contextPath}/resources/template/assets/data/country.json';
		 $.getJSON(url,function(data) {
			 $.each(data,function(key,value) {
				 if(locale=='kr'){
					 $('#country-op').append('<option value="'+value.CountryNameEN+'" value2="'+key+'">'+value.CountryNameKR+'</option>');
					 $('#dcountry-op').append('<option value="'+value.CountryNameEN+'" value2="'+key+'">'+value.CountryNameKR+'</option>');
				 }else{
					 $('#country-op').append('<option value="'+value.CountryNameEN+'" value2="'+key+'">'+value.CountryNameEN+'</option>');
					 $('#dcountry-op').append('<option value="'+value.CountryNameEN+'" value2="'+key+'">'+value.CountryNameEN+'</option>');
				 }
	 		});
		 });
	 });
	
	// locale이 en 이라면 value=innerHTML 둘다 영어
	//국가 선택시 라벨 어펜드 
 	 $('#country-op').on('change',function(){
		 var enVal= this.value;	//DB검색되는value 
		 var koVal= this.options[this.selectedIndex].text; //페이지에 보여지는value
		 var val2 = $("#country-op > option:selected").attr("value2");	//삭제구분value
	     if($('#append-op').children().length==5){	//5개이상선택불가 
	    	 return;
	     }else{
	    	 if($('#append-op').find('#'+enVal).length){	//중복불가
	    		 return;
	    	 }else{
			 $('#append-op').append("<span class='append-label "+val2+"' id='"+enVal+"' onclick="+"'deleteCountry(\""+ val2 + "\")'>"+koVal+"</span>"); 	 
	    	 }
	     }
	 });

	//제외국가 선택시 라벨 어펜드 
	 $('#dcountry-op').on('change',function(){
		 var enVal= this.value; //DB검색되는value
		 var koVal= this.options[this.selectedIndex].text; //페이지에 보여지는value
		 var val2 = $("#dcountry-op > option:selected").attr("value2"); //삭제구분value
	     if($('#append-dop').children().length==5){
	    	 return;
	     }else{
	    	if($('#append-dop').find('#dis'+enVal).length){
	    		 return;
	    	}else{
	    	 $('#append-dop').append("<span class='append-label dis"+val2+"' id='dis"+enVal+"' onclick="+"'deleteCountry(\"dis"+ val2 + "\")'>"+koVal+"</span>");	    		
	    	}
	     }
	 });	
	 
	 //-----load more firstTab-----
	  var increment;
	  var startFilter;
	  var endFilter;
	  var $this;
	  var elementLength;
	  increment =12;
	  startFilter=0;
	  endFilter=increment;
	  
	  $this = $('#searchRow');						
	  elementLength = $this.children().length;
	  $('.listLength').text(elementLength);
	   
 		// show/hide the Load More button
 	 	if (elementLength > 12) { 
	    	$('#buttonToogle').show();
	    }else{
	    	$('#buttonToogle').hide();
	    }
 		
	  $('#searchRow #searchItem').slice(startFilter, endFilter).addClass('shown');
	  $('.shownLength').text(endFilter);
	  $('#searchRow #searchItem').not('.shown').hide();
	   
	  $('#buttonToogle .load-more-button').on('click', function() {
	  	if (elementLength > endFilter) {
		      startFilter += increment;
		      endFilter += increment;
		      $('#searchRow #searchItem').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
		      $('.shownLength').text((endFilter > elementLength) ? elementLength : endFilter);
		      if (elementLength <= endFilter) {
		          $(this).remove();
		      }
		}
	  });
	//-----load more secondTab-----
	   $('#allTab').on('click',function(){
			increment = 12;			//12개씩 로드
			startFilter = 0;		
			endFilter = increment;
		    
			$this = $('#allRow');						
		    elementLength = $this.children().length;
	   		$('.listLength2').text(elementLength);
	   		
	 	    if (elementLength > 12) { 
	 	    	$('#buttonToogle1').show();
	 	    }else{
	 	    	$('#buttonToogle1').hide();
	 	    }
	 	   
			$('#allRow #allItem').slice(startFilter, endFilter).addClass('shown');
		   	$('.shownLength2').text(endFilter);
		   	$('#allRow #allItem').not('.shown').hide();
	   		
		   	$('#buttonToogle1 .load-more-button').on('click', function() {
		   		if (elementLength > endFilter) {
			       startFilter += increment;
			       endFilter += increment;
			   	   $('#allRow #allItem').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
			       $('.shownLength2').text((endFilter > elementLength) ? elementLength : endFilter);
			       if (elementLength <= endFilter) {
			           $(this).remove();
			       }
			     }
		   });
	   })
	   //-----load more ThirdTab-----
	   $('#newTab').on('click',function(){
		    increment = 12;
		    startFilter = 0;
		    endFilter = increment;
		    $this = $('#newRow');						
		    elementLength = $this.children().length;
	   		$('.listLength3').text(elementLength);
	   		
	 	    if (elementLength > 12) { 
	 	    	$('#buttonToogle2').show();
	 	    }else{
	 	    	$('#buttonToogle2').hide();
	 	    }
	 	   
			$('#newRow #newItem').slice(startFilter, endFilter).addClass('shown');
		   	$('.shownLength3').text(endFilter);
		   	$('#newRow #newItem').not('.shown').hide();
		   	
		   	$('#buttonToogle2 .load-more-button').on('click', function() {
		   		if (elementLength > endFilter) {
			       startFilter += increment;
			       endFilter += increment;
			       $('#newRow #newItem').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
			       $('.shownLength3').text((endFilter > elementLength) ? elementLength : endFilter);
			       if (elementLength <= endFilter) {
			           $(this).remove();
			       }
			     }
		   });
	   })
});

//---국가 라벨 삭제-------
function deleteCountry(value) {
	 $('.'+value).remove();
};	
</script>
<body>
	<!-- Pageloader -->
	<div class="pageloader"></div>
	<div class="infraloader is-active"></div>
	<div class="app-overlay"></div>
	<div class="view-wrapper" style="font-family: 'ONE-Mobile-Regular' !important;">
		<!-- /partials/global/options-nav/friends-options-nav.html -->
		<div class="options-nav no-shadow">
			<div class="container is-fluid">
				<div class="nav-inner is-friends">
					<a id="show-filters" class="nav-item is-icon"> <svg
							viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
							stroke-width="2" fill="none" stroke-linecap="round"
							stroke-linejoin="round" class="css-i6dzq1">
							<polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon></svg>
					</a> <a id="hide-filters" class="nav-item is-icon is-hidden"> <svg
							viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
							stroke-width="2" fill="none" stroke-linecap="round"
							stroke-linejoin="round" class="css-i6dzq1">
							<line x1="18" y1="6" x2="6" y2="18"></line>
							<line x1="6" y1="6" x2="18" y2="18"></line></svg>
					</a>
					<div class="option-tabs is-friends">
						<a class="option-tab is-active" id="searchTab"
							data-tab="all-friends"> <span><spring:message code="friends.search"/> </span>
						</a> <a class="option-tab" id="allTab" data-tab="starred-friends">
							<span><spring:message code="friends.all"/></span>
						</a> <a class="option-tab" id="newTab" data-tab="new-friends"> <span><spring:message code="friends.new"/></span>
						</a>
						<div class="option-naver"></div>
					</div>
					<div class="end-group">
						<div class="nav-item is-friend-count">${fn:length(allList) }<spring:message code="friends.people.count"/>
							</div>
						<div id="subsearch" class="nav-item is-search is-hidden">
							<div class="control">
								<input type="text" class="input textFilter-input">
							</div>
						</div>
						<a id="show-subsearch" class="nav-item is-icon"> <svg
								viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
								stroke-width="2" fill="none" stroke-linecap="round"
								stroke-linejoin="round" class="css-i6dzq1">
								<circle cx="11" cy="11" r="8"></circle>
								<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
						</a> <a id="hide-subsearch" class="nav-item is-icon is-hidden"> <svg
								viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
								stroke-width="2" fill="none" stroke-linecap="round"
								stroke-linejoin="round" class="css-i6dzq1">
								<line x1="18" y1="6" x2="6" y2="18"></line>
								<line x1="6" y1="6" x2="18" y2="18"></line></svg>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 친구 찾기-->
		<form id="frm" name="frm" method="post" action="searchList.do">
			<input type="hidden" id="gender" name="gender"> <input
				type="hidden" id="dgender" name="dgender"> <input
				type="hidden" id="country" name="country"> <input
				type="hidden" id="dcountry" name="dcountry"> <input
				type="hidden" id="language1" name="language1"> <input
				type="hidden" id="topic" name="topic"> <input type="hidden"
				id="dtopic" name="dtopic">
			<div class="filters-panel" style="overflow: scroll;">
				<div class="panel-inner">
					<div class="title">
						<span class="search-title">검색조건</span>
						<a class="button is-rounded is-solid accent-button" id="friendSearch"><spring:message code="friends.search"/></a>
					</div>
					<div class="field" style="font-size: .7rem;">
						<div class="control">
							<label class="search-label"><spring:message code="friends.search.age"/></label> <input type="text"
								class="input" id="s_age" name="s_age" maxlength="2"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><small>
								<spring:message code="friends.search.age.and"/> </small> <input type="text" class="input" id="e_age" name="e_age"
								maxlength="2"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>
					</div>
					<div>
						<label class="search-label"><spring:message code="friends.search.gender"/></label> 
						<label class="radio-label"><input class="radio"type="radio" name="genderval" value="" checked="checked"><spring:message code="friends.search.gender.all"/></label>
						<label class="radio-label"><input class="radio" type="radio" name="genderval" value="M"><spring:message code="friends.search.gender.m"/></label>
						<label class="radio-label"><input class="radio" type="radio" name="genderval" value="W"><spring:message code="friends.search.gender.w"/></label>
						<label class="radio-label"><input class="radio" type="radio" name="genderval" value="O"><spring:message code="friends.search.gender.o"/></label>
					</div>
					<div class="div-margin">
						<div class="control">
							<label class="search-label"><spring:message code="friends.search.country"/></label>
							<div class="select">
								<select id="country-op">
									<option value=""><spring:message code="friends.search.all"/></option>
								</select>
							</div>
							<div id="append-op"></div>
						</div>
					</div>
					<div>
						<div class="div-margin">
							<div class="control">
								<label class="search-label"><spring:message code="friends.search.language"/></label>
								<div class="select">
									<select id="language1-val">
										<option value=""><spring:message code="friends.search.all"/></option>
										<option value="kr"><spring:message code="friends.search.language.ko"/></option>
										<option value="en"><spring:message code="friends.search.language.en"/></option>
									</select>
								</div>
							</div>
						</div>

					</div>
					<div>
						<label class="search-label"><spring:message code="friends.search.topic"/></label>
						<div class="topic-list">
							<c:forEach items="${topicList }" var="vo">
								<c:if test="${locale eq 'kr'}">
								<input class="text-nicelabel" name="topic-label"
									data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}'
									type="checkbox" value="${vo.topic_id }">
								</c:if>
								<c:if test="${locale eq 'en'}">
									<input class="text-nicelabel" name="topic-label"
									data-nicelabel='{"checked_text": "${vo.en }", "unchecked_text": "${vo.en }"}'
									type="checkbox" value="${vo.topic_id }">
								</c:if>									
							</c:forEach>
						</div>
					</div>
					<div class="title">
					<hr>
					<span class="search-title">제외조건</span>
					</div>
					<!-- 제외조건 시작 -->
					<div class="field" style="font-size: .7rem;">
						<div class="control">
							<label class="search-label"><spring:message code="friends.search.age"/></label> <input type="text"
								class="input" id="s_dage" name="s_dage" maxlength="2"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><small>
								<spring:message code="friends.search.age.and"/> </small> <input type="text" class="input" id="e_dage" name="e_dage"
								name="e_age" maxlength="2"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>
					</div>
					<div>
						<label class="search-label"><spring:message code="friends.search.gender"/></label> 
						<label class="radio-label"><input class="radio"type="radio" name="dgenderval" value="M"><spring:message code="friends.search.gender.m"/></label>
						<label class="radio-label"><input class="radio" type="radio" name="dgenderval" value="W"><spring:message code="friends.search.gender.w"/></label>
						<label class="radio-label"><input class="radio" type="radio" name="dgenderval" value="O"><spring:message code="friends.search.gender.o"/></label>
					</div>
					<div class="div-margin">
						<div class="control">
							<label class="search-label"><spring:message code="friends.search.country"/></label>
							<div class="select">
								<select id="dcountry-op">
									<option value=""><spring:message code="friends.search.all"/></option>
								</select>
							</div>
							<div id="append-dop"></div>
						</div>
					</div>
					<div>
						<label class="search-label"><spring:message code="friends.search.topic"/></label>
						<div class="topic-list"
							style="overflow: auto; height: 200px; -ms-overflow-style: none;">
							<c:forEach items="${topicList }" var="vo">
								<c:if test="${locale eq 'kr' }">
								<input class="text-nicelabel" name="dtopic-label"
									data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}'
									type="checkbox" value="${vo.topic_id }">
								</c:if>
								<c:if test="${locale eq 'en' }">
									<input class="text-nicelabel" name="dtopic-label"
									data-nicelabel='{"checked_text": "${vo.en }", "unchecked_text": "${vo.en }"}'
									type="checkbox" value="${vo.topic_id }">
								</c:if>	
							</c:forEach>
							<script>
								$('input').nicelabel({});
							</script>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- /partials/global/pageloader/subloaders/grey-subloader.html -->
		<div class="subloader is-grey is-active">
			<div class="loader is-loading"></div>
		</div>

		<div id="friends-page" class="friends-wrapper main-container">
			<!--First tab-->
			<div id="all-friends" class="card-row-wrap is-active">
				<div class="card-row-placeholder is-hidden"><spring:message code="friends.search.no"/></div>
				<!-- /partials/pages/friends/friend-lists/all-friends.html -->
				<!--Friend-->
				<c:choose>
					<c:when test="${fn:length(searchList) == 0}">
						<div class="card-row-placeholder"><spring:message code="friends.search.no"/></div>
						<div class="card-row" id="searchRow"></div>
					</c:when>
					<c:when test="${fn:length(searchList) < 12}">
						<div class="card-row" id="searchRow">
							<c:forEach items="${searchList }" var="vo">
								<div class="card-flex friend-card" id="searchItem"
									onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"
									+ ${vo.user_id}>
									<a id="goProfile"
										href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
										<div class="img-container">
											<c:if test="${vo.uuid ne '-'}">
												<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
											<c:if test="${vo.uuid eq '-'}">
												<img class="avatar" src="https://via.placeholder.com/300x300"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
										</div>
										<div class="friend-info">
											<div class="friend-name textFilter-match">${vo.name }</div>
											<div class="friend-location">
												<span><svg viewBox="0 0 24 24" width="15" height="15"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
													id="friend-city textFilter-match">${vo.city},
													${vo.country}</span>
												<c:if test="${vo.topicCnt ne 0 }">
													<div class="divCnt">
													<h4><spring:message code="friends.search.topic.count"/><span class="spanCnt">${vo.topicCnt }</span><spring:message code="friends.search.topic.count2"/>
													</h4>
													</div>
												</c:if>
												<c:if test="${vo.topicCnt eq 0 }">
													<div></div>
												</c:if>
											</div>
										</div>
									</a>
									<div class="friend-stats">
										<div class="stat-block">
											<label>Following</label>
											<div class="stat-number">${vo.followingCnt }</div>
										</div>
										<div class="stat-block">
											<label>Posts</label>
											<div class="stat-number">${vo.feedCnt }</div>
										</div>
										<div class="stat-block">
											<label>Followers</label>
											<div class="stat-number">${vo.followerCnt }</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-row" id="searchRow">
							<c:forEach items="${searchList }" var="vo">
								<div class="card-flex friend-card" id="searchItem"
									onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"
									+ ${vo.user_id}>
									<a id="goProfile"
										href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
										<div class="img-container">
											<c:if test="${vo.uuid ne '-'}">
												<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
											<c:if test="${vo.uuid eq '-'}">
												<img class="avatar" src="https://via.placeholder.com/300x300"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
										</div>
										<div class="friend-info">
											<div class="friend-name textFilter-match">${vo.name }</div>
											<div class="friend-location">
												<span><svg viewBox="0 0 24 24" width="15" height="15"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
													id="friend-city textFilter-match">${vo.city},
													${vo.country}</span>
												<c:if test="${vo.topicCnt ne 0 }">
													<div class="divCnt">
													<h4><spring:message code="friends.search.topic.count"/><span class="spanCnt">${vo.topicCnt }</span><spring:message code="friends.search.topic.count2"/></h4>
													</div>
												</c:if>
												<c:if test="${vo.topicCnt eq 0 }">
													<div></div>
												</c:if>
											</div>
										</div>
									</a>
									<div class="friend-stats">
										<div class="stat-block">
											<label>Posts</label>
											<div class="stat-number">${vo.feedCnt }</div>
										</div>
										<div class="stat-block">
											<label>Following</label>
											<div class="stat-number">${vo.followingCnt }</div>
										</div>
										<div class="stat-block">
											<label>Followers</label>
											<div class="stat-number">${vo.followerCnt }</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="load-more-wrap narrow-top has-text-centered"
								id="buttonToogle">
								<a href="javascript:;" class="load-more-button"><spring:message code="friends.search.more"/></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!--Second tab-->
			<div id="starred-friends" class="card-row-wrap">
				<div class="card-row-placeholder is-hidden"><spring:message code="friends.search.no"/></div>
				<!-- /partials/pages/friends/friend-lists/all-friends.html -->
				<!--Friend-->
				<c:choose>
					<c:when test="${fn:length(allList) == 0}">
						<div class="card-row-placeholder"><spring:message code="friends.search.no"/></div>
						<div class="card-row" id="allRow"></div>
					</c:when>
					<c:when test="${fn:length(allList) < 12}">
						<div class="card-row" id="allRow">
							<c:forEach items="${allList }" var="vo">
								<div class="card-flex friend-card" id="allItem"
									onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"
									+ ${vo.user_id}>
									<a id="goProfile"
										href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
										<div class="img-container">
											<c:if test="${vo.uuid ne '-'}">
												<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
											<c:if test="${vo.uuid eq '-'}">
												<img class="avatar" src="https://via.placeholder.com/300x300"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
										</div>
										<div class="friend-info">
											<div class="friend-name textFilter-match">${vo.name }</div>
											<div class="friend-location">
												<span><svg viewBox="0 0 24 24" width="15" height="15"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
													id="friend-city textFilter-match">${vo.city},
													${vo.country}</span>
											</div>
										</div>
									</a>
									<div class="friend-stats">
										<div class="stat-block">
											<label>Following</label>
											<div class="stat-number">${vo.followingCnt }</div>
										</div>
										<div class="stat-block">
											<label>Posts</label>
											<div class="stat-number">${vo.feedCnt }</div>
										</div>
										<div class="stat-block">
											<label>Followers</label>
											<div class="stat-number">${vo.followerCnt }</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-row" id="allRow">
							<c:forEach items="${allList }" var="vo">
								<div class="card-flex friend-card" id="allItem"
									onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"+ ${vo.user_id}>
									<a id="goProfile"
										href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
										<div class="img-container">
											<c:if test="${vo.uuid ne '-'}">
												<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
											<c:if test="${vo.uuid eq '-'}">
												<img class="avatar" src="https://via.placeholder.com/300x300"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag" src="${vo.flag }" alt="">
											</c:if>
										</div>
										<div class="friend-info">
											<div class="friend-name textFilter-match">${vo.name }</div>
											<div class="friend-location">
												<span><svg viewBox="0 0 24 24" width="15" height="15"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
													id="friend-city textFilter-match">${vo.city},
													${vo.country}</span>
											</div>
										</div>
									</a>
									<div class="friend-stats">
										<div class="stat-block">
											<label>Following</label>
											<div class="stat-number">${vo.followingCnt }</div>
										</div>
										<div class="stat-block">
											<label>Posts</label>
											<div class="stat-number">${vo.feedCnt }</div>
										</div>
										<div class="stat-block">
											<label>Followers</label>
											<div class="stat-number">${vo.followerCnt }</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class=" load-more-wrap narrow-top has-text-centered"
								id="buttonToogle1">
								<a href="javascript:;" class="load-more-button"><spring:message code="friends.search.more"/></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<!--third tab-->
			<div id="new-friends" class="card-row-wrap">
				<div class="card-row-placeholder is-hidden"><spring:message code="friends.search.no"/></div>
			<c:choose>
					<c:when test="${fn:length(newList) == 0}">
					  <div class="card-row-placeholder"><spring:message code="friends.search.no"/></div>
					  <div class="card-row" id="newRow"></div>
					</c:when>
					<c:when test="${fn:length(newList) < 12}">
					     <div class="card-row" id="newRow">
							<c:forEach items="${newList }" var="vo">
									<div class="card-flex friend-card" id="newItem" onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"+ ${vo.user_id}>
										<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
											<div class="img-container">
												<c:if test="${vo.uuid ne '-'}">
													<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
														data-demo-src="resources/template/assets/img/avatars/david.jpg"
														alt=""> <img class="flag" src="${vo.flag }" alt="">
												</c:if>
												<c:if test="${vo.uuid eq '-'}">
													<img class="avatar" src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/david.jpg"
														alt=""> <img class="flag" src="${vo.flag }" alt="">
												</c:if>
											</div>
											<div class="friend-info" >
											<div class="friend-name textFilter-match">${vo.name }</div>
												<div class="friend-location">
													<span><svg viewBox="0 0 24 24" width="15"
															height="15" stroke="currentColor" stroke-width="2"
															fill="none" stroke-linecap="round"
															stroke-linejoin="round" class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
														id="friend-city textFilter-match">${vo.city}, ${vo.country}</span>
													<span class="time"><p>
													<fmt:formatDate value="${vo.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" var="reg_dt"/>
													<script type="text/javascript">														
														document.write(timeForToday('${reg_dt }'));
													</script> <spring:message code="friends.search.new"/>
													</p></span>
												</div>
											</div>
										</a>
										<div class="friend-stats">
											<div class="stat-block">
												<label>Following</label>
												<div class="stat-number" >
												${vo.followingCnt }
												</div>
											</div>
											<div class="stat-block">
												<label>Posts</label>
												<div class="stat-number">
													${vo.feedCnt }
												</div>
											</div>
											<div class="stat-block">
												<label>Followers</label>
												<div class="stat-number">
													${vo.followerCnt }
												</div>
											</div>
										</div>
									</div>
							</c:forEach>
						</div>
					 </c:when>
					    <c:otherwise>
					     <div class="card-row" id="newRow">
							<c:forEach items="${newList }" var="vo">
									<div class="card-flex friend-card" id="newItem" onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"+ ${vo.user_id}>
										<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
											<div class="img-container">
												<c:if test="${vo.uuid ne '-'}">
													<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${vo.uuid }"
														data-demo-src="resources/template/assets/img/avatars/david.jpg"
														alt=""> <img class="flag" src="${vo.flag }" alt="">
												</c:if>
												<c:if test="${vo.uuid eq '-'}">
													<img class="avatar" src="https://via.placeholder.com/300x300"
														data-demo-src="resources/template/assets/img/avatars/david.jpg"
														alt=""> <img class="flag" src="${vo.flag }" alt="">
												</c:if>
											</div>
											<div class="friend-info" >
											<div class="friend-name textFilter-match">${vo.name }</div>
												<div class="friend-location">
													<span><svg viewBox="0 0 24 24" width="15"
															height="15" stroke="currentColor" stroke-width="2"
															fill="none" stroke-linecap="round"
															stroke-linejoin="round" class="css-i6dzq1">
															<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
															<circle cx="12" cy="10" r="3"></circle></svg></span> <span
														id="friend-city textFilter-match">${vo.city}, ${vo.country}</span>
														<fmt:formatDate value="${vo.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" var="reg_dt"/>
													<span class="time"><p>
													<script type="text/javascript">														
														document.write(timeForToday('${reg_dt }'));
													</script><spring:message code="friends.search.new"/> 
													</p></span>
												</div>
											</div>
										</a>
										<div class="friend-stats">
											<div class="stat-block">
												<label>Following</label>
												<div class="stat-number" >
												${vo.followingCnt }
												</div>
											</div>
											<div class="stat-block">
												<label>Posts</label>
												<div class="stat-number">
													${vo.feedCnt }
												</div>
											</div>
											<div class="stat-block">
												<label>Followers</label>
												<div class="stat-number">
													${vo.followerCnt }
												</div>
											</div>
										</div>
									</div>
							</c:forEach>
							<div class=" load-more-wrap narrow-top has-text-centered"  id="buttonToogle2">
								<a href="javascript:;" class="load-more-button"><spring:message code="friends.search.more"/> </a>
							</div>
							</div>
					     </c:otherwise>
				</c:choose>
			</div>
		</div>
</body>
<script>
	feather.replace()
</script>
</html>
