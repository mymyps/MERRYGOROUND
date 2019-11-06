<%@ page language="java" contentType="text/html;charSet=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="서포터즈 리뷰" />
</jsp:include>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<!-- Blog post start -->
				<div class="post-content">
					<h1 class="post-title text-center">
						<a href="#">${supUpload.SUPUPTITLE}</a>
					</h1>
					<hr>
					<div class="entry-content">
						${supUpload.SUPUPCONTENT }
					</div>
				</div>
			</div>
		</div>
	</div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />