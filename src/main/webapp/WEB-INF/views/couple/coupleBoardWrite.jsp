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


	<style>
		.modal-dialog{
			display: table-caption;
			text-align: left;
		}
	</style>

<section id="main-container">
	<div class="container">
		<div class="row">
	
	<!-- summernote 폼-->
	<form action="${path }/couple/coupleBoardWriteEnd" method="post">
		<h2 style="text-align: center;">게시글 작성</h2>
		<input type="text" name="title" style="width: 40%;" placeholder="제목" class="form-control" required/>
			<br>
			<input type="text" name="writer" style="width: 20%;" placeholder="작성자" class="form-control" required/>
			<br>
			<textarea id="summernote" name="content" required></textarea>
		<div><br>
			<button class="btn btn-primary pull-right" type="submit">게시글 작성</button> 
		</div>
	</form>

	<script>
	$('#summernote').summernote({
		placeholder: '내용',
		tabsize: 2,
		height: 400,
		width: '100%',
		maxHeight: 500
	});
	</script>
		</div>
	</div>
</section>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>