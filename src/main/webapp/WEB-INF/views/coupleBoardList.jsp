<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<%-- <jsp:include page ="/WEB-INF/views/common/header.jsp"> --%>
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

<!-- Blog details page start -->
<section id="main-container">
	<div class="container">
		<div class="row">

			<!-- Blog start -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div>
					<br>
					<button class="btn btn-primary pull-right"
						onclick='location.href="${path}/couple-boardForm.html"'>글 작성</button>
				</div>
				<br>
				<br>
				<br>

				<!-- 1st post start -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-1.jpg"
							class="img" alt="" />
							<p class="img-content">숙소가기전 우븟 재래시장!</p> <span class="blog-date">
								May 03, 2019</span>
						</a>
					</div>
					<!-- post image end -->

				</div>
				<!-- 1st post end -->

				<!-- 2nd post start -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-2.jpg"
							class="img" alt="" />
							<p class="img-content">우붓 스타벅스 가는길</p> <span class="blog-date">
								May 03, 2019</span>
						</a>
					</div>
					<!-- post image end -->

				</div>
				<!-- 2nd post end -->

				<!-- 3rd post start -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-3.jpg"
							class="img" alt="" />
							<p class="img-content">스타벅스안 호수</p> <span class="blog-date">
								May 03, 2019</span>
						</a>
					</div>
					<!-- post image end -->
				</div>
				<!-- 3rd post end -->

				<!-- 4번째 게시글 -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-4.jpg"
							class="img" alt="" />
							<p class="img-content">몽키 포레스트</p> <span class="blog-date">
								May 04, 2019</span>
						</a>
					</div>
					<!-- post image end -->
				</div>
				<!-- 4번째 게시글 끝-->

				<!-- 5번째 게시글 -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-5.jpg"
							class="img" alt="" />
							<p class="img-content">사원 울루와뚜</p> <span class="blog-date">
								May 05, 2019</span>
						</a>
					</div>
					<!-- post image end -->
				</div>
				<!-- 5번째 게시글 끝-->

				<!-- 6번째 게시글 -->
				<div class="post postmb">
					<!-- post image start -->
					<div class="post-image-wrapper">
						<a href="couple-boardView.html"> <img src="../imgS/1-8.jpg"
							class="img" alt="" />
							<p class="img-content">스미냑 포테이토헤드 비치클럽!</p> <span
							class="blog-date"> May 08, 2019</span>
						</a>
					</div>
					<!-- post image end -->
				</div>
				<!-- 6번째 게시글 끝-->

				<div class="paging">
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
			<!--/ Content col end -->


		</div>
	</div>
	<!--/ row end -->
	</div>
	<!--/ container end -->
</section>
<!-- Blog details page end -->

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>