<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<jsp:include page ="/WEB-INF/views/common/header.jsp">
<jsp:param name ="pageTitle" value=""/>
</jsp:include>

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
									숙소가기전 우븟 재래시장!
								</h1>
								<div class="post-meta">
									<span class="post-meta-author">작성자 <a href="#"> (작성자)</a></span>
									<!-- <span class="post-meta-cats">in <a href="#"> News</a></span> -->
									<div class="pull-right">
										<span class="post-meta-comments"><a href="#"><i class="fa fa-comment-o"></i> (댓글 수)</a></span>
										<span class="post-meta-hits"><a href="#"><i class="fa fa-heart-o"></i> (좋아요 수)</a></span>
									</div>
									
								</div><!-- post meta end -->
							</div><!-- post heading end -->
							<br>

						<!-- post image start -->
						<div class="post-image-wrapper">
							<img src="../imgS/1-1.jpg" class="img"  alt="" />
							<!-- <span class="blog-date"> May 03, 2015</span> -->
						</div><!-- post image end -->
						
						<div class="entry-content">
							<p> 발리 자유여행 코스로 우붓 재래시장은 꼬옥 들러봐야 합니다

									꾸따, 스미냑등 쇼핑센터, 시장등 여러군데 다녀보았는데
									
									우붓 재래시장이 젤 싸.. 기념품등.. 구매하실때는 무조껀 여기로 꼬꼬우!!!</p>
							
						</div><br>


						<!-- Blog post start -->
					<div class="post-content">
							<!-- post image start -->
							<div class="post-image-wrapper">
								<img src="../imgS/1-1-1.jpg" class="img"  alt="" />
								<!-- <span class="blog-date"> May 03, 2015</span> -->
							</div><!-- post image end -->
							
							<div class="entry-content">
								<p> 발리 자유여행 코스로 우붓 재래시장은 꼬옥 들러봐야 합니다
	
										꾸따, 스미냑등 쇼핑센터, 시장등 여러군데 다녀보았는데
										
										우붓 재래시장이 젤 싸.. 기념품등.. 구매하실때는 무조껀 여기로 꼬꼬우!!!</p>
								
							</div>

						<!-- Author info start -->
						<!-- <div class="about-author">
							<div class="author-img pull-left">
								<img src="images/blog/author.jpg" alt="" />
							</div>
							<div class="author-info">
								<h3>Josefine Kristy <span>Web Developer</span></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vestibulum eget justo sit amet varius.</p>
								<p class="author-url">Website: <span><a href="#">http://www.spikeincor.eu</a></span></p>

							</div>
						</div> -->
						<!-- Author info end -->

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