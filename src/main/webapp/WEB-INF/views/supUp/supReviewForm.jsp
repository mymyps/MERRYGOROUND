<%@ page language="java" contentType="text/html;charSet=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="demo" />
</jsp:include>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<section id="content">
	<!-- summernote 폼-->
	<form name="infoForm"
		action="${pageContext.request.contextPath }/info/infoFormEnd.do"
		method="post" enctype="multipart/form-data">
		<div class="container">

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
										</select> <select id="" name="themaSubNum">
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
								<textarea id="summernote" name="content" required></textarea>
							</div>

						</div>



					</div>
					<!-- Blog post end -->
				</div>
				<!--/ Content col end -->

			</div>
		</div>


		<div>
			<button class="btn infoFormBtn" type="submit">INFO 작성</button>
			<button class="btn infoFormBtn" type="reset">INFO 작성 취소</button>
		</div>
	</form>

	<script>
		$('#summernote').summernote({
			placeholder : '내용',
			tabsize : 4,
			height : 600,
			width : '100%',
			maxHeight : 1200,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					console.log(editor);
					console.log(files);
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
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
			$.ajax({
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
					$(edi).summernote('editor.insertImage', savename);
					alert("성공!" + savename);
				},
				error : function() {
					alert("summernote 에러");
				}
			});

		}
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />