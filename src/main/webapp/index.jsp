<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

		
<!-- Slider start -->
		<section id="home" class="no-padding">
			<div id="main-slide" class="cd-hero">
				<ul class="cd-hero-slider">
					<li class="selected">
						<div class="overlay2">
							<img class="" src="${pageContext.request.contextPath}/resources/images/merry2.jpg" alt="slider">
						</div>
						<div class="cd-full-width">
							<h2>Merry-Go-Round</h2>
							<br>
							<br>
							<h4 style="color:white;">매일, 매번 똑같은 영화-밥-카페 데이트코스에 질리셨나요? 식상한 데이트에 지치셨나요?
							<br>메리고라운드와 함께 색다른 데이트를 경험해보세요:)</h4>
						</div> <!-- .cd-full-width -->
					</li>

				</ul>
				<!--/ cd-hero-slider -->
			</div>
			<!--/ Main slider end -->
		</section>
		<!--/ Slider end -->



		<!-- 지역별로 검색하기  -->
		<section id="mapHref" class="service angle">
			<!-- 제목-->
			<div class="container">
				<span class="title-icon pull-left"><i class="fa fa-university"></i></span>
				<h2 class="title" id="brownColor">지역별로 검색하기
					<span class="title-desc">
						<p class="nanumSquare">원하는 지역의 핫플레이스를 한눈에 볼수있어요:)</p>
					</span>
				</h2>
			</div>
			<!-- 지도 이미지 -->
	<div class="container" id="mapcontainer">
		<img src="${pageContext.request.contextPath}/resources/images/mapsearch.png" usemap="#mapSearch">
		<map id="mapSearch" name="mapSearch">
			<area shape="rect" title="은평서대문" coords="771,69,827,165" href="${pageContext.request.contextPath}/search/locList?localNum=1" target="_self" onfocus=this.blur() />
			<area shape="rect" title="종로" coords="879,87,953,178" href="${pageContext.request.contextPath}/search/locList?localNum=2" target="_self" onfocus=this.blur() />
			<area shape="rect" title="대학로" coords="997,59,1082,93" href="${pageContext.request.contextPath}/search/locList?localNum=3" target="_self" onfocus=this.blur() />
			<area shape="rect" title="삼청동" coords="984,139,1089,190" href="${pageContext.request.contextPath}/search/locList?localNum=4" target="_self" onfocus=this.blur() />
			<area shape="rect" title="성북" coords="1130,78,1223,154" href="${pageContext.request.contextPath}/search/locList?localNum=5" target="_self" onfocus=this.blur() />
			<area shape="rect" title="노원" coords="1260,54,1326,158" href="${pageContext.request.contextPath}/search/locList?localNum=6" target="_self" onfocus=this.blur() />
			<area shape="rect" title="동대문" coords="1147,186,1241,245" href="${pageContext.request.contextPath}/search/locList?localNum=7" target="_self" onfocus=this.blur() />
			<area shape="rect" title="신촌" coords="720,181,811,251" href="${pageContext.request.contextPath}/search/locList?localNum=8" target="_self" onfocus=this.blur() />
			<area shape="rect" title="광화문 인사동" coords="873,205,952,262" href="${pageContext.request.contextPath}/search/locList?localNum=9" target="_self" onfocus=this.blur() />
			<area shape="rect" title="중구" coords="1055,220,1112,352" href="${pageContext.request.contextPath}/search/locList?localNum=10" target="_self" onfocus=this.blur() /> 
			<area shape="rect" title="건대" coords="1155,285,1255,318" href="${pageContext.request.contextPath}/search/locList?localNum=11" target="_self" onfocus=this.blur() />
			<area shape="rect" title="중랑 광진" coords="1286,190,1345,276" href="${pageContext.request.contextPath}/search/locList?localNum=12" target="_self" onfocus=this.blur() />
			<area shape="rect" title="마포" coords="606,259,679,337" href="${pageContext.request.contextPath}/search/locList?localNum=13" target="_self" onfocus=this.blur() />
			<area shape="rect" title="홍대" coords="747,273,845,334" href="${pageContext.request.contextPath}/search/locList?localNum=14" target="_self" onfocus=this.blur() />
			<area shape="rect" title="상수" coords="731,353,844,393" href="${pageContext.request.contextPath}/search/locList?localNum=15" target="_self" onfocus=this.blur() />
			<area shape="rect" title="명동" coords="884,302,972,345" href="${pageContext.request.contextPath}/search/locList?localNum=16" target="_self" onfocus=this.blur() />
			<area shape="rect" title="용산" coords="884,384,971,430" href="${pageContext.request.contextPath}/search/locList?localNum=17" target="_self" onfocus=this.blur() />
			<area shape="rect" title="이태원" coords="1027,393,1103,420" href="${pageContext.request.contextPath}/search/locList?localNum=18" target="_self" onfocus=this.blur() />
			<area shape="rect" title="강동" coords="1305,367,1379,409" href="${pageContext.request.contextPath}/search/locList?localNum=19" target="_self" onfocus=this.blur() />
			<area shape="rect" title="송파" coords="1301,474,1380,522" href="${pageContext.request.contextPath}/search/locList?localNum=20" target="_self" onfocus=this.blur() />
			<area shape="rect" title="강남구" coords="1185,491,1260,544" href="${pageContext.request.contextPath}/search/locList?localNum=21" target="_self" onfocus=this.blur() />
			<area shape="rect" title="가로수길" coords="1039,506,1148,543" href="${pageContext.request.contextPath}/search/locList?localNum=22" target="_self" onfocus=this.blur() />
			<area shape="rect" title="강남역" coords="1051,580,1166,623" href="${pageContext.request.contextPath}/search/locList?localNum=23" target="_self" onfocus=this.blur() />
			<area shape="rect" title="서초" coords="941,541,1005,646" href="${pageContext.request.contextPath}/search/locList?localNum=24" target="_self" onfocus=this.blur() />
			<area shape="rect" title="관악" coords="750,591,814,650" href="${pageContext.request.contextPath}/search/locList?localNum=25" target="_self" onfocus=this.blur() />
			<area shape="rect" title="동작" coords="828,520,899,569" href="${pageContext.request.contextPath}/search/locList?localNum=26" target="_self" onfocus=this.blur() />
			<area shape="rect" title="영등포" coords="694,464,778,529" href="${pageContext.request.contextPath}/search/locList?localNum=27" target="_self" onfocus=this.blur() />
			<area shape="rect" title="구로" coords="594,533,678,596" href="${pageContext.request.contextPath}/search/locList?localNum=28" target="_self" onfocus=this.blur() />
			<area shape="rect" title="강서양천" coords="570,402,645,486" href="${pageContext.request.contextPath}/search/locList?localNum=29" target="_self" onfocus=this.blur() />
		</map>
	</div>
