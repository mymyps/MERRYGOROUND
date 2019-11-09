<<<<<<< HEAD
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="지도로 찾기" />
</jsp:include>


<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.8);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid lightgray;margin:3px 0; margin-top:10px;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<section style="padding: 0px 0;">

<!--맵 div-->
<!-- <div class="map_wrap"> -->


<div id="map" style="width: 100%; height: 650px; position: relative; overflow: hidden;"></div>
	<!--왼쪽에 키워드검색&검색결과 하얀 박스 -->
	<div id="menu_wrap" class="bg_white">
        <div class="option">
        <h3>키워드 검색</h3>
            <div style="margin-top:10px;">
               <input type="text" value="" placeholder=" ex)강남역" id="keyword" size="20">
	   		   <button id="submit" class="btn" style="background-color:#EB9579;color:white;height:29.5px;margin-left:-3px;">검색</button>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div><!--왼쪽에 키워드검색&검색결과 하얀 박스 끝 -->
<!--     </div> -->
<!--     map_wrap끝 -->
    



<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>
<p id="result"></p>
<p id="result1"></p>
<p id="result2"></p>

<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=a70d9f47dd92a2c810ce5d8c69f6b406"></script>
<script>

/* 지도~*/
	var markers = [];
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
	    
	});

/* 접속위치를 받아오기 */
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {

	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
		lon = position.coords.longitude; // 경도

		var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;">너의위치는 여기란다</div>'; // 인포윈도우에 표시될 내용입니다
		
		var resultDiv1 = document.getElementById('result1');
		var resultDiv2 = document.getElementById('result2');
		
		resultDiv1.innerHTML = lat;
		resultDiv2.innerHTML = lon;

		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);

	});

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

	displayMarker(locPosition, message);
}
//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map : map,
		position : locPosition
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
	iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});

	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	markers.push(marker);
	map.setCenter(locPosition);
}

/* 이동된 위치 중심좌표 반환하기 */
// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'dragend', function() {

	// 지도 중심좌표를 얻어옵니다 
	var latlng = map.getCenter();

	var y = latlng.getLat();
	var x = latlng.getLng();

	/* var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
	message += '경도는 ' + latlng.getLng() + ' 입니다'; */
	
	var resultDiv1 = document.getElementById('result1');
	var resultDiv2 = document.getElementById('result2');

	resultDiv1.innerHTML = y;
	resultDiv2.innerHTML = x;
});


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});

/* 검색 버튼 클릭시!! 로직*/
$('#submit').click(function(){
	
	var keyword=$('#keyword').val();
	var y=$('#result1').html();
	console.log(y);
	var x=$('#result2').html();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/search/mapSearch",
		type : "post",
		data : {
			keyword : keyword,
			y : y,
			x : x
		},
		dataType : "JSON",
		success : function(data) {
			
			removeMarker();

			var positions = data;
			var pagination=Math.ceil(positions.length/5+positions.length%5*0.01);
			var cPage=1;
			if(positions.length==0){
				alert('반경 70km 이내에 검색결과가 없습니다.');
			}else{
				displayPlaces(data,cPage,pagination);
				
				displayPagination(data,cPage,pagination);
			}
			
		},

		error : function(data) {
		}

	})
})
function displayPlaces(places,cPage,pagination){
	
	var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
	
	// 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    
    for ( var i=0; i<places.length; i++ ) {
    	console.log('여기 들어오니?');

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].loc_y, places[i].loc_x);
        var startNo=(cPage-1)*5+1;
        var endNo=startNo+4;
         if(i>=startNo-1 && i<=endNo-1){
        	 var itemEl=getListItem(i, places[i]);
        } 
          // 검색 결과 항목 Element를 생성합니다

         /*    var coords = new kakao.maps.LatLng(places[0].loc_y,
            		places[0].loc_x);  */
					
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: placePosition // 마커를 표시할 위치
		    });
		    marker.setMap(map);
		    markers.push(marker); 
		    
		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
		    
		   (function(marker,title,addr,tel,pCode,placePosition){
			   kakao.maps.event.addListener(marker, 'click',
						function() {
				   var content = '<div style="padding:5px;z-index:1; width:300px;height:100px;">'
						   +'<p>'+title+'</p>'
						   +'<p>'+addr+'</p>'
						   +'<p>'+tel+'</p>'
						   +'<a href="<%=request.getContextPath()%>/search/detailView?pCode='+pCode+'&from=2019-19-24&to=2019-19-25"><button>예매하러가기</button></a>'
							+ '</div>';
					

			infowindow.setContent(content);
			infowindow.open(map, marker);
			map.setCenter(placePosition);
						});
			   if(i>=startNo-1 && i<=endNo-1){
			   itemEl.onclick =function() {
				   var content = '<div style="padding:5px;z-index:1; width:300px;height:100px;">'
					   +'<p>'+title+'</p>'
					   +'<p>'+addr+'</p>'
					   +'<p>'+tel+'</p>'
					   +'<a href="<%=request.getContextPath()%>/search/detailView?pCode='+pCode+'"><button>예매하러가기</button></a>'
						+ '</div>';
				

				infowindow.setContent(content);
				infowindow.open(map, marker);
				map.setCenter(placePosition);
				
	            };
			   }
		   })(marker,places[i].pName,places[i].pAddr,places[i].pTel,places[i].pCode,placePosition);
		    
