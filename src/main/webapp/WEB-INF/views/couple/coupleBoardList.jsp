<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value="커플게시판"/>
</jsp:include>


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.img{
		position: relative;
		width: 100%; height: 400px;
		object-fit: cover; object-position: center;
		z-index: 1;
		opacity: 0.85;
	}
	
	.img-content{
		position: relative;
		/* transform: translate(0%,-800%); */
		transform: translateY(-500%);
		color: whitesmoke; 
		text-align: center;
		z-index: 2;
		font-size: 26px;
		font-weight: bold;
		text-shadow: 0 0 3px black;
		z-index: 4;

	}
	.post span{
		z-index: 1;
	}
	.postmb{
		margin-bottom: -100px;
	}
</style>

<!-- Blog details page start -->
<section id="main-container">
	<div class="container">
		<div class="row">

			<!-- Blog start -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div>
					<br>
					<button style="z-index: 5;" class="btn btn-primary pull-right"
						onclick='location.href="${path}/couple/coupleBoardWrite"'>글 작성</button>
				</div>
				<br>
				<br>
				<br>

				<c:forEach items="${list }" var="c" varStatus="v">
					<div class="post postmb">
						<!-- post image start -->
						<div class="post-image-wrapper">
							<a href='${path }/couple/coupleBoardView?no=${c["COUPLENUM"]}'> 
<%-- 							<img src='${path}/resources/images/couple/${c["FILERENAME"]}'	class="img" alt="" /> --%>
<img src="${path}/resources/images/banpo.JPG"  class="img" alt="이미지준비중" />
																	 <!-- 마지막 파일명만 따로 불러오든, 전체경로를 다 받아오든  -->
								<p class="img-content"><c:out value='${c["COUPLETITLE"] }'></c:out></p>
								<span class="blog-date"> <fmt:formatDate value='${c["COUPLEDATE"] }'/></span>
							</a>
							<input id="hidden" type="hidden" value='${c["COUPLECONTENT"] }'/>
						</div>
						<!-- post image end -->
					</div>
				</c:forEach>
				
				${pageBar }
<!-- 				<div class="paging"> -->
<!-- 					<ul class="pagination"> -->
<!-- 						<li><a href="#"><i class="fa fa-angle-left"></i></a></li> -->
<!-- 						<li class="active"><a href="#">1</a></li> -->
<!-- 						<li><a href="#">2</a></li> -->
<!-- 						<li><a href="#">3</a></li> -->
<!-- 						<li><a href="#">4</a></li> -->
<!-- 						<li><a href="#">5</a></li> -->
<!-- 						<li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->

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