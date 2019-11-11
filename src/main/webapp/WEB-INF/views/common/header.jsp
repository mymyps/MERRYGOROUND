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

   <!-- Mobile Specific Metas ================================================== -->
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

   <!-- Favicons================================================== -->
   <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"></script>
   <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"></script>
   
   <link rel="icon" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-32x32.png" type="image/x-icon" />
   <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-144x144.png">
   <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-72x72.png">
   <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/img/favicon/favicon-54x54.png">

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
   <%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/smoothscroll.js"></script> --%>
   <!-- Eeasing -->
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
   <!-- Counter -->
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.counterup.min.js"></script>
   <!-- Waypoints -->
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/waypoints.min.js"></script>
   <!-- Template custom -->
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/custom.js"></script>
   
   <!-- CSS  ================================================== -->

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
                  <div class="navbar-brand navbar-bg">
                     <a href="${pageContext.request.contextPath }">
                        <img class=" img-responsive" src="${pageContext.request.contextPath }/resources/images/logo.png" alt="logo">
                     </a>
                  </div>
               </div>
               <!--/ Logo end -->
               
               <nav class="collapse navbar-collapse clearfix" role="navigation">
                  <ul class="nav navbar-nav navbar-right">
                    
                     <!--로그인 -->
                     <c:if test="${empty loginMember}">
                     <li class="dropdown active">
                        <a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">Login <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                           <ul>
                              <li><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></li>
                              <li><a href="${pageContext.request.contextPath }/member/signup.do">회원가입</a></li>
                              <li><a href="${pageContext.request.contextPath }/member/searchid.do">아이디 찾기</a></li>
                              <li><a href="${pageContext.request.contextPath }/member/searchpw.do">비밀번호찾기</a></li>
                           </ul>
                        </div>
                     </li>
                     </c:if>
                     <c:if test="${not empty loginMember}">
                        <li class="dropdown active">
                        <a href="${pageContext.request.contextPath }" class="dropdown-toggle" data-toggle="dropdown">${loginMember.id}님 반가워요:) <i
                              class="fa fa-angle-down"></i></a>
                        <div class="dropdown-menu">
                           <ul>
                                 <li><a href="${pageContext.request.contextPath }/sign/mypage.do?mNo=${loginMember.memberNum}">마이페이지</a>
                              <li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
                           </ul>
                        </div>
                     </li>
                     </c:if>
                     <c:if test="${loginMember==null }">
	                     <li class="dropdown">
	                           <div class="dropdown-menu">
	                           <ul>
	                              <li><a href="portfolio-static.html">로그인후 이용가능</a></li>
	                           </ul>
	                        </div>
                     	</li>
                     </c:if>
                    
                     <!--관리자페이지 -->
                     <c:if test="${loginMember.id eq 'admin'}">
                     <li class="dropdown">
                     <li>
                        <a href="${pageContext.request.contextPath }/admin/adminMain">Admin</a>
                     </li>
                     </c:if>
                    
                 <!--서포터즈페이지 -->
                <li class="dropdown">
                   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Supporters <i class="fa fa-angle-down"></i></a>
                    <c:if test="${loginMember.memberLevel eq 2}">
                     <div class="dropdown-menu">
                      <ul>
                       <li><a href="${pageContext.request.contextPath }/supLv/supLvForm.do?id=${loginMember.id}">서포터즈 신청</a>
                       <li><a href="${pageContext.request.contextPath }/info/infoForm.do?mNum=${loginMember.memberNum}">인포메이션 작성</a></li>
                      </ul>
                     </div>
                     </c:if>
                     <c:if test="${loginMember.memberLevel ==0 }">
                     	<div class="dropdown-menu">
	                      <ul>
	                         <!-- <li><h2>관리자</h2></li> -->
	                      </ul>
	                   </div>
                     </c:if>
                     <c:if test="${loginMember.memberLevel ==1}">
	                   <div class="dropdown-menu">
	                      <ul>
	                         <li><a href="${pageContext.request.contextPath }/supLv/supLvForm.do?id=${loginMember.id}">서포터즈 신청</a>
	                      </ul>
	                   </div>
                    </c:if>
                    <c:if test="${loginMember == null}">
                    <div class="dropdown-menu">
	                      <ul>
	                         <li><a href="${pageContext.request.contextPath }/supLv/supLvForm.do?id=${loginMember.id}">서포터즈 신청</a>
	                      </ul>
	                   </div>
                    </c:if>
                    </li>
                     
                      <!--커플페이지 -->
                      <li class="dropdown">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown">CouplePage <i class="fa fa-angle-down"></i></a>
                           <div class="dropdown-menu">
                              <c:if test='${empty loginMember}'>
                                 <ul>
                                    <li><a>로그인 후 커플을 신청하세요!</a></li>
                                 </ul>
                              </c:if>
                            <c:if test="${not empty loginMember and fn:trim(loginMember.cpstatus) == 1}">
                              <ul>
                                 <li><a href="${pageContext.request.contextPath }/couple/coupleBoardList?mNum=${loginMember.memberNum}">커플게시판</a></li>
                              </ul>
                           </c:if>
                           </div>
                        </li>
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
   