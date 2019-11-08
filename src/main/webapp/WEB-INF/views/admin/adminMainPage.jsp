<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:param name="관라자페이지" value="adminMainPage" />
</jsp:include> --%>

<!-- 관리자 페이지 css -->
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />

<!-- 캘린더 시간만 감추기 -->
<style>
	.fc-time {
    display:none;
	}
</style>
		<!-- ---------------------------------------------------------------------------- -->
		<!-- -------------------------     데이터      ------------------------------------ -->
		<!-- ---------------------------------------------------------------------------- -->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- Widgets  -->
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five link01">
									<div class="stat-icon dib flat-color-1">
										<i class="pe-7s-browser"></i>
										<!-- <i class="pe-7s-cash"></i> -->
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count"><c:out value="${topResult }"/></span>
											</div>
											<div class="stat-heading">게시글수</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five link02">
									<div class="stat-icon dib flat-color-2">
										<i class="fa fa-users"></i>
										<!-- <i class="pe-7s-cart"></i> -->
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count"><c:out value="${topSupporters }"/></span>
											</div>
											<div class="stat-heading">서포터즈</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five link03">
									<div class="stat-icon dib flat-color-3">
										<i class="pe-7s-users"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count"><c:out value="${topSupStatus }"/></span>
											</div>
											<div class="stat-heading">신청</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="card">
							<div class="card-body">
								<div class="stat-widget-five link04">
									<div class="stat-icon dib flat-color-4">
										<i class="ti-link"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count"><c:out value="${topCouple }"/></span>
											</div>
											<div class="stat-heading">커플</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Widgets -->
				<!-- 그래프 추가 -->

				<div class="animated fadeIn">
					<div class="row">
						<!-- 테이블 1 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">게시글 추천(Top5)</strong>
								</div>
								<div class="table-stats order-table ov-h">
									<table class="table ">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">제목</th>
												<th scope="col">번호</th>
												<th scope="col">날짜</th>
												<th scope="col">*</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${uploadTop5 }" var="up" varStatus="i">
											<tr>
												<fmt:parseNumber var="test" value="${up['ravg'] }" integerOnly="true"/>
												<td scope="row"><c:out value="${i.count }"/></td>
												<td class="serial"><c:out value="${up['INFOUPTITLE'] }"/></td>
												<td><span class="name"><c:out value="${up['INFOUPNUM'] }"/></span></td>
												<td><span class="product"><fmt:formatDate value="${up['INFOUPDATE'] }" pattern="yyyy.MM.dd"/></span></td>
												<td><span class="count"> <fmt:formatNumber value="${test}" pattern=".00"/> </span></td>
											</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<!-- /.table-stats -->
							</div>
						</div>
						<!-- 테이블 2 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">서포터즈 상금(Top5)</strong>
								</div>
								<div class="table-stats order-table ov-h">
									<table class="table ">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">서포터번호</th>
												<th scope="col">서포터등급</th>
												<th scope="col">포상금</th>
											</tr>
										</thead>
										<tbody>
										<!-- supPayMain5 -->
											<c:forEach items="${supPayMain5 }" var="sp" varStatus="i">
											<tr>
												<fmt:parseNumber var="test" value="${sp['rsum'] }" integerOnly="true"/>
												<td scope="row"><c:out value="${i.count }"/></td>
												<td class="serial"><c:out value="${sp['SUPNUM'] }"/></td>
												<td><span class="name"><c:out value="${sp['SUPLEVEL'] }"/></span></td>
												<td><span class="count"><fmt:formatNumber value="${test}" pattern="#########"/></span></td>
												
											</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<!-- /.table-stats -->
							</div>
						</div>
					</div>


				</div>

				<!-- 그래프 추가 끝 -->
				<!--  Traffic  -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card animated fadeIn">
							<div class="card-body">
								<h4 class="box-title"></h4>
							</div>
							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-6">
									<div class="card">
										<div class="card-body">
											<h4 class="mb-3">업로드 글</h4>
											<div id="morrisBars"></div>
										</div>
									</div>
								</div>
								<!-- /# column -->
								<!-- bg-flat-color-1 -->
								<div class="col-lg-4">
									<div class="card-body">
										<div class="progress-box progress-1">
											<!-- mainThema - (list) -->
											<h4 class="por-title">테마별 조회(Thema)</h4>
											<c:set var = 'rto' value="${rto }"/>
											<c:forEach items="${mainThema }" var="t" varStatus="i">
											<div class="por-txt"><c:out value="${t['THEMANAME'] }"/> <c:out value="${t['COUNT'] }"/>회</div>
											<div class="progress mb-2" style="height: 5px;">
												<div class="progress-bar bg-flat-color-${i.count }" role="progressbar"
													style="width: <c:out value="${t['COUNT']/rto}"/>%;" aria-valuenow="5" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
											</c:forEach>
										</div>

									</div>
									<!-- /.card-body -->
								</div>
								<div class="col-lg-1"></div>
							</div>
							<!-- /.row -->
							<div class="card-body"></div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!--  /Traffic -->
				<div class="clearfix"></div>
				<!-- Orders -->
				<div class="orders">
					<div class="row">
						<div class="col-xl-7">
							<div class="card">
								<div class="card-body">
									<h4 class="box-title">서포터즈 목록(최근명단)</h4>
								</div>
								<div class="card-body--">
									<div class="table-stats order-table ov-h">
										<table class="table">
											<thead>
												<tr>
													<th class="serial">#</th>
													<th class="avatar">사진</th>
													<th>ID</th>
													<th>이름</th>
													<th>전화번호</th>
													<th>가입날짜</th>
													<!-- <th>Status</th> -->
												</tr>
											</thead>
											<tbody>
											<!-- supListMain -->
											<c:forEach items="${supListMain }" var="sl" varStatus="i">
											<tr>
												<td scope="row"><c:out value="${i.count }"/></td>
												<td class="avatar">
														<div class="round-img">
															<a href="#"><img class="rounded-circle" 
															src="${path }resources/images/${sl['PROIMG']}" alt=""></a>
														</div>
													</td>
												<td class="serial"><c:out value="${sl['ID'] }"/></td>
												<td><span class="name"><c:out value="${sl['NAME'] }"/></span></td>
												<td><c:out value="${sl['PHONE'] }"/></td>
												<td><fmt:formatDate value="${sl['ENROLLDATE'] }" pattern="yyyy.MM.dd"/></td>
											</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.table-stats -->
								</div>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col-lg-8 -->


						<div class="col-lx-4">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">신청 목록(최근명단)</strong>
								</div>
								<div class="card-body">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">ID</th>
												<th scope="col">이름</th>
												<th scope="col">가입날짜</th>
											</tr>
										</thead>
										<tbody>
										<!-- supConfirmMain -->
											<c:forEach items="${supConfirmMain }" var="sc" varStatus="i">
											<tr>
												<td scope="row"><c:out value="${i.count }"/></td>
												<td class="serial"><c:out value="${sc['ID'] }"/></td>
												<td><span class="name"><c:out value="${sc['NAME'] }"/></span></td>
												<td><fmt:formatDate value="${sc['ENROLLDATE'] }" pattern="yyyy.MM.dd"/></td>
												<%-- <td><c:out value="${sc['ENROLLDATE'] }"/></td> --%>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
						</div>
					</div>
					<!-- /.orders -->



					<!-- Calender Chart Weather  -->
					<div class="row">
						<div class="col-md-12 col-lg-4">
							<div class="card">
								<div class="card-body">
									<!-- <h4 class="box-title">Chandler</h4> -->
									<div class="calender-cont widget-calender">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>

						<div class="col-lg-4 col-md-6">
							<div class="card ov-h">
								<div class="card-body bg-flat-color-4">
									<div id="flotBarChart" class="float-chart ml-4 mr-4">
										<p style="color:black">&lt;공지 사항&gt;</p>
										<p style="color:white" class="notiTi"><c:out value="${adminNotice['NOTICECONTENT'] }" /></p>
										<p style="color:red" class="notiDa"><fmt:formatDate value="${adminNotice['NOTICEDATE'] }" pattern="yyyy-MM-dd"/></p>
									</div>
								</div>
								<div id="cellPaiChart" class="float-chart">
									<p>&lt;입력창&gt;   &nbsp;<a style="color:#EB9579;" id="noticeClick">공지사항 추가하기</a></p> 
									<textarea class="txAA" cols="5" style="resize:none; width:100%; height:100px; padding:8px"></textarea>
									
								</div>
							</div>
							<!-- /.card -->
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="card weather-box">
								<h4 class="weather-title box-title">추가 메모</h4>
								<textarea cols="5" style="resize:none; width:100%; height:280px;"></textarea>
								<div class="card-body">
									<div class="weather-widget">
										<div id="weather-one" class="weather-one"></div>
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- /Calender Chart Weather -->
					<!-- Modal - Calendar - Add New Event -->
					<div class="modal fade none-border" id="event-modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">
										<strong>새로운 일정</strong>
									</h4>
								</div>
								<div class="modal-body"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default waves-effect"
										data-dismiss="modal">닫기</button>
									<button type="button"
										class="btn btn-success save-event waves-effect waves-light">이벤트
										추가</button>
									<button type="button"
										class="btn btn-danger delete-event waves-effect waves-light"
										data-dismiss="modal">삭제</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /#event-modal -->
				</div>
				<!-- .animated -->
			</div>
			<!-- /.content -->
			<div class="clearfix"></div>
			<!-- Footer -->
			<footer class="site-footer"> </footer>
			<!-- /.site-footer -->
		</div>
	</div>
	<!-- /#right-panel -->
	
	
    

	
