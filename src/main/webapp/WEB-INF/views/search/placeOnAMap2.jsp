<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>
<!--Tmap API관련   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--appKey = 어쩌구 -> Tmap사이트에서 받은 고유키 입니당-->
    <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9b9bcfec-7c62-4c75-8854-04b5c8e68f51"></script>
    

<script>
	
// 	$(document).ready(function() {
// 		initTmap();
// 	});
	
// 	function setVariables(){    
// 	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
// 	}
	
// 	function initTmap(){
// 		// map 생성
// 		// Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
// 		map = new Tmapv2.Map("map",  // "map" : 지도가 표시될 div의 id
// 		{
// 			center: new Tmapv2.LatLng(37.566481622437934,126.98502302169841), // 지도 초기 좌표
// 			width: "100%", // map의 width 설정
// 			height: "400px" // map의 height 설정
// 		});
		
// 		map.setZoom(12);

// 	//마커 표시하기 
// 	var marker = new Tmapv2.Marker({
// 		position: new Tmapv2.LatLng(37.566481622437934,126.98502302169841),
// 		map: map
// 	});	
	
// 	//선 그리기 
//     var polyline = new Tmapv2.Polyline({
//         path: [new Tmapv2.LatLng(37.566381,126.985123),
//         	new Tmapv2.LatLng(37.566581,126.985123),
//         	new Tmapv2.LatLng(37.566381,126.985273),
//         	new Tmapv2.LatLng(37.566581,126.985423),
//         	new Tmapv2.LatLng(37.566381,126.985423)],
//         strokeColor: "#dd00dd",
//         strokeWeight: 6,
//         map: map
//     });
	
// 	//다각형 그리기 
// 	   var polygon = new Tmapv2.Polygon({
//         paths: [new Tmapv2.LatLng(37.566610,126.985666),
//             new Tmapv2.LatLng(37.566595,126.985985),
//             new Tmapv2.LatLng(37.566512,126.986071),
//             new Tmapv2.LatLng(37.566397,126.985894),
//             new Tmapv2.LatLng(37.566395,126.985664)],
//         fillColor:"pink",
//         draggable: true,
//         map: map
//     });
	
// 	} 

							
// 1. 지도 띄우기
	
	$(document).ready(function() {
		initTmap();
	});
	
	function setVariables(){    
	    zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다. 
	}
	
	
	function initTmap(){
		// map 생성
		// Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		map = new Tmapv2.Map("map",  // "map" : 지도가 표시될 div의 id
		{
			center: new Tmapv2.LatLng(37.566481622437934,126.98502302169841), // 지도 초기 좌표
			width: "100%", // map의 width 설정
			height: "400px" // map의 height 설정
		});
		
		map.setZoom(12);
map.setCenter(new Tmap.LonLat("127.058908811749", "37.52084364186228").transform("EPSG:4326", "EPSG:3857"), 12);
routeLayer = new Tmap.Layer.Vector("route");
map.addLayer(routeLayer);

markerStartLayer = new Tmap.Layer.Markers("start");
markerEndLayer = new Tmap.Layer.Markers("end");
markerWaypointLayer = new Tmap.Layer.Markers("waypoint");
markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
pointLayer = new Tmap.Layer.Vector("point");

// 2. 시작, 도착 심볼찍기
// 시작
map.addLayer(markerStartLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
var marker_s = new Tmap.Marker(new Tmap.LonLat("127.02810900563199", "37.519892712436906").transform("EPSG:4326", "EPSG:3857"), icon);
markerStartLayer.addMarker(marker_s);

// 도착
map.addLayer(markerEndLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
var marker_e = new Tmap.Marker(new Tmap.LonLat("127.13281976335786", "37.52130314703887").transform("EPSG:4326", "EPSG:3857"), icon);
markerEndLayer.addMarker(marker_e);

//경유지 마커 제거
markerWaypointLayer.clearMarkers();
markerWaypointLayer2.clearMarkers();


// 3. 경유지 심볼 찍기
map.addLayer(markerWaypointLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h); 
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
var marker = new Tmap.Marker(new Tmap.LonLat("127.04724656694417","37.524162226778515").transform("EPSG:4326", "EPSG:3857"), icon);
markerWaypointLayer.addMarker(marker);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
var marker = new Tmap.Marker(new Tmap.LonLat("127.10887300128256","37.5289781669373").transform("EPSG:4326", "EPSG:3857"), icon);
markerWaypointLayer.addMarker(marker);

markerWaypointLayer2.clearMarkers();


// 4. 경로 탐색 API 사용요청
var startX = 127.02810900563199;
var startY = 37.519892712436906;
var endX = 127.13281976335786;
var endY = 37.52130314703887;
var passList = "127.04724656694417,37.524162226778515_127.10887300128256,37.5289781669373";
var prtcl;
var headers = {}; 
headers["appKey"]="발급appKey";
$.ajax({
		method:"POST",
		headers : headers,
		url:"https://apis.openapi.sk.com/tmap/routes?version=1&format=xml",//
		async:false,
		data:{
			startX : startX,
			startY : startY,
			endX : endX,
			endY : endY,
			passList : passList,
			reqCoordType : "WGS84GEO",
			resCoordType : "EPSG3857",
			angle : "172",
			searchOption : "0",
			trafficInfo : "Y" //교통정보 표출 옵션입니다.
		},
		success:function(response){
			prtcl = response;
		
		//5. 경로탐색 결과 Line 그리기
		//출발지,도착지 마커 제거
		markerStartLayer.clearMarkers();
		markerEndLayer.clearMarkers();
		//경유지 마커 제거
		markerWaypointLayer.clearMarkers();
						
		var trafficColors = {
				extractStyles:true,
				
				/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
				trafficDefaultColor:"#000000", //Default
				trafficType1Color:"#009900", //원할
				trafficType2Color:"#8E8111", //지체
				trafficType3Color:"#FF0000"  //정체
				
			};    
		var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
		routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
		routeLayer.addFeatures(kmlForm); 교통정보를 백터 레이어에 추가   
		
		map.addLayer(routeLayer); // 지도에 백터 레이어 추가
		
		markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
		map.addLayer(markerWaypointLayer2);
		
		var size = new Tmap.Size(24, 38);
		var offset = new Tmap.Pixel(-(size.w / 2), -size.h); 
		var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
		var marker = new Tmap.Marker(new Tmap.LonLat("127.07389565460413","37.5591696189164").transform("EPSG:4326", "EPSG:3857"), icon);
		markerWaypointLayer2.addMarker(marker);
		
		var size = new Tmap.Size(24, 38);
		var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
		var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
		var marker = new Tmap.Marker(new Tmap.LonLat("127.13346617572014", "37.52127761904626").transform("EPSG:4326", "EPSG:3857"), icon);
		markerWaypointLayer2.addMarker(marker);
		
		
		
		// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
		map.zoomToExtent(routeLayer.getDataExtent());
		
	},
	error:function(request,status,error){
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});




</script> 
	
	
	
</script>

<section id="content">
<div id="map_div">
 
 
 </div>
 
 <p id="result">요기는 Tmap조회 결과 들어갈 공간이에요!!!</p>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>