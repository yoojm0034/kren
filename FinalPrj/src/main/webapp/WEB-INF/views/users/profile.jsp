<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<style>
.cover-bg .cover-image {
	max-height: 200px;
}

#map {
	height: 200px;
	width: 100%;
}

.menu-badge {
    height: 30px;
    font-size: 1rem;
    font-weight: 500;
    line-height: 30px;
    text-align: center;
    border-radius: 50%;
    background: #e5e5e5;
    color: #393a4f;
    width: 30px;
    display: inline-block;
}

a[href^="http://maps.google.com/maps"] {
	display: none !important
}

a[href^="https://maps.google.com/maps"] {
	display: none !important
}

.gmnoprint a, .gmnoprint span, .gm-style-cc {
	display: none;
}

.gmnoprint div {
	background: none !important;
}

.cover-bg .avatar .avatar-flag {
	position: absolute;
	bottom: 0;
	left: inherit;
	height: 40px;
	width: 40px;
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

.language_label {
	width: 150px;
	text-align: left;
	font-family: 'Montserrat';
	color: #4a4a4a;
}

.language_label>span {
	letter-spacing: -0.4rem;
}

.profile-subheader .subheader-start, .profile-subheader .subheader-end {
	width: auto;
}

.subheader-end>a {
	font-size: 1rem;
	margin: 0 0.5rem 0 0;
}

.profile-subheader .subheader-start span:nth-child(odd) {
	display: table-cell;
	font-family: "Montserrat", sans-serif;
	text-transform: uppercase;
	font-size: .8rem;
	font-weight: 500;
	color: #999;
}

.profile-subheader .subheader-start span:nth-child(even) {
	display: table-cell;
	font-size: 1.2rem;
	font-family: "Montserrat", sans-serif;
	color: #393a4f;
	padding: 0 1rem 0 0.5rem;
}

.box-heading {
	min-height: 56px;
}

.info-row div {
	display: contents
}

.info {
	font-size: .9rem !important;
	font-weight: 400;
	color: #999 !important;
}
.matched {
	background-color: #5596e6 !important;
	color: #FFF !important;
}

.follow-area a {
	font-size: 1rem !important;
}

.editProfile-area .button{
	font-size: 1rem !important;
}

.tt { 
	position: relative; 
	display: inline-block; 
	border-bottom: 2px dotted Sienna; 
	background-color: yellow; 
} 


.arrow_box {
	display: none;
	position: absolute;
	top: 330px;
    right: 95px;
	padding: 12px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;  
	border-radius: 8px;
	background: #0000001a;
	color: #2a2a2a;
	font-size: 14px;
	z-index: 99;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #0000001a;
  border-width: 10px;
  pointer-events: none;
  content: " ";

}

#btnLetter:hover + p.arrow_box {
  display: block;
}

.fbutton {
	font-family: 'ONE-Mobile-Regular' !important;
	font-size: 1rem !important;
	
}

