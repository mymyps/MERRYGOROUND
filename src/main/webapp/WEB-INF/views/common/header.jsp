<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Merry-go-round</title>
<meta name="description" content="">
<meta name="author" content="">
   
   

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

   
<!--    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!--    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!--    crossorigin="anonymous"></script> -->
   
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
   </div><!-- Body inner end -->
   
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

<body>
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
                     <c:if test="${empty loginMember}">
                     <li class="dropdown active">
                        <a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">Login <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                           <ul>
                              <li><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></li>
                              <li><a href="${pageContext.request.contextPath }/member/signup.do">회원가입</a></li>
                              <%-- <li><a href="${pageContext.request.contextPath }">dd</a></li> --%>
                              <li><a href="${pageContext.request.contextPath }/member/searchpw.do">비밀번호찾기</a></li>
                              
                           </ul>
                        </div>
                     </li>
                     </c:if>
                     <c:if test="${not empty loginMember }">
                        <li class="dropdown active">
                        <a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">${loginMember.id} 님 ㅎㅇ <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                           <ul>
                              <li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
                           </ul>
                        </div>
                     </li>
                     </c:if>
                     <li class="dropdown">
                        <a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">Mypage <i
                              class="fa fa-angle-down"></i></a>
                        <c:if test="${loginMember==null }">
                           <div class="dropdown-menu">
                           <ul>
                              <li><a href="portfolio-static.html">로그인후 이용가능</a></li>
                           </ul>
                        </div>
                        </c:if>
                        <%-- <c:if test="${loginMember!=null }">
                        <div class="dropdown-menu">
                           <ul>
                              <li><a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">개인정보수정</a></li>
                              <li><a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">내 작성글 보기</a></li>
                              <li><a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">커플요청</a></li>
                              <li><a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">비밀번호 변경</a></li>
                           </ul>
                        </div>
                        </c:if> --%>
                     </li>
                     <li class="dropdown">
                     <li>
                        <a href="${pageContext.request.contextPath }/admin/adminMain">Admin</a>
                        <%-- <a href="${pageContext.request.contextPath }/admin/adminMain" class="dropdown-toggle" data-toggle="dropdown">Admin <i
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
                        </div> --%>
                     </li>
                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Supporters <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                        
                           <ul>
                           		<li><a href="${pageContext.request.contextPath }/supLv/supLvForm.do?id=${loginMember.id}">서포터즈 신청</a>
								<li><a href="${pageContext.request.contextPath }/info/infoForm.do?mNum=${loginMember.memberNum}">infoForm 임의연결</a></li>
								<li><a href="${pageContext.request.contextPath }/info/infoView.do">infoView 임의연결</a></li>
                           </ul>
                        </div>
                     </li>
                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">CouplePage <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                           <ul>
                              <li><a href="${pageContext.request.contextPath }/couple/coupleBoardList">커플게시판</a></li>
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