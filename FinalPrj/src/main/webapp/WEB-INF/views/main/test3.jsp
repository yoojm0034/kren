<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<style>
img {
	height: 48px;
}

#map {
	height: 400px;
	width: 100%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function getAdd() {
		$.getJSON("https://api.ipregistry.co/?key=f3cmlbb66kf0ewyi", function(
				json) {
			console.log(json);
			$("#country").text(json['location']['country']['name']);
			$("#city").text(json['location']['region']['name']);
			$("#time").text(json['time_zone']['current_time']);
			$("#flag").attr("src",
					json['location']['country']['flag']['emojitwo']);

			var lat = json['location']['latitude'];
			var lon = json['location']['longitude'];
			$("#lat").text(lat);
			$("#lon").text(lon);

			// 시간계산
			var time = json['time_zone']['current_time'];
			var hour = time.substr(11, 2);
			var min = time.substr(14, 2);
			var time2 = (hour % 12 || 12) + ':'
					+ min.toString().padStart(2, '0')
					+ (hour < 12 ? ' A' : ' P') + 'M';
			$("#time2").text(time2);
			
			initMap(lat, lon);
		});
	};
	
	// 지도
    function initMap(lat, lon) {
        const city = { lat: lat,
        		lng: lon};
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 8,
          center: city,
          mapTypeControl: false,
          streetViewControl: false,
        });
        const marker = new google.maps.Marker({
          position: city,
          map: map,
        });
	};
</script>
<body>
	<button onclick="getAdd()">확인</button>
	<br> 나라 :
	<span id="country"></span>
	<br> 도시 :
	<span id="city"></span>
	<br> 시간 :
	<span id="time"></span>
	<br> 시간2 :
	<span id="time2"></span>
	<br> 국기 :
	<img id="flag" src="" />
	<br> 위도 :
	<span id="lat"></span>
	<br> 경도 :
	<span id="lon"></span>
	<br> 지도
	<br>
	<div id="map"></div>
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
</body>
</html>