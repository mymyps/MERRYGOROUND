<%@ page language="java" contentType="text/html;charSet=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="demo"/>
</jsp:include>
<section id="content">

    <!-- Blog details page start -->
    <section id="main-container">
        <div class="container">
            <div class="row">

                <!-- Blog start -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- Blog post start -->
                    <div class="post-content">
                        <h1 class="post-title text-center">
                            <a href="blog-item.html">INFO TITLE</a>
                        </h1>
                        <div class="post-header clearfix">
                        
                            <div class="post-meta">
                                <span class="post-meta-author">INFO<a href="#"> NUM</a></span>
                                <span class="post-meta-cats infoDate">INFO<a href="#"> DATE</a></span>
                            </div><!-- post meta end -->
                        </div><!-- post heading end -->
                        <hr>
                        <!-- post image start -->
                        <div class="post-image-wrapper">
                            <img src="images/blog/blog1.jpg" class="infoimg"  alt="" />
                        </div><!-- post image end -->
                        <div class="entry-content">
                            <div class="infocontent1">
                                <p>INFO - THEMA</p>
                                <p>INFO - LOCATION</p>
                                <p>INFO - PAY</p>
                                <p>INFO - PHONE</p>
                                <p>INFO - TIME</p>
                            </div>
                            <div class="infocontent2">
                                <p>INFO - THEMA VALUE</p>
                                <p>INFO - LOCATION VALUE</p>
                                <p>INFO - PAY VALUE</p>
                                <p>INFO - PHONE VALUE</p>
                                <p>INFO - TIME VALUE</p>
                            </div>
                        </div>
                        <!-- Author info start -->
                        <!-- <div class="about-author">
                            <div class="author-img pull-left">
                                <img src="images/blog/author.jpg" alt="" />
                            </div>
                            <div class="author-info">
                                <h3>SUPPORTERS NAME <span>SUP - MEMBER - ID</span></h3>
                                <p>SUP - MEMBER - EMAIL</p>
                                <p>SUP - MEMBER - PHONE</p>
                                    
                            </div>
                            
                        </div> -->
                        <br><br>
                        <div>
                            <form>
                                <button class="btn supreviewBtn" type="submit">서포터즈 리뷰 바로가기</button> 
                            </form>
                        </div>
                        <!-- Author info end -->

                        <div class="gap-30"></div>
                        <div class="comments-form">
                            <h3>MEMBER REVIEW</h3>
                            <form role="form">
                                <div class="form-group">
                                    <textarea class="form-control required-field" id="message" placeholder="" rows="4" required></textarea>
                                    
                                </div>
                                <button class="btn reviewBtn" type="submit">Post Comment</button>
                            </form>
                        </div><!-- Comments form end -->
                        <br><br><br><br>
                        <!-- Post comment start -->
                        <div id="post-comments">
                            <div class="comments-counter"><a href="#">NN개의 리뷰를 남기셨습니다.</a></div>
                            <ul class="comments-list">
                                <li>
                                    <div class="comment">
                                        <img class="comment-avatar pull-left" alt="" src="images/blog/avator1.png">
                                        
                                        <div class="comment-body">
                                            <h4 class="comment-author">Jack Ruler</h4>
                                            <div class="comment-date">March 29, 2014 at 1:38 pm</div>
                                            <div class="reviewPoint">
                                                REVIEW POINT 4.0/5.0
                                            </div>
                                            <hr>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In magna ligula, faucibus sed ligula ut, venenatis mattis diam. Proin feugiat mollis nibh.</p>
                                        </div>
                                    </div>
                                    <div class="comment last">
                                            <img class="comment-avatar pull-left" alt="" src="images/blog/avator1.png">
                                            
                                            <div class="comment-body">
                                                <h4 class="comment-author">Jack Ruler</h4>
                                                <div class="comment-date">March 29, 2014 at 1:38 pm</div>
                                                <div class="reviewPoint">
                                                    REVIEW POINT 4.0/5.0
                                                </div>
                                                <hr>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In magna ligula, faucibus sed ligula ut, venenatis mattis diam. Proin feugiat mollis nibh.</p>
                                            </div>
                                        </div>
                                </li><!-- Comments-list li end -->
                            </ul><!-- Comments-list ul end -->
                        </div><!-- Post comment end -->

                        
                    </div><!-- Blog post end -->
                </div><!--/ Content col end -->
                
                </div>
            </div><!--/ row end -->
        </div><!--/ container end -->
    </section><!-- Blog details page end -->
    

    <div class="gap-40"></div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>