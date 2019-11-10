<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
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
                                    <h1>서포터즈 목록</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">사용자 관리</a></li>
                                        <li><a href="#">서포터즈</a></li>
                                        <li class="active">서포터즈 목록 테이블</li>
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
                                    <strong class="card-title">서포터즈</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th class="avatar">face</th>
                                                <th>SN</th>
                                                <th>ID</th>
                                                <th>이름</th>
                                                <th>연락처</th>
                                                <th>이메일</th>
                                                <th>가입일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${list }" var="b" varStatus="i">
                                            <tr>
                                                <td><c:out value="${b['RNUM'] }"/></td>
                                                <td class="avatar">
	                                                <div class="round-img">
	                                                    <a href="#"><img class="rounded-circle" src="${path }/resources/images/member/<c:out value="${b['PROIMG'] }"/>"></a>
	                                                </div>
                                                </td>
                                                <td><c:out value="${b['SUPNUM'] }"/></td>
                                                <td><c:out value="${b['ID'] }"/></td>
                                                <td><c:out value="${b['NAME'] }"/></td>
                                                <td><c:out value="${b['PHONE'] }"/></td>
                                                <td><c:out value="${b['EMAIL'] }"/></td>
                                                <td><fmt:formatDate value="${b['SUPENROLLDATE'] }" pattern="yyyy.MM.dd"/></td>
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
