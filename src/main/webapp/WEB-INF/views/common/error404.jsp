<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value="404 Error Page"/>
</jsp:include>
<section id="main-container">
		<div class="container">
			<div class="error-page text-center">
				<div class="error-code">
					<strong>404</strong>
				</div>
				<div class="error-message">
					<h3>페이지를 찾을 수 없습니다.</h3>
				</div>
				<div class="error-body">
					고객센터에 문의하세요.<br/>
					<a href="index.html" class="btn btn-primary solid blank"><i class="fa fa-arrow-circle-left">&nbsp;</i> Go to Home</a>
				</div>
			</div>
		</div>
	</section><!--/ Main container end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>