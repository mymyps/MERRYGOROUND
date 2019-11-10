<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value="SUPPORTERS REVIEW"/>	
</jsp:include>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<section id="content">
	<!-- summernote 폼-->
	<form name="infoForm"
		action="${pageContext.request.contextPath }/supUp/supReviewFormEnd.do?infoupNum=${info.INFOUPNUM}&id=${loginMember.id}"
		method="post" enctype="multipart/form-data" onsubmit="return checkNull();">
		<div class="container">
			<input type="hidden" name="loginMemberNum"
				value="${loginMember.memberNum}">
			<input type="hidden" name="id" value="${loginMember.id }"/>
			<input type="hidden" name="supNum" value="${sup.SUPNUM }"/>

			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">작성</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div>
									<div class="infoFormSubFrame">인포메이션 번호</div>
									<p class="infoForm1">
										${info.INFOUPNUM } <input type="hidden" name="infoupNum"
											value="${info.INFOUPNUM }" id="infoupNum"/>
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
										<input type="text" name="supupTitle" id="supupTitle"/>
									</p>
								</div>
								<textarea id="summ" name="supupContent"></textarea>
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div>
			<button class="btn infoFormBtn" type="submit">서포터즈 리뷰 작성</button>
			<input type="button" class="btn infoFormBtn" onClick="location.href='${pageContext.request.contextPath }/info/infoView.do?infoupNum=${info.INFOUPNUM }&id=${loginMember.id }'" value="서포터즈 리뷰 작성 취소">
		</div>
	</form>

	<script>
		function checkNull(){
			var supupTitle=$('#supupTitle');
			var summ=$('#summ')
			
			if(supupTitle.val()==""){
		    	alert('제목을 입력해주세요.');
		    	supupTitle.focus();
		    	return false;
			}
			if(summ.val()==""){
		    	alert('내용을 입력해주세요.');
		    	summ.focus();
		    	return false;
			}
		}
	</script>

	<input type="hidden" value="" />
	
	<script src="${path }/resources/dist/summernote.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="${path }/resources/dist/lang/summernote-ko-KR.js"></script>
	<script>
	$('#summ').summernote(
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
						
						for (var i = files.length - 1; i >= 0; i--) {
						console.log(this);
							sendFile(
									files[i],
									this);
						}
					}
				}
			});
	
	function sendFile(file, edi, welEditable) {
	var imgUrl = "${path}/resources/images/supRv/"
	//파일전송을 위한 폼생성
	var form_data = new FormData();
	form_data.append("image", file);
	
	$.ajax({
				data : form_data,
				type : "post",
				url : "${path}/summernote_imageUpload_supRv2.do",
				cache : false,
				contentType : false,
				enctype : "multipart/form-data",
				processData : false,
				success : function(savename) {
					//console.log(summernote);
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
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />