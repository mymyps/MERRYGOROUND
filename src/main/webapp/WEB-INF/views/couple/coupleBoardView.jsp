<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

<!-- <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <script src="http://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!--    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!--    crossorigin="anonymous"></script> -->
<style>
		.img{
			position: relative;
			width: 100%; height: 500px;
			object-fit: cover; object-position: center;
			z-index: 1;
			opacity: 1;
			margin-left: auto; margin-right: auto; display: block;
		}
	</style>
	
	<!-- Blog details page start -->
	<section id="main-container">
			
		<div class="container">
			<div class="row">
					
				  
				  

				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- <div> -->
						
					<!-- Blog post start -->
					<div class="post-content">
						<div class="post-header clearfix">
								<h1>
									<c:out value='${cboard["COUPLETITLE"]}'></c:out>
								</h1>
								<div class="post-meta">
									<span class="post-meta-author">작성자 <a href="#"> <c:out value='${cboard["ID"] }'></c:out></a></span>
									<!-- <span class="post-meta-cats">in <a href="#"> News</a></span> -->
									<div class="pull-right">
										<span class="post-meta-comments"><a href="#"><i class="fa fa-comment-o"></i> 댓글 <span id="cCnt"></a></span>
<!-- 										<span class="post-meta-hits"><a href="#"><i class="fa fa-heart-o"></i> (좋아요 수)</a></span> -->
									</div>
									
								</div><!-- post meta end -->
							</div><!-- post heading end -->
							<br>

						<!-- 첫이미지, 리스트에 보일 이미지 post image start -->
<!-- 						<div class="post-image-wrapper"> -->
<%-- 							<img src="${path }/resources/images/couple/1-1.jpg" class="img"  alt="" /> --%>
<!-- 							<span class="blog-date"> May 03, 2015</span> -->
<!-- 						</div>post image end -->
						
<!-- 						내용부분 -->
						<div class="entry-content">
							<input id="hidden" type="hidden" value='${cboard["COUPLECONTENT"] }'/>
							
						</div>
						
						<div class="gap-30"></div>
						
						<script>
							$(function(){
								var content = $('#hidden').val();
								console.log(content);
								$('.entry-content').append(content);
								//////
// 								var content2 = "<c:out value='${cboard["COUPLECONTENT"] }'/>";
// 								console.log(content2);
// 								$('.entry-content').append(content2);
							});
						</script>
						<button class="btn btn-primary pull-left" onclick='location.href="${path }/couple/coupleBoardList?mNum=${loginMember.memberNum}"'>목록</button>
<%-- 						<button class="btn btn-primary pull-right" id="deleteCB" onclick='location.href="${path }/couple/deleteCoupleBoard?no=${cboard["COUPLENUM"]}"'>삭제</button>  --%>
<%-- 						<button class="btn btn-primary pull-right" id="updateCB" onclick='location.href="${path }/couple/updateCoupleBoard?no=${cboard["COUPLENUM"]}"'>수정</button> --%>
						<c:if test="${cboard.ID eq loginMember.id}">
							<button class="btn btn-primary pull-right" id="deleteCB" onclick='deleteCB();'>삭제</button>
							<button class="btn btn-primary pull-right" id="updateCB" onclick='updateCB();'>수정</button>
						</c:if>
						<script>
							console.log("${cboard.ID}");
							console.log("${loginMember.id}");
						</script>
						<br><hr>
					

						<div class="gap-30"></div>
						
<!-- 				--------------------------------------------------------- -->

			<div class="container">
				<form id="commentListForm" name="commentListForm" method="post">
					<div>
						<span><strong>댓글</strong></span>
						<span id="cCnt2"></span>
						<span><strong>개</strong></span>
					</div><hr><br>
					<div id="commentList"></div>
				</form>
			</div>
			
<!-- 			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px"> -->
<!-- 				<h6 class="border-bottom pb-2 mb-0">댓글</h6> -->
<!-- 				<div id="commentList"></div> -->

<!-- 			</div>  -->
			
			
			<div class="container">
				<form id="commentForm" name="commentForm" method="post">
					<br>
					<br>
					<div>
						
						<div>
							<table class="table">
								<tr>
									<td><textarea class="form-control required-field" rows="4" cols="30"
											id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
										<br>
										<div>
											<a href='#' onClick="fn_comment('${result.code }')"
												class="btn pull-right btn-primary btn-success">댓글등록</a>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<input type="hidden" id="coupleNum" name="coupleNum" value='${cboard["COUPLENUM"]}' />
					<input type="hidden" id="memberNum" name="memberNum" value='${loginMember.memberNum }'/>
					<input type="hidden" id="writerNumDB" name="writerNumDB" value='${cboard["MEMBERNUM"]}'/>
