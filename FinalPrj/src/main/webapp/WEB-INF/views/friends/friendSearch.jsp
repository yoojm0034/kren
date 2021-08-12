<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />

</head>
<style>
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
	overflow:auto;
}
.filters-panel .panel-inner {
	padding-left: 19px;
    padding-right: 12px;
    font-size: xx-small;
}
.filters-panel::-webkit-scrollbar  {
	width: 0 !important;
  	display: none; 
}
.search-label {
	font-size: .7rem;
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
	overflow:auto;
	height: 200px;
	-ms-overflow-style: none;
	margin-top: 15px;
}
.topic-list::-webkit-scrollbar  {
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
.select:not(.is-multiple) {
    height: 25px;
    font-size: small;
}
.div-margin{
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
#friendSearch{
    left: 286px;
}

.title {
    padding-top: 11px;
}
.field label {
    font-size: .7rem; 
    /* font-weight: 500;
     color: #393a4f;*/
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
</style>
<script>
$(document).ready(function() {
	 var countryCnt =0;
	 var dcountryCnt =0;
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
		 discountry_op.each(function(i,v){discountry += v.id + ",";});
		
		 $('#gender').val(gender);
		 $('#dgender').val(dgender);
		 $('#country').val(country);
		 $('#dcountry').val(discountry);
		 $('#language1').val(lan);
		 $('#topic').val(topic);
		 $('#dtopic').val(distopic);
		 $('#frm').submit();
	 });

	 $('#show-filters').on('click',function() {
	 var url = '${pageContext.request.contextPath}/resources/template/assets/data/country.json';
		 $.getJSON(url,function(data) {
			 $.each(data,function(key,value) {
				 $('#country-op').append('<option value="'+value.CountryNameEN+'">'+value.CountryNameKR+'</option>');
				 $('#dcountry-op').append('<option value="'+value.CountryNameEN+'">'+value.CountryNameKR+'</option>');
	 		});
		 });
	 });
	
	
	 $('#country-op').on('change',function(){
		 var value = this.value;
		 if (countryCnt == 5) return;
		 $('#append-op').append("<span class='append-label' id='"+value+"' onclick="+"'deleteCountry(\""+ value + "\")'>"+value+"</span>");
		 countryCnt++;
	 });		
	
	 $('#dcountry-op').on('change',function(){
		 var value = this.value;
		 if (dcountryCnt == 5) return;
		 $('#append-dop').append("<span class='append-label' id='dis"+value+"' onclick="+"'deleteCountry(\"dis"+ value + "\")'>"+value+"</span>");
		 dcountryCnt++;
	 });	
	  // load more
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
	  if (elementLength > 2) { $('.buttonToogle').show();}
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
	  
	   $('#allTab').on('click',function(){
			increment = 12;
			startFilter = 0;
			endFilter = increment;
		    
			$this = $('#allRow');						
		    elementLength = $this.children().length;
	   		$('.listLength2').text(elementLength);
	   		
	 	    if (elementLength > 2) { $('.buttonToogle').show();}
	 	   
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
	   
	   $('#newTab').on('click',function(){
		    increment = 12;
		    startFilter = 0;
		    endFilter = increment;
		    $this = $('#newRow');						
		    elementLength = $this.children().length;
	   		$('.listLength3').text(elementLength);
	   		
	 	    if (elementLength > 2) { $('.buttonToogle').show();}
	 	   
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
	 function deleteCountry(val) {
		 $('#'+val).remove();
		 if(val.substring(0,3)=="dis"){
		 	dcountryCnt--;
		 }else{
		 	countryCnt--; 
		 }
	 };
</script>
<body>
	<!-- Pageloader -->
	<div class="pageloader"></div>
	<div class="infraloader is-active"></div>
	<div class="app-overlay"></div>
	<div class="view-wrapper">
		<!-- /partials/global/options-nav/friends-options-nav.html -->
		<div class="options-nav no-shadow">
			<div class="container is-fluid">
				<div class="nav-inner is-friends">
					<a id="show-filters" class="nav-item is-icon"> <svg
							viewBox="0 0 24 24" width="24" height="24" stroke="currentColor"
							stroke-width="2" fill="none" stroke-linecap="round"
							stroke-linejoin="round" class="css-i6dzq1">
							<polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon></svg>
					</a> <a id="hide-filters" class="nav-item is-icon is-hidden"> 
					<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
					</a>
					<div class="option-tabs is-friends">
						<a class="option-tab is-active" id="searchTab" data-tab="all-friends"> 
						<span>Search</span>
						</a> 
						<a class="option-tab" id="allTab" data-tab="starred-friends"> 
						<span>All</span>
						</a>
						<a class="option-tab" id="newTab" data-tab="new-friends"> 
						<span>New</span>
						</a>
						<div class="option-naver"></div>
					</div>
					<div class="end-group">
						<div class="nav-item is-friend-count">${fn:length(allList) }
							friends</div>
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
 			<input type="hidden" id="gender" name="gender"> 
 			<input type="hidden" id="dgender" name="dgender"> 
			<input type="hidden" id="country" name="country"> 
			<input type="hidden" id="dcountry" name="dcountry"> 
			<input type="hidden" id="language1" name="language1">
			<input type="hidden" id="topic" name="topic">
			<input type="hidden" id="dtopic" name="dtopic">
			<div class="filters-panel" style="overflow: scroll;">
				<div class="panel-inner">
				<div class="title">				
					<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
					<a class="button is-rounded" id="friendSearch">검색</a>
				</div>
					<div class="field" style=" font-size: .7rem;">
				        <div class="control">
				        	<label class="search-label">나이</label>
				            <input type="text" class="input" id="s_age" name="s_age" maxlength = "2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><small> AND </small>  
				            <input type="text" class="input" id="e_age" name="e_age" maxlength = "2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				        </div>
					</div>
					<div>
						<label class="search-label">성별</label> 
						무관<input class="radio" type="radio" name="genderval" value="" checked="checked"> 
						남<input class="radio" type="radio" name="genderval" value="M"> 
						여<input class="radio" type="radio" name="genderval" value="W">
						기타<input class="radio" type="radio" name="genderval" value="O">
					</div>
					<div class="div-margin">
                       <div class="control">
						<label class="search-label">국가</label> 
                           <div class="select">
                               <select id="country-op">
                                   <option value="">전체</option>
                               </select>
                           </div>
                           <div id="append-op">
                           </div>
                       </div>
					</div>
					<div>
					<div class="div-margin">
                       <div class="control">
						<label class="search-label">언어</label> 
                           <div class="select">
                               <select id="language1-val">
	                            <option value="">전체</option>
								<option value="kr">한국어</option>
								<option value="en">영어</option>
                               </select>
                           </div>
                       </div>
					</div>
						
					</div>
					<div>
						<label class="search-label">관심사</label>
						<div class="topic-list">
							<c:forEach items="${topicList }" var="vo">
								<input class="text-nicelabel" name="topic-label" data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}' type="checkbox" value="${vo.topic_id }">
							</c:forEach>
						</div>
					</div>
					<div class="title">		
						<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M10 15v4a3 3 0 0 0 3 3l4-9V2H5.72a2 2 0 0 0-2 1.7l-1.38 9a2 2 0 0 0 2 2.3zm7-13h2.67A2.31 2.31 0 0 1 22 4v7a2.31 2.31 0 0 1-2.33 2H17"></path></svg>
					</div>
					<div class="field" style=" font-size: .7rem;">
				        <div class="control">
				        	<label class="search-label">나이</label>
				            <input type="text" class="input" id="s_dage" name="s_dage"  maxlength = "2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><small> AND </small>  
				            <input type="text" class="input" id="e_dage" name="e_dage" name="e_age" maxlength = "2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				        </div>
					</div>
					<div>
						<label class="search-label">성별</label> 
						남<input class="radio" type="radio" name="dgenderval" value="M"> 
						여<input class="radio" type="radio" name="dgenderval" value="W">
						기타<input class="radio" type="radio" name="dgenderval" value="O">
					</div>
					<div class="div-margin">
                       <div class="control">
						<label class="search-label" >국가</label> 
                           <div class="select">
                               <select id="dcountry-op" >
                                   <option value="">전체</option>
                               </select>
                           </div>
                           <div id="append-dop">
                           </div>
                       </div>
					</div>
					<div>
						<label class="search-label">관심사</label>
						<div class="topic-list" style="overflow:auto; height: 200px; -ms-overflow-style: none;">
							<c:forEach items="${topicList }" var="vo">
								<input class="text-nicelabel" name="dtopic-label" data-nicelabel='{"checked_text": "${vo.kr }", "unchecked_text": "${vo.kr }"}' type="checkbox" value="${vo.topic_id }">
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
				<div class="card-row-placeholder is-hidden">No matching
					results</div>
				<div class="card-row" id="searchRow">
					<!-- /partials/pages/friends/friend-lists/all-friends.html -->
					<!--Friend-->
					<c:choose>
					    <c:when test="${fn:length(searchList) == 0}">
					       <div class="no-result">No matching results</div>
					    </c:when>
					    <c:otherwise>
							<c:forEach items="${searchList }" var="vo">
									<div class="card-flex friend-card" id="searchItem" onclick="location.href='${pageContext.request.contextPath}/profile.do?user_id='"+ ${vo.user_id}>
										<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
											<div class="img-container">
												<img class="avatar" src="https://via.placeholder.com/300x300"
													data-demo-src="resources/template/assets/img/avatars/david.jpg"
													alt=""> <img class="flag"
													src="${vo.flag }"
													alt="">
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
							<div class=" load-more-wrap narrow-top has-text-centered"  id="buttonToogle">
								<a href="javascript:;" class="load-more-button">Load More</a>
							</div>
					     </c:otherwise>
					 </c:choose>
				</div>
			</div>
			<!--Second tab-->
			<div id="starred-friends" class="card-row-wrap">
				<div class="card-row-placeholder is-hidden">No matching
					results</div>
				<div class="card-row" id="allRow">
					<!-- /partials/pages/friends/friend-lists/all-friends.html -->
					<!--Friend-->
					<c:forEach items="${allList }" var="vo">
						<div class="card-flex friend-card" id="allItem">
							<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
								<div class="img-container">
									<img class="avatar" src="https://via.placeholder.com/300x300"
										data-demo-src="resources/template/assets/img/avatars/david.jpg"
										alt=""> <img class="flag"
										src="${vo.flag }"
										alt="">
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
											<p style="">나와 일치하는 관심사 <span style="color: blue;">${vo.topicCnt }</span> 개</p>
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
					<div class=" load-more-wrap narrow-top has-text-centered"  id="buttonToogle1">
						<a href="javascript:;" class="load-more-button">Load More</a>
					</div>
				</div>
			</div>
			
		<!--third tab-->
			<div id="new-friends" class="card-row-wrap">
				<div class="card-row-placeholder is-hidden">No matching
					results</div>
				<div class="card-row" id="newRow">
					<!-- /partials/pages/friends/friend-lists/starred-friends.html -->
					<!--Friend-->
					<c:forEach items="${newList }" var="vo">
						<div class="card-flex friend-card" id="newItem">
							<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${vo.user_id }">
								<div class="img-container">
									<img class="avatar" src="https://via.placeholder.com/300x300"
										data-demo-src="resources/template/assets/img/avatars/david.jpg"
										alt=""> <img class="flag"
										src="${vo.flag }"
										alt="">
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
											<p style="">나와 일치하는 관심사 <span style="color: blue;">${vo.topicCnt }</span> 개</p>
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
						<a href="javascript:;" class="load-more-button">Load More</a>
					</div>
				</div>
			</div>
		</div>

	<div class="chat-wrapper">
		<div class="chat-inner">

			<!-- Chat top navigation -->
			<div class="chat-nav">
				<div class="nav-start">
					<div class="recipient-block">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/dan.jpg"
								alt="">
						</div>
						<div class="username">
							<span>Dan Walker</span> <span><i data-feather="star"></i>
								<span>| Online</span></span>
						</div>
					</div>
				</div>
				<div class="nav-end">

					<!-- Settings icon dropdown -->
					<div
						class="dropdown is-spaced is-neutral is-right dropdown-trigger">
						<div>
							<a class="chat-nav-item is-icon"> <i data-feather="settings"></i>
							</a>
						</div>
						<div class="dropdown-menu" role="menu">
							<div class="dropdown-content">
								<a href="#" class="dropdown-item">
									<div class="media">
										<i data-feather="message-square"></i>
										<div class="media-content">
											<h3>Details</h3>
											<small>View this conversation's details.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="settings"></i>
										<div class="media-content">
											<h3>Preferences</h3>
											<small>Define your preferences.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="bell"></i>
										<div class="media-content">
											<h3>Notifications</h3>
											<small>Set notifications settings.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="bell-off"></i>
										<div class="media-content">
											<h3>Silence</h3>
											<small>Disable notifications.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="box"></i>
										<div class="media-content">
											<h3>Archive</h3>
											<small>Archive this conversation.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="trash-2"></i>
										<div class="media-content">
											<h3>Delete</h3>
											<small>Delete this conversation.</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="chat-search">
						<div class="control has-icon">
							<input type="text" class="input" placeholder="Search messages">
							<div class="form-icon">
								<i data-feather="search"></i>
							</div>
						</div>
					</div>
					<a class="chat-nav-item is-icon is-hidden-mobile"> <i
						data-feather="at-sign"></i>
					</a> <a class="chat-nav-item is-icon is-hidden-mobile"> <i
						data-feather="star"></i>
					</a>

					<!-- More dropdown -->
					<div
						class="dropdown is-spaced is-neutral is-right dropdown-trigger">
						<div>
							<a class="chat-nav-item is-icon no-margin"> <i
								data-feather="more-vertical"></i>
							</a>
						</div>
						<div class="dropdown-menu" role="menu">
							<div class="dropdown-content">
								<a href="#" class="dropdown-item">
									<div class="media">
										<i data-feather="file-text"></i>
										<div class="media-content">
											<h3>Files</h3>
											<small>View all your files.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="users"></i>
										<div class="media-content">
											<h3>Users</h3>
											<small>View all users you're talking to.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="gift"></i>
										<div class="media-content">
											<h3>Daily bonus</h3>
											<small>Get your daily bonus.</small>
										</div>
									</div>
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="download-cloud"></i>
										<div class="media-content">
											<h3>Downloads</h3>
											<small>See all your downloads.</small>
										</div>
									</div>
								</a>
								<hr class="dropdown-divider">
								<a class="dropdown-item">
									<div class="media">
										<i data-feather="life-buoy"></i>
										<div class="media-content">
											<h3>Support</h3>
											<small>Reach our support team.</small>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<a class="chat-nav-item is-icon close-chat"> <i
						data-feather="x"></i>
					</a>
				</div>
			</div>
			<!-- Chat sidebar -->
			<div id="chat-sidebar" class="users-sidebar">
				<!-- Header -->
				<div class="header-item">
					<img class="light-image"
						src="resources/template/assets/img/logo/friendkit-bold.svg" alt="">
					<img class="dark-image"
						src="resources/template/assets/img/logo/friendkit-white.svg"
						alt="">
				</div>
				<!-- User list -->
				<div class="conversations-list has-slimscroll-xs">
					<!-- User -->
					<div class="user-item is-active" data-chat-user="dan"
						data-full-name="Dan Walker" data-status="Online">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/dan.jpg"
								alt="">
							<div class="user-status is-online"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="stella"
						data-full-name="Stella Bergmann" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/stella.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="daniel"
						data-full-name="Daniel Wellington" data-status="Away">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
								alt="">
							<div class="user-status is-away"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="david"
						data-full-name="David Kim" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/david.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="edward"
						data-full-name="Edward Mayers" data-status="Online">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
								alt="">
							<div class="user-status is-online"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="elise"
						data-full-name="Elise Walker" data-status="Away">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/elise.jpg"
								alt="">
							<div class="user-status is-away"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="nelly"
						data-full-name="Nelly Schwartz" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/nelly.png"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
					<!-- User -->
					<div class="user-item" data-chat-user="milly"
						data-full-name="Milly Augustine" data-status="Busy">
						<div class="avatar-container">
							<img class="user-avatar"
								src="https://via.placeholder.com/300x300"
								data-demo-src="resources/template/assets/img/avatars/milly.jpg"
								alt="">
							<div class="user-status is-busy"></div>
						</div>
					</div>
				</div>
				<!-- Add Conversation -->
				<div class="footer-item">
					<div class="add-button modal-trigger"
						data-modal="add-conversation-modal">
						<i data-feather="user"></i>
					</div>
				</div>
			</div>

			<!-- Chat body -->
			<div id="chat-body" class="chat-body is-opened">
				<!-- Conversation with Dan -->
				<div id="dan-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:03am</span>
							<div class="message-text">Hi Jenna! I made a new design,
								and i wanted to show it to you.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:03am</span>
							<div class="message-text">It's quite clean and it's
								inspired from Bulkit.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:12am</span>
							<div class="message-text">Oh really??! I want to see that.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/dan.jpg"
							alt="">
						<div class="message-block">
							<span>8:13am</span>
							<div class="message-text">FYI it was done in less than a
								day.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:17am</span>
							<div class="message-text">Great to hear it. Just send me
								the PSD files so i can have a look at it.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:18am</span>
							<div class="message-text">And if you have a prototype, you
								can also send me the link to it.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Stella -->
				<div id="stella-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>10:34am</span>
							<div class="message-text">Hey Stella! Aren't we supposed to
								go the theatre after work?.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>10:37am</span>
							<div class="message-text">Just remembered it.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/stella.jpg"
							alt="">
						<div class="message-block">
							<span>11:22am</span>
							<div class="message-text">Yeah you always do that, forget
								about everything.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Daniel -->
				<div id="daniel-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Yesterday</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>3:24pm</span>
							<div class="message-text">Daniel, Amanda told me about your
								issue, how can I help?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
							alt="">
						<div class="message-block">
							<span>3:42pm</span>
							<div class="message-text">Hey Jenna, thanks for answering
								so quickly. Iam stuck, i need a car.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
							alt="">
						<div class="message-block">
							<span>3:43pm</span>
							<div class="message-text">Can i borrow your car for a quick
								ride to San Fransisco? Iam running behind and there' no train in
								sight.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with David -->
				<div id="david-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>12:34pm</span>
							<div class="message-text">Damn you! Why would you even
								implement this in the game?.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>12:32pm</span>
							<div class="message-text">I just HATE aliens.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:09pm</span>
							<div class="message-text">C'mon, you just gotta learn the
								tricks. You can't expect aliens to behave like humans. I mean
								that's how the mechanics are.</div>
						</div>
					</div>
					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:11pm</span>
							<div class="message-text">I checked the replay and for
								example, you always get supply blocked. That's not the right
								thing to do.</div>
						</div>
					</div>
					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>13:12pm</span>
							<div class="message-text">I know but i struggle when i have
								to decide what to make from larvas.</div>
						</div>
					</div>
					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/david.jpg"
							alt="">
						<div class="message-block">
							<span>13:17pm</span>
							<div class="message-text">Join me in game, i'll show you.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Edward -->
				<div id="edward-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Monday</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>4:55pm</span>
							<div class="message-text">Hey Jenna, what's up?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>4:56pm</span>
							<div class="message-text">Iam coming to LA tomorrow.
								Interested in having lunch?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:21pm</span>
							<div class="message-text">Hey mate, it's been a while. Sure
								I would love to.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>5:27pm</span>
							<div class="message-text">Ok. Let's say i pick you up at
								12:30 at work, works?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:43pm</span>
							<div class="message-text">Yup, that works great.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>5:44pm</span>
							<div class="message-text">And yeah, don't forget to bring
								some of my favourite cheese cake.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
							alt="">
						<div class="message-block">
							<span>5:27pm</span>
							<div class="message-text">No worries</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Edward -->
				<div id="elise-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">September 28</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>11:53am</span>
							<div class="message-text">Elise, i forgot my folder at your
								place yesterday.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>11:53am</span>
							<div class="message-text">I need it badly, it's work stuff.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/elise.jpg"
							alt="">
						<div class="message-block">
							<span>12:19pm</span>
							<div class="message-text">Yeah i noticed. I'll drop it in
								half an hour at your office.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Nelly -->
				<div id="nelly-conversation"
					class="chat-body-inner has-slimscroll is-hidden">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">September 17</span>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:22pm</span>
							<div class="message-text">So you watched the movie?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>8:22pm</span>
							<div class="message-text">Was it scary?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/nelly.png"
							alt="">
						<div class="message-block">
							<span>9:03pm</span>
							<div class="message-text">It was so frightening, i felt my
								heart was about to blow inside my chest.</div>
						</div>
					</div>
				</div>
				<!-- Conversation with Milly -->
				<div id="milly-conversation" class="chat-body-inner has-slimscroll">
					<div class="date-divider">
						<hr class="date-divider-line">
						<span class="date-divider-text">Today</span>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:01pm</span>
							<div class="message-text">Hello Jenna, did you read my
								proposal?</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:01pm</span>
							<div class="message-text">Didn't hear from you since i sent
								it.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:02pm</span>
							<div class="message-text">Hello Milly, Iam really sorry,
								Iam so busy recently, but i had the time to read it.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:04pm</span>
							<div class="message-text">And what did you think about it?</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:05pm</span>
							<div class="message-text">Actually it's quite good, there
								might be some small changes but overall it's great.</div>
						</div>
					</div>

					<div class="chat-message is-sent">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/jenna.png"
							alt="">
						<div class="message-block">
							<span>2:07pm</span>
							<div class="message-text">I think that i can give it to my
								boss at this stage.</div>
						</div>
					</div>

					<div class="chat-message is-received">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="resources/template/assets/img/avatars/milly.jpg"
							alt="">
						<div class="message-block">
							<span>2:09pm</span>
							<div class="message-text">Crossing fingers then</div>
						</div>
					</div>
				</div>
				<!-- Compose message area -->
				<div class="chat-action">
					<div class="chat-action-inner">
						<div class="control">
							<textarea class="textarea comment-textarea" rows="1"></textarea>
							<div
								class="dropdown compose-dropdown is-spaced is-accent is-up dropdown-trigger">
								<div>
									<div class="add-button">
										<div class="button-inner">
											<i data-feather="plus"></i>
										</div>
									</div>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="code"></i>
												<div class="media-content">
													<h3>Code snippet</h3>
													<small>Add and paste a code snippet.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="file-text"></i>
												<div class="media-content">
													<h3>Note</h3>
													<small>Add and paste a note.</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="server"></i>
												<div class="media-content">
													<h3>Remote file</h3>
													<small>Add a file from a remote drive.</small>
												</div>
											</div>
										</a> <a class="dropdown-item">
											<div class="media">
												<i data-feather="monitor"></i>
												<div class="media-content">
													<h3>Local file</h3>
													<small>Add a file from your computer.</small>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div id="chat-panel" class="chat-panel is-opened">
				<div class="panel-inner">
					<div class="panel-header">
						<h3>Details</h3>
						<div class="panel-close">
							<i data-feather="x"></i>
						</div>
					</div>

					<!-- Dan details -->
					<div id="dan-details" class="panel-body is-user-details">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/dan.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Dan Walker</h3>
								<h4>IOS Developer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">WebSmash Inc.</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-school"></i>
									<div class="about-text">
										<span>Studied at</span> <span><a class="is-inverted"
											href="#">Riverdale University</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Stella details -->
					<div id="stella-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/stella.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Stella Bergmann</h3>
								<h4>Shop Owner</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-purple">
									<div>
										<i class="mdi mdi-bomb"></i>
									</div>
								</div>
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-check-decagram"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Trending Fashions</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Oklahoma
												City</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Daniel details -->
					<div id="daniel-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/daniel.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Daniel Wellington</h3>
								<h4>Senior Executive</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-google-cardboard"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-pizza"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-linux"></i>
									</div>
								</div>
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-puzzle"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Peelman & Sons</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Los
												Angeles</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- David details -->
					<div id="david-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/david.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>David Kim</h3>
								<h4>Senior Developer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Frost Entertainment</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Chicago</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Edward details -->
					<div id="edward-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/edward.jpeg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Edward Mayers</h3>
								<h4>Financial analyst</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Brettmann Bank</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Santa
												Fe</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Elise details -->
					<div id="elise-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/elise.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Elise Walker</h3>
								<h4>Social influencer</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Social Media</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">London</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Nelly details -->
					<div id="nelly-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/nelly.png"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Nelly Schwartz</h3>
								<h4>HR Manager</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Carrefour</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Melbourne</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- Milly details -->
					<div id="milly-details"
						class="panel-body is-user-details is-hidden">
						<div class="panel-body-inner">

							<div class="subheader">
								<div class="action-icon">
									<i class="mdi mdi-video"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-camera"></i>
								</div>
								<div class="action-icon">
									<i class="mdi mdi-microphone"></i>
								</div>
								<div
									class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
									<div>
										<div class="action-icon">
											<i class="mdi mdi-dots-vertical"></i>
										</div>
									</div>
									<div class="dropdown-menu" role="menu">
										<div class="dropdown-content">
											<a href="#" class="dropdown-item">
												<div class="media">
													<i data-feather="user"></i>
													<div class="media-content">
														<h3>View profile</h3>
														<small>View this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="mail"></i>
													<div class="media-content">
														<h3>Send message</h3>
														<small>Send a message to the user's inbox.</small>
													</div>
												</div>
											</a>
											<hr class="dropdown-divider">
											<a class="dropdown-item">
												<div class="media">
													<i data-feather="share-2"></i>
													<div class="media-content">
														<h3>Share profile</h3>
														<small>Share this user's profile.</small>
													</div>
												</div>
											</a> <a class="dropdown-item">
												<div class="media">
													<i data-feather="x"></i>
													<div class="media-content">
														<h3>Block user</h3>
														<small>Block this user permanently.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="details-avatar">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="resources/template/assets/img/avatars/milly.jpg"
									alt="">
								<div class="call-me">
									<i class="mdi mdi-phone"></i>
								</div>
							</div>

							<div class="user-meta has-text-centered">
								<h3>Milly Augustine</h3>
								<h4>Sales Manager</h4>
							</div>

							<div class="user-badges">
								<div class="hexagon is-red">
									<div>
										<i class="mdi mdi-heart"></i>
									</div>
								</div>
								<div class="hexagon is-green">
									<div>
										<i class="mdi mdi-dog"></i>
									</div>
								</div>
								<div class="hexagon is-accent">
									<div>
										<i class="mdi mdi-flash"></i>
									</div>
								</div>
								<div class="hexagon is-blue">
									<div>
										<i class="mdi mdi-briefcase"></i>
									</div>
								</div>
							</div>

							<div class="user-about">
								<label>About Me</label>
								<div class="about-block">
									<i class="mdi mdi-domain"></i>
									<div class="about-text">
										<span>Works at</span> <span><a class="is-inverted"
											href="#">Salesforce</a></span>
									</div>
								</div>
								<div class="about-block">
									<i class="mdi mdi-map-marker"></i>
									<div class="about-text">
										<span>From</span> <span><a class="is-inverted" href="#">Seattle</a></span>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="add-conversation-modal"
		class="modal add-conversation-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3>New Conversation</h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body">

					<img src="resources/template/assets/img/icons/chat/bubbles.svg"
						alt="">

					<div class="field is-autocomplete">
						<div class="control has-icon">
							<input type="text" class="input simple-users-autocpl"
								placeholder="Search a user">
							<div class="form-icon">
								<i data-feather="search"></i>
							</div>
						</div>
					</div>

					<div class="help-text">Select a user to start a new
						conversation. You'll be able to add other users later.</div>

					<div class="action has-text-centered">
						<button type="button" class="button is-solid accent-button raised">Start
							conversation</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="explorer-menu">
		<div class="explorer-inner">
			<div class="explorer-container">
				<!--Header-->
				<div class="explorer-header">
					<h3>Explore</h3>
					<div class="control">
						<input type="text" class="input is-rounded is-fade"
							placeholder="Filter">
						<div class="form-icon">
							<i data-feather="filter"></i>
						</div>
					</div>
				</div>
				<!--List-->
				<div class="explore-list has-slimscroll">
					<!--item-->
					<a href="/navbar-v1-feed.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/clover.svg"
						alt="">
						<h4>Feed</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-profile-friends.html" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/friends.svg"
						alt="">
						<h4>Friends</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-videos-home.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/videos.svg"
						alt="">
						<h4>Videos</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-pages-main.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/tag-euro.svg"
						alt="">
						<h4>Pages</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-ecommerce-products.html" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/cart.svg"
						alt="">
						<h4>Commerce</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-groups.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/house.svg" alt="">
						<h4>Interests</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-stories-main.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/chrono.svg"
						alt="">
						<h4>Stories</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-questions-home.html" class="explore-item">
						<img
						src="resources/template/assets/img/icons/explore/question.svg"
						alt="">
						<h4>Questions</h4>
					</a>
					<!--item-->
					<a href="news.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/news.svg" alt="">
						<h4>News</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-groups.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/cake.svg" alt="">
						<h4>Groups</h4>
					</a>
					<!--item-->
					<a href="https://envato.com" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/envato.svg"
						alt="">
						<h4>Envato</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-events.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/calendar.svg"
						alt="">
						<h4>Events</h4>
					</a>
					<!--item-->
					<a href="https://cssninja.io" target="_blank" class="explore-item">
						<img src="resources/template/assets/img/icons/explore/pin.svg"
						alt="">
						<h4>Css Ninja</h4>
					</a>
					<!--item-->
					<a href="/elements.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/idea.svg" alt="">
						<h4>Elements</h4>
					</a>
					<!--item-->
					<a href="/navbar-v1-settings.html" class="explore-item"> <img
						src="resources/template/assets/img/icons/explore/settings.svg"
						alt="">
						<h4>Settings</h4>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="end-tour-modal"
		class="modal end-tour-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3></h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body has-text-centered">

					<div class="image-wrap">
						<img src="resources/template/assets/img/logo/friendkit.svg" alt="">
					</div>

					<h3>That's all folks!</h3>
					<p>Thanks for taking the friendkit tour. There are still tons
						of other features for you to discover!</p>

					<div class="action">
						<a href="/#demos-section"
							class="button is-solid accent-button raised is-fullwidth">Explore</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
 <script>
	feather.replace()
	
	$('select').select2({
		placeholder: '선택하여 주십시오.'
	});
</script> 
</html>