</section>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<!-- 모리스 차트 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
<script src="${pageContext.request.contextPath }/resources/admin/assets/js/init/morris.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>

<script>
	
	var testAr = [];
	var ajaxPath = '<c:out value="${path}"/>';

	<c:forEach items="${ac}" var="item">
		//console.log("${item}");
		testAr.push({
			title: "${item.title}",
	        start: new Date(${item.start}),
	        end: new Date(${item.end}),
	        className: "${item.className}"
		});
	</c:forEach>

	var today = new Date($.now());
	
	/* morrisChart */
	<!-- 1:날짜  2:총 글수 3:총 리뷰수 -->
	var dateBoard = [];
	<c:forEach items="${infoUploadMain}" var="iu">
		dateBoard.push({
			"period" : '<fmt:formatDate value="${iu.infoup}" pattern="yyyy-MM-dd" />',
			"licensed" : ${iu.dayInfo},
			"sorned" : 0
		});
	</c:forEach>
	
	new Morris.Bar({
		element: 'morrisBars',
	  	data: dateBoard,
	  	xkey: 'period',
	  	ykeys: ['licensed', 'sorned'],
	  	labels: ['Licensed', 'SORN'],
	  	xLabelAngle: 60
	});
	
	$(document).ready(function(){
		
		$("#noticeClick").on('click', function (e) {
			//alert('notice click');
			var ta = {'strTmp' : document.getElementsByClassName("txAA")[0].value};
			//var ta = $('.txAA').val();
			//console.log(ta);
			
			e.preventDefault();
		
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/admin/adminNoticeIn.do',
				data: ta,
				dataType:"JSON",
				success: function (data) {
					console.log("공지사항 추가되었습니다");
					var d = new Date(data['NOTICEDATE']);
					var d = d.getFullYear() +"-" + d.getMonth() +"-" + d.getDate();
				
					// notiTi, notiDa
					$(".notiTi").text(data['NOTICECONTENT']);
					$(".notiDa").text(d);
					$('.txAA').val("");
					
				},error: function(e) {
					console.log("ajax error");
	            }
			});
			
			
		});
	});
	
	$(function () {
		
		$(".link01").on("click", function () {
			location.href = "${path}/admin/board";
		});
		
		$(".link02").on("click", function () {
			location.href = "${path}/admin/supportersList";
		});
		
		$(".link03").on("click", function () {
			location.href = "${path}/admin/celtify";
		});
		
		$(".link04").on("click", function () {
			location.href = "${path}/admin/users";
		});
	});
		
	
    </script>
<!-- Scripts -->
<link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/assets/css/morris.css">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>
 
<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/init/fullcalendar-init.js"></script>
	
</html>
