<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<!-- 	인포업로드에서 번호를 받아와서 그번호 DB작성 -->
	<form action="${path }/couple/coupleBoardWriteEnd" id="writeFrm" method="post">
		<h2 style="text-align: center;">게시글 작성</h2>
		<input type="text" name="title" style="width: 40%;" placeholder="제목" class="form-control" required/>
			<br>
			<input type="text" name="writer" value="1" style="width: 20%;" placeholder="작성자" class="form-control" required/>
			<br>
			<textarea id="summernote" name="content" required></textarea>
		<div><br>
			<button class="btn btn-primary pull-right" id="write" type="submit">게시글 작성</button> 
		</div>
	</form>

	<script>
	$('#summernote').summernote({
		placeholder: '내용',
		tabsize: 4,
		height: 600,
		width: '100%',
		maxHeight: 1200,
		callbacks : {
			onImageUpload: function(files, editor, welEditable){
			console.log(editor);
			console.log(files);
			for (var i = files.length -1; i>=0; i--){
				sendFile(files[i], this);
			}
		}}
	});
	function sendFile(file, edi, welEditable){
		var imgUrl = "resources/images/couple/"
		console.log(imgUrl);
		//파일전송을 위한 폼생성
		var form_data = new FormData();
		form_data.append("image",file);
		$.ajax({
			data: form_data,
			type: "post",
			url: "${path}/summernote_imageUpload.do",
			cache: false,
			contentType: false,
			enctype: "multipart/form-data",
			processData: false,
			success: function(savename){
				//imgUrl = imgUrl + savename;
				console.log(savename);
				console.log(edi);
	        	$(edi).summernote('editor.insertImage', savename);
	        	alert("성공!"+savename);
			},
			error: function(){
				alert("summernote 에러");
			}
		});

	}
	
	
	
	$('#write').click(function(){
		if(confirm('정말로 등록하시겠습니까?')){
			var frm=$('#writeFrm');
			var url="${path }/couple/coupleBoardWriteEnd";
			frm.attr("action", url);
			frm.submit();
		}else{
			return false;
		}
	})
	</script>
		</div>
	</div>
</section>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>