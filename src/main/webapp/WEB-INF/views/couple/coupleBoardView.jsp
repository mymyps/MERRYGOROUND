<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

<script src="http://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script>
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
										<span class="post-meta-comments"><a href="#"><i class="fa fa-comment-o"></i> (댓글 수)</a></span>
										<span class="post-meta-hits"><a href="#"><i class="fa fa-heart-o"></i> (좋아요 수)</a></span>
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
<!-- 							<p>  -->
<%-- 								<c:out value='${cboard["COUPLECONTENT"] }'></c:out> --%>
<!-- 							</p> -->
							
						</div><br>
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
						<button class="btn btn-primary pull-left" onclick='location.href="${path }/couple/updateCoupleBoard?no=${cboard["COUPLENUM"]}"'>글 수정</button>
						<button class="btn btn-primary pull-right" onclick='location.href="${path }/couple/deleteCoupleBoard?no=${cboard["COUPLENUM"]}"'>글 삭제</button> 
						<br><hr>
					

						<div class="gap-30"></div>
						
<!-- 				--------------------------------------------------------- -->

			<div class="container">
				<form id="commentListForm" name="commentListForm" method="post">
					<div>
						<span><strong>댓글</strong></span>
						<span id="cCnt"></span>
						<span><strong>개</strong></span>
					</div><hr><br><br>
					<div id="commentList"></div>
				</form>
			</div>

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
												class="btn pull-right btn-primary btn-success">등록</a>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<input type="hidden" id="coupleNum" name="coupleNum"
						value='${cboard["COUPLENUM"]}' />
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
// 			    var cNum=${cboard["COUPLENUM"]};
// 			    console.log("콘솔cNUM!: "+cNum);
			    
			    getCommentList(coupleNum);
			    
			});
			 
			/**
			 * 댓글 불러오기(Ajax)
			 */
			function getCommentList(coupleNum){
			    
			    $.ajax({
			        type:'GET',
			        url : "<c:url value='/couple/commentList'/>",
			        dataType : "json",
			        data:$("#commentForm").serialize(),
			        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			        success : function(data){
			            
			            var html = "";
			            var cCnt = data.length;
			            
			            if(data.length > 0){
			                
			                for(i=0; i<data.length; i++){
			                    html += "<div>";
// 			                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
			                    html += "<div><table class='table'><h6><strong></strong></h6>";
			                    html += "<tr><td>"+data[i].comment + "</td><td style='text-align: right;'>"+data[i].coupleDate+"</td></tr>";
			                    html += "</table></div>";
			                    html += "</div>";
			                }
			                
			            } else {
			                
			                html += "<div>";
			                html += "<div><table class='table'><p><strong>등록된 댓글이 없습니다.</strong></p>";
			                html += "</table></div>";
			                html += "</div>";
			                
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			        },
			        error:function(request,status,error){
			            
			       }
			        
			    });
			}
			 
			</script>


    		</div><!--/ row end -->
		</div><!--/ container end -->
	</section><!-- Blog details page end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>