/* 				    map.setCenter(coords); */
		if(i>=startNo-1 && i<=endNo-1){
        fragment.appendChild(itemEl);
		}
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.pName + '</h5>';

    
        itemStr += '    <span>' +  places.pAddr  + '</span>'; 

                 
      itemStr += '  <span class="tel">' + places.pTel  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(places,cPage,pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===cPage) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                	cPage=i;
                	displayPlaces(places,cPage,pagination);
                	displayPagination(places,cPage,pagination)
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
} 

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

</section>

=======
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="지도로 찾기" />
</jsp:include>


<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.8);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid lightgray;margin:3px 0; margin-top:20px;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
#submit {
background-color:#EB9579;
color:white;
position: relative;
right:10px;
height:30px;
}
</style>
<section style="padding: 0px 0;">
<div id="map" style="width: 100%; height: 650px; position: relative; overflow: hidden;"></div>
			 <div id="menu_wrap" class="bg_white">
        <div class="option">
               <div>
               <h3>키워드검색</h3>
					<input type="text" value="" placeholder=" ex) 테헤란로" id="keyword" size="25">
					<button id="submit" class="btn">검색</button>
				</div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>
<p id="result"></p>
<p id="result1"></p>
<p id="result2"></p>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a70d9f47dd92a2c810ce5d8c69f6b406"></script>
<script>

var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);


//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
  // 지도 중심좌표에 마커를 생성합니다 
  position: map.getCenter() 
}); 
//지도에 마커를 표시합니다
marker.setMap(map);

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
  
  // 클릭한 위도, 경도 정보를 가져옵니다 
  var latlng = mouseEvent.latLng; 
  
  // 마커 위치를 클릭한 위치로 옮깁니다
  marker.setPosition(latlng);
  
  var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
  message += '경도는 ' + latlng.getLng() + ' 입니다';
  
  var resultDiv = document.getElementById('clickLatlng'); 
  resultDiv.innerHTML = message;
  
});

/* 접속위치를 받아오기 */
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {

	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
		lon = position.coords.longitude; // 경도
		

		var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;"><h4>너의 위치는...</h4></div>'; // 인포윈도우에 표시될 내용입니다
		
		var resultDiv1 = document.getElementById('result1');
		var resultDiv2 = document.getElementById('result2');
		
		resultDiv1.innerHTML = lat;
		resultDiv2.innerHTML = lon;

		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);

	});

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

	displayMarker(locPosition, message);
}
//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map : map,
		position : locPosition
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
	iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});

	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	markers.push(marker);
	map.setCenter(locPosition);
}

