<%@ page language="java" contentType="text/html;charSet=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="INFOMATION"/>
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
                            <a href="blog-item.html">${info.INFOUPTITLE}</a>
                        </h1>
                        <div class="post-header clearfix">
                        
                            <div class="post-meta">
                                <span class="post-meta-author">NUM<a href="#"> ${info.INFOUPNUM }</a></span>
                                <span class="post-meta-cats infoDate">DATE<a href="#"> ${info.INFOUPDATE }</a></span>
                            </div><!-- post meta end -->
                        </div><!-- post heading end -->
                        <hr>
                        <!-- post image start -->
                        <div class="post-image-wrapper">
                            <img src="${path }/resources/upload/info/${infoImg.fileReName}" class="infoimg"  alt="" />
                        </div><!-- post image end -->
                        <div class="entry-content">
                            <div class="infocontent1">
                                <p>테마</p>
                                <p>위치</p>
                                <p>가격</p>
                                <p>번호</p>
                                <p>영업시간</p>
                            </div>
                            <div class="infocontent2">
                                <p>${info.THEMANAME }</p>
                                <p>${info.INFOADDR }</p>
                                <p>${info.INFOUPPAYMENT }</p>
                                <p>${info.INFOUPPHONE }</p>
                                <p>${info.INFOUPTIME }</p>
                            </div>
                        </div>
                        <br><br>
                        <div>
                            <form name="supReview" action="${pageContext.request.contextPath }/supUp/supReview?infoupNum=${info.INFOUPNUM}" method="post">
                                <button class="btn supreviewBtn" type="submit">서포터즈 리뷰 바로가기</button> 
                            </form>
                            <form name="supReviewForm" action="${pageContext.request.contextPath }/supUp/supReviewForm.do?infoupNum=${info.INFOUPNUM}" method="post">
                                <button class="btn supreviewBtn" type="submit">서포터즈 리뷰 작성하기</button> 
                            </form>
                            <br>
                            <form name="infoUpdate" action="${pageContext.request.contextPath }/info/infoUpdate?infoupNum=${info.INFOUPNUM}" method="post">
                                <button class="btn supreviewBtn" type="submit">INFOMATION 수정</button> 
                            </form>
                            <br>
                            <form name="infoDelete" action="${pageContext.request.contextPath }/info/infoStatus0?infoupNum=${info.INFOUPNUM }" method="post">
                                <button class="btn supreviewBtn" type="submit">INFOMATION 삭제</button> 
                            </form>
                        </div>
                        <!-- Author info end -->

                        <div class="gap-30"></div>
                        <div class="comments-form">
                            <h3>멤버 리뷰 등록하기</h3>
                            <form name="insertReview" action="${pageContext.request.contextPath }/infoReview/insertInfoReview?infoupNum=${info.INFOUPNUM}" method="post">
                                <input type="text" value="${loginMember.memberNum}" name="memNum">
                                <div class="form-group">
                                평점 <input type="number" step="1" max="5" min="0" name="infoReviewPoint" /><br><br>
                                    <input type="text" name="infoReviewContent" class="form-control required-field" id="message" placeholder="" rows="4" required></textarea>
                                    
                                </div>
                                <button class="btn reviewBtn" type="submit">리뷰 등록</button>
                            </form>
                        </div><!-- Comments form end -->
                        <br><br><br><br>
                        <!-- Post comment start -->
                        <div id="post-comments">
                            <ul class="comments-list">
                                <li>
                                	<c:if test="${not empty review }">
	                                <c:forEach items="${review}" var="r" >
		                                	<c:if test="${r['INFOREVIEWSTATUS']==1}">
			                                    <div class="comment">
			                                        <img class="comment-avatar pull-left" alt="" src="images/blog/avator1.png">
			                                        
			                                        <div class="comment-body">
			                                            <h4 class="comment-author"><c:out value='${r["NAME"] }'/></h4>
			                                            <div class="comment-date"><c:out value='${r["INFOREVIEWDATE"] }'/></div>
			                                            <div class="reviewPoint">
			                                                평점 <c:out value='${r["INFOREVIEWPOINT"] }'/> / 5
			                                            </div>
			                                            <hr>
			                                            <p><c:out value='${r["INFOREVIEWCONTENT"] }'/></p>
			                                            <form name="updateInfoReview" action="${pageContext.request.contextPath }/info/updateInfoReview?infoReviewNum=${r['INFOREVIEWNUM']}?infoupNum=${r['INFOUPNUM']}" method="post">
							                                <button class="btn" type="submit">리뷰 수정</button> 
							                            </form>
							                            <br>
							                            <form name="deleteInfoReview" action="${pageContext.request.contextPath }/info/status0InfoReview" method="post">
							                            	<input type="hidden" value="${r['INFOREVIEWNUM']}" name="infoReviewNum"/>
							                            	<input type="hidden" value="${info.INFOUPNUM }" name="infoupNum"/>
							                                <button class="btn" type="submit">리뷰 삭제</button> 
							                            </form>
			                                        </div>
			                                    </div>
		                                    </c:if>
                                    </c:forEach>
                                    </c:if>
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