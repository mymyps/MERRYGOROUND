<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>	
</jsp:include>

<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="${path }/resources/dist/lang/summernote-ko-KR.js"></script>

<section id="content">
	<!-- summernote 폼-->
	<form name="infoForm"
		action="${pageContext.request.contextPath }/info/infoFormEnd.do"
		method="post" enctype="multipart/form-data">
		<div class="container">
			<input type="hidden" name="loginMemberNum"
				value="${loginMember.memberNum}">

			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">서포터즈 리뷰 작성</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div>
									<div class="infoFormSubFrame">인포메이션 번호</div>
									<p class="infoForm1">
										${info.INFOUPNUM } <input type="hidden" name="infoupNum"
											value="${info.INFOUPNUM }" />
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">인포메이션 제목</div>
									<p class="infoForm1">${info.INFOUPTITLE }</p>
								</div>
								<div></div>
								<div>
									<div class="infoFormSubFrame">테마</div>
									<p class="infoForm1">${info.THEMANAME }</p>
								</div>

								<div>
									<div class="infoFormSubFrame">위치</div>
									<p class="infoForm1">${info.INFOADDR }</p>
								</div>

								<div>
									<div class="infoFormSubFrame">제목</div>
									<p class="infoForm1">
										<input type="text" name="supupTitle" />
									</p>
								</div>
								<textarea id="summernote" name="content" required></textarea>
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div>
			<button class="btn infoFormBtn" type="submit">서포터즈 리뷰 작성</button>
			<button class="btn infoFormBtn" type="reset">서포터즈 리뷰 작성 취소</button>
		</div>
	</form>

<script>
									$('#summernote')
											.summernote(
													{
														placeholder : '내용',
														tabsize : 4,
														height : 600,
														width : '100%',
														maxHeight : 1200,
														callbacks : {
															onImageUpload : function(
																	files,
																	editor,
																	welEditable) {
																console
																		.log(editor);
																console
																		.log(files);
																for (var i = files.length - 1; i >= 0; i--) {
																	sendFile(
																			files[i],
																			this);
																}
															}
														}
													});
									function sendFile(file, edi, welEditable) {
										var imgUrl = "resources/images/couple/"
										console.log(imgUrl);
										//파일전송을 위한 폼생성
										var form_data = new FormData();
										form_data.append("image", file);
										$
												.ajax({
													data : form_data,
													type : "post",
													url : "${path}/summernote_imageUpload.do",
													cache : false,
													contentType : false,
													enctype : "multipart/form-data",
													processData : false,
													success : function(savename) {
														//imgUrl = imgUrl + savename;
														console.log(savename);
														console.log(edi);
														$(edi).summernote(
																		'editor.insertImage',
																		savename);
														alert("성공!" + savename);
													},
													error : function() {
														alert("summernote 에러");
													}
												});

									}
								</script>
	<input type="hidden" value="" />
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />