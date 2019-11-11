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
      bottom:1px;
      height:29px;
      }
</style>
<section style="padding:0px 0;">

<div class="map_wrap">
<div id="map" style="width: 100%; height: 500px; position: relative; overflow: hidden;"></div>
      <div id="menu_wrap" class="bg_white">
        <div class="option">
        <form onsubmit="searchPlaces(); return false">
               <h1>키워드검색</h1>
               <input type="text" value="" placeholder=" ex) 테헤란로" id="keyword" size="25">
               <button type="submit" id="submit" class="btn">검색</button>
            </form>
        </div>
        <hr>
        <ul id="placesList"></ul>
<!--         <div id="pagination"></div> -->
    </div>
 </div> 
 
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a70d9f47dd92a2c810ce5d8c69f6b406"></script>
 <script>

   //기본값 저장
   var keyword;
   var pageNo;
   var totalPage;
   var num;
   var total;

// function Pagesearch(totalPage, total, blocksize, blockpage) {
//    displayPagination(totalPage, total, blocksize, blockpage);
//    if (keyword != '') {
//       $.ajax({
//          type : 'POST',
//          dataType : 'json',
//          data : {
//              'cPage' : blockpage,
//              'totalCount' : total,
//             'keyword' : keyword
//          },
//          url : '${path}/search/mapSearchEnd',
//          success : function(result) {
//             var search = result.map;
//          //   var search = result.list;
//             pageNo = result.cPage;
//             totalPage = result.totalCount;
//             displayPlaces(search);
//          },
//          error : function(error) {
//             console.log("키워드 정보가 없습니다.");
//          }
//       });
//    }
// }
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
   center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
   level : 3 // 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);


//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
//키워드로 장소를 검색합니다
searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {
   keyword = document.getElementById('keyword').value;
   if (!keyword.replace(/^\s+|\s+$/g, '')) {
        console.log('키워드를 입력해주세요!');
      return false;
    } 
//   else {
//       infowindow.close();
//       Searchkeyword(keyword);
//    }
// }

   // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
// function placesSearchCB(data, status, pagination) {
   function placesSearchCB(data, status) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
       // displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}


//========================================================
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
 {
     title: '카카오', 
     latlng: new kakao.maps.LatLng(33.450705, 126.570677)
 },
 
 {
     title: '생태연못', 
     latlng: new kakao.maps.LatLng(33.450936, 126.569477)
 },
 
 {
     title: '텃밭', 
     latlng: new kakao.maps.LatLng(33.450879, 126.569940)
 },
 
 {
     title: '근린공원',
     latlng: new kakao.maps.LatLng(33.451393, 126.570738)
 }
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
 
for (var i = 0; i < positions.length; i ++) {
 
 // 마커 이미지의 이미지 크기 입니다
 var imageSize = new kakao.maps.Size(24, 35); 
 
 // 마커 이미지를 생성합니다    
 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng, // 마커를 표시할 위치
     title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
     image : markerImage // 마커 이미지 
 });
}

//======================================================


var iwContent = '<div style="padding:5px;">ddd <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', 
// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다 

   // 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({
      content : iwContent,
      removable : true
   });




function Searchkeyword(keyword) {
   console.log(keyword);
   // 한페이지당 표시될 화면 계산
//    num = 1;
//    total = 15;
   keyword = keyword;
   // 디비값을 불러 지도에 뿌림
   $.ajax({
      type : 'POST',
      dataType : 'json',
      data : {
//          'pageNo' : num,
//          'pageSize' : total,
         'keyword' : keyword
      },
      url : '${path}/search/mapSearchEnd',
      success : function(result) {
         console.log(result);
         var search = result.map;
//           pageNo = result.cPage;
//           totalPage = result.totalCount;
         displayPlaces(search);
         keyword = document.getElementById('keyword').value;
         
      },
      error : function(error) {
        console.log("키워드 정보가 없습니다.");
         
      }
   });
} 

