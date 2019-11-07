<%@ page language="java" contentType="text/html;charSet=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="INFOMATION"/>
</jsp:include>
<section id="content">
<input type="hidden" value="${loginMember.id }" name="id"/>
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
                        	<c:if test="${not empty supUp}">
	                            <form name="supReview" action="${pageContext.request.contextPath }/supUp/supReview?infoupNum=${info.INFOUPNUM}&id=${loginMember.id}" method="post">
	                                <button class="btn supreviewBtn" type="submit">서포터즈 리뷰 바로가기</button> 
	                            </form>
                            </c:if>
                            <c:if test="${loginMember.memberNum eq sup.MEMBERNUM }">
	                            <c:if test="${empty supUp }">
		                            <form name="supReviewForm" action="${pageContext.request.contextPath }/supUp/supReviewForm.do?infoupNum=${info.INFOUPNUM}&id=${loginMember.id}" method="post">
		                                <button class="btn supreviewBtn" type="submit">서포터즈 리뷰 작성하기</button> 
		                            </form>
	                            </c:if>
	                            <br>
	                            <c:if test="${not empty loginMember }">
	                            	<form name="infoUpdate" action="${pageContext.request.contextPath }/info/infoUpdate?infoupNum=${info.INFOUPNUM}" method="post">
		                                <button class="btn supreviewBtn" type="submit">INFOMATION 수정</button> 
		                            </form>
		                            <br>
		                            <form name="infoDelete" action="${pageContext.request.contextPath }/info/infoStatus0?infoupNum=${info.INFOUPNUM }" method="post">
		                                <button class="btn supreviewBtn" type="submit">INFOMATION 삭제</button> 
		                            </form>
	                            </c:if>
                            </c:if>
                        </div>
                        <!-- Author info end -->

                        <div class="gap-30"></div>
                        <c:if test="${not empty loginMember }">
	                        <div class="comments-form">
	                            <h3>멤버 리뷰 등록하기</h3>
	                            <form name="insertReview" action="${pageContext.request.contextPath }/infoReview/insertInfoReview?infoupNum=${info.INFOUPNUM}" method="post">
	                                <input type="hidden" value="${loginMember.memberNum}" name="memNum">
	                                <div class="form-group">
	                                평점 <input type="number" step="1" max="5" min="0" name="infoReviewPoint" /><br><br>
	                                    <input type="text" name="infoReviewContent" class="form-control required-field" id="message" placeholder="" rows="4" required></textarea>
	                                    
	                                </div>
	                                <button class="btn reviewBtn" type="submit">리뷰 등록</button>
	                            </form>
	                        </div><!-- Comments form end -->
                        </c:if>
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
			                                        
			                                        <div class="comment-body" id="review${r['INFOREVIEWNUM'] }">
			                                            <h4 class="comment-author"><c:out value='${r["NAME"] }'/></h4>
			                                            <div class="comment-date"><c:out value='${r["INFOREVIEWDATE"] }'/></div>
			                                            <div class="reviewPoint">
			                                                평점 <c:out value='${r["INFOREVIEWPOINT"] }'/> / 5
			                                            </div>
			                                            <hr>
			                                            <div class="reviewContent"><c:out value='${r["INFOREVIEWCONTENT"] }'/></div>
						                                
						                                <c:if test="${loginMember.memberNum eq r['MEMBERNUM'] }">
							                                <button class="btn" type="submit" onclick="updateInfoReview${r['INFOREVIEWNUM']}();">리뷰 수정</button>
								                            
								                            <br>
								                            <form name="deleteInfoReview" action="${pageContext.request.contextPath }/info/status0InfoReview" method="post">
								                            	<input type="hidden" value="${r['INFOREVIEWNUM']}" name="infoReviewNum"/>
								                            	<input type="hidden" value="${info.INFOUPNUM }" name="infoupNum"/>
								                                <button class="btn" type="submit">리뷰 삭제</button> 
								                            </form>
							                            </c:if>
			                                        </div>
			                                        <script>
			                                        function updateInfoReview${r['INFOREVIEWNUM']}(){
					                            		var html="";
					                            		html+="<form name='updateInfoReview' action='${pageContext.request.contextPath }/info/updateInfoReview?infoReviewNum=${r['INFOREVIEWNUM']}&infoupNum=${info.INFOUPNUM}' method='post'>";
					                            		html+="<input type='hidden' name='infoReviewNum' value='${r["INFOREVIEWNUM"]}'";
					                            		html+="<div class='comment-body' id='review${r["INFOREVIEWNUM"] }'>";
					                            		html+="<h4 class='comment-author'><c:out value='${r["NAME"] }'/></h4>";
					                            		html+="<div class='comment-date'><c:out value='${r["INFOREVIEWDATE"] }'/></div>";
					                            		html+="<div class='reviewPoint'>평점 <input type='number' step='1' max='5' min='0' name='infoReviewPoint' value='${r["INFOREVIEWPOINT"] }'/> / 5</div>";
					                            		
					                            		html+="<div class='reviewContent'><input type='text' name='infoReviewContent' class='form-control required-field' id='message' value='${r["INFOREVIEWCONTENT"]}' rows='4' required/></div>";
					                            		html+="<br>";
					                            		html+="<button class='btn reviewBtn' type='submit'>수정 완료</button>";
					                            		html+="<br><br>";
					                            		/* html+="<input type='hidden' name='infoReviewNum' value='${r['INFOREVIEWNUM']}'"
					                                    html+="<div class='form-group'>";
					                                    html+=" 평점 <input type='number' step='1' max='5' min='0' name='infoReviewPoint' />";
														html+="<input type='text' name='infoReviewContent' class='form-control required-field' id='message' placeholder='' rows='4' required></textarea>";
					                                    html+="</div>";
					                                    html+="<button class='btn reviewBtn' type='submit'>수정 완료</button>"; */
					                                    
					                                    
					                                    html+="</form>";
					                                    
					                                    $("#review"+"${r['INFOREVIEWNUM']}").replaceWith(html);
				                            		}
						                            </script>
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