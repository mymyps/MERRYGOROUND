<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="지역별 데이트코스" />
</jsp:include>
<style>
#locGrayLi ul li a{
border: 1px lightgray !important;
}

</style>


 <!-- Portfolio start -->
 <section id="portfolio" class="portfolio portfolio-box">
    <div class="container">
        <div class="row">
            <div class="col-md-12 heading text-center" style="margin-top:-30px;">
                <span class="icon-pentagon wow bounceIn"><i class="fa fa-suitcase"></i></span>
                <h2 class="title2">Local List
                    <span class="title-desc" style="color: white;">:)</span>
                </h2>
            </div>
        </div> <!-- Title row end -->

        <!--Isotope filter start -->
        <div class="row text-center" style="margin-top:-50px; border:1px !important" >
            <div class="isotope-nav" id="locGrayLi">
                <ul>
                    <li><a href="${path}/search/locList?localNum=1">은평/서대문</a></li>
                    <li><a href="${path}/search/locList?localNum=2">종로</a></li>
                    <li><a href="${path}/search/locList?localNum=3">대학로</a></li>
                    <li><a href="${path}/search/locList?localNum=4">삼청동</a></li>
                    <li><a href="${path}/search/locList?localNum=5">성북</a></li>
                    <li><a href="${path}/search/locList?localNum=6">노원</a></li>
                    <li><a href="${path}/search/locList?localNum=7">동대문</a></li>
                    <li><a href="${path}/search/locList?localNum=8">신촌</a></li>
                    <li><a href="${path}/search/locList?localNum=9">광화문/인사동</a></li>
                    <li><a href="${path}/search/locList?localNum=10">중구</a></li>
                    <li><a href="${path}/search/locList?localNum=11">건대</a></li>
                    <li><a href="${path}/search/locList?localNum=12">중랑/광진</a></li>
                    <div class="gap-20"></div>
                    <li><a href="${path}/search/locList?localNum=13">마포</a></li>
                    <li><a href="${path}/search/locList?localNum=14">홍대</a></li>
                    <li><a href="${path}/search/locList?localNum=15">상수</a></li>
                    <li><a href="${path}/search/locList?localNum=16">명동</a></li>
                    <li><a href="${path}/search/locList?localNum=17">용산</a></li>
                    <li><a href="${path}/search/locList?localNum=18">이태원</a></li>
                    <li><a href="${path}/search/locList?localNum=19">강동</a></li>
                    <li><a href="${path}/search/locList?localNum=20">송파</a></li>
                    <li><a href="${path}/search/locList?localNum=21">강남구</a></li>
                    <li><a href="${path}/search/locList?localNum=22">가로수길</a></li>
                    <li><a href="${path}/search/locList?localNum=23">강남역</a></li>
                    <li><a href="${path}/search/locList?localNum=24">서초</a></li>
                    <li><a href="${path}/search/locList?localNum=25">관악</a></li>
                    <li><a href="${path}/search/locList?localNum=26">동작</a></li>
                    <div class="gap-20"></div>
                    <li><a href="${path}/search/locList?localNum=27">영등포</a></li>
                    <li><a href="${path}/search/locList?localNum=28">구로</a></li>
                    <li><a href="${path}/search/locList?localNum=29">강서/양천</a></li>
                    <div class="gap-20"></div>
                    <hr style="color:brown;">
                  </ul>
                 
            </div>
             
        </div><!-- Isotope filter end -->
        
         
        <div class="row text-center" style="margin-top:-60px;">
       
            <div class="isotope-nav" data-isotope-nav="isotope">
                <ul>
                    <li><a href="#" class="active" data-filter="*">All</a></li>
                    <li><a href="#" data-filter=".food">먹거리</a></li>
                    <li><a href="#" data-filter=".play">놀거리</a></li>
                    <li><a href="#" data-filter=".cafe">카페/술</a></li>
                </ul>
            </div>
        </div><!-- Isotope filter end -->
			
			<div class="row">
			<div id="isotope" class="isotope">	
				 <c:forEach items="${locList}" var="list">
				 <!--먹거리 -->
			    <c:if test="${1 eq list.themaNumRef}">
			    <div class="col-sm-3 portfolio-static-item food isotope-item" style="margin-bottom:20px;">
					<div class="grid">
						<figure class="effect-oscar">
							<img src="${path}/resources/images/beerparty.jpg" alt="">
							<figcaption>
<!--                        <a class="view icon-pentagon" data-rel="prettyPhoto" href="images/portfolio/portfolio-bg1.jpg"><i class="fa fa-search"></i></a>  -->
				            <h3>${list.infoupTitle}</h3>
							<a href="${pageContext.request.contextPath}/info/infoView.do?infoupNum=${list.infoupNum }" class="btn btn-primary white cd-btn">보러가기</a>
							</figcaption>			
						</figure>
						<div class="portfolio-static-desc">
							<div class="row text-center">
							<h3>${list.infoupTitle}</h3>
							<span><a href="#">${list.localCity}</a></span>
							</div>
						</div>					
					</div><!--/ grid end -->
				</div><!--/ item 1 end -->
				</c:if>

                <!-- 놀거리 -->
				
			     <c:if test="${7 eq list.themaNumRef}">
				<div class="col-sm-3 portfolio-static-item play isotope-item" style="margin-bottom:20px;">
					<div class="grid">
						<figure class="effect-oscar">
							<img src="${path}/resources/images/coex.jpg" alt="">
							<figcaption>
							<h3>${list.infoupTitle}</h3>
							<a href="${pageContext.request.contextPath}/info/infoView.do?infoupNum=${list.infoupNum }" class="btn btn-primary white cd-btn">보러가기</a>
							</figcaption>			
						</figure>
						<div class="portfolio-static-desc">
							<div class="row text-center">
							<h3>${list.infoupTitle}</h3>
							<span><a href="#">${list.localCity}</a></span>
							</div>
						</div>					
					</div><!--/ grid end -->
				</div><!--/ item 1 end -->
				</c:if>
                
                <!-- 카페/술 -->
				  <c:if test="${13 eq list.themaNumRef}">
				<div class="col-sm-3 portfolio-static-item cafe isotope-item" style="margin-bottom:20px;" >
					<div class="grid">
						<figure class="effect-oscar">
							<img src="${path}/resources/images/banpo.JPG" alt="">
								<figcaption>
						        <h3>${list.infoupTitle}</h3>
								<a href="${pageContext.request.contextPath}/info/infoView.do?infoupNum=${list.infoupNum }" class="btn btn-primary white cd-btn">보러가기</a>
							</figcaption>			
						</figure>
						<div class="portfolio-static-desc">
							<div class="row text-center">
							<h3>${list.infoupTitle}</h3>
							<span><a href="#">${list.localCity}</a></span>
							</div>
						</div>					
					</div><!--/ grid end -->
				</div><!--/ item 1 end -->
				</c:if>
				</c:forEach>
		
		
<!-- 			<div class="paging2"> -->
<!-- 						<ul class="pagination"> -->
<!-- 							<li><a href="#"><i class="fa fa-angle-left"></i></a></li> -->
<!-- 							<li class="active"><a href="#">1</a></li> -->
<!-- 							<li><a href="#">2</a></li> -->
<!-- 							<li><a href="#">3</a></li> -->
<!-- 							<li><a href="#">4</a></li> -->
<!-- 							<li><a href="#">5</a></li> -->
<!-- 							<li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
			</div><!-- Content row end -->
		</div><!-- Container end -->
		</div>
	</section><!-- Portfolio end -->

	<div class="gap-40"></div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />