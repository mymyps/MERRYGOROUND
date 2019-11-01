<%@ page language="java" contentType="text/html;charSet=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="demo"/>
</jsp:include>
<section id="content">
	<div class="container">
		<form name="infoForm"
			action="${pageContext.request.contextPath }/supLv/supLvFormEnd.do"
			method="post"
			enctype="multipart/form-data">
			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">서포터즈 신청 작성</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
									<div class="infoFormSubFrame">이미지1</div>
									<p class="infoForm1">
										<input type="file" name="supLvImg1"/>

									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">이미지2</div>
									<p class="infoForm1">
										<input type="file" name="supLvImg2"/>

									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">이미지3</div>
									<p class="infoForm1">
										<input type="file" name="supLvImg3"/>

									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">이미지4</div>
									<p class="infoForm1">
										<input type="file" name="supLvImg4"/>

									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">이미지5</div>
									<p class="infoForm1">
										<input type="file" name="supLvImg5"/>

									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">내용</div>
									<p class="infoForm1">
										<input type="text" class="subLvHeight" name="supLvContent"/>
									</p>
								</div>
								
								<br>
								<br>
								<div>
									<button class="btn infoFormBtn" type="submit">서포터즈 신청</button>
									<button class="btn infoFormBtn" type="reset">서포터즈 신청 취소</button>
								</div>
							</div>

						</div>



					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>