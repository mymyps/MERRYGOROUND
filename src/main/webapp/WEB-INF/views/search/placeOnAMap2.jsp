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

	//마커 표시하기 
	var marker = new Tmapv2.Marker({
		position: new Tmapv2.LatLng(37.566481622437934,126.98502302169841),
		map: map
	});	
	
	//선 그리기 
    var polyline = new Tmapv2.Polyline({
        path: [new Tmapv2.LatLng(37.566381,126.985123),
        	new Tmapv2.LatLng(37.566581,126.985123),
        	new Tmapv2.LatLng(37.566381,126.985273),
        	new Tmapv2.LatLng(37.566581,126.985423),
        	new Tmapv2.LatLng(37.566381,126.985423)],
        strokeColor: "#dd00dd",
        strokeWeight: 6,
        map: map
    });
	
	//다각형 그리기 
	   var polygon = new Tmapv2.Polygon({
        paths: [new Tmapv2.LatLng(37.566610,126.985666),
            new Tmapv2.LatLng(37.566595,126.985985),
            new Tmapv2.LatLng(37.566512,126.986071),
            new Tmapv2.LatLng(37.566397,126.985894),
            new Tmapv2.LatLng(37.566395,126.985664)],
        fillColor:"pink",
        draggable: true,
        map: map
    });
	
	} 
	
	
	
</script>

<section id="content">
<div id="map_div">
 
 
 </div>
 
 <p id="result">요기는 Tmap조회 결과 들어갈 공간이에요!!!</p>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>