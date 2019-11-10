<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/lib/datatable/dataTables.bootstrap.min.css">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

<style>
#weatherWidget .currentDesc {
	color: #ffffff !important;
}

.traffic-chart {
	min-height: 335px;
}

#flotPie1 {
	height: 150px;
}

#flotPie1 td {
	padding: 3px;
}

#flotPie1 table {
	top: 20px !important;
	right: -10px !important;
}

.chart-container {
	display: table;
	min-width: 270px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#flotLine5 {
	height: 105px;
}

#flotBarChart {
	height: 150px;
}

#cellPaiChart {
	height: 160px;
}

.facolor{
	color: navajowhite;
}

.facolor:hover,
.facolor:focus{
	color: mediumturquoise;
}

</style>

<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>

<section id="content">

	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath }/admin/adminMain"><i
							class="menu-icon fa fa-laptop"></i>Main Dashboard </a></li>
					<li class="menu-title">게시글 관리</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-list-alt"></i>게시글
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-indent"></i> <a href="${pageContext.request.contextPath }/admin/board">게시글
									목록</a></li>
							<li><i class="fa fa-camera-retro"></i> <a
								href="${pageContext.request.contextPath }/admin/supBoard">서포터즈 리뷰글</a></li>

						</ul></li>
					<li class="menu-title">사용자 관리</li>
					<!-- /.menu-title -->

					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-star-o"></i>서포터즈</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-star"></i><a href="${pageContext.request.contextPath }/admin/supportersList">서포터즈
									목록</a></li>
							<li><i class="fa fa-krw"></i><a href="${pageContext.request.contextPath }/admin/supportersPay">상금
									목록</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath }/admin/users"> <i
							class="menu-icon fa fa-github-alt"></i>이용자
					</a></li>

					<li class="menu-title">추가 관리</li>
					<!-- /.menu-title -->
					<li class="menu-item-has-children dropdown icon-container"><a
						href="#" class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-compass"> </i>지역/테마
					</a>
						<ul class="sub-menu children dropdown-menu">
							<!-- <li><i class="menu-icon fa fa-plane"></i><a href="#">지역</a></li> -->
							<li><i class="menu-icon fa fa-flag"></i><a
								href="${pageContext.request.contextPath }/admin/location">세부지역</a></li>
							<li><i class="menu-icon fa fa-paper-plane"></i><a
								href="${pageContext.request.contextPath }/admin/thema">테마</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath }/admin/celtify"> <i
							class="menu-icon fa fa-exclamation"></i>승인
					</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/notice"> <i
							class="menu-icon fa fa-stethoscope"></i>공지 사항목록
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header" style="background-color:#EB9579; height:66px;">
			<div class="top-left">
				<div class="navbar-header" style="background-color:#EB9579;">
					<div class="navbar-brand navbar-bg" style="width:130px;">
                     <a href="${pageContext.request.contextPath }">
                        <img class=" img-responsive" style="max-width:161; padding-top:3px" 
                        src="${pageContext.request.contextPath }/resources/images/logo.png" alt="logo">
                     </a>
                  	
					</div>
					<a id="menuToggle" class="menutoggle"><i class="fa fa-bars facolor"></i></a>
				</div>
			</div>
					<p style="text-align: right; color:antiquewhite; padding-top:16px; font-size:27px">
					ADMINISTRATOR
					<a href="#">logout</a>
					</p>
		</header>
		<!-- /#header -->