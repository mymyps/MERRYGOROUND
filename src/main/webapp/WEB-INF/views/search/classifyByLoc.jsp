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
                    <li><a href="${path}/search/locList?localNum=1" <c:if test="${1 eq param.localNum}">class="active"</c:if>>은평/서대문</a></li>
                    <li><a href="${path}/search/locList?localNum=2" <c:if test="${2 eq param.localNum}">class="active"</c:if>>종로</a></li>
                    <li><a href="${path}/search/locList?localNum=3" <c:if test="${3 eq param.localNum}">class="active"</c:if>>대학로</a></li>
                    <li><a href="${path}/search/locList?localNum=4" <c:if test="${4 eq param.localNum}">class="active"</c:if>>삼청동</a></li>
                    <li><a href="${path}/search/locList?localNum=5" <c:if test="${5 eq param.localNum}">class="active"</c:if>>성북</a></li>
                    <li><a href="${path}/search/locList?localNum=6" <c:if test="${6 eq param.localNum}">class="active"</c:if>>노원</a></li>
                    <li><a href="${path}/search/locList?localNum=7" <c:if test="${7 eq param.localNum}">class="active"</c:if>>동대문</a></li>
                    <li><a href="${path}/search/locList?localNum=8" <c:if test="${8 eq param.localNum}">class="active"</c:if>>신촌</a></li>
                    <li><a href="${path}/search/locList?localNum=9" <c:if test="${9 eq param.localNum}">class="active"</c:if>>광화문/인사동</a></li>
                    <li><a href="${path}/search/locList?localNum=10" <c:if test="${10 eq param.localNum}">class="active"</c:if>>중구</a></li>
                    <li><a href="${path}/search/locList?localNum=11" <c:if test="${11 eq param.localNum}">class="active"</c:if>>건대</a></li>
                    <li><a href="${path}/search/locList?localNum=12" <c:if test="${12 eq param.localNum}">class="active"</c:if>>중랑/광진</a></li>
                    <div class="gap-20"></div>
                    <li><a href="${path}/search/locList?localNum=13" <c:if test="${13 eq param.localNum}">class="active"</c:if>>마포</a></li>
                    <li><a href="${path}/search/locList?localNum=14" <c:if test="${14 eq param.localNum}">class="active"</c:if>>홍대</a></li>
                    <li><a href="${path}/search/locList?localNum=15" <c:if test="${15 eq param.localNum}">class="active"</c:if>>상수</a></li>
                    <li><a href="${path}/search/locList?localNum=16" <c:if test="${16 eq param.localNum}">class="active"</c:if>>명동</a></li>
                    <li><a href="${path}/search/locList?localNum=17" <c:if test="${17 eq param.localNum}">class="active"</c:if>>용산</a></li>
                    <li><a href="${path}/search/locList?localNum=18" <c:if test="${18 eq param.localNum}">class="active"</c:if>>이태원</a></li>
                    <li><a href="${path}/search/locList?localNum=19" <c:if test="${19 eq param.localNum}">class="active"</c:if>>강동</a></li>
                    <li><a href="${path}/search/locList?localNum=20" <c:if test="${20 eq param.localNum}">class="active"</c:if>>송파</a></li>
                    <li><a href="${path}/search/locList?localNum=21" <c:if test="${21 eq param.localNum}">class="active"</c:if>>강남구</a></li>
                    <li><a href="${path}/search/locList?localNum=22" <c:if test="${22 eq param.localNum}">class="active"</c:if>>가로수길</a></li>
                    <li><a href="${path}/search/locList?localNum=23" <c:if test="${23 eq param.localNum}">class="active"</c:if>>강남역</a></li>
                    <li><a href="${path}/search/locList?localNum=24" <c:if test="${24 eq param.localNum}">class="active"</c:if>>서초</a></li>
                    <li><a href="${path}/search/locList?localNum=25" <c:if test="${25 eq param.localNum}">class="active"</c:if>>관악</a></li>
                    <li><a href="${path}/search/locList?localNum=26" <c:if test="${26 eq param.localNum}">class="active"</c:if>>동작</a></li>
                    <div class="gap-20"></div>
                    <li><a href="${path}/search/locList?localNum=27" <c:if test="${27 eq param.localNum}">class="active"</c:if>>영등포</a></li>
                    <li><a href="${path}/search/locList?localNum=28" <c:if test="${28 eq param.localNum}">class="active"</c:if>>구로</a></li>
                    <li><a href="${path}/search/locList?localNum=29" <c:if test="${29 eq param.localNum}">class="active"</c:if>>강서/양천</a></li>
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
<%-- 							<img src="${path}/resources/upload/info/${list.fileReName}" style="width:295px; height: 243px;"> --%>
							<img src="${path}/resources/images/banpo.JPG" style="width:295px; height: 243px;">
							<figcaption>
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
<%-- 							<img src="${path}/resources/upload/info/${list.fileReName}" style="width:295px; height: 243px;"> --%>
							<img src="${path}/resources/images/map1.jpg" style="width:295px; height: 243px;">
							<figcaption>
							<a href="${pageContext.request.contextPath}/info/infoView.do?infoupNum=${list.infoupNum}" class="btn btn-primary white cd-btn">보러가기</a>
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
				<div class="col-sm-3 portfolio-static-item cafe isotope-item">
					<div class="grid">
						<figure class="effect-oscar">
<%-- 							<img src="${path}/resources/upload/info/${list.fileReName}" style="width:295px; height: 243px;"> --%>
								<img src="${path}/resources/images/merry2.jpg" style="width:295px; height: 243px;">
								<figcaption>
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
		
			</div><!-- Content row end -->
		</div><!-- Container end -->
		</div>
		       <div style="margin-left:880px;">
				${pageBar }
				</div>
	</section><!-- Portfolio end -->

	<div class="gap-40"></div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />