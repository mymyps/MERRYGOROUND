<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="MyPage " />
</jsp:include>

<section id="content">
	<div class="container">
		<form name="infoForm"
			action="${pageContext.request.contextPath }/info/infoFormEnd.do"
			method="post"
			enctype="multipart/form-data">
			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">INFOMATION 작성</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div>
									<div class="infoFormSubFrame">이미지</div>
									<p class="infoForm1">
										<input type="file" name="infoupFile"/>

									</p>
								</div>

								<div>
									<div class="infoFormSubFrame">제목</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TITLE" name="infoupTitle" />
									</p>
								</div>
								
								<div>
									<div class="infoFormSubFrame">테마</div>
									<p class="infoForm1">
										<select id="" name="themaNum" class="mainThema">
											<c:forEach items="${themaList2 }" var="t">
												<option value="${t['THEMANUM'] }">${t['THEMANAME'] }</option>
											</c:forEach>
										</select>
										<select id="" name="themaSubNum">
											<c:forEach items="${themaList }" var="t">
												<option value="${t['THEMANUM'] }">${t['THEMANAME'] }</option>
											</c:forEach>
										</select>
									</p>
								</div>
								
								<div>
									<div class="infoFormSubFrame">장소</div>
									<p class="infoForm1">
										<select id="" name="localNum" class="infoFormLocFrame">
											<c:forEach items="${locationList }" var="l">
												<option value="${l['LOCALNUM'] }">${l['LOCALNAME'] }</option>
											</c:forEach>
										</select>
										
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">가격</div>
									<p class="infoForm1">
										<input type="number" step="1000" name="infoupPayment" />
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">번호</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO PHONE" name="infoupPhone" />
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">시간</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TIME" name="infoupTime" />
									</p>
								</div>
								<br>
								<br>
								<div>
									<button class="btn infoFormBtn" type="submit">INFO 작성</button>
									<button class="btn infoFormBtn" type="reset">INFO 작성
										취소</button>
								</div>
							</div>

						</div>



					</div>
					<!-- Blog post end -->
				</div>
				<!--/ Content col end -->

			</div>
		</form>
	</div>
	<!--/ row end -->
	<!--/ container end -->
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />