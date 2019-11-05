<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="테마별 데이트 코스"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<style>


</style>

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
			              <li>
			                  <a class="animated fadeIn" data-toggle="tab">
			                      <span class="tab-icon"><i class="fa fa-info"></i></span>
			                      <div class="tab-info">
			                         <h3><a href="${path}/search/mainThemaList?themaNumRef=1" id="themenameBrown">먹거리</a></h3>
			                    </div>
			                  </a>
			              </li>
		               <li>
                           <a class="animated fadeIn" data-toggle="tab">
		                       <span class="tab-icon"><i class="fa fa-briefcase"></i></span>
		                       <div class="tab-info">
		                          <h3><a href="${path}/search/mainThemaList?themaNumRef=7" id="themenameBrown">놀거리</a></h3>
		                      </div>
		                   </a>
		              </li>
			             <li>
		                  <a class="animated fadeIn" data-toggle="tab">
		                      <span class="tab-icon"><i class="fa fa-android"></i></span>
		                      <div class="tab-info">
		                       <h3><a href="${path}/search/mainThemaList?themaNumRef=13" id="themenameBrown">카페/술</a></h3>
		                      </div>
		                  </a>
			            </li>
			       </ul>

				<!-- 메인 테마 메뉴 바 끝-->
			
				<!-- 테마별 리스트 DIV시작 -->
				   
    
				<div class="tab-content col-md-9 col-sm-7">
             	<!--오른쪽 상단 side thema 선택 메뉴 시작 -->
             	<!--메인테마가 먹거리 일 때  -->
             	<c:if test="${1 eq param.themaNumRef}">
             	<div class="row text-center"> 
						<div class="isotope-nav" data-isotope-nav="isotope">
							<ul id="subThemaUl">
								<li><a href="${path}/search/mainThemaList?&themaNumRef=1" class="active">전체보기</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=2&themaNumRef=1">한식</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=3&themaNumRef=1">일식</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=4&themaNumRef=1">양식</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=5&themaNumRef=1">아시안푸드</a></li>
							
							</ul>
						</div>
					</div>
			   </c:if>
            	<c:if test="${7 eq param.themaNumRef}">
				<div class="row text-center">
					<div class="isotope-nav" data-isotope-nav="isotope">
						<ul id="subThemaUl">
							<li><a href="${path}/search/mainThemaList?themaNumRef=7" class="active">전체보기</a></li>
							<li><a href="${path}/search/subThemaList?themaNum=8&themaNumRef=7">실내데이트</a></li>
							<li><a href="${path}/search/subThemaList?themaNum=9&themaNumRef=7">야외데이트</a></li>
							<li><a href="${path}/search/subThemaList?themaNum=10&themaNumRef=7">산책코스</a></li>
							<li><a href="${path}/search/subThemaList?themaNum=11&themaNumRef=7">연극/공연</a></li>
							<li><a href="${path}/search/subThemaList?themaNum=12&themaNumRef=7">마사지</a></li>
						</ul>
					</div>
				</div>
				</c:if>
                 <c:if test="${13 eq param.themaNumRef}">
					<div class="row text-center">
						<div class="isotope-nav" data-isotope-nav="isotope">
							<ul id="subThemaUl">
								<li><a href="${path}/search/mainThemaList?themaNumRef=13" class="active">전체보기</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=14&themaNumRef=13">칵테일/펍</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=15&themaNumRef=13">달다구리</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=16&themaNumRef=13">포토존</a></li>
								<li><a href="${path}/search/subThemaList?themaNum=17&themaNumRef=13">공부존</a></li>
							</ul>
						</div>
					  </div>
					</c:if>
	<!--오른쪽 상단 side thema 선택 메뉴 끝 -->
		  
		  <!-- list 출력 시작  -->
	     	     <c:forEach items="${list}" var="list">
                    		<div class="row" id="themarow2">
						<div class="col-md-8 ts-padding2 themaContent">
							<h3 style="margin-top: -2px;">
							<a href="${pageContext.request.contextPath }/info/infoView.do?infoupNum=${list.infoupNum }"><c:out value='${list.infoupTitle}'/></a>
							</h3>
							<p>이용시간 : <c:out value='${list.infoupTime}'/> / 전화번호 : <c:out value='${list.infoupPhone}'/></p>
							<hr style="height: 0.5px; background-color: rgb(214, 206, 194);" >
							<p><strong><c:out value='${list.localCity}'/></strong><p>
							</div>
							<div class="col-md-4 ts-padding about-img" >
<%-- 							<img class="listImg" src="${list.fileReName}" alt="이미지 준비중"> --%>
                             <img class="listImg" src="${path}/resources/images/banpo.JPG" alt="이미지 준비중">
						</div>
					</div>
					<br>
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

<script>


</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />