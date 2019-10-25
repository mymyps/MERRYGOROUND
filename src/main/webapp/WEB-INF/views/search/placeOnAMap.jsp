<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Merry-go-round</title>
<meta name="description" content="">
<meta name="author" content="">

    <!--Tmap API관련   -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--appKey = 어쩌구 -> Tmap사이트에서 받은 고유키 입니당-->
    <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9b9bcfec-7c62-4c75-8854-04b5c8e68f51"></script>
    
    <script type="text/javascript">

 function initTmap(){
     var map = new Tmap.Map({
         div:'map_div',  // 결과 지도를 표시할 곳 입니당
         width : "50%",  // 가로와 세로 사이즈는 픽셀로 적을 수도 있고
         height : "50%", // 퍼센트로 적을 수도 있어용 (tmap홈페이지 예제는 픽셀로 되어 있음!!!!!)
     });
   
     // 경로 탐색 출발지점과 도착 지점의 좌표
     // 구글 지도에서 나오는 좌표의 x, y를 바꾸면 된다.
     // 구글 지도와 x,y 좌표 반대로 적어야함..........ㅎ 
     var startX = 127.104997;
     var startY = 37.220800;
     var endX = 127.028131;
     var endY = 37.239072;
     var passList = null;
     var prtcl;
     var headers = {};

     headers["appKey"]="9b9bcfec-7c62-4c75-8854-04b5c8e68f51"; //Tmap홈페이지에서 받은 인증키!!
   
     $.ajax({
         method:"POST",
         headers : headers,
         url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",
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
             trafficInfo : "Y" //교통정보 표출 옵션입니당!
         },

         success:function(response){ //API가 제대로 작동할 경우 실행될 코드
             prtcl = response;

             // 결과 출력 부분 - 여기는 잘 모르겠음.
             var innerHtml ="";
             var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String
             xmlDoc = $.parseXML( prtclString ),
             $xml = $( xmlDoc ),
             $intRate = $xml.find("Document");

             var tDistance = " 총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
             var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";
             var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";
             var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";

             $("#result").text(tDistance+tTime+tFare+taxiFare);

             // 실시간 교통정보 추가
             var trafficColors = {
                 extractStyles:true,
                 /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
                 trafficDefaultColor:"#000000", //Default
                 trafficType1Color:"#009900", //원활
                 trafficType2Color:"#8E8111", //지체
                 trafficType3Color:"#FF0000", //정체
             };    
             var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
             routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
             routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   

             map.addLayer(routeLayer); // 지도에 백터 레이어 추가

             // 경로탐색 결과 반경만큼 지도 레벨 조정
             map.zoomToExtent(routeLayer.getDataExtent());
         },
         error:function(request,status,error){ // API가 제대로 작동하지 않을 경우
         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
     });
 }
 </script>
 
  <script type="text/javascript">
			function initTmap(){
				var map = new Tmapv2.Map("map_div",  
				{
					center: new Tmapv2.LatLng(37.566481622437934,126.98502302169841), // 지도 초기 좌표
					width: "890px", 
					height: "400px",
					zoom: 15
				});
			} 
		</script>



	<!-- Mobile Specific Metas
	================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Favicons
	================================================== -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
	
	<link rel="icon" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-32x32.png" type="image/x-icon" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-144x144.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-72x72.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-54x54.png">

	
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!-- 	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 	crossorigin="anonymous"></script> -->
	
	<!-- Javascript Files ================================================== -->

	<!-- initialize jQuery Library -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<!-- Bootstrap jQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- Style Switcher -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/style-switcher.js"></script>
	<!-- Owl Carousel -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/owl.carousel.js"></script>
	<!-- PrettyPhoto -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.prettyPhoto.js"></script>
	<!-- Bxslider -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<!-- CD Hero slider -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/cd-hero.js"></script>
	<!-- Isotope -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/isotope.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ini.isotope.js"></script>
	<!-- Wow Animation -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/wow.min.js"></script>
	<!-- SmoothScroll -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/smoothscroll.js"></script>
	<!-- Eeasing -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<!-- Counter -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.counterup.min.js"></script>
	<!-- Waypoints -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/waypoints.min.js"></script>
	<!-- Template custom -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/custom.js"></script>
	
	
	<!-- Body inner end 요기 div 쪼끔 문제있음 -->
	
	<!-- CSS
	================================================== -->

	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	<!-- Template styles-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
	<!-- Responsive styles-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
	<!-- FontAwesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.css">
	<!-- Animation -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
	<!-- Prettyphoto -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flexslider.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cd-hero.css">
	<!-- Style Swicther -->
	<link id="style-switch" href="${pageContext.request.contextPath }/resources/css/presets/preset3.css" media="screen" rel="stylesheet" type="text/css">
</head>

<body onload="initTmap()">
	<div class="body-inner">
		<!-- Header start -->
		<header id="header" class="navbar-fixed-top header" role="banner">
			<div class="container">
				<div class="row">
					<!-- Logo start -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- 로고 이미지 들어갈 자리  -->
						<div class="navbar-brand navbar-bg">
							<a href="${pageContext.request.contextPath }">
								<img class=" img-responsive" src="${pageContext.request.contextPath }/resources/images/logo.png" alt="logo">
							</a>
						</div>
					</div>
					<!--/ Logo end -->
					
					<nav class="collapse navbar-collapse clearfix" role="navigation">
						<ul class="nav navbar-nav navbar-right">
							

							<!-- 마이페이지(로그인 후 이용가능) -->
							<li class="dropdown active">
								<a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">Login <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="${pageContext.request.contextPath }">로그인</a></li>
										<li><a href="${pageContext.request.contextPath }">회원가입</a></li>
										<li><a href="${pageContext.request.contextPath }">아이디찾기</a></li>
										<li><a href="${pageContext.request.contextPath }">비밀번호찾기</a></li>
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">Mypage <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="portfolio-classic.html">Portfolio Classic</a></li>
										<li><a href="portfolio-static.html">Portfolio Static</a></li>
										<li><a href="portfolio-item.html">Portfolio Single</a></li>
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="team.html">Our Team</a></li>
										<li><a href="about2.html">About Us - 2</a></li>
										<li><a href="service2.html">Services - 2</a></li>
										<li><a href="service-single.html">Services Single</a></li>
										<li><a href="pricing.html">Pricing Table</a></li>
										<li><a href="404.html">404 Page</a></li>
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Supporters <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="blog-rightside.html">Blog with Sidebar</a></li>
										<li><a href="blog-item.html">Blog Single</a></li>
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">CouplePage <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="typography.html">Typography</a></li>
										<li><a href="elements.html">Elements</a></li>
									</ul>
								</div>
							</li>
							<li><a href="${pageContext.request.contextPath}">Contact</a></li>
						</ul>
					</nav>
					<!--/ Navigation end -->
				</div>
				<!--/ Row end -->
			</div>
			<!--/ Container end -->
		</header>
		<!--헤더 끝!!!!!!!!!!!!! -->

       
        <!--공통 배너  -->
        <div id="ban" class="ban">
		<div id="banner-area">
			<img src="${pageContext.request.contextPath }/resources/images/banner/banner4.jpg" />
			<div class="parallax-overlay"></div>
		
				<div class="banner-title-content">
					<div class="text-center">
						<h2>${param.pageTitle }</h2>
						
					  </div>
				  </div>
		</div>
	</div>
	</div>
	
 
 <section>
 
 <div id="map_div">
 
 
 </div>
 
 <p id="result">요기는 Tmap조회 결과 들어갈 공간이에요!!!</p>
 
 </section>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>