<%-- 					<input type="hidden" id="writerNum" name="writerNum" value='${loginMember.memberNum }'/> --%>
				</form>
			</div>
			



			<script>
			/*
			 * 댓글 등록하기(Ajax)
			 */
			function fn_comment(code){
			    
			    $.ajax({
			        type:'POST',
			        url : "<c:url value='/couple/addComment'/>",
			        data:$("#commentForm").serialize(),
			        success : function(data){
			            if(data=="success")
			            {
			                getCommentList();
			                $("#comment").val("");
			                $("#comment").focus();
			            }
			        },
			        error:function(request,status,error){
			            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			        
			    });
			}
			
			 
			/**
			 * 초기 페이지 로딩시 댓글 불러오기
			 */
			$(function(){
			    var cNum=${cboard["COUPLENUM"]};
			    console.log("콘솔cNUM!: "+cNum);
				console.log("${loginMember.id}");
			    
			    getCommentList(cNum);
// 			    showReplyList(cNum);
			    
			});
			
			
			//가져온 댓글리스트 불러오기
// 			function showReplyList(coupleNum){
// 				var url = "/couple/getReqlyList";
// 				var paramData = {"bid" : 'coupleNum'};
// 				$.ajax({
// 		            type: 'POST',
// 		            url: url,
// 		            data: $("#commentForm").serialize(),
// 		            dataType: 'json',
// 		            success: function(result) {
// 		               	var htmls = "";
// 					if(result.length < 1){
// 						htmls.push("등록된 댓글이 없습니다.");
// 					} else {
// 			                    $(result).each(function(){
// 			                     htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
// 			                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
// 			                     htmls += '<title>Placeholder</title>';
// 			                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
// 			                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
// 			                     htmls += '</svg>';
// 			                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
// 			                     htmls += '<span class="d-block">';
// 			                     htmls += '<strong class="text-gray-dark">' + this.reg_id + '</strong>';
// 			                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
// 			                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
// 			                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';
// 			                     htmls += '</span>';
// 			                     htmls += '</span>';
// 			                     htmls += this.content;
// 			                     htmls += '</p>';
// 			                     htmls += '</div>';
// 			                });	//each end
// 					}
// 					$("#replyList").html(htmls);

// 		            }	   // Ajax success end

// 				});	// Ajax end

// 			}
			
			
			
			 
			//기존 댓글 불러오기
			function getCommentList(coupleNum){
			    console.log("ajax 전!!: "+coupleNum);
			    $.ajax({
			        type:'GET',
			        url : "<c:url value='/couple/commentList'/>",
			        dataType : "json",
			        data:$("#commentForm").serialize(),
			        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			        success : function(data){

			            var htmls = "";
			            var cCnt = data.length;
			            if(data.length > 0){
			                
			                for(i=0; i<data.length; i++){
								var date = new Date(data[i].coupleDate);
								var date = date.getFullYear() +"-"+date.getMonth() +"-"+date.getDate()+" &nbsp"+date.getHours()+":"+date.getMinutes();
// 			           			 console.log(date);
			                	
// 			                    html += "<div>";
// 			                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
// 			                    html += "<tr><td>"+data[i].comment + "</td><td style='text-align: right;'>"+data[i].coupleDate+"</td></tr>";
// 			                    html += "</table></div>";
// 			                    html += "</div>";

			                	htmls += '<div class="media text-muted pt-3" id="commentNo' + data[i].commentNo + '">';
// 			                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
// 			                     htmls += '<title>Placeholder</title>';
// 			                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
// 			                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
// 			                     htmls += '</svg>';
			                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			                     htmls += '<span class="d-block">';
			                     htmls += '<strong class="text-gray-dark">' + data[i].writer + '</strong>';
			                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			                  
			                     htmls += '&nbsp &nbsp '+date+'&nbsp &nbsp';
			                     if("${loginMember.id}" == data[i].writer){
				                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + data[i].commentNo + ', \'' + data[i].writer + '\', \'' + data[i].comment + '\' )" style="padding-right:5px">수정</a>';
				                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + data[i].commentNo + ')" >삭제</a>';
			                     }
			                     
			                     
			                     htmls += '</span>';
			                     htmls += '</span>';
			                     htmls += '</p>';
			                     htmls += '<p>';
			                     htmls += data[i].comment;
			                     htmls += '</p>';
			                     htmls += '</div>';
			                }
			                
			            } else {
			                
			                htmls += "<div>";
			                htmls += "<div><table class='table'><p><strong>등록된 댓글이 없습니다.</strong></p>";
			                htmls += "</table></div>";
			                htmls += "</div>";
			                
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#cCnt2").html(cCnt);
			            $("#commentList").html(htmls);
			            
			        },
			        error:function(request,status,error){
			            
			       }
			        
			    });
			}
			 
			function fn_deleteReply(commentNo){
				if(confirm("댓글을 삭제하시겠습니가?")){
					console.log("초기 commentNo: "+commentNo);
				    var paramData = {"commentNo":commentNo};
				    $.ajax({
				        type:'POST',
				        url : "<c:url value='/couple/deleteComment'/>",
						data:paramData,
						dataType: 'text',
				        success : function(data){
				            if(data=="success")
				            {
				                getCommentList();
	// 			                $("#comment").val("");
				            }
				        },
				        error:function(request,status,error){
				            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				        
				    });
			    }
			}
		
			function fn_editReply(commentNo, writer, content){
				if(writer== "${loginMember.id}"){
					var htmls = "";
					htmls += '<div class="media text-muted pt-3" id="commentNo' + commentNo + '">';
	// 				htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	// 				htmls += '<title>Placeholder</title>';
	// 				htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	// 				htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	// 				htmls += '</svg>';
					htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
					htmls += '<span class="d-block">';
					htmls += '<strong class="text-gray-dark">' + writer + '</strong>';
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';
// 					htmls += '<c:if test="${empty loginMember}">'
					htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + commentNo + ', \'' + writer + '\')" style="padding-right:5px">저장</a>';
					htmls += '<a href="javascript:void(0)" onClick="getCommentList()">취소<a>';
// 					htmls += '</c:if>'
					htmls += '</span>';
					htmls += '</span>';		
					htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
					htmls += content;
					htmls += '</textarea>';
					htmls += '</p>';
					htmls += '</div>';
					
					$('#commentNo' + commentNo).replaceWith(htmls);
					$('#commentNo' + commentNo + ' #editContent').focus();
				}
				else{
					alert("등록한 작성자 본인이 아닙니다");
				}
			}
			
			//내가 임의로 만든 updateComment
// 			function fn_updateComment(commentNo,writer,comment){
// 			    var paramData = {"commentNo":commentNo , "writer":writer, "comment":comment};
			    
// 			    $.ajax({
// 			        type:'POST',
// 			        url : "<c:url value='/couple/updateComment'/>",
// // 			        data:$("#commentForm").serialize(),
// 					data:paramData,
// 					dataType: 'text',
// 			        success : function(data){
// 			            if(data=="success")
// 			            {
// 			                getCommentList();
// // 			                $("#comment").val("");
// 			            }
// 			        },
// 			        error:function(request,status,error){
// 			            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 			       }
			        
// 			    });
// 			}
			
			//수정후 저장버튼을 눌렀을때!  사용안할듯XXX
			$(document).on('click', '#btnReplySave', function(){
					var replyContent = $('#content').val();
					var replyReg_id = $('#reg_id').val();
	
					var paramData = JSON.stringify({"content": replyContent
							, "reg_id": replyReg_id
							, "bid":'${boardContent.bid}'
					});
					var headers = {"Content-Type" : "application/json"
							, "X-HTTP-Method-Override" : "POST"};
					$.ajax({
						url: "${saveReplyURL}"
						, headers : headers
						, data : paramData
						, type : 'POST'
						, dataType : 'text'
						, success: function(result){
							showReplyList();
	
							$('#content').val('');
							$('#reg_id').val('');
						}
						, error: function(error){
							console.log("에러 : " + error);
						}
					});
			});
			
			function fn_updateReply(commentNo, writer){
				if(confirm("댓글 수정을 완료하시겠습니가?")){
				var replyEditContent = $('#editContent').val();
				var paramData = JSON.stringify({"comment": replyEditContent, "commentNo": commentNo});
// 				var paramData = {"content":replyEditContent, "commentNo":commentNo};

				var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};

				$.ajax({
					url: "<c:url value='/couple/updateComment'/>"
					, headers : headers
					, data : paramData
					, type : 'POST'
					, dataType : 'text'
					, success: function(result){
						if(result=="success"){
		               	console.log(result);
		                getCommentList();
						}	
					}
					, error: function(error){
						console.log("에러 : " + error);
					}
				});
				
				}else{return false;}
			}
		
			
			function updateCB(){
				if(confirm("글을 수정하시겠습니까?")){
					location.href="${path }/couple/updateCoupleBoard?no=${cboard['COUPLENUM']}";
				}
				else{return false;}
			}
			function deleteCB(){
				if(confirm("글을 삭제하시겠습니까?")){
					location.href="${path }/couple/deleteCoupleBoard?no=${cboard['COUPLENUM']}";
				}
				else{return false;}
			}
			
			</script>


    		</div><!--/ row end -->
		</div><!--/ container end -->
	</section><!-- Blog details page end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>