</section>

		<!-- 테마/카테고리별로 검색하기 start -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="col-md-12 heading">
						<span class="title-icon classic pull-left"><i class="fa fa-suitcase"></i></span>
						<h2 class="title" id="brownColor">테마별로 검색하기
							<span class="title-desc">
								<p class="nanumSquare">원하는 테마에 맞게 장소를 골라보세요:)</p>
							</span>
						</h2>
					</div>
				</div> <!-- Title row end -->
			
				<!--Isotope filter start -->
				<div class="row text-center">
					<div class="isotope-nav" data-isotope-nav="isotope">
						<ul>
							<li><a href="#" class="active" data-filter="*">전체보기</a></li>
							<li><a href="#" data-filter=".web-design">먹거리</a></li>
							<li><a href="#" data-filter=".development">놀거리</a></li>
							<li><a href="#" data-filter=".joomla">카페/술</a></li>
						</ul>
					</div>
				</div><!-- Isotope filter end -->
			
			<div class="row">
				<div id="isotope" class="isotope">
					<!-- 먹거리 -->
					<!-- 한식 -->
					<div class="col-sm-3 web-design isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/portfolio/korean.jpg" alt="" class="img-thumbnail">
								<figcaption>
									<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=2&themaNumRef=1" >한식</a></h2>
								
							    </figcaption>
							</figure>
						</div>
					</div>
					<!-- 일식 -->
					<div class="col-sm-3 web-design isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/japan.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=3&themaNumRef=1">일식</a></h2>
										</figcaption>
								</figure>
							</div>
						</div>
						<!-- 양식 -->
						<div class="col-sm-3 web-design isotope-item">
								<div class="grid">
									<figure class="effect-oscar">
										<img src="${pageContext.request.contextPath}/resources/images/portfolio/yang.jpg" alt="" class="img-thumbnail">
										<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=4&themaNumRef=1">양식</a></h2>
										</figcaption>
									</figure>
								</div>
							</div>
							<!-- 아시안푸드 -->
							<div class="col-sm-3 web-design isotope-item">
									<div class="grid">
										<figure class="effect-oscar">
											<img src="${pageContext.request.contextPath}/resources/images/portfolio/asia.jpg" alt="" class="img-thumbnail">
											<figcaption>
													<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=5&themaNumRef=1">아시안푸드</a></h2>
												</figcaption>
										</figure>
									</div>
								</div>
								<!-- 중식 -->
								<div class="col-sm-3 web-design isotope-item">
										<div class="grid">
											<figure class="effect-oscar">
												<img src="${pageContext.request.contextPath}/resources/images/portfolio/china.jpg" alt="" class="img-thumbnail">
												<figcaption>
														<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=6&themaNumRef=1">중식</a></h2>
													</figcaption>
											</figure>
										</div>
									</div>
									<!-- 먹거리 끝 -->
					
					<!-- 놀거리 -->
					<!-- 실내데이트 -->
					<div class="col-sm-3 development isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/portfolio/indoor.jpg" alt="" class="img-thumbnail">
								<figcaption>
										<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=8&themaNumRef=7">실내데이트</a></h2>
									</figcaption>
							</figure>
						</div>
					</div>
					<!-- 야외데이트 -->
					<div class="col-sm-3 development isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/out.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=9&themaNumRef=7">야외데이트</a></h2>
										</figcaption>
								</figure>
							</div>
						</div>
						<!-- 산책하기 좋은곳 -->
					<div class="col-sm-3 development isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/walk.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=10&themaNumRef=7">산책하기 좋은 곳</a></h2>
									</figcaption>
								</figure>
							</div>
						</div>
						<!-- 연극,공연 -->
					<div class="col-sm-3 development isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/play.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=11&themaNumRef=7">연극 /공연</a></h2>
									</figcaption>
								</figure>
							</div>
						</div>
						<!-- 마사지 -->
					<div class="col-sm-3 development isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/ma.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=12&themaNumRef=7">마사지</a></h2>
									</figcaption>
								</figure>
							</div>
						</div>
						<!-- 놀거리 끝 -->
					<!-- 카페/술 -->
					<!-- 칵테일&펍 -->
					<div class="col-sm-3 joomla isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/portfolio/pub.jpg" alt="" class="img-thumbnail">
								<figcaption>
										<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=14&themaNumRef=13">칵테일 /펍</a></h2>
								</figcaption>
							</figure>
						</div>
					</div>
					<!-- 디저트특집 -->
					<div class="col-sm-3 joomla isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/dal.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=15&themaNumRef=13">달다구리</a></h2>
									</figcaption>
								</figure>
							</div>
						</div>
						<!-- 포토존있는곳 -->
					<div class="col-sm-3 joomla isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/zone.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=16&themaNumRef=13">포토존 있는 곳</a></h2>
									</figcaption>
								</figure>
							</div>
						</div>
						<!-- 공부하기 좋은곳 -->
					<div class="col-sm-3 joomla isotope-item">
							<div class="grid">
								<figure class="effect-oscar">
									<img src="${pageContext.request.contextPath}/resources/images/portfolio/study.jpg" alt="" class="img-thumbnail">
									<figcaption>
											<h2><a href="${pageContext.request.contextPath}/search/subThemaList?themaNum=17&themaNumRef=13">공부하기 좋은 곳</a></h2>
									</figcaption>		
								  </figure>
							</div>
						</div>
					</div><!-- Isotope content end -->
			</div><!-- Content row end -->
		</div><!-- Container end -->
	</section><!-- 테마별 검색 끝 -->
	
	
		<!-- 추천 데이트 -->
		<section id="team" class="team">
			<div class="container">
				<div class="row">
					<div class="col-md-12 heading">
						<span class="title-icon pull-left"><i class="fa fa-thumbs-up"></i></span>
						<h2 class="title" id="brownColor">추천 데이트 코스
							<span class="title-desc">
								<p class="nanumSquare">쌀쌀한 가을날씨에 이런 데이트는 어떠세요?</p>
							</span>
						</h2>
					</div>
				</div><!-- Title row end -->
				
				<div class="row text-center">
					<!-- 반포한강공원 -->
					<div class="col-sm-3 development isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/banpo.JPG" alt="" class="img-thumbnail">
								<figcaption>
									<h3>반포한강공원</h3>
									<a href="${pageContext.request.contextPath}" class="btn btn-primary white cd-btn">보러가기</a>
								</figcaption>
							</figure>
						<p>무지개분수와 푸드트럭!</p>
						</div>
					</div><!-- Isotope item end -->
					<!--반포한강공원끝 -->
					<!-- 신촌맥주축제 -->
					<div class="col-sm-3 development isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/beerparty.jpg" alt="" class="img-thumbnail">
								<figcaption>
									<h3>신촌맥주축제</h3>
									<a href="${pageContext.request.contextPath}" class="btn btn-primary white cd-btn">보러가기</a>
								</figcaption>
							</figure>
							<p>시원한 맥주와 신나는 공연!</p>
						</div>
					</div><!-- Isotope item end -->
					<!--신촌맥주축제 끝 -->
					<!-- 코엑스연극 -->
					<div class="col-sm-3 development isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/coex.jpg" alt="" class="img-thumbnail">
								<figcaption>
									<h3>코엑스<br>연극 관람</h3>
									<a href="${pageContext.request.contextPath}" class="btn btn-primary white cd-btn">보러가기</a>
								</figcaption>
							</figure>
							<p>쌀쌀한 가을날 실내데이트 어때요?</p>
						</div>
					</div><!-- Isotope item end -->
					<!--코엑스 연극 끝-->
					<!-- 루프탑 레스토랑 -->
					<div class="col-sm-3 development isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="${pageContext.request.contextPath}/resources/images/looftop.JPG" alt="" class="img-thumbnail">
								<figcaption>
									<h3>루프탑<br>레스토랑</h3>
									<a href="${pageContext.request.contextPath}" class="btn btn-primary white cd-btn">보러가기</a>
								</figcaption>
							</figure>
							<p>시원한 가을바람과 맛있는 저녁!</p>
						</div>
					</div><!-- Isotope item end -->
					<!--루프탑 레스토랑 끝 -->
				</div>
				<!--/ Content row end -->
			</div>
			<!--/ Container end -->
		</section>
		<!--추천 데이트코스 끝 -->


		<!--현위치 기반 검색 - 지도API와 연결될 link-->
		<section class="parallax parallax1">
			<div class="parallax-overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2>주변 데이트 장소가 궁금하세요?</h2>
						<h3>위치를 기반으로 데이트 장소를 보여줍니다:)</h3>
						<p>
							<a href="${pageContext.request.contextPath}/search/mapSearch" class="btn btn-primary white">내 주변 데이트장소 검색</a>
						</p>
					</div>
				</div>
			</div><!-- Container end -->
		</section>
		<!-- 현 위치기반 검색 끝 -->

		<!-- 공지사항 브리핑 화면 -->
		<section class="noticeBref">
			<div class=" container">
			<div class="row">
				<span class="title-icon pull-left"><i class="fa fa-clipboard"></i></span>
				<h2 class="title" id="brownColor">공지사항
					<span class="title-desc">
						<p class="nanumSquare1">메리고라운드 이용 시 공지사항을 꼭 확인해주세요:)</p>
					</span>
				</h2>
				
				<div id="testimonial-carousel" class="owl-carousel owl-theme text-center testimonial-slide" style="display: block; opacity: 1;">
					<div class="owl-wrapper-outer">
						<div class="owl-wrapper"
							style="display: block; width: 5820px; left: 0px; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">
							<div class="owl-item" style="width: 970px;">
								<div class="item">
									<div class="testimonial-content">
									<c:forEach items="${noticeList}" var="list">
										<h3><c:out value='${list["NOTICECONTENT"]}'></c:out></h3>
									
                                     </c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ Testimonial carousel end-->
			</div>
			<!--/ Row end-->
	</div>
	<!--/  Container end-->
	
	</section>
	
   <script>

  $(document).ready(function(){
	  $("#ban").hide();  
	
  });
 
	
 </script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>