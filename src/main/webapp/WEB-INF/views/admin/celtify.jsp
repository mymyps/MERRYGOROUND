<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
                                    <h1>서포터즈 리뷰 목록</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">추가관리</a></li>
                                        <!-- <li><a href="#">승인</a></li> -->
                                        <li class="active">서포터즈 승인 테이블</li>
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
    
                            <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong class="card-title">승인</strong>
                                        </div>
                                        <div class="table-stats order-table ov-h">
                                            <br>
                                            <table id="bootstrap-data-table" class="table table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>S번호</th>
                                                        <th class="avatar">face</th>
                                                        <th>ID</th>
                                                        <th>성별</th>
                                                        <th>연락처</th>
                                                        <th>e-mail</th>
                                                        <th>인가</th>
                                                	</tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${list }" var="b" varStatus="i">
	                                            <tr>
	                                            	<td><c:out value="${b['MEMBERNUM'] }"/></td>
	                                            	<td class="avatar">
	                                                    <div class="round-img">
	                                                        <a href="#"><img class="rounded-circle" src="${path }images/avatar/<c:out value="${b['PROIMG'] }"/>" alt=""></a>
	                                                    </div>
                                                    </td>
	                                                <td><span class="name"><c:out value="${b['ID'] }"/></span></td>
	                                                <td><c:out value="${b['GENDER'] }"/></td>
	                                                <td><c:out value="${b['PHONE'] }"/></td>
	                                                <td><c:out value="${b['EMAIL'] }"/></td>
	                                                <td>
                                                        <span class="badge badge-complete">승인</span>
                                                    </td>
	                                            </tr>
	                                            </c:forEach>
                                                    
                                                </tbody>
                                            </table>
                                        </div> <!-- /.table-stats -->
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