/* 이동된 위치 중심좌표 반환하기 */
// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'dragend', function() {

	// 지도 중심좌표를 얻어옵니다 
	var latlng = map.getCenter();

	var y = latlng.getLat();
	var x = latlng.getLng();

	/* var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
	message += '경도는 ' + latlng.getLng() + ' 입니다'; */
	
	var resultDiv1 = document.getElementById('result1');
	var resultDiv2 = document.getElementById('result2');

	resultDiv1.innerHTML = y;
	resultDiv2.innerHTML = x;
});



// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});

/* 검색 버튼 클릭시!! 로직*/
$('#submit').click(function(){
	
	var keyword=$('#keyword').val();
	var y=$('#result1').html();
	console.log(y);
	var x=$('#result2').html();
	
	$.ajax({
		url:"${path}/search/mapSearchEnd",
		type : "post",
		data : {
			keyword : keyword,
			y : y,
			x : x
		},
		dataType : "JSON",
		success : function(data) {
			
			removeMarker();

			var positions = data;
			var pagination=Math.ceil(positions.length/5+positions.length%5*0.01);
			var cPage=1;
			if(positions.length==0){
				alert('반경 70km 이내에 검색결과가 없습니다.');
			}else{
				displayPlaces(data,cPage,pagination);
				
				displayPagination(data,cPage,pagination);
			}
			
		},

		error : function(data) {
		}

	});
});
function displayPlaces(places,cPage,pagination){
	
	var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
	
	// 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    
    for ( var i=0; i<places.length; i++ ) {
    	console.log('여기 들어오니?');

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].loc_y, places[i].loc_x);
        var startNo=(cPage-1)*5+1;
        var endNo=startNo+4;
         if(i>=startNo-1 && i<=endNo-1){
        	 var itemEl=getListItem(i, places[i]);
        } 
          // 검색 결과 항목 Element를 생성합니다

         /*    var coords = new kakao.maps.LatLng(places[0].loc_y,
            		places[0].loc_x);  */
					
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: placePosition // 마커를 표시할 위치
		    });
		    marker.setMap(map);
		    markers.push(marker); 
		    
		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
		    
		   (function(marker,title,addr,tel,pCode,placePosition){
			   kakao.maps.event.addListener(marker, 'click',
						function() {
				   var content = '<div style="padding:5px;z-index:1; width:300px;height:100px;">'
						   +'<p>'+title+'</p>'
						   +'<p>'+addr+'</p>'
						   +'<p>'+tel+'</p>'
						   +'<a href="<%=request.getContextPath()%>/search/detailView?pCode='+pCode+'&from=2019-19-24&to=2019-19-25"><button>예매하러가기</button></a>'
							+ '</div>';
					

			infowindow.setContent(content);
			infowindow.open(map, marker);
			map.setCenter(placePosition);
						});
			   if(i>=startNo-1 && i<=endNo-1){
			   itemEl.onclick =function() {
				   var content = '<div style="padding:5px;z-index:1; width:300px;height:100px;">'
					   +'<p>'+title+'</p>'
					   +'<p>'+addr+'</p>'
					   +'<p>'+tel+'</p>'
					   +'<a href="<%=request.getContextPath()%>/search/detailView?pCode='+pCode+'"><button>예매하러가기</button></a>'
						+ '</div>';
				

				infowindow.setContent(content);
				infowindow.open(map, marker);
				map.setCenter(placePosition);
				
	            };
			   }
		   })(marker,places[i].pName,places[i].pAddr,places[i].pTel,places[i].pCode,placePosition);
		    
/* 				    map.setCenter(coords); */
		if(i>=startNo-1 && i<=endNo-1){
        fragment.appendChild(itemEl);
		}
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.pName + '</h5>';

    
        itemStr += '    <span>' +  places.pAddr  + '</span>'; 

                 
      itemStr += '  <span class="tel">' + places.pTel  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(places,cPage,pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===cPage) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                	cPage=i;
                	displayPlaces(places,cPage,pagination);
                	displayPagination(places,cPage,pagination)
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
} 

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

</section>

>>>>>>> origin/lovewoney2
<jsp:include page="/WEB-INF/views/common/footer.jsp" />