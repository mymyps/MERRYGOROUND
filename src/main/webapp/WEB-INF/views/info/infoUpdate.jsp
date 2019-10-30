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
			action="${pageContext.request.contextPath }/info/infoUpdateEnd.do?infoupNum=${info.INFOUPNUM}"
			method="post"
			enctype="multipart/form-data">
			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">INFOMATION ${info.INFOUPNUM }번 수정</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div>
									<div class="infoFormSubFrame">이미지</div>
									<p class="infoForm1">
										<input type="file" name="infoupFile"/>
										<img src="${path }/resources/upload/info/${infoImg.fileReName }" class="infoimg	"/>
									</p>
								</div>

								<div>
									<div class="infoFormSubFrame">제목</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TITLE" name="infoupTitle" value="${info.INFOUPTITLE }"/>
									</p>
								</div>
								
								<div>
									<div class="infoFormSubFrame">테마</div>
									<p class="infoForm1">
										<select id="" name="themaNum" class="mainThema">
											<c:forEach items="${themaList2 }" var="t">
												<c:if test="${info.THEMANUMREF ==t['THEMANUM']}">
													<option value="${t['THEMANUM'] }" selected>${t['THEMANAME'] }</option>
												</c:if>
											</c:forEach>
											<c:forEach items="${themaList2 }" var="t">
												<c:if test="${info.THEMANUM != t['THEMANUM']}">
													<c:if test="${info.THEMANUMREF != t['THEMANUM'] }">
														<option value="${t['THEMANUM'] }">${t['THEMANAME'] }</option>
													</c:if>
												</c:if>
											</c:forEach>
										</select>
										<select id="" name="themaSubNum">
											<option value="${info.THEMANUM }" selected>${info.THEMANAME }</option>
											<c:forEach items="${themaList }" var="t">
												<c:if test="${info.THEMANUM != t['THEMANUM']}">
													<option value="${t['THEMANUM'] }">${t['THEMANAME'] }</option>
												</c:if>
											</c:forEach>
										</select>
									</p>
								</div>
								
								<div>
									<div class="infoFormSubFrame">장소</div>
									<p class="infoForm1">
										<select id="" name="localNum" class="infoFormLocFrame">
											<option value="${info.LOCALNUM }" selected>${info.LOCALNAME }</option>
											<c:forEach items="${locationList }" var="l">
												<c:if test="${info.LOCALNUM != l['LOCALNUM'] }">
													<option value="${l['LOCALNUM'] }">${l['LOCALNAME'] }</option>
												</c:if>
											</c:forEach>
										</select>
										
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">가격</div>
									<p class="infoForm1">
										<input type="number" step="1000" name="infoupPayment" value="${info.INFOUPPAYMENT }"/>
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">번호</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO PHONE" name="infoupPhone" value="${info.INFOUPPHONE }"/>
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">시간</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TIME" name="infoupTime" value="${info.INFOUPTIME }"/>
									</p>
								</div>
								<br>
								<br>
								<div>
									<button class="btn infoFormBtn" type="submit">INFO 수정</button>
									<button class="btn infoFormBtn" type="reset">INFO 수정
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

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>