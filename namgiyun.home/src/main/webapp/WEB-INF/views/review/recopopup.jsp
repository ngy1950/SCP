<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- notice -->
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- roco-popup -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 장소라이브러리 -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk-Ih31hsMuQfIp0lOfd3XwK518Czqaf4&libraries=places"></script>
	<!-- 장소오토완성 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk-Ih31hsMuQfIp0lOfd3XwK518Czqaf4&libraries=places&callback=initAutocomplete" async defer></script>
<style>

#description {
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
}

#infowindow-content .title {
  font-weight: bold;
}

#infowindow-content {
  display: none;
}

#map #infowindow-content {
  display: inline;
}

.pac-card {
  margin: 10px 10px 0 0;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
  background-color: #fff;
  font-family: Roboto;
}

#pac-container {
  padding-bottom: 12px;
  margin-right: 12px;
}

.pac-controls {
  display: inline-block;
  padding: 5px 11px;
}

.pac-controls label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 350px;
  margin-top: 20px;
  border: 1px solid;
  height: 30px;
  border-radius: 5px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

#title {
  color: #fff;
  background-color: #4d90fe;
  font-size: 25px;
  font-weight: 500;
  padding: 6px 12px;
}
#target {
  width: 345px;
}
/* Set the size of the div element that contains the map */
#map {
	height: 100%; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
.review-name {
	padding: 0% 5% 0% 5%;
}

.review-date {
	width: 17%;
}

.review-id {
	width: 14%;
}
.recolink {
	color: #303030;
}

.mapping {
	border: 1px solid;
	width: 63%;
	height: 100%;
	border-radius: 20px;
	float: left;
	overflow: hidden
}


.photo {
	border: 1px solid;
	height: 30%;
}

.place-name {
	border: 1px solid;
	height: 13%;
	border-top: white;
	text-align: center;
	padding: 4%;
	font-size: x-large;
	background-color: #9e9e9e63;
}


.reco-reason {
	border: 1px solid;
	height: 32%;
	padding: 5% 7% 3% 7%;
	border-top: white;
	background-color: #f8f8f8;
}

.reco-dtail {
	padding: 3% 2% 0% 6%;
	height: 100%;
}

.tab-content {
	height: 600px;
}

body {
	font-family: "맑은 고딕"
}
.mapping{
	border: 1px solid;
	width: 63%;
	height: 100%;
	float: left;
}

.place-dtail{
	float: right;
	width: 30%;
	height: 84%;
	margin-right: 3%;
}

.place-loc1 {
	border: 1px solid;
	height: 28%;
	border-top: white;
	padding: 6% 4%;
	background-color: #f8f8f8;
}

.reco-reason1 {
	border: 1px solid;
	height: 48%;
	padding: 6% 7% 6% 7%;
	border-top: white;
	background-color: #f8f8f8;
}

.reco-dtail1 {
	padding: 2% 0% 0% 3%;
	height: 92%;
}

.pop-reason1 {
	margin: 8.48438px 0px 20px;
	border-radius: 7px;
	background-color: rgb(248, 248, 248);
	border: 0px;
	padding: 1% 0% 0% 1%;
	width: 274px;
	height: 108px;
	resize: none;
}

.place-search1 {
	padding: 0% 0% 1% 5%;
	float: left;
	width: 97%;
}
</style>

<script type="text/javascript">
	
</script>
<body>
	<div class="container">

		<!-- tab menu -->
		<div class="tabbable">
			<ul class="nav nav-tabs" id="mytab" style="margin: 40px 0% 2%;">
				<li><a href="02" style="color: #303030; font-size: medium;">
				<b>후기</b></a></li>
				<li><a href="03" data-toggle="tab" aria-expanded="true" style="color: #303030; font-size: medium;">
				<b>맛집&관광지</b></a></li>
				<li class="active"><a href="recopopup" data-toggle="tab" style="font-size: medium;">
				<b>맛집&관광지 추천하기</b></a></li>
			</ul>
			<div class="tab-content">
				<div class="reco-dtail">
				<!-- <div class="place-search1">
					<input type="text" id="pac-input" placeholder="   검색어를 입력하세요."
						class="controls" style="width: 35%; height: 36px; border-radius: 5px">
						</div> -->
					<div class="mapping">
					<input id="pac-input" class="controls" type="text" placeholder="   검색어를 입력하세요.">
						<div id="map">
							<script>
							function initAutocomplete () {
								  var map = new google.maps.Map(document.getElementById('map'), {
								    center: {lat: -33.8688, lng: 151.2195},
								    zoom: 13,
								    mapTypeId: 'roadmap'
								  });

								  // Create the search box and link it to the UI element.
								  var input = document.getElementById('pac-input');
								  var searchBox = new google.maps.places.SearchBox(input);
								  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

								  // Bias the SearchBox results towards current map's viewport.
								  map.addListener('bounds_changed', function() {
								    searchBox.setBounds(map.getBounds());
								  });

								  
								  var markers = [];
								  // Listen for the event fired when the user selects a prediction and retrieve
								  // more details for that place.
								  searchBox.addListener('places_changed', function() {
								    var places = searchBox.getPlaces();

								    if (places.length == 0) {
								      return;
								    }

								    // Clear out the old markers.
								    markers.forEach(function(marker) {
								      marker.setMap(null);
								    });
								    markers = [];

								    // For each place, get the icon, name and location.
								    var bounds = new google.maps.LatLngBounds();
								    places.forEach(function(place) {
								      if (!place.geometry) {
								        console.log("Returned place contains no geometry");
								        return;
								      }

								      // Create a marker for each place.
								      var ping = markers.push(new google.maps.Marker({
								        map: map,
								        title: place.name,
								        
								        position: place.geometry.location
								      }));

								      if (place.geometry.viewport) {
								        // Only geocodes have viewport.
								        bounds.union(place.geometry.viewport);
								      } else {
								        bounds.extend(place.geometry.location);
								      }
								    });
								    map.fitBounds(bounds);
								  });
								  var request = {
										  placeId: 'ChIJN1t_tDeuEmsRUsoyG83frY4',
										  fields: ['name', 'rating', 'formatted_phone_number', 'geometry', 'address_component']
										};
									console.log(request);
										service = new google.maps.places.PlacesService(map);
										service.getDetails(request, callback);

										function callback(place, status) {
										  if (status == google.maps.places.PlacesServiceStatus.OK) {
											  var marker = new google.maps.Marker({
											      map: map,
											      place: {
											        placeId: results[0].place_id,
											        location: results[0].geometry.location
											      }
											    });
										  }
										}
								}
							 
							 google.maps.event.addDomListener (map, 'click', function (e){
								    console.log(e)
								  });
							 
							 
							</script>
						</div>
					</div>
					<div class="place-dtail">
						<div class="photo">가게 이미지</div>
						<div class="place-name">
							<b>홍대 야도란</b>
						</div>
						<div class="place-loc1">
							주소 : <span id ="adr-box"></span> <br>전화번호
							: 02 - 712 - 9354
						</div>
						<div class="reco-reason1">
							<b>추천 이유</b> <br>
							<textarea rows="7" cols="37"
								placeholder="추천하시는 이유를 50자 이내로 적어주세요" class="pop-reason1"></textarea>
							<br> <a href="javascript:popupClose();"
								class="layerpop_close" id="layerbox_close">
								<button value="submit" type="button" class="btn btn-secondary">등록</button>
							</a>
						</div>
					</div>
				</div>

			</div>
			<!-- tab-content end -->
		</div>
	</div>
</body>
</html>