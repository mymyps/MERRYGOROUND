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
                                    <h1>지역</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">추가 관리</a></li>
                                        <li><a href="#">지역&테마</a></li>
                                        <li class="active">세부 지역 테이블</li>
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
                                	<div class="float-left">
		                                <div >
		                                    <strong class="card-title">지 역</strong>
		                                </div>
		                            </div>
		                            <div class="float-right">
	                                	<div class="input-group">
										  	<input class="form-control form-control-sm" type="text" placeholder="추가할 지역명">
										  	<div class="input-group-append">
											    	<button class="btn btn-success btn-sm" onclick="localAdd(); return false;">추가</button>
										  	</div>
										</div>
		                            </div>
		        	            </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>지역명</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list }" var="b" varStatus="i">
                                            <tr>
                                                <td><c:out value="${b['RNUM'] }"/></td>
                                                <td><c:out value="${b['LOCALNAME'] }"/></td>
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
    <script type="text/javascript">
		function localAdd() {
			var cTest = confirm("지역을 추가할까요?");
			if(cTest == true){
				console.log("true");
				//ajax ->
			}else{
				console.log("false");
			}
		}
    </script>

   	<jsp:include page="/WEB-INF/views/admin/common/tableJs.jsp" />