// 검색 결과 목록과 마커를 표출하는 함수입니다
//function displayPlaces(places) {
function displayPlaces(search) {
   console.log(search.length);
    var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
   
    // 검색 결과 목록에 추가된 항목들을 제거합니다
   removeAllChildNods(listEl);

   // 지도에 표시되고 있는 마커를 제거합니다
   removeMarker();

    for ( var i=0; i<search.length; i++ ) {

           // 마커를 생성하고 지도에 표시합니다
           var placePosition = new kakao.maps.LatLng(search[i].y, search[i].x),
               marker = addMarker(placePosition, i), 
               itemEl = getListItem(i, search[i]); // 검색 결과 항목 Element를 생성합니다

      // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
      // LatLngBounds 객체에 좌표를 추가합니다
      bounds.extend(placePosition);

               
               
      // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, search[i].infoupTitle);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, search) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + search.infoupTitle + '</h5>';

    if (search.road_address_name) {
        itemStr += '    <span>' + search.infoAddr + '</span>' +
                    '   <span class="jibun gray">' +  search.infoAddr + '</span>';
    } else {
        itemStr += '    <span>' + search.infoAddr  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + search.infoupPhone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}


//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}


//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
// function displayPagination(pagination) {
//     var paginationEl = document.getElementById('pagination'),
//         fragment = document.createDocumentFragment(),
//         i; 

//     // 기존에 추가된 페이지번호를 삭제합니다
//     while (paginationEl.hasChildNodes()) {
//         paginationEl.removeChild (paginationEl.lastChild);
//     }

//     for (i=1; i<=pagination.last; i++) {
//         var el = document.createElement('a');
//         el.href = "#";
//         el.innerHTML = i;

//         if (i===pagination.current) {
//             el.className = 'on';
//         } else {
//             el.onclick = (function(i) {
//                 return function() {
//                     pagination.gotoPage(i);
//                 }
//             })(i);
//         }

//         fragment.appendChild(el);
//     }
//     paginationEl.appendChild(fragment);
// }
     
           
       // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
          var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
      
          infowindow.setContent(content);
          infowindow.open(map, marker);
      }
      
       // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {   
          while (el.hasChildNodes()) {
              el.removeChild (el.lastChild);
          }
      }
                     
      
        var searchs = search[i];
      
      function panTo(searchs){
          // 이동할 위도 경도 위치를 생성합니다 
          var moveLatLon = new kakao.maps.LatLng(searchs.lat, searchs.lon);
          
          // 지도 중심을 부드럽게 이동시킵니다
          // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
          map.panTo(moveLatLon);            
      }
      // 마커와 검색결과 항목에 click 했을때
      // 해당 장소에 인포윈도우에 장소명을 표시합니다
      // 지도 click 했을 때는 인포윈도우를 닫습니다
            
      (function(marker, title, searchs) {
         
         daum.maps.event.addListener(marker, 'click', function() {
         
            displayInfowindow(marker, title, searchs);
            panTo(searchs);
            
         });

         daum.maps.event.addListener(map, 'click', function() {
            infowindow.close();
         });

         itemEl.onclick = function() {
            displayInfowindow(marker, title, searchs);
            panTo(searchs);
         };

         // itemEl.onclick = function() {
         // infowindow.close();
         // };
      })(marker, search[i], searchs);

      fragment.appendChild(itemEl);
   
   function removeMarker() {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
      }
      markers = [];
   }

   // 검색결과 항목들을 검색결과 목록 Elemenet에 추가합니다
   listEl.appendChild(fragment);
   menuEl.scrollTop = 0;

   displayPagination(totalPage, total, 10, 1);
   
   // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
   map.setBounds(bounds);


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, search, marker) {
      
   var el = document.createElement('li'), 
      itemStr = '<span class="markerbg marker_'
         + (index + 1)
         + '"></span>'
         + '<div class="info">'
         + '   <h3>'
         + search.infoupTitle + '</h3>';
   
//    if (search.road_address_name) {
      itemStr += '<span>' + search.infoAddr + '</span>'
            + '<span class="jibun gray">' + search.infoupPhone
            + '</span>';
//    } else {
//       itemStr += '<span>' + search.infoupAddr + '</span>';
//    }

//    itemStr += '<span class="tel">' + search.infoupPhone + '</span>'
//          + '</div>';

   el.innerHTML = itemStr;
   el.className = 'item';
   return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
   var imageSrc = '/hos/resources/images/ph.png', // 마커
   // 이미지
   // url,
   // 스프라이트
   // 이미지를
   // 씁니다
   imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
   imgOptions = {
//      spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
//      spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중
      // 사용할 영역의 좌상단
      // 좌표
      offset : new daum.maps.Point(13, 37)
   // 마커 좌표에 일치시킬 이미 내에서의 좌표지
   }, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new daum.maps.Marker(
         {
            position : position, // 마커의 위치
            image : markerImage,
            clickable : true
         });

   marker.setMap(map); // 지도 위에 마커를 표출합니다
   markers.push(marker); // 배열에 생성된 마커를 추가합니다

   return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
// function removeMarker() {
//    for (var i = 0; i < markers.length; i++) {
//       markers[i].setMap(null);
//    }
//    markers = [];
// }

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
// function displayPagination(totalCount, total, blocksize, pageNo) {

//    var paginationEl = document.getElementById('pagination');

//    paginationEl.innerHTML = "";
//    var totalpages = totalCount; // 총페이지수
//    var blockpage = 0; // 1,11,21,...각 블럭 들의 첫페이지 1~10 까지가 한블럭

   // 블럭의 첫번째 페이지 구하기
//    blockpage = Math.floor((pageNo - 1) / blocksize);
//    blockpage = blockpage * blocksize + 1;
   // 페이지리스트, blockpage++
//    for (i = 1; i <= blocksize; i++, blockpage++) {
      // 마지막 페이지와 같다면..
//       if (blockpage == totalpages)
//          i = blocksize + 1; // 다음차례에 for문 빠져나감
      // if (blockpage == pageNo)
      // paginationEl.insertAdjacentHTML("beforeEnd", " <span
      // style='cursor:default;'><b>"
      // + blockpage + "</b></span> ");
      // else
//       paginationEl.insertAdjacentHTML("beforeEnd",
//             " <span style='cursor:pointer;'" + "onClick='Pagesearch("
//                   + totalPage + "," + total + "," + blocksize + ","
//                   + blockpage + ")'>" + blockpage + "</span> ");
//    }

// }

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title, searchs) {
   
   var content =   
   '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            '+searchs.infoupTitle+'' + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="/hos/resources/images/ph.png" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+searchs.infoAddr+'</div>' + 
    '                <div class="jibun ellipsis">'+searchs.infoupPhone+'</div>' +
    '                <div><a href="" target="_blank" class="link">보러가기</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
    
    
 
    
//   // content의 내용을 인포윈도우에 등록
   infowindow.setContent(content);
   infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
   while (el.hasChildNodes()) {
      el.removeChild(el.lastChild);
   }
}



//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
   infowindow.close();   
}

</script> 
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />