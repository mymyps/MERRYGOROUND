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
	<form action="${path }/couple/updateCoupleBoardEnd" id="updateFrm" method="post">
		<h2 style="text-align: center;">게시글 수정</h2>
		<label for="title">제목</label>
		<input type="hidden" name="couplenum" value='${cboard["COUPLENUM"] }'/>
		<input type="text" name="title" value='${cboard["COUPLETITLE"] }' style="width: 40%;" placeholder="제목" class="form-control" required/>
			<br>
			<label for="writer">작성자ID</label>
			<input type="hidden" id="writerNumDB" name="writerNumDB" value='${cboard["MEMBERNUM"]}'/>
			<input type="hidden" id="writerNum" name="writerNum" value='${loginMember.memberNum }'/>
			<input type="text" id="writerID" name="writerID" value="${loginMember.id}" style="width: 20%;" placeholder="작성자" class="form-control" disabled/>
			<br>
			<textarea id="summernote" name="content" required>${cboard["COUPLECONTENT"]}</textarea>
		<div><br>
			<button class="btn btn-primary pull-right" id="update" type="submit">게시글 수정</button>
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
				},
				
				onMediaDelete : function(target){
					console.log("traget[0].src"+target[0].src);
					deleteFile(target[0].src);
				}
				
			}
		});
		
		function deleteFile(src) {
		    $.ajax({
		        data: {"src" : src.substr(src.lastIndexOf("/")+1)},
		        type: "POST",
		        url: "${path}/summernote_imageDelete.do", // replace with your url
		        cache: false,
		        success: function(resp) {
// 		        	console.log(src);
		            console.log(resp);
		        }
		    });
		}
		
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
					console.log("성공!" + savename);
				},
				error : function() {
					console.log("summernote 에러");
				}
			});

		}
		
		$(function(){
			console.log("DB값: "+$('#writerNumDB').val());
			console.log("프론트: "+$('#writerNum').val());
		})
		
		
		$('#update').click(function(){
			if(confirm('정말로 등록하시겠습니까?')){
				var frm=$('#updateFrm');
				var url="${path }/couple/updateCoupleBoardEnd";
				
				if($('#writerNumDB') == $('#writerNum')){
					console.log("성공!");
					frm.attr("action", url);
					frm.submit();
				}
			}else{
				return false;
			}
		})
	</script>
		</div>
	</div>
</section>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>