<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="테마별 데이트코스" />
</jsp:include>

<section id="main-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12 heading">
				<span class="title-icon classic pull-left"><i
					class="fa fa-suitcase"></i></span>
				<h2 class="title classic">THEMA LIST</h2>
			</div>
		</div>
		<!-- Title row end -->
		
		<!--메인 테마 메뉴 바 시작-->
		<div class="row">
			<div class="landing-tab clearfix">
				<ul class="nav nav-tabs nav-stacked col-md-3 col-sm-5">
				    <!--먹거리-->
					<li class="active">
					<a class="animated fadeIn" href="${path}/search/themaList?${param.themaNum}=100&${param.level}=1" data-toggle="tab"> 
					<span class="tab-icon"><i class="fa fa-info"></i></span>
					 <div class="tab-info">
						<h3>먹거리</h3>
					 </div>
					</a>
					</li>
			     
			        <!--놀거리-->
					<li>
					<a class="animated fadeIn" href="${path}/search/themaList?${param.themaNum}=200&${param.level}=1" data-toggle="tab">
					<span class="tab-icon"><i class="fa fa-briefcase"></i></span>
					 <div class="tab-info">
						<h3>놀거리</h3>
					 </div>
					</a>
					</li>
					
				    <!--카페/술-->
					<li>
					<a class="animated fadeIn" href="${path}/search/themaList?${param.themaNum}=300&${param.level}=1" data-toggle="tab">
					<span class="tab-icon"><i class="fa fa-android"></i></span>
					 <div class="tab-info">
						<h3>카페/술</h3>
					 </div>
					</a></li>
				</ul>
				<!-- 메인 테마 메뉴 바 끝-->

				<!-- 테마별 리스트 DIV시작 -->

				<div class="tab-content col-md-9 col-sm-7">
				
				
             
             	<!--오른쪽 상단 side thema 선택 메뉴 시작 -->
             	<c:choose>
             	
                <!--메인테마가 먹거리 일 때  -->
             	<c:when test="${param.themaNum==100}">
					<div class="row text-center">
						<div class="isotope-nav" data-isotope-nav="isotope">
							<ul>
								<li><a href="${path}/search/themaList?${param.themaNum}=100&${param.level}=1" class="active">전체보기</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=101&${param.level}=2">한식</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=102&${param.level}=2">일식</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=103&${param.level}=2">양식</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=104&${param.level}=2">아시안푸드</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=105&${param.level}=2">중식</a></li>
							</ul>
						</div>
					</div>
					</c:when>
					
			    <!--메인테마가 놀거리 일 때  -->
             	<c:when test="${param.num==200}">
					<div class="row text-center">
						<div class="isotope-nav" data-isotope-nav="isotope">
							<ul>
								<li><a href="${path}/search/themaList?${param.themaNum}=200&${param.level}=1" class="active">전체보기</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=201&${param.level}=2">실내데이트</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=202&${param.level}=2">야외데이트</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=203&${param.level}=2">산책코스</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=204&${param.level}=2">연극/공연</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=205&${param.level}=2">마사지</a></li>
							</ul>
						</div>
					</div>
					</c:when>
					
				<!--메인테마가 카페/술 일 때  -->
             	<c:when test="${param.num==300}">
					<div class="row text-center">
						<div class="isotope-nav" data-isotope-nav="isotope">
							<ul>
								<li><a href="${path}/search/themaList?${param.themaNum}=300&${param.level}=1" class="active">전체보기</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=301&${param.level}=2">칵테일/펍</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=302&${param.level}=2">달다구리</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=303&${param.level}=2">포토존</a></li>
								<li><a href="${path}/search/themaList?${param.themaNum}=304&${param.level}=2">공부존</a></li>
							</ul>
						</div>
					  </div>
					</c:when>
				</c:choose>
					<!--오른쪽 상단 side thema 선택 메뉴 끝 -->

					  
					  
		  <!-- list 출력 시작  -->
		
		     <c:forEach items="${list}" var="list">
                    		<div class="row" id="themarow">
						<div class="col-md-8 ts-padding themaContent">
							<h3 style="margin-top: -2px;">
							<a href="${path}주미꺼controller?${list.themaNum}=${list.supupnum}" id="themenameBrown">${list["SUPUPTITLE"]}</a>
							</h3>
							<p>${list.supupcontent}</p>
							<hr style="height: 0.5px; background-color: rgb(214, 206, 194);" >
							<p><strong>${list.supuplocation }</strong><p>
							</div>
							<div class="col-md-4 ts-padding about-img" >
							<img class="listImg" src="${list.filerename}" alt="이미지 준비중">
						</div>
					</div><!--/ Content row end -->
			</c:forEach>
	
		<!-- list 출력 끝 -->

			
					<!-- 테마별 리스트 DIV 끝 -->

    				<div class="paging2">
						<ul class="pagination">
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- tab content -->
			</div>
			<!-- Overview tab end -->
		</div>
		<!--/ Content row end -->
	</div>
	<!--/ 1st container end -->
	<div class="gap-60"></div>
</section>
<!--/ Main container end -->
<div class="gap-40"></div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />