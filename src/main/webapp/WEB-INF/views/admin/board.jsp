<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param name="pageTitle" value=""/>
</jsp:include> --%>
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />

<!-- ---------------------------------------------------------------------------- -->
<!-- -------------------------     데이터      ------------------------------------ -->
<!-- ---------------------------------------------------------------------------- -->
        <!-- Content -->
            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">
                        <div class="col-sm-4">
                            <div class="page-header float-left">
                                <div class="page-title">
                                    <h1>게시글 목록</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">게시글 관리</a></li>
                                        <li><a href="#">게시글</a></li>
                                        <li class="active">게시글 목록 테이블</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="content">
                <div class="animated fadeIn">
                    <div class="row">
    
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">게시글</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <!-- -- 글넘버 제목 테마 지역 페이 전화번호 운영시간 날짜 -->
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>제목</th>
                                                <th>테마</th>
                                                <th>지역</th>
                                                <th>페이</th>
                                                <th>전화번호</th>
                                                <th>운영시간</th>
                                                <th>날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${list }" var="b" varStatus="i">
                                            <tr>
                                                <td><c:out value="${b['RNUM'] }"/></td>
                                                <td><c:out value="${b['INFOUPTITLE'] }"/></td>
                                                <td><c:out value="${b['THEMANAME'] }"/></td>
                                                <td><c:out value="${b['LOCALNAME'] }"/></td>
                                                <td><c:out value="${b['INFOUPPAYMENT'] }"/></td>
                                                <td><c:out value="${b['INFOUPPHONE'] }"/></td>
                                                <td><c:out value="${b['INFOUPTIME'] }"/></td>
                                                <td><fmt:formatDate value="${b['INFOUPDATE'] }" pattern="yyyy.MM.dd"/></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
    
    
                    </div>
                </div><!-- .animated -->
            </div>
            <!-- .content -->
    
            <div class="clearfix"></div>
            
            <!-- footer panel -->
            <footer class="site-footer">
                
            </footer>
        
        </div><!-- /#right-panel -->
    </div>
    <!-- /#right-panel -->
    <jsp:include page="/WEB-INF/views/admin/common/tableJs.jsp" />
    <%-- <script src="${path}/resources/admin/assets/js/lib/data-table/dataTables.buttons.min.js"></script> --%>
    
