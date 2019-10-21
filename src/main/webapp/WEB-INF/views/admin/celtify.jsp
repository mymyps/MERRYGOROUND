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
                                                        <th class="serial">#</th>
                                                        <th class="avatar">Avatar</th>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Product</th>
                                                        <th>Quantity</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="serial">1.</td>
                                                        <td class="avatar">
                                                            <div class="round-img">
                                                                <a href="#"><img class="rounded-circle" src="images/avatar/1.jpg" alt=""></a>
                                                            </div>
                                                        </td>
                                                        <td> #5469 </td>
                                                        <td>  <span class="name">Louis Stanley</span> </td>
                                                        <td> <span class="product">iMax</span> </td>
                                                        <td><span class="count">231</span></td>
                                                        <td>
                                                            <span class="badge badge-complete">Complete</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="serial">2.</td>
                                                        <td class="avatar">
                                                            <div class="round-img">
                                                                <a href="#"><img class="rounded-circle" src="images/avatar/2.jpg" alt=""></a>
                                                            </div>
                                                        </td>
                                                        <td> #5468 </td>
                                                        <td>  <span class="name">Gregory Dixon</span> </td>
                                                        <td> <span class="product">iPad</span> </td>
                                                        <td><span class="count">250</span></td>
                                                        <td>
                                                            <span class="badge badge-complete">Complete</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="serial">3.</td>
                                                        <td class="avatar">
                                                            <div class="round-img">
                                                                <a href="#"><img class="rounded-circle" src="images/avatar/3.jpg" alt=""></a>
                                                            </div>
                                                        </td>
                                                        <td> #5467 </td>
                                                        <td>  <span class="name">Catherine Dixon</span> </td>
                                                        <td> <span class="product">SSD</span> </td>
                                                        <td><span class="count">250</span></td>
                                                        <td>
                                                            <span class="badge badge-complete">Complete</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="serial">4.</td>
                                                        <td class="avatar">
                                                            <div class="round-img">
                                                                <a href="#"><img class="rounded-circle" src="images/avatar/4.jpg" alt=""></a>
                                                            </div>
                                                        </td>
                                                        <td> #5466 </td>
                                                        <td>  <span class="name">Mary Silva</span> </td>
                                                        <td> <span class="product">Magic Mouse</span> </td>
                                                        <td><span class="count">250</span></td>
                                                        <td>
                                                            <span class="badge badge-pending">Pending</span>
                                                        </td>
                                                    </tr>
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