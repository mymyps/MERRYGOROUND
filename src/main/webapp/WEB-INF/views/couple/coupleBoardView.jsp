<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
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
						<br><br><hr><hr><hr>
					

						<div class="gap-30"></div>

						<!-- Post comment start -->
						<div id="post-comments">
							<div class="comments-counter"><a href="#">댓글 07개</a></div>
							<ul class="comments-list">
								<li>
									<div class="comment">
										<img class="comment-avatar pull-left" alt="" src="images/blog/avator1.png">
										<div class="comment-body">
											<h4 class="comment-author">(댓글작성자)</h4>
											<div class="comment-date">2019-09-18 오후 1시 25분</div>
											<p>(댓글 내용)</p>
											<div class="text-right weight-600">
												<a class="comment-reply" href="#">
												<i class="fa fa-mail-reply"></i> 답글</a>
											</div>	
										</div>
									</div>
									<ul class="comments-reply">
										<li>
											<div class="comment">
												<img class="comment-avatar pull-left" alt="img" src="images/blog/avator2.jpg">
												<div class="comment-body">
													<h4 class="comment-author">(대댓글작성자)</h4>
													<div class="comment-date">(작성날짜)</div>
														<p>(대댓글 내용)</p>
													<div class="text-right weight-600">
														<a class="comment-reply" href="#">
														<i class="fa fa-mail-reply"></i> 답글</a>
													</div>	
												</div>
											</div>
										</li>
										<li>
											<div class="comment">
												<img class="comment-avatar pull-left" alt="" src="images/blog/avator1.png">
												<div class="comment-body">	
													<h4 class="comment-author">(대댓글작성자)</h4>
													<div class="comment-date">(작성날짜)</div>
													<p>(대댓글 내용))</p>
													<div class="text-right weight-600">
														<a class="comment-reply" href="#">
														<i class="fa fa-mail-reply"></i> 답글</a>
													</div>	
												</div>
											</div>
										</li>
									</ul><!-- comments-reply end -->
									<div class="comment last">
										<img class="comment-avatar pull-left" alt="" src="images/blog/author.jpg">
										<div class="comment-body">
											<h4 class="comment-author">Jack Ruler</h4>
											<div class="comment-date">March 29, 2014 at 1:38 pm</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In magna ligula, faucibus sed ligula ut, venenatis mattis diam. Proin feugiat mollis nibh.</p>
											<div class="text-right weight-600">
												<a class="comment-reply" href="#">
												<i class="fa fa-mail-reply"></i> Reply</a>
											</div>	
										</div>
									</div>
								</li><!-- Comments-list li end -->
							</ul><!-- Comments-list ul end -->
						</div><!-- Post comment end -->

						<div class="comments-form">
							<h3>댓글 작성란</h3>
							<form role="form">
								<!-- <div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>Your Name</label>
										<input class="form-control" name="name" id="name" placeholder="" type="text" required>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Your Email</label>
											<input class="form-control" name="email" id="email" placeholder="" type="email" required>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Your Website</label>
											<input class="form-control" placeholder="" type="text" required>
										</div>
									</div>
								</div> -->
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control required-field" id="message" placeholder="" rows="4" required></textarea>
								</div>
								<div><br>
								<button class="btn btn-primary" type="submit">댓글 달기</button> 
								</div>
							</form>
						</div><!-- Comments form end -->
					</div><!-- Blog post end -->
				</div><!--/ Content col end -->
				
				
				</div>
    		</div><!--/ row end -->
		</div><!--/ container end -->
	</section><!-- Blog details page end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>