.activeCnt {
	padding-left: 7px;
    color: #777777;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/assets/css/mainfeed.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/template/assets/js/moment.js"></script>
<script src="resources/template/assets/js/moment-timezone-with-data.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/template/assets/js/diffButty.js"></script>
<script>
$(document).ready(function() {
	initMap();
	//지도 출력
	function initMap() {
		var lat = Number($('#lat2').val());
		var lon = Number($('#lon2').val());
		const city = { lat: lat, lng: lon};
	    const map = new google.maps.Map(document.getElementById("map"), {
	      zoom: 10,
	      center: city,
	      mapTypeControl: false,
	      streetViewControl: false,
	    });
	    const marker = new google.maps.Marker({
	      position: city,
	      map: map,
	    });
    
		// 시간출력
		var date = new Date();
		var a = moment.tz(date, $('#timezone2').val());
		$('#localTime').text(a.format('LT'));

		// 언어 레벨 
		var level = Number($('#language2_level2').val());
		var result = "";
			switch(level) {
			  case 1 : 
			    result = "◼◻◻◻◻";
			    break;
			  case 2 :
				result = "◼◼◻◻◻";
			    break;
			  case 3 : 
				result = "◼◼◼◻◻";
			    break;
			  case 4 : 
				result = "◼◼◼◼◻";
			    break;
			  case 5 :
				result = "◼◼◼◼◼";
			    break;
			}
		$('#level2').text(result);
		};
});

// 팔로잉 리스트 ajax
$(function(){
	$('#followingList').on('click', function (){
		var user_id = $('#user_id2').val();
		$.ajax({
			url: '${pageContext.request.contextPath}/followingList.do',
	    	type:'post',
	    	data:{user_id : user_id},
			success: function(result) {
				$('.profile-contents').html(result);
			}
		});
	});
});

// 팔로워 리스트 ajax
$(function(){
	$('#followerList').on('click', function (){
		var user_id = $('#user_id2').val();
		$.ajax({
			url: '${pageContext.request.contextPath}/followerList.do',
	    	type:'post',
	    	data:{user_id : user_id},
			success: function(result) {
				$('.profile-contents').html(result);
			}
		});
	});
});

function initPic() {
	  if ($("#profile-pic-dz").length) {
		    var myDropzone = new Dropzone("#profile-pic-dz", {
		      maxFilesize: 8,
		      // MB
		      acceptedFiles: ".jpeg,.jpg,.png",
		      clickable: ".upload-button",
		      init: function init() {
		        this.on("error", function (file, message) {
		          console.log(message);
		          this.removeFile(file);
		        });

		        if (this.files[1] != null) {
		          this.removeFile(this.files[0]);
		        }

		        ;
		      },
		      transformFile: function transformFile(file, done) {
		        $('#crop-modal').addClass('is-active'); //pictures = [];
		        // Create the image editor overlay

		        var editor = document.createElement('div');
		        editor.style.position = 'absolute';
		        editor.style.left = 0;
		        editor.style.right = 0;
		        editor.style.top = 0;
		        editor.style.bottom = 0;
		        editor.style.zIndex = 9999;
		        editor.style.backgroundColor = '#fff';
		        document.getElementById('cropper-wrapper').appendChild(editor); // Create confirm button at the top left of the viewport

		        var buttonConfirm = document.createElement('button');
		        buttonConfirm.style.position = 'absolute';
		        buttonConfirm.style.right = '10px';
		        buttonConfirm.style.bottom = '10px';
		        buttonConfirm.style.zIndex = 9999;
		        buttonConfirm.textContent = 'Crop';
		        buttonConfirm.classList.add('button');
		        editor.appendChild(buttonConfirm);
		        buttonConfirm.addEventListener('click', function () {
		          // Get the canvas with image data from Cropper.js
		          var canvas = cropper.getCroppedCanvas({
		            width: 256,
		            height: 256
		          }); // Turn the canvas into a Blob (file object without a name)

		          canvas.toBlob(function (blob) {
		            // Create a new Dropzone file thumbnail
		            myDropzone.createThumbnail(blob, myDropzone.options.thumbnailWidth, myDropzone.options.thumbnailHeight, myDropzone.options.thumbnailMethod, false, function (dataURL) {
		              // Update the Dropzone file thumbnail
		              myDropzone.emit('thumbnail', file, dataURL); // Return the file to Dropzone

		              done(blob); //console.log(blob);
		              //Display image preview

		              var previewReader = new FileReader();

		              previewReader.onload = function (event) {
		                // event.target.result contains base64 encoded image
		                $('#upload-preview').attr('src', blob.dataURL); //Show popover

		                $('.picture-container').webuiPopover({
		                  title: '',
		                  content: 'Your photo is ready to be uploaded. Hit the "Save Changes" button to complete the upload process.',
		                  animation: 'pop',
		                  width: 300,
		                  style: 'inverse',
		                  placement: 'top',
		                  offsetTop: -16
		                }).trigger('click'); //console.log('THIS IS THE BLOB', blob)
		              };

		              previewReader.readAsDataURL(file);
		            });
		            var reader = new FileReader();
		            reader.addEventListener("loadend", function (event) {// put picture in a holding var

		              /*pictures.push({
		                  binaryData: btoa(reader.result),
		                  filePath: file.name,
		                  seoFilename: file.name.substring(0, file.name.lastIndexOf(".")),
		                  titleAttribute: file.name,
		                  altAttribute: file.name,
		                  mimeType: file.type,
		                  isNew: true
		              });*/
		              // accept the file
		              //done();
		              //console.log('THIS IS THE RESULT', reader.result);
		              //console.log('THIS IS THE ARRAY', pictures);
		            }); //reader.readAsBinaryString(file);

		            reader.readAsBinaryString(blob);
		          }); // Remove the editor from the view

		          document.getElementById('cropper-wrapper').removeChild(editor);
		          document.getElementById('crop-modal').classList.remove('is-active');
		        }); // Create an image node for Cropper.js

		        var image = new Image();
		        image.src = URL.createObjectURL(file);
		        editor.appendChild(image); // Create Cropper.js

		        var cropper = new Cropper(image, {
		          aspectRatio: 1
		        });
		      }
		    });
		  }
}

// 프로필 수정 페이지로 이동
$(function(){
	$('#editProfile').on('click', function (){
		var user_id = $('#user_id').val();
		var locale = '${locale}';
		$.ajax({
			url: '${pageContext.request.contextPath}/usersUpdateForm.do',
	    	type:'post',
	    	data:{user_id : user_id, locale: locale},
			success: function(result) {
				$('.editProfile-area').empty();
				$('.editProfile-area').html('<button class="button is-solid primary-button" id="saveBtn">Save</button>');
				$('.photo-upload').empty();
				var img = '<div class="preview">'
						+ '<button class="upload-button dz-clickable" id="photoUpdate">'
						+ '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>'
						+ '</button>'
						+ '<img id="upload-preview" class="avatar-image" src="${pageContext.request.contextPath}/resources/upload/${userPhoto.uuid }" data-demo-src="/FinalPrj/assets/img/avatars/avatar-w.png" alt="">'
						+ '<form id="profile-pic-dz" name="profile-pic-dz" class="dropzone is-hidden" action="/">'
						+ '<div class="dz-default dz-message"><span>Drop files here to upload</span></div></form></div>';
				$('.photo-upload').append(img);
				$('.profile-contents').html(result);
				initPic();
			}
		});
	});
});

//우표 히스토리 페이지로 이동
$(function(){
	$('#myStamp').on('click', function (){
		$.ajax({
			url: '${pageContext.request.contextPath}/myStamp.do',
	    	type:'post',
			success: function(result) {
				$('.profile-contents').html(result);
			}
		});
	});
});



// 팔로우 언팔로우 버튼
$('body').on('click', '#follow-btn',  function() {
	follow(true);
});

$('body').on('click', '#unfollow-btn',  function() {
	follow(false);
});


let followerCnt = ${followerCnt}
function follow(check) {
	var profile_id = $(".fbutton").val();
	var session_id = '${user.user_id}';
	if(check) {
    	$.ajax({
	    	url:'${pageContext.request.contextPath}/follow.do',
	    	type:'post',
	    	data:JSON.stringify({following : profile_id}),
		    contentType : "application/json; charset=UTF-8",
	    	success: function(result) {
	    		console.log("result : " + result);
	    		if(result === "FollowOK") {
	    			$(".follow-area").remove("#follow-btn");
	    			$(".follow-area").html('<button class="button fbutton" id="unfollow-btn" value="${profile.user_id}"><spring:message code="unfollow"/></button>');
	    			followerCnt = followerCnt + 1
	    			$("#followerCnt").html(followerCnt);
	    			// 팔로워 리스트에 그려주기
	    			var sessioninfo = '<div class="card-flex friend-card" id="${user.user_id}">'
	    							+ '<a id="goProfile" href="${pageContext.request.contextPath}/profile.do?user_id=${user.user_id }">'
	    							+ '<div class="img-container">'
	    							+ '<img class="avatar" src="${pageContext.request.contextPath}/resources/upload/${photo.uuid }"> <img class="flag" src="${user.flag }" alt="">'
	    							+ '</div>'
	    							+ '<div class="friend-info">'
	    							+ '<div class="friend-name">${user.name }</div>'
	    							+ '<div class="friend-location">'
	    							+ '<span><svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg></span>'
	    							+ '<span id="friend-city">${user.city}, ${user.country}</span>'
	    							+ '</div></div></a>'
	    							+ '<div class="friend-stats">';
	    			$(".followerList").append(sessioninfo);
	    			sendFollowPush(profile_id);
	    		}
	    	}
		}); // end of follow ajax
	} else {
    	$.ajax({
	    	url:'${pageContext.request.contextPath}/unfollow.do',
	    	type:'post',
	    	data:JSON.stringify({following : profile_id}),
		    contentType : "application/json; charset=UTF-8",
	    	success: function(result) {
	    		console.log("result : " + result);
	    		if(result === "UnFollowOK") {
	    			$(".follow-area").remove("#unfollow-btn");
	    			$(".follow-area").html('<button class="button fbutton" id="follow-btn" value="${profile.user_id}"><spring:message code="follow"/></button>');
	    			followerCnt = followerCnt - 1
	    			$("#followerCnt").html(followerCnt);
	    			// 팔로워 리스트에서 지우기
	    			$('#'+session_id).remove();
	    		}
	    	}
		}); // end of unfollow ajax
	}; // end of if
};

// 새 편지 쓰기
function writePopup() {
	var winWidth = 860;
    var winHeight = 580;
    var popupOption= "width="+winWidth+", height="+winHeight;
	
	var target ='pop';
	var url = '${pageContext.request.contextPath}/writeLetter.do';
	window.open('',target,popupOption);

	var letterform = document.letterform;
	letterform.action=url;
	letterform.target=target;
	letterform.submit();	
}
</script>

<!-- 여기서부터 피드기능 하는 js -->
<script>
function loadMore(){
	 //-------load more-------
	  var increment=5;	//---5개씩추가----- 
	  var startFilter=0;
	  var endFilter=increment;
	  var $this = $('.feedContents');						
	  var elementLength = $this.children('#feed-post-1').length;

	  if (elementLength > 5) { 
		  $('#buttonToogle').show();
	  }else{
		  $('#buttonToogle').hide();
	  }
	  $('.feedContents #feed-post-1').slice(startFilter, endFilter).addClass('shown');
	  $('.feedContents #feed-post-1').not('.shown').hide();
	  $('body').off('click','.load-more-button');
	  
	  $('body').on('click','.load-more-button',function() {
	  	if (elementLength > endFilter) {
		      startFilter += increment;
		      endFilter += increment;
		      $('.feedContents #feed-post-1').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
		      $('.shownLength').text((endFilter > elementLength) ? elementLength : endFilter);
		      if (elementLength <= endFilter) {
		          $(this).remove();
		      }
		}
	  });
	} 
	

//-------좋아요--------
function likeIt(feedId,userId){
	var span = $('#recCnt'+feedId);
	var myId= '${user.user_id}';
	$.ajax({
		url:"${pageContext.request.contextPath}/likeCnt.do",
		type:"POST",
		data:{feed_id:feedId},
		dataType:"JSON",
		success:function(data){
			var count=data.length;	//새로운 카운트 
			var chk=0;				
           	$.each(data, function(idx, val) {
           		if('${user.user_id}' == val.user_id){
           			chk = 1; 
           		}
          	});
			if(chk){
				alert('좋아요!');
				if(userId != myId ){
					sendLikePush(userId,feedId);						
				}
			}else{
				alert('좋아요 취소');				
			}
				span.empty();
				span.append(count);
		},
		error:function(err){
			console.log(err);
		}
	}) 
}; 

//-------번역---------
function trans(id, text){
	var div = $("#tdiv"+id);			//div ID
	var lan = div.next().attr('id');	//content

 	$.ajax({
		url:"${pageContext.request.contextPath}/transContent.do",
		type:"GET",
		data:{	korean: text,
				write_lan: lan},
		success:function(v){
			var json = JSON.parse(v);
			var transval = json.message.result.translatedText;

			if(div.children().length){
				return;
			}else{
				div.append($('<p/>').html(transval));
			}
		},
		error:function(err){
			console.log(err);
		}
	});  
};


function feedUpdate(feedId){
	$('.app-overlay').addClass('is-active');
	$('.is-new-content').addClass('is-highlighted');
	$('#publish').focus();
	
	var tags = $('#update'+feedId).find('#update-tag').val();
	var content = $('#update'+feedId).find('#update-content').val();
	var photo = $('#update'+feedId).find('#update-photo').val(); 
	var fphoto = $('#update'+feedId).find('#update-fphoto').val(); 
	var retag = tags.replace(/,/g, "#");	
	var photoChk = $('#photoChk');	//사진 수정시 체크 여부 
	
	$('#feedid').val(feedId);	
	$('#publish').val(content);
	document.getElementById('photo').value = fphoto;
	
	if(retag != ""){
		var afterStr = retag.split('#');
		for(var i=0; i < afterStr.length; i++){
			$('#append_tag').append("<a class='deleteTag'>#"+afterStr[i]+"</a>");
		}	
	}
	
	if(photo != ""){	
	  var deleteIcon = feather.icons.x.toSvg();
	  var template = "\n                <div class=\"upload-wrap\">\n                    <img src=/FinalPrj/resources/upload/" + photo + " alt=\"\">\n                    <span class=\"remove-file\">\n                        " + deleteIcon + "\n                    </span>\n                </div>\n            ";
	  $('#feed-upload').append(template);

	}

  	$('.remove-file').on('click', function () {
         $(this).closest('.upload-wrap').remove();
         photoChk.val(1);
  	});
    
    $('.deleteTag').on('click', function () {
        $( this ).remove(); 
    });
}

$(function(){
loadMore();
//-------피드 등록---------
$('#publish-button').on('click', function(){
	var feedId = $('#feedid').val();
	var tagval = $('#append_tag').text();
	if(tagval == ""){
	}else{
		tagval= tagval.replace("#","");
		tagval= tagval.replace(/#/g,",");
	}
	document.getElementById('tags').value = tagval;		
	//피드작성스탬프지급
	if(feedId ==""){
	$.ajax({
		url:"${pageContext.request.contextPath}/stamphFeedChk.do",
		type:"POST",
		success:function(v){
			if(v==0){
				alert('<spring:message code="feed.feed.stamp"/>');				
			}
			$('#feedInsert').submit();		
		},
		error:function(err){
			console.log(err);
		}
	});
	}else{
		$('#feedInsert').submit();	
	}
});

//-------피드 Reset---------
$('.close-publish').on('click',function(){
	$('#publish').val('');
	$('#append_tag').text('');
	$('#photoChk').val('');
	$('#feed-upload').empty();
	$('#feedid').val('');
});  

//-------태그등록---------
document.getElementById("activities-autocpl").onkeypress = function() {tagFunction()};
function tagFunction() {
  var div= $('#append_tag');
  if(event.keyCode==13){
      var tagval = $('#activities-autocpl').val();
      if(!tagval) {
        alert('<spring:message code="feed.insert.tag"/>');
     }else{
    	 
		if(div.children().length == 5){
			return;
		}else{
			div.append('<span class="tagDelete">#' + tagval+ ' </span>');
		}
        	$('#activities-autocpl').val('');
        $.ajax({
           url: "tagInsert.do" ,
           type: "POST",
           data:{ tag_name : tagval } ,
           success: function(data){
           },
           error: function(err){
           }
        }); 
     }
  }else if(event.keyCode==35){
     event.preventDefault();
     event.returnValue = false;
  }else if(event.keyCode==44){
     event.preventDefault();
     event.returnValue = false;
  }
  
 $('.tagDelete').on('click', function () {
     $( this ).remove(); 
 });
}


//-------프로필클릭시---------
$('.user-info').on('click',function(){
	var userId= this.id;
	location.href="${pageContext.request.contextPath}/profile.do?user_id="+userId
});

$('.delFeed').on('click',function(){
	var feedId= this.id;
	if(confirm('<spring:message code="feed.confirm.delete"/>')){
	location.href='${pageContext.request.contextPath}/feedDelete.do?feed_id='+feedId			
	}
})

});

$(function(){
	//-------태그자동완성---------
	if ($('#activities-autocpl').length) {
		var data1 = $(this);
	    var html = '';
	    var activitiesOptions = {
	      url: "${pageContext.request.contextPath}/autocpl.do",
	      getValue: "tag_name",
		      template: {
	        type: "custom",
	        method: function method(value) {
	          return "<div class=" + 'template-wrapper' + "><div class=" + 'avatar-wrapper' + ">" + "</div><div class=" + 'entry-text' + ">#" + value + "<br>" + "</div></div>";
	        }
	      }, 
	      highlightPhrase: false,
	      list: {
	        maxNumberOfElements: 5,
	        showAnimation: {
	          type: "slide",
	          time: 400,
	          callback: function callback() {}
	        },
	        match: {
	          enabled: true
	        }
	      }
	    };
	    $('#activities-autocpl').easyAutocomplete(activitiesOptions);
	 };
	 

	//-------태그검색---------
	$('#searchTag').on('click',function(){
		  	var input = $('#tagInput').attr("class");
		  	if(input=="input is-hidden"){
		  		$('#tagInput').removeClass('is-hidden').addClass('is-active');
		  	}else{
		  		$('#tagInput').removeClass('is-active').addClass('is-hidden');
		  	}
		  	
		    $(document).click(function (e) {
		        var target = e.target.id;
	
  		        if (target != 'searchTag' && target != 'tagInput') {
		    	  $('#tagInput').removeClass('is-active').addClass('is-hidden');
		        }  
		      });
		    
			if ($('#tagInput').length) {
			    var html = '';
			    var activitiesOptions = {
			      url: "${pageContext.request.contextPath}/autocpl.do",
			      getValue: "tag_name",
		 	      template: {
			        type: "custom",
			        method: function method(value) {
			          return "<div class=" + 'template-wrapper' + "><div class=" + 'avatar-wrapper' + ">" + "</div><div class=" + 'entry-text' + ">#" + value + "<br>" + "</div></div>";
			        }
			      }, 
			      highlightPhrase: false,
			      list: {
			        maxNumberOfElements: 5,
			        showAnimation: {
							          type: "slide",
							          time: 400,
							          callback: function callback() {}
			        },
			        match: {
			          enabled: true
			        }
			      }
			    }
			    $("#tagInput").easyAutocomplete(activitiesOptions);
			  };
			  
			document.getElementById("tagInput").onkeypress = function() {tagsFunction()};
			function tagsFunction() {
				if(event.keyCode==13){
			    	var tagval=$('#tagInput').val();
			    	if(!tagval) {
						alert('<spring:message code="feed.insert.tag"/>');
					}else{
						$.ajax({
							url:"${pageContext.request.contextPath}/feedSelect.do",
							data:{tags : tagval },
							success:function(result){
								$('.feedContents').html(result);
								datePosdst();
								loadMore();
								initPostComments();
								dateCmt();
								$('.load-more-wrap.narrow-top.has-text-centered').addClass('is-hidden');
								$("div[id^='load_'").each(function(i, el){
									var cid = $(this).data('cid');//cc_id.line
									var cdc = $(this).data('cdc');//content
									var cdo = $(this).data('cdo');//origin
									test_diff(cid,cdc,cdo);
								});
							},
							error:function(err){
								console.log(err);
							}
						});
					}
				}
			};
	});
	
	//-------태그라벨---------
	$('body').on('click','.tag-label',function(){
		var tagName = this.id;
		$.ajax({
			url:"${pageContext.request.contextPath}/feedSelect.do" ,
			data:{tags : tagName},
			success:function(result){
				$('.feedContents').html(result);
				datePosdst();
				loadMore();
				initPostComments();
				dateCmt();
				$("div[id^='load_'").each(function(i, el){
					var cid = $(this).data('cid');//cc_id.line
					var cdc = $(this).data('cdc');//content
					var cdo = $(this).data('cdo');//origin
					test_diff(cid,cdc,cdo);
				});
			},
			error:function(err){
				console.log(err);
			}
		});
	});
	
	//---------피드신고---------
	$('body').on('click','#frbtn',function(){
		$('.reportMenu').toggle();
	}); 
	
	$('body').on('click','#fmsg',function(){
		var select = $(this);
		var repo = select.attr('name');
		var msg = $("input:radio[name='"+repo+"']:checked").val();
		if(msg == '기타') {
			$('input[data-rftxt="'+repo+'"]').attr('hidden',false);				
		}else{
			$('input[data-rftxt="'+repo+'"]').attr('hidden',true);				
		}
	});
		
	$('body').on('click','#report-btn',function(){
		var report = $(this).data('report2');	//name 
		var repo = $(this).data('repo2')			//feed_id
		var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
		var txt = "";
		var chk = $("input:checkbox[data-rfchk='"+repo+"']:checked").val(); //체크된값
		
		if(radio == '기타') {
			txt = $('input[data-rftxt="'+repo+'"]').val();//기타사유
			if(txt=='') {
				alert('<spring:message code="feed.report.blank"/>');
				return;
			}
		} else {
			txt = radio;
		}
		if(txt == null) {//값이 선택되지 않았으면
			alert('<spring:message code="feed.report.text.empty"/>');
			return;
		} 
		
		if(confirm('<spring:message code="feed.confirm.report"/>')) {
			$.ajax({//신고 여부 확인
				url:'${pageContext.request.contextPath}/reportUserCheck.do',
				type:'post',
				data:{content:repo,user_id:'${user.user_id}'},
				success: function(cnt) {
					if(cnt == 0) {
						$.ajax({
							url:'${pageContext.request.contextPath}/reportInsert.do',
							type:'post',
							data:JSON.stringify({
								user_id:'${user.user_id}',	//신고자
								content:repo,				//피드아이디
								msg:txt,					//신고냐용
								reported:report,			//신고당한자
								blocked:chk					//블락체크여부
							}),
							contentType : "application/json; charset=UTF-8",
							success: function(data) {
								alert('<spring:message code="feed.report.success"/>');
							},
							error: function(err) {
								alert('<spring:message code="feed.alert.errormsg"/>');
							}
						});
					} else {
						alert('<spring:message code="feed.report.did"/>');
					}
				},
				error: function(e) {
					alert('<spring:message code="feed.alert.errormsg"/>');
				}
			});//$.ajax신고 여부 확인
		}
	});//버튼을 누르면
	})
		//-------댓글-------- 
		$(function() {
			//-------댓글작성 그룹이벤트-------- 		
			$('body').on('click','#post', function() {
				var feedid = $(this).data('feedid');
				var feeduser = $(this).data('feeduser');
				var scr = $(this).data('scr');//status.index
				var content = $('textarea[data-content="'+feedid+'"]').val();
				var scroll = $('div[data-scroll="'+scr+'"]');
				var span2 = $('span[data-minicmt="'+scr+'"]');
				if(content == "") {
					alert('<spring:message code="comment.alert.blank"/>');
					return ;
				}
				//-------댓글입력-------
				$.ajax({
					url: '${pageContext.request.contextPath}/commentInsert.do',
					method: 'post',
					data: JSON.stringify({
						feed_id:feedid,
						content:content,
						user_id:'${user.user_id}'
					}),
					contentType:'application/json; charset=UTF-8',
					success: function() {
						alert('<spring:message code="comment.send.success"/>');
						//입력된 값 조회 후 jsp
						$.ajax({
							url: '${pageContext.request.contextPath}/commentInsertData.do',
							method: 'post',
							data: {feed_id:feedid,user_id:'${user.user_id}',name:'${user.name}',idx:scr},
							success: function(data) {
								scroll.append(data);
								scroll.scrollTop(scroll.prop('scrollHeight'));
								$('textarea[data-content="'+feedid+'"]').val('');
								//-------댓글수+1-------
								$.ajax({
									url: '${pageContext.request.contextPath}/commentCnt.do',
									method: 'post',
									data: {feed_id:feedid},
									success: function(cnt) {
										var cnt = cnt;
										console.log(cnt);
										$('div[data-card="'+scr+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
										span2.html(cnt);
										if(feeduser != '${user.user_id}') {//작성자가 내가 아니라면 알림주기
											sendTextPush(feeduser, feedid);										
										}
									}
								});//댓글수+1
							}
						});
					},
					error: function() {
						alert('<spring:message code="comment.send.fail"/>');
					}
				});//댓글입력

			});//#post
			
			//-------댓글삭제 그룹이벤트-------- 		
			$('body').on('click','#del', function() {
				var delcmt = $(this).data('delcmt');
				var delcmtfeed = $(this).data('delcmtfeed');
				var delidx = $(this).data('idx');
				var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent().parent();
				var span = $('span[data-minicmt="'+delidx+'"]');
				//-------댓글삭제-------
				if(confirm('<spring:message code="comment.confirm.delete"/>')) {
					$.ajax({
						url: '${pageContext.request.contextPath}/commentDelete.do',
						method: 'post',
						data: JSON.stringify({comment_id:delcmt}),
						contentType:'application/json; charset=UTF-8',
						success: function(data) {
							del.remove();
							//-------댓글수-1-------
							$.ajax({
								url: '${pageContext.request.contextPath}/commentCnt.do',
								method: 'post',
								data: {feed_id:delcmtfeed},
								success: function(cnt) {
									var cnt = cnt;
									$('div[data-card="'+delidx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
									span.html(cnt);
								}
							});
						},
						error: function(e) {
							alert('<spring:message code="comment.delete.fail"/>');
						}
					});
				}		
			});
			
		});//end $function
		
	//--------신고START--------------------------------
		$(function() {
			
		$('body').on('click','#fr-btn', function() { // 신고버튼을 누르면
			var report = $(this).data('report');//name
			var repo = $(this).data('repo'); 	//comment_id
			
			var sub = $('button[data-report="'+repo+'"]'); //해당버튼 
			var radio = $("input:radio[name='"+repo+"']:checked").val(); //선택된값
			var txt = "";
			if(radio == '기타') {
				txt = $('input[data-rtxt="'+repo+'"]').val();//기타사유
				if(txt=='') {
					alert('<spring:message code="comment.report.text.empty"/>');
					return;
				}
			} else {
				txt = radio;
			}
			if(txt == null) {//값이 선택되지 않았으면
				alert('<spring:message code="comment.report.blank"/>');
				return;
			}
			var chk = $("input:checkbox[data-rchk='"+repo+"']:checked").val(); //체크된값
			console.log(report, repo, radio, chk, txt);
			
			
			if(confirm('<spring:message code="comment.confirm.report"/>')) {
				$.ajax({//신고 여부 확인
					url:'${pageContext.request.contextPath}/reportUserCheck.do',
					type:'post',
					data:{content:repo,user_id:'${user.user_id}'},
					success: function(cnt) {
						if(cnt == 0) {
							$.ajax({
								url:'${pageContext.request.contextPath}/reportInsert.do',
								type:'post',
								data:JSON.stringify({
									user_id:'${user.user_id}',
									content:repo,
									msg:txt,
									reported:report,
									blocked:chk
								}),
								contentType : "application/json; charset=UTF-8",
								success: function(data) {
									alert('<spring:message code="comment.report.success"/>');
								},
								error: function(err) {
									alert('<spring:message code="comment.alert.errormsg"/>');
								}
							});
					 } else {
							alert('<spring:message code="letter.report.did"/>');
						}
					},
					error: function(e) {
						alert('<spring:message code="comment.alert.errormsg"/>');
					}
				});//$.ajax신고 여부 확인
			}
		});//신고버튼을 누르면
		
		$('body').on('click','#msg', function() { //기타를 누르면 값을 입력할 수 있도록
			var select = $(this);
			var repo = select.attr('name');
			console.log(repo);
			var msg = $("input:radio[name='"+repo+"']:checked").val();
			if(msg == '기타') {
				$('input[data-rtxt="'+repo+'"]').attr('hidden',false);				
			} else {
				$('input[data-rtxt="'+repo+'"]').attr('hidden',true);				
			}
		});	
	}); //$function
	//--------신고END----------------------------------------
	//--------교정START--------------------------------------
		$(function() {
			$("div[id^='load_'").each(function(i, el){
				var cid = $(this).data('cid');//cc_id.line
				var cdc = $(this).data('cdc');//content
				var cdo = $(this).data('cdo');//origin
				test_diff(cid,cdc,cdo);
			});
			
			// 문자열 비교; diffButty.js; String
			function test_diff(cid,dif,ori) {
				var original = ori;
				var revised = dif;
				var output = $('<pre>');
				var html = diffButty(original, revised);
				output.html(html);
				var div = $('div[data-cid="'+cid+'"]');
				div.html(output);
			} 
			
			// 교정테이블 추가 그룹 이벤트
			$("body").on('click', '#feedcor',  function() {
			    var fid = $(this).data('fid');		//feed_id;
			    var fidx = $(this).data('fidx');	//status.index;
			    var fuser = $(this).data('fuser');	//feed_user_id;
			    var a = $('div[data-fidx="'+fidx+'"]');
			    add(fid, fidx, fuser);
			    a.remove();
			});
			
			// 전송버튼을 누르면 교정문장 전달
			$("body").on('click', '#frmBtn',  function() {
			    var num = $(this).data('num');			//row
			    var frmbtn = $(this).data('frmbtn');	//idx
			    var fd = $(this).data('fd');	//feed_id
			    var fu = $(this).data('fu');	//feed_user_id
			    commentc(num, frmbtn, fd, fu);
			});
			
			//-------교정댓글삭제 그룹이벤트-------- 		
			$('body').on('click','#cdel', function() {
				var delcmt = $(this).data('delcmt');
				var delcmtfeed = $(this).data('delcmtfeed');
				var delidx = $(this).data('idx');
				var del = $('a[data-delcmt="'+delcmt+'"]').parent().parent().parent().parent().parent();
				var span = $('span[data-minicmt="'+delidx+'"]');
				//-------댓글삭제-------
				if(confirm('<spring:message code="comment.confirm.delete"/>')) {
					$.ajax({
						url: '${pageContext.request.contextPath}/commentcDelete.do',
						method: 'post',
						data: {cc_id:delcmt},
						success: function(data) {
							del.remove();
							//-------댓글수-1-------
							$.ajax({
								url: '${pageContext.request.contextPath}/commentCnt.do',
								method: 'post',
								data: {feed_id:delcmtfeed},
								success: function(cnt) {
									var cnt = cnt;
									$('div[data-card="'+delidx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
									span.html(cnt);
								}
							});
						},
						error: function(e) {
							alert('<spring:message code="comment.delete.fail"/>');
						}
					});
				}		
			});
			
		});
		
		//----------교정테이블 추가------------------------------
		function add(fid, fidx, fuser) {
			var p = $('#tdiv'+fid).prev().text();//내용
			
		    var result = p.split(".");
		    console.log(result);

		    var div = $('div[data-table="'+fidx+'"]');//표가 그려질 영역
			var tbl = $('<table id="correcting-table">');

	 		// 교정 테이블 출력
			var num = 0;
			for(var i=0; i < result.length; i++) {
				if(result[i].length != 0) { // 리스트가 비어있지않으면
					num = i;
					var tr = $('<tr>');
					tr.append($('<td data-cont="'+i+'">').append(result[i]));
					tr.append($('<td>').append($('<textarea id="correcting" data-corr="'+i+'">').val(result[i])));
					tbl.append(tr);			
				}
			}
			var tr2 = $('<tr>');
			var col = $('<td colspan="2" align="right">');
			var submit = $('<button type="button" class="button" id="frmBtn" data-fd="'+fid+'" data-fu="'+fuser+'" data-num="'+num+'" data-frmbtn="'+fidx+'">').text('<spring:message code="comment.btn.send"/>');
			col.append(submit);
			tr2.append(col);
			tbl.append(tr2)
			div.append(tbl);
		} //function add
		
		function commentc(row, idx, fid, fuser) {
		    var corr = ""; // 교정문장
		    var cont = ""; // 원문장
			for (var i=0; i <= row; i++) {
				if(i == row) {
					corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "");
					cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "");
				} else {
					corr += $('textarea[data-corr="'+i+'"]').val().replace(/,/g, "")+".,";
					cont += $('td[data-cont="'+i+'"]').text().replace(/,/g, "")+".,";
				}
			}
			
			var rows = ""; // 행숫자만큼 숫자를 리스트에 담아줌
			var feed = "";
			for(var i=0; i<=row; i++) {
				if(i != row) {
					rows += i +",";	
					feed += fid+",";	
				} else {
					rows += i;
					feed += fid;
				}
			}
			
			var Data = {
				"feed_id":feed,
				"line":rows,
				"origin":cont,
				"content":corr
			};
			
			$.ajax({//commentC
				url:"${pageContext.request.contextPath}/commentcInsert.do",
				type:"post",
			    data: {"feed_id":fid,"user_id":'${user.user_id}'},
				success:function(data){
					$.ajax({//commentD
						url:"${pageContext.request.contextPath}/insertCommentDetail.do",
			 			type:"post",
			 		    traditional:true,
			 		    data: JSON.stringify(Data),
			 		    contentType : "application/json; charset=UTF-8",
			 			success:function(r){
			 				alert('<spring:message code="comment.send.success"/>');
			 				$('div[data-table="'+idx+'"]').remove();//교정테이블 삭제
							//입력된 값 조회 후 jsp
							$.ajax({
								url: '${pageContext.request.contextPath}/commentDetailData.do',
								method: 'post',
								data: {feed_id:fid,user_id:'${user.user_id}',name:'${user.name}',idx:idx},
								success: function(data) {
									console.log(data);
									$('div[data-crap="'+idx+'"]').addClass('is-hidden').removeClass('is-active');
									$('div[data-card="'+idx+'"]').parent().addClass('is-active').removeClass('is-hidden');
									var scroll = $('div[data-scroll="'+idx+'"]');
									scroll.append(data);
									scroll.scrollTop(scroll.prop('scrollHeight'));
									
									//-------댓글수+1-------
									$.ajax({
										url: '${pageContext.request.contextPath}/commentCnt.do',
										method: 'post',
										data: {feed_id:fid},
										success: function(cnt) {
											var cnt = cnt;
											console.log(cnt);
											$('div[data-card="'+idx+'"]').children().eq(0).html('<spring:message code="comment.h4.title"/>'+' ('+cnt+')');
											var span2 = $('span[data-minicmt="'+idx+'"]');
											span2.html(cnt);
											if(feeduser != '${user.user_id}') {//작성자가 내가 아니라면 알림주기
												sendTextPush(feeduser, feedid);										
											}
										}
									});//댓글수+1
								}
							});
			 			},error:function(e){
			 				alert('<spring:message code="comment.send.fail"/>');
			 			}
					});
				},error:function(e){
	 				alert('<spring:message code="comment.alert.errormsg"/>');
				}
				
			});
		} //function commentc

	//--------교정END----------------------------------------
</script>
<body>
<form id="letterform" name="letterform" method="post">
<input type="hidden" id="to_id" name="to_id" value="${profile.user_id }">
<input type="hidden" id="user_id" value="${user.user_id }">
<input type="hidden" id="to_name" name="to_name" value="${profile.name }">
<input type="hidden" id="name" name="name" value="${user.name }">
</form>
	<!-- Container -->
	<div class="container is-custom">
		<!-- Profile page main wrapper -->
		<div id="profile-main" class="view-wrap is-headless">
			<div class="columns is-multiline no-margin">
				<!-- Left side column -->
				<div class="column is-paddingless">
					<!-- Timeline Header -->
					<!-- html/partials/pages/profile/timeline/timeline-header.html -->
					<div class="cover-bg">
						<div id="map"></div>
						<div class="location-info is-hidden-mobile">
							<span>${profile.city }, ${profile.country }&nbsp;</span><span
								id="localTime"></span>
						</div>
						<input type="text" id="lat2" value="${profile.lat }" hidden="hidden" /> 
						<input type="text" id="lon2" value="${profile.lon }" hidden="hidden" /> 
						<input type="text" id="timezone2" value="${profile.timezone }" hidden="hidden" />
						<input type="text" id="language2_level2" value="${profile.language2_level }" hidden="hidden" /> 
						<input type="text" id="user_id2" value="${profile.user_id }" hidden="hidden" />
						<script async
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
						<div class="avatar">
							<div class="photo-upload">
								<div class="preview">
									<img id="upload-preview" class="avatar-image"
										src="${pageContext.request.contextPath}/resources/upload/${userPhoto.uuid }">
								</div>
							</div>
							<div class="avatar-flag">
								<img src="${profile.flag}">
							</div>
							
						</div>
					</div>
					<div class="box-heading"
						style="display: block; margin-bottom: 15px;">
						<div class="profile-menu is-hidden-mobile"
							style="min-height: 43px;">
							<div class="menu-start">
								<c:if test="${user.user_id eq profile.user_id }">
									<a id="myStamp"
										style="color: #999 !important; font-size: 0.85rem;"> <img
										src="resources/template/assets/img/logo/stamp.png"
										style="width: 35px; vertical-align: middle">
										<span style="margin:0 5px 0 5px"><spring:message code="profile.mystamp"/></span>
										<span class="menu-badge">${profile.stamp }</span>
									</a>
								</c:if>
							</div>
						</div>
						<div class="profile-subheader">
							<div class="subheader-start is-hidden-mobile"
								style="display: table">
								<span>Post</span> <span>${postCnt }</span> <a id="followingList">
									<span>Following</span> <span id="followingCnt">${followingCnt }</span>
								</a> <a id="followerList"> <span>Followers</span> <span
									id="followerCnt">${followerCnt }</span>
								</a>
							</div>
							<div class="subheader-middle"
								style="position: absolute; left: 50%; transform: translate(-50%);">
								<a href="profile.do?user_id=${profile.user_id }"><h2>${profile.name}</h2></a>
							</div>
							<div class="subheader-end is-hidden-mobile" style="display: flex">
								<div class="language_label">
									<div>${profile.language1}&nbsp;&nbsp;⇆&nbsp;&nbsp;${profile.language2 }</div>
									<span>◼◼◼◼◼</span>&nbsp;&nbsp; <span id="level2"></span>
								</div>
								<c:choose>
									<c:when test="${user.user_id eq profile.user_id }">
										<div class="editProfile-area">
										<a class="button is-solid primary-button" id="editProfile"><spring:message code="profile.edit"/></a>
										</div>
									</c:when>
									<c:otherwise>
										<a class="button is-solid primary-button" id="btnLetter" onclick="writePopup()"><spring:message code="profile.letter"/></a>
										<c:set var="letterDistance" value="${time.distance }"/>
										<c:choose>
											<c:when test="${letterDistance < 300 }">
												<c:set var="letterTime" value="1"/>
											</c:when>
											<c:when test="${letterDistance < 2000 }">
												<c:set var="letterTime" value="4"/>
											</c:when>
											<c:when test="${letterDistance < 4000 }">
												<c:set var="letterTime" value="8"/>
											</c:when>
											<c:when test="${letterDistance < 6000 }">
												<c:set var="letterTime" value="12"/>
											</c:when>
											<c:when test="${letterDistance < 8000 }">
												<c:set var="letterTime" value="16"/>
											</c:when>
											<c:when test="${letterDistance < 10000 }">
												<c:set var="letterTime" value="20"/>
											</c:when>
											<c:otherwise>
												<c:set var="letterTime" value="24"/>
											</c:otherwise>
										</c:choose>
										<p class="arrow_box"><spring:message code="profile.time" arguments="${letterTime }"/></p>
										<div class="follow-area">
											<c:choose>
												<c:when test="${followCheck > 0}">
													<button class="button fbutton" id="unfollow-btn" value="${profile.user_id }"><spring:message code="unfollow"/></button>
												</c:when>
												<c:otherwise>
													<button class="button fbutton" id="follow-btn" value="${profile.user_id }"><spring:message code="follow"/></button>
												</c:otherwise>
											</c:choose>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="columns profile-contents">
				<div id="profile-timeline-widgets" class="column is-5">

					<!-- Basic Infos widget -->
					<!-- html/partials/pages/profile/timeline/widgets/basic-infos-widget.html -->
					<div class="box-heading">
						<h4><spring:message code="profile.basicinfos"/></h4>
					</div>

					<div class="basic-infos-wrapper">
						<div class="card is-profile-info">
							<div class="info-row">
								<div>
									<span><spring:message code="profile.regdt"/></span>
									<span class="info"><fmt:formatDate
											value="${profile.reg_date }" pattern="YYYY/MM/dd" /></span>
								</div>
							</div>
							<div class="info-row">
								<div>
									<span><spring:message code="profile.editdt"/></span>
									<span class="info"><fmt:formatDate
											value="${profile.edit_dt }" pattern="YYYY/MM/dd" /></span>
								</div>
							</div>
							<div class="info-row">
								<div>
									<span><spring:message code="profile.birth"/></span> 
									<span class="info"><fmt:formatDate
											value="${profile.birth }" pattern="YYYY/MM/dd" /></span>
								</div>
							</div>
							<div class="info-row">
								<div>
									<span><spring:message code="profile.gender"/></span> 
									<span class="info"> 
									<c:if test="${profile.gender eq 'M'}"><spring:message code="gender.male"/></c:if> 
									<c:if test="${profile.gender eq 'W'}"><spring:message code="gender.female"/></c:if> 
									<c:if test="${profile.gender eq 'O'}"><spring:message code="gender.other"/></c:if>
									</span>
								</div>
							</div>
							<div class="info-row" style="display: block">
								<div>
									<h4><spring:message code="profile.aboutme"/></h4>
									<span class="info" style="color: #6d6d6d !important; word-wrap:break-word; white-space: pre-line;">${profile.profile }</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 관심사 -->
					<div class="box-heading">
						<h4><spring:message code="topic"/></h4>
					</div>
					<div class="friend-cards-list">
						<div class="card is-friend-card">
							<div class="friend-item">
								<div class="text-content">
									<c:choose>
										<c:when test="${user.user_id eq profile.user_id }">
											<c:forEach items="${mytopic }" var="vo">
												<c:if test="${locale eq 'kr'}">
													<span class="label-round">${vo.kr }</span>
												</c:if>
												<c:if test="${locale eq 'en'}">
													<span class="label-round">${vo.en }</span>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:set var="userTopic" value="${user.topic}," />
											<c:forEach items="${mytopic }" var="vo">
												<c:set var="topic" value="${vo.topic_id }," />
												<c:if test="${locale eq 'kr'}">
												<span
													class="label-round <c:if test='${fn:contains(userTopic,topic)}'>matched</c:if>">${vo.kr }</span>
												</c:if>
												<c:if test="${locale eq 'en'}">
												<span
													class="label-round <c:if test='${fn:contains(userTopic,topic)}'>matched</c:if>">${vo.en }</span>
												</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<!-- Trips widget -->
					<!-- html/partials/pages/profile/timeline/widgets/trips-widget.html -->
					<div class="box-heading">
						<h4><spring:message code="profile.trips"/></h4>
					</div>

					<div class="trip-cards-list">
						<div class="card is-trip-card">
							<div class="trip-item">
								<div class="text-content">
									<c:forEach items="${mytrip }" var="vo">
										<span class="label-round">${vo.visited }</span>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!---------------------피드영역--------------------------->
				<div class="column is-7">
					<div id="profile-timeline-posts" class="box-heading">
						<h4><spring:message code="profile.posts"/></h4>
					</div>
					
					<!-- 본인의 피드라면 게시글 작성, 수정 -->
					
					<form action="feedInsert.do" id="feedInsert" method="post" enctype="multipart/form-data">
							<input type="hidden" id="tags" name="tags"> <input
								type="hidden" id="feedid" name="feedid"> <input
								type="hidden" id="photo" name="photo"> <input
								type="hidden" id="photoChk" name="photoChk">
							<!-- Publishing Area -->
							<!-- /partials/pages/feed/compose-card.html -->
							<div id="compose-card" class="card is-new-content <c:if test='${profile.user_id ne user.user_id}'>is-hidden</c:if>" style="margin-top: 10px;">
								<!-- Top tabs -->
								<div class="tabs-wrapper">
									<div class="tabs is-boxed is-fullwidth">
										<ul>
											<li class="is-active"><a> <span
													class="icon is-small"><i data-feather="edit-3"></i></span>
													<span><spring:message code="feed.feed.publish"/></span>
											</a></li>
											<!-- Close X button -->
											<li class="close-wrap"><span class="close-publish">
													<svg viewBox="0 0 24 24" width="24" height="24"
														stroke="currentColor" stroke-width="2" fill="none"
														stroke-linecap="round" stroke-linejoin="round"
														class="css-i6dzq1">
														<line x1="18" y1="6" x2="6" y2="18"></line>
														<line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</span></li>
										</ul>
									</div>
									<!-- Tab content -->
									<!-- ----------글쓰는 부분 --------------->
									<div class="tab-content">
										<div class="compose">
											<div class="compose-form">
												<img src="${pageContext.request.contextPath}/resources/upload/${photo.uuid }"  alt="">
												<div class="control">
													<textarea id="publish" name="content" class="textarea"
														rows="3" placeholder='<spring:message code="feed.feed.text"/>'></textarea>
												</div>
											</div>
											<div id="feed-upload" class="feed-upload"></div>
											<div id="append_tag"></div>
											<div id="options-summary" class="options-summary"></div>
											<div id="tag-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<!-- Tag friends suboption -->
												<div id="tag-list" class="tag-list"></div>
												<div class="control">
													<input id="tags-autocpl" type="text" class="input"
														placeholder="Who are you with?">
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>
											<!-- /Tag friends suboption -->

											<!-- Activities suboption -->
											<div id="activities-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="activities-autocpl-wrapper"
													class="control has-margin">
													<input id="activities-autocpl" type="text" class="input"
														placeholder="태그를 입력해 주세요" maxlength="10">
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>

												<!-- Mood suboption -->
												<div id="mood-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="mood-autocpl" type="text"
															class="input is-subactivity"
															placeholder="How do you feel?">
														<div class="input-block">Feels</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Drinking suboption child -->
												<div id="drinking-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="drinking-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you drinking?">
														<div class="input-block">Drinks</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Eating suboption child -->
												<div id="eating-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="eating-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you eating?">
														<div class="input-block">Eats</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Reading suboption child -->
												<div id="reading-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="reading-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you reading?">
														<div class="input-block">Reads</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Watching suboption child -->
												<div id="watching-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="watching-autocpl" type="text"
															class="input is-subactivity"
															placeholder="What are you watching?">
														<div class="input-block">Watches</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

												<!-- Travel suboption child -->
												<div id="travel-autocpl-wrapper"
													class="is-autocomplete is-activity is-hidden">
													<div class="control has-margin">
														<input id="travel-autocpl" type="text"
															class="input is-subactivity"
															placeholder="Where are you going?">
														<div class="input-block">Travels</div>
														<div class="close-icon is-subactivity">
															<i data-feather="x"></i>
														</div>
													</div>
												</div>

											</div>
											<!-- /Activities suboption -->

											<!-- Location suboption -->
											<div id="location-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="location-autocpl-wrapper"
													class="control is-location-wrapper has-margin">
													<input id="location-autocpl" type="text" class="input"
														placeholder="Where are you now?">
													<div class="icon">
														<i data-feather="map-pin"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>

											<!-- Link suboption -->
											<div id="link-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="link-autocpl-wrapper"
													class="control is-location-wrapper has-margin">
													<input id="link-autocpl" type="text" class="input"
														placeholder="Enter the link URL">
													<div class="icon">
														<i data-feather="link-2"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
												</div>
											</div>

											<!-- GIF suboption -->
											<div id="gif-suboption"
												class="is-autocomplete is-suboption is-hidden">
												<div id="gif-autocpl-wrapper"
													class="control is-gif-wrapper has-margin">
													<input id="gif-autocpl" type="text" class="input"
														placeholder="Search a GIF to add" autofocus>
													<div class="icon">
														<i data-feather="search"></i>
													</div>
													<div class="close-icon is-main">
														<i data-feather="x"></i>
													</div>
													<div class="gif-dropdown">
														<div class="inner">
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/1.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/2.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/3.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/4.gif" alt="">
															</div>
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/5.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/6.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/7.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/8.gif" alt="">
															</div>
															<div class="gif-block">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/9.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/10.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/11.gif" alt="">
																<img src="https://via.placeholder.com/478x344"
																	data-demo-src="assets/img/demo/gif/12.gif" alt="">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- /Compose form -->

										<!-- General basic options -->
										<div id="basic-options" class="compose-options">
											<!-- Upload action -->
											<div class="compose-option" style="height: 32px">
												<span>📷 <spring:message code="feed.feed.photo"/></span> <input id="feed-upload-input-2"
													name="file" type="file" accept=".png, .jpg, .jpeg"
													onchange="readURL(this)">
											</div>
											<!-- Tag action -->
											<div id="show-activities" class="compose-option">
												<img
													src="resources/template/assets/img/icons/emoji/emoji-1.svg"
													alt=""> <span><spring:message code="feed.feed.tag"/></span>
											</div>
										</div>
										<!-- /General basic options -->

										<!-- Footer buttons -->
										<div class="more-wrap">

											<!-- Publish button -->
											<button id="publish-button" type="button"
												class="button is-solid accent-button is-fullwidth is-disabled">Publish</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					<div class="profile-timeline">
						<!-- Timeline POST #1 -->
						<div class="feedContents">
							<!-- Post -->
							<!------------------------ 포스트 시작 ------------------------->
							<c:forEach items="${posts }" var="vo" varStatus="status">
								<div id="feed-post-1" class="card is-post">
									<!-- Main wrap -->
									<div class="content-wrap" data-crap="${status.index }">
										<!-- Post header -->
										<div class="card-heading">
											<!-- User meta -->
											<div class="user-block">
												<div class="image">
													<img src="${pageContext.request.contextPath}/resources/upload/${vo.photo}"
														data-demo-src="assets/img/avatars/dan.jpg"
														data-user-popover="1" alt="">
												</div>
												<div class="user-info" id="${vo.user_id }">
													<a href="#" style="font-size: 1rem; display: inline">${vo.name }</a>
													<span class="time"> <script
															type="text/javascript">														
														document.write(timeForToday('${vo.reg_date}'));
													</script>
													</span>
												</div>
											</div>
											<!-- Right side dropdown -->
											<!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
											<div
												class="dropdown is-spaced is-right is-neutral dropdown-trigger">
												<div>
													<div class="button">
														<svg viewBox="0 0 24 24" width="24" height="24"
															stroke="currentColor" stroke-width="2" fill="none"
															stroke-linecap="round" stroke-linejoin="round"
															class="css-i6dzq1">
															<line x1="8" y1="6" x2="21" y2="6"></line>
															<line x1="8" y1="12" x2="21" y2="12"></line>
															<line x1="8" y1="18" x2="21" y2="18"></line>
															<line x1="3" y1="6" x2="3.01" y2="6"></line>
															<line x1="3" y1="12" x2="3.01" y2="12"></line>
															<line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
													</div>
												</div>
												<div class="dropdown-menu" role="menu">
													<div class="dropdown-content">
														<a href="#" class="dropdown-item">
															<div class="media">
																<div class="media-content" id="${vo.content }"
																	onclick="trans('${vo.feed_id }','${vo.content }'); return false;">
																	<h3><spring:message code="feed.drop.trans" /></h3>
																</div>
															</div>
														</a>
														<c:if test="${vo.user_id ne user.user_id}">
															<a class="dropdown-item">
																<div class="media">
																	<div class="media-content" id="feedcor"
																		data-fid="${vo.feed_id }" data-fidx="${status.index }"
																		data-fuser="${vo.user_id }">
																		<h3><spring:message code="feed.drop.corr" /></h3>
																	</div>
																</div>
															</a>
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media">
																	<div class="media-content" id="frbtn"
																		data-repo2="${vo.feed_id }"
																		data-report2="${vo.user_id }">
																		<h3><spring:message code="feed.drop.report" /></h3>
																	</div>
																	<div class="dropdown-menu">
																		<div class="dropdown-content reportMenu">
																			<div class="media freport" style="border: 0px;">
																				<table id="report-table">
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }" value="스팸 게시물"><spring:message code="feed.report.content" /></label></td>
																					</tr>
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }" value="가짜정보 제공"><spring:message code="feed.report.lie" /></label></td>
																					</tr>
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }" value="성적인 내용"><spring:message code="feed.report.sexual" /></label></td>
																					</tr>
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }"
																								value="데이트가 목적인 내용"><spring:message
																									code="feed.report.date" /></label></td>
																					</tr>
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }" value="욕설/비방"><spring:message code="feed.report.word" /></label>
																						</td>
																					</tr>
																					<tr>
																						<td><label><input type="radio"
																								id="fmsg" name="${vo.feed_id }" value="기타"><spring:message code="feed.report.etc" /></label>
																						</td>
																					</tr>
																					<tr>
																					<spring:message code="comment.report.input.placeholder" var="feed_placeholder" />
																						<td><input placeholder="${feed_placeholder }" hidden="true"
																							data-rftxt="${vo.feed_id }" maxlength="30"></input>
																						</td>
																					</tr>
																				</table>
																			</div>
																			<div class="dropdown-divider"></div>
																			<div class="reported-div">
																				<input type="checkbox" id="feed-blocked"
																					data-rfchk="${vo.feed_id  }" value="${vo.user_id }">${vo.name }
																				<spring:message code="feed.report.block" />
																				<button id="report-btn" data-repo2="${vo.feed_id  }"
																					data-report2="${vo.user_id }"><spring:message code="feed.report.btn" /></button>
																			</div>
																		</div>
																	</div>
																</div>
															</a>
														</c:if>
														<c:if test="${vo.user_id eq user.user_id}">
															<hr class="dropdown-divider">
															<a class="dropdown-item">
																<div class="media feedUpdate" id="update${vo.feed_id }" onclick="feedUpdate('${vo.feed_id }')">
																	<i data-feather="bell"></i>
																	<div class="media-content">
																		<input type="hidden" id="update-tag" name="update-tag"
																			value="${vo.tags }"> <input type="hidden"
																			id="update-content" name="update-content"
																			value="${vo.content }"> <input type="hidden"
																			id="update-photo" name="update-photo"
																			value="${vo.uuid }"> <input type="hidden"
																			id="update-fphoto" name="update-fphoto"
																			value="${vo.fphoto }">
																		<h3><spring:message code="profile.posts.edit"/></h3>
																	</div>
																</div> <a href="#" class="dropdown-item">
																	<div class="media">
																		<i data-feather="flag"></i>
																		<div class="media-content delFeed" id="${vo.feed_id }">
																			<h3><spring:message code="profile.posts.delete"/></h3>
																		</div>
																	</div>
															</a>
														</c:if>
													</div>
												</div>
											</div>
										</div>
										<!-- /Post header -->
										<!-- Post body -->
										<div class="card-body">
											<!-- Post body text -->
											<div class="post-text">
												<p
													style="font-size: 1rem; color: #5f5f5f; line-height: 1.5; word-wrap: break-word; white-space: pre-line;">${vo.content }</p>
												<div class="tdiv" id="tdiv${vo.feed_id }"></div>
												<div class="twdiv" id="${vo.write_lan }"></div>
											</div>
												<div class="post-image">
													<img
														src='${pageContext.request.contextPath}/resources/upload/${vo.uuid}'
														alt="" />
												</div>
											<div>
												<p>
													<c:if test="${not empty vo.tags }">
														<a>#${fn:replace(vo.tags,',','#')}</a>
													</c:if>
												</p>
											</div>
										</div>
										<!-- /Post body -->

										<!-- Post footer -->
										<div class="card-footer">
											<!-- Post statistics -->
											<div class="social-count">
													<!-- Action buttons -->
													<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
													<!-- 댓글 카운트 -->
													<div class="fab-wrapper is-comment" style="padding-right: 10px;">
														<a href="javascript:void(0);" class="small-fab"> <svg
																viewBox="0 0 24 24" width="24" height="24"
																stroke="currentColor" stroke-width="2" fill="none"
																stroke-linecap="round" stroke-linejoin="round"
																class="css-i6dzq1">
																<path
																	d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
														<span class="activeCnt" id="minicmt" data-minicmt="${status.index }">
															<c:if test="${vo.cmt eq 0 }">0</c:if>
															<c:if test="${vo.cmt gt 0 }">${vo.cmt }</c:if>
														</span>
														</a>
													</div>
													<!-- 좋아요 카운트 -->
													<div class="like-wrapper">
														<a class="like-button"
															onclick="likeIt('${vo.feed_id}','${vo.user_id }'); return false;"> <i
															class="mdi mdi-heart not-liked bouncy"></i> <i
															class="mdi mdi-heart is-liked bouncy"></i> 
															<span class="activeCnt" id="recCnt${vo.feed_id }"> ${vo.like_cnt } </span>
														</a>
													</div>
											</div>
										</div>
										<div data-table="${status.index }"></div>
										<!-- /Post footer -->
									</div>
									<!-- /Main wrap -->


									<!-- Post #1 Comments -->
									<div class="comments-wrap is-hidden">
										<!-- Header -->
										<div class="comments-heading" data-card="${status.index }">
											<h4>
												<spring:message code="comment.h4.title" />
												<small> <c:if
														test="${!empty vo.cmt and vo.cmt eq 0 }">(0)</c:if> <c:if
														test="${!empty vo.cmt and vo.cmt gt 0 }">(${vo.cmt})</c:if>
												</small>
											</h4>
											<div class="close-comments">
												<svg viewBox="0 0 24 24" width="24" height="24"
													stroke="currentColor" stroke-width="2" fill="none"
													stroke-linecap="round" stroke-linejoin="round"
													class="css-i6dzq1">
													<line x1="18" y1="6" x2="6" y2="18"></line>
													<line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</div>
										</div>
										<!-- /Header -->

										<!-- Comments body -->
										<div class="comments-body has-slimscroll"
											data-scroll="${status.index }">

											<!-- Comment -->
											<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">
												<c:forEach items="${commentList }" var="cmt">
													<!-- 피드번호가 같으면 -->
													<c:if test="${vo.feed_id eq cmt.feed_id }">
														<c:choose>
															<c:when test="${cmt.content ne '-'}">
																<!-- 일반댓글이면 -->
																<div class="media is-comment">
																	<!-- User image -->
																	<div class="media-left">
																		<div class="image">
																			<c:if test="${cmt.uuid ne '-' }">
																				<img src="${pageContext.request.contextPath}/resources/upload/${cmt.uuid}"
																					data-demo-src="assets/img/avatars/dan.jpg"
																					data-user-popover="1" alt="">
																			</c:if>
																			<c:if test="${cmt.uuid eq '-' }">
																				<img src="https://via.placeholder.com/300x300"
																					data-demo-src="assets/img/avatars/dan.jpg"
																					data-user-popover="1" alt="">
																			</c:if>
																		</div>
																	</div>
																	<!-- Content -->
																	<div class="media-content">
																		<a
																			href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
																		<span class="time"> <fmt:formatDate
																				value="${cmt.reg_date }"
																				pattern="yyyy-MM-dd HH:mm:ss" var="rg_dt" /> <script
																				type="text/javascript">														
														document.write(timeForToday('${rg_dt}'));
													</script> <!-- Actions --> <c:if
																				test="${cmt.user_id eq user.user_id }">
																				<div class="controls" style="display: inline-block">
																					<div class="edit">
																						<a id="del" data-delcmt="${cmt.comment_id }"
																							data-delcmtfeed="${cmt.feed_id }"
																							data-idx="${status.index }"> <svg
																								viewBox="0 0 24 24" width="15" height="15"
																								stroke="currentColor" stroke-width="2"
																								fill="none" stroke-linecap="round"
																								stroke-linejoin="round" class="css-i6dzq1">
																	<line x1="18" y1="6" x2="6" y2="18"></line>
																	<line x1="6" y1="6" x2="18" y2="18"></line></svg>
																						</a>
																					</div>
																				</div>
																			</c:if>
																		</span>
																		<p
																			style="color: #525252; word-wrap: break-word; white-space: pre-line;">${cmt.content }
																		</p>
																	</div>
																	<c:if test="${user.user_id ne cmt.user_id and cmt.user_id ne 'admin'}">
																		<!-- Right side dropdown -->
																		<div class="media-right">
																			<div
																				class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																				<div>
																					<div class="button">
																						<svg viewBox="0 0 24 24" width="24" height="24"
																							stroke="currentColor" stroke-width="2"
																							fill="none" stroke-linecap="round"
																							stroke-linejoin="round" class="css-i6dzq1">
							                                    <path
																								d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
							                                    <line x1="12" y1="9" x2="12"
																								y2="13"></line>
							                                    <line x1="12" y1="17"
																								x2="12.01" y2="17"></line></svg>
																					</div>
																				</div>
																				<div class="dropdown-menu" role="menu">
																					<div class="dropdown-content">
																						<div class="media">
																							<table id="report-table">
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="스팸 게시물">
																										<spring:message code="comment.report.content" /></label>
																									</td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="가짜정보 제공">
																										<spring:message code="comment.report.lie" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="성적인 내용">
																										<spring:message code="comment.report.sexual" /></label>
																									</td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="데이트가 목적인 내용">
																										<spring:message code="letter.report.date" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="욕설/비방">
																										<spring:message code="letter.report.word" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }" value="기타">
																										<spring:message code="letter.report.etc" /></label></td>
																								</tr>
																								<tr>
																									<td><spring:message
																											code="comment.report.input.placeholder"
																											var="cmt_placeholder" /> <input
																										data-rtxt="${cmt.comment_id }"
																										placeholder="${cmt_placeholder}" hidden="true"
																										maxlength="30"></input></td>
																								</tr>
																							</table>
																						</div>
																						<div class="dropdown-divider"></div>
																						<input type="checkbox" id="blocked"
																							data-rchk="${cmt.comment_id  }"
																							value="${cmt.user_id }">${cmt.name }
																						<spring:message code="comment.report.block" />
																						<button id="fr-btn"
																							data-repo="${cmt.comment_id  }"
																							data-report="${cmt.user_id }">
																							<spring:message code="comment.report.btn" />
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-- /Right side dropdown -->
																	</c:if>
																</div>
																<!-- /일반댓글이면 -->
															</c:when>
															<c:otherwise>
																<!-- 교정댓글이면 -->
																<div class="media is-comment">
																	<!-- User image -->
																	<div class="media-left">
																		<div class="image">
																			<c:if test="${cmt.uuid ne '-' }">
																				<img src="${pageContext.request.contextPath}/resources/upload/${cmt.uuid}"
																					data-demo-src="assets/img/avatars/dan.jpg"
																					data-user-popover="1" alt="">
																			</c:if>
																			<c:if test="${cmt.uuid eq '-' }">
																				<img src="https://via.placeholder.com/300x300"
																					data-demo-src="assets/img/avatars/dan.jpg"
																					data-user-popover="1" alt="">
																			</c:if>
																		</div>
																	</div>
																	<!-- Content -->
																	<div class="media-content">
																		<a
																			href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
																		<span class="time"> <fmt:formatDate
																				value="${cmt.reg_date }"
																				pattern="yyyy-MM-dd HH:mm:ss" var="rg_dt" /> <script
																				type="text/javascript">														
														document.write(timeForToday('${rg_dt}'));
													</script> <!-- Actions --> <c:if
																				test="${cmt.user_id eq user.user_id }">
																				<div class="controls" style="display: inline-block">
																					<div class="edit">
																						<a id="cdel" data-delcmt="${cmt.comment_id }"
																							data-delcmtfeed="${cmt.feed_id }"
																							data-idx="${status.index }"> <svg
																								viewBox="0 0 24 24" width="15" height="15"
																								stroke="currentColor" stroke-width="2"
																								fill="none" stroke-linecap="round"
																								stroke-linejoin="round" class="css-i6dzq1">
																								<line x1="18" y1="6" x2="6" y2="18"></line>
																								<line x1="6" y1="6" x2="18" y2="18"></line></svg>
																						</a>
																					</div>
																				</div>
																			</c:if>
																		</span>
																		<!-- 교정댓글이면, line을 반복 -->
																		<c:forEach items="${cdList }" var="cd">
																			<c:if test="${cmt.comment_id eq cd.cc_id }">
																				<div id="load_${cd.cc_id }${cd.line}"
																					data-cid="${cd.cc_id }${cd.line}"
																					data-cdc="${cd.content }" data-cdo="${cd.origin }">${cd.content }</div>
																			</c:if>
																		</c:forEach>
																	</div>
																	<c:if test="${user.user_id ne cmt.user_id and cmt.user_id ne 'admin'}">
																		<!-- Right side dropdown -->
																		<div class="media-right">
																			<div
																				class="dropdown is-spaced is-right is-neutral dropdown-trigger">
																				<div>
																					<div class="button">
																						<svg viewBox="0 0 24 24" width="24" height="24"
																							stroke="currentColor" stroke-width="2"
																							fill="none" stroke-linecap="round"
																							stroke-linejoin="round" class="css-i6dzq1">
							                                    <path
																								d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
							                                    <line x1="12" y1="9" x2="12"
																								y2="13"></line>
							                                    <line x1="12" y1="17"
																								x2="12.01" y2="17"></line></svg>
																					</div>
																				</div>
																				<div class="dropdown-menu" role="menu">
																					<div class="dropdown-content">
																						<div class="media">
																							<table id="report-table">
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="스팸 게시물">
																										<spring:message code="comment.report.content" /></label>
																									</td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="가짜정보 제공">
																										<spring:message code="comment.report.lie" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="성적인 내용">
																										<spring:message code="comment.report.sexual" /></label>
																									</td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="데이트가 목적인 내용">
																										<spring:message code="letter.report.date" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }"
																											value="욕설/비방">
																										<spring:message code="letter.report.word" /></label></td>
																								</tr>
																								<tr>
																									<td><label><input type="radio"
																											id="msg" name="${cmt.comment_id }" value="기타">
																										<spring:message code="letter.report.etc" /></label></td>
																								</tr>
																								<tr>
																									<td><spring:message
																											code="comment.report.input.placeholder"
																											var="cmt_placeholder" /> <input
																										data-rtxt="${cmt.comment_id }"
																										placeholder="cmt_placeholder" hidden="true"
																										maxlength="30"></input></td>
																								</tr>
																							</table>
																						</div>
																						<div class="dropdown-divider"></div>
																						<input type="checkbox" id="blocked"
																							data-rchk="${cmt.comment_id  }"
																							value="${cmt.user_id }">${cmt.name }
																						<spring:message code="comment.report.block" />
																						<button id="fr-btn"
																							data-repo="${cmt.comment_id  }"
																							data-report="${cmt.user_id }">
																							<spring:message code="comment.report.block" />
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-- /Right side dropdown -->
																	</c:if>
																</div>
																<!-- /교정댓글이면 -->
															</c:otherwise>
														</c:choose>
													</c:if>
													<!-- /피드번호가 같으면 -->
												</c:forEach>
											</c:if>
											<!-- /Comment -->

										</div>
										<!-- /Comments body -->

										<!-- Comments footer -->
										<div class="card-footer">
											<div class="media post-comment has-emojis">
												<!-- Comment Textarea -->
												<div class="media-content">
													<div class="field">
														<p class="control">
															<spring:message code="comment.textarea.placeholder"
																var="cmt_text_placeholder" />
															<textarea data-content="${vo.feed_id }"
																class="textarea comment-textarea" rows="5"
																placeholder="${cmt_text_placeholder }"></textarea>
														</p>
													</div>
													<!-- Additional actions -->
													<div class="actions">
														<div class="toolbar">
															<a class="button is-solid primary-button raised"
																id="post" data-feedid="${vo.feed_id }"
																data-feeduser="${vo.user_id }"
																data-scr="${status.index }"> <spring:message
																	code="comment.btn.send" />
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Comments footer -->
									</div>
									<!-- /Post #1 Comments -->
								</div>
							</c:forEach>
							<!-- /Post -->
							<!------------------------ 포스트 끝 ------------------------->
							<div class="load-more-wrap narrow-top has-text-centered"
								id="buttonToogle">
								<a href="javascript:;" class="load-more-button"><spring:message code="feed.loadmore"/> </a>
							</div>
						</div>
						<!-- /Load more posts -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Profile page main wrapper -->
	<!-- /Container -->

	<!-- Change profile pic modal -->
	<!--html/partials/pages/profile/timeline/modals/change-profile-pic-modal.html-->
	<div id="change-profile-pic-modal"
		class="modal change-profile-pic-modal is-medium has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3>Update Profile Picture</h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body">
					<!-- Placeholder -->
					<div class="selection-placeholder">
						<div class="columns">
							<div class="column is-6">
								<!-- Selection box -->
								<div class="selection-box modal-trigger"
									data-modal="upload-crop-profile-modal">
									<div class="box-content">
										<img src="assets/img/illustrations/profile/change-profile.svg"
											alt="">
										<div class="box-text">
											<span>Upload</span> <span>From your computer</span>
										</div>
									</div>
								</div>
							</div>
							<div class="column is-6">
								<!-- Selection box -->
								<div class="selection-box modal-trigger"
									data-modal="user-photos-modal">
									<div class="box-content">
										<img src="assets/img/illustrations/profile/upload-profile.svg"
											alt="">
										<div class="box-text">
											<span>Choose</span> <span>From your photos</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Profile picture crop modal -->
	<!--html/partials/pages/profile/timeline/modals/upload-crop-profile-modal.html-->
	<div id="upload-crop-profile-modal"
		class="modal upload-crop-profile-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content">

			<div class="card">
				<div class="card-heading">
					<h3>Upload Picture</h3>
					<!-- Close X button -->
					<div class="close-wrap">
						<span class="close-modal"> <i data-feather="x"></i>
						</span>
					</div>
				</div>
				<div class="card-body">
					<label class="profile-uploader-box" for="upload-profile-picture">
						<span class="inner-content"> <img
							src="assets/img/illustrations/profile/add-profile.svg" alt="">
							<span>Click here to <br>upload a profile picture
						</span>
					</span> <input type="file" id="upload-profile-picture" accept="image/*">
					</label>
					<div class="upload-demo-wrap is-hidden">
						<div id="upload-profile"></div>
						<div class="upload-help">
							<a id="profile-upload-reset" class="profile-reset is-hidden">Reset
								Picture</a>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button id="submit-profile-picture"
						class="button is-solid accent-button is-fullwidth raised is-disabled">Use
						Picture</button>
				</div>
			</div>

		</div>
	</div>
	<div id="crop-modal" class="modal is-small crop-modal is-animated">
			<div class="modal-background"></div>
			<div class="modal-content">
				<div class="modal-card">
					<header class="modal-card-head">
						<h3>Crop your picture</h3>
						<div class="close-wrap">
							<button class="close-modal" aria-label="close">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</button>
						</div>
					</header>
					<div class="modal-card-body">
						<div id="cropper-wrapper" class="cropper-wrapper"></div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

