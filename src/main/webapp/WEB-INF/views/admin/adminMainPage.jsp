<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
<%--     <jsp:param name="관라자페이지" value="adminMainPage" />
</jsp:include> --%>

<!-- 관리자 페이지 css -->
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />

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
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-1">
										<i class="pe-7s-browser"></i>
										<!-- <i class="pe-7s-cash"></i> -->
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												$<span class="count">23569</span>
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
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-2">
										<i class="fa fa-users"></i>
										<!-- <i class="pe-7s-cart"></i> -->
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">3435</span>
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
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-3">
										<i class="pe-7s-users"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">349</span>
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
								<div class="stat-widget-five">
									<div class="stat-icon dib flat-color-4">
										<i class="ti-link"></i>
									</div>
									<div class="stat-content">
										<div class="text-left dib">
											<div class="stat-text">
												<span class="count">2986</span>
											</div>
											<div class="stat-heading">신고</div>
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
										<tbody>
											<tr>
												<td class="serial">1.</td>
												<td class="avatar">
													<div class="round-img">
														<a href="#"><img class="rounded-circle"
															src="images/avatar/1.jpg" alt=""></a>
													</div>
												</td>
												<td>#5469</td>
												<td><span class="name">Louis Stanley</span></td>
												<td><span class="product">iMax</span></td>
												<td><span class="count">231</span></td>

											</tr>

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
										<tbody>
											<tr>
												<td class="serial">2.</td>
												<td class="avatar">
													<div class="round-img">
														<a href="#"><img class="rounded-circle"
															src="images/avatar/2.jpg" alt=""></a>
													</div>
												</td>
												<td>#5468</td>
												<td><span class="name">Gregory Dixon</span></td>
												<td><span class="product">iPad</span></td>
												<td><span class="count">250</span></td>

											</tr>

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
						<div class="card">
							<div class="card-body">
								<h4 class="box-title"></h4>
							</div>
							<div class="row">
								<div class="col-lg-1"></div>
								<div class="col-lg-6">
									<div class="card">
										<div class="card-body">
											<h4 class="mb-3">Bar chart</h4>
											<canvas id="barChart"></canvas>
										</div>
									</div>
								</div>
								<!-- /# column -->
								<!-- bg-flat-color-1 -->
								<div class="col-lg-4">
									<div class="card-body">
										<div class="progress-box progress-1">
											<h4 class="por-title">Visits</h4>
											<div class="por-txt">테마1 (10%)</div>
											<div class="progress mb-2" style="height: 5px;">
												<div class="progress-bar bg-flat-color-1" role="progressbar"
													style="width: 90%;" aria-valuenow="5" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
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
									<h4 class="box-title">서포터즈 목록(명단)</h4>
								</div>
								<div class="card-body--">
									<div class="table-stats order-table ov-h">
										<table class="table">
											<thead>
												<tr>
													<th class="serial">#</th>
													<th class="avatar">Avatar</th>
													<th>ID</th>
													<th>Name</th>
													<th>Product</th>
													<th>Quantity</th>
													<!-- <th>Status</th> -->
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="serial">1</td>
													<td class="avatar">
														<div class="round-img">
															<a href="#"><img class="rounded-circle"
																src="images/avatar/1.jpg" alt=""></a>
														</div>
													</td>
													<td>#5469</td>
													<td><span class="name">Louis Stanley</span></td>
													<td><span class="product">iMax</span></td>
													<td><span class="count">231</span></td>

												</tr>


												<tr>
													<td class="serial">2.</td>
													<td class="avatar">
														<div class="round-img">
															<a href="#"><img class="rounded-circle"
																src="images/avatar/2.jpg" alt=""></a>
														</div>
													</td>
													<td>#5468</td>
													<td><span class="name">??????</span></td>
													<td><span class="product">??????</span></td>
													<td><span class="count">250</span></td>

												</tr>


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
									<strong class="card-title">신청목록</strong>
								</div>
								<div class="card-body">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First</th>
												<th scope="col">Last</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>???</td>
												<td>??????</td>
												<td>????</td>
											</tr>

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
								<div class="card-body bg-flat-color-2">
									<div id="flotBarChart" class="float-chart ml-4 mr-4">
										<p>공지 사항</p>
									</div>
								</div>
								<div id="cellPaiChart" class="float-chart">
									<p>공지 사항</p>
								</div>
							</div>
							<!-- /.card -->
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="card weather-box">
								<h4 class="weather-title box-title">???????</h4>
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


					<!-- <div class="modal fade none-border" id="add-category">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               <h4 class="modal-title"><strong>카테고리 추가 </strong></h4>
                           </div>
                           <div class="modal-body">
                               <form>
                                   <div class="row">
                                       <div class="col-md-6">
                                           <label class="control-label">카테고리 이름</label>
                                           <input class="form-control form-white" placeholder="이름 입력" type="text" name="category-name"/>
                                       </div>
                                       <div class="col-md-6">
                                           <label class="control-label">색상 선택</label>
                                           <select class="form-control form-white" data-placeholder="색상 선택..." name="category-color">
                                               <option value="success">녹색</option>
                                               <option value="danger">빨강</option>
                                               <option value="info">청색</option>
                                               <option value="pink">핑크</option>
                                               <option value="primary">파랑</option>
                                               <option value="warning">노랑</option>
                                           </select>
                                       </div>
                                   </div>
                               </form>
                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                               <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                           </div>
                       </div>
                   </div>
               </div> -->

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
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script>
	//console.log('${ac.get(0)}');
	//console.log('${ac.get(1)}');
	//consol.log('${ac.size()}');
	//consol.log('${ac.get(0).title}');
		
	var testAr = [];
	var ajaxPath = '<c:out value="${path}"/>';

/* 		{
		title: "123124",
        start: new Date(1570233600000),
        end: new Date(1570233600000),
        className: "bg-danger"
	}]; */
	<c:forEach items="${ac}" var="item">
		testAr.push({
			title: "${item.title}",
	        start: new Date(${item.start}),
	        end: new Date(${item.end}),
	        className: "${item.className}"
		});
	</c:forEach>

	//var testAr1 = new Array();
	
	/*	testAr.push({
			title: "${cal.title}",
	        start: new Date(${cal.start}),
	        end: new Date(${cal.end}),
	        className: "${cal.className}"
		});
	*/
	
//	console.log("-------------");
	var today = new Date($.now());
	
	// 테스트 초기값
	
	
//	console.log(testAr);
//	console.log("-------------");
	
//	console.log(testAr);
//	console.log(test);
	
	
	//title: '이존데',
    //start: today,
    //end: today,
    //className: 'bg-danger'
	
	//defaultEvents.push(${ac});
	</script>

	<!-- Scripts -->
 	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/main.js"></script>
 
	<!--Chartist Chart-->
	<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/admin/assets/js/init/fullcalendar-init.js"></script>
</section>
</div>
</body>

</html>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>