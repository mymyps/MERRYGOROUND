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
                                    <h1>테 마</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">추가관리</a></li>
                                        <li><a href="#">지역&테마</a></li>
                                        <li class="active">테마 목록 테이블</li>
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
		                                    <strong class="card-title">테 마</strong>
		                                </div>
		                            </div>
		                            <div class="float-right">
	                                	<div class="input-group">
										  	<input class="form-control form-control-sm inputThema" type="text" placeholder="추가할 테마명">
										  	<div class="input-group-append">
											    	<button class="btn btn-success btn-sm" onclick="themaAdd(); return false;">추가</button>
										  	</div>
										</div>
		                            </div>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>테마</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list }" var="b" varStatus="i">
                                            <tr>
                                                <td><c:out value="${b['RNUM'] }"/></td>
                                                <td><c:out value="${b['THEMANAME'] }"/></td>
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
		function themaAdd() {
			var cTest = confirm("테마를 추가할까요?");
			if(cTest == true){
				console.log("true");
				
				var strTmp = $(".inputThema").val().trim();
				console.log(strTmp);
				
				//ajax ->
				$.ajax({
					url: '${path }/admin/themaAdd.do',
					data: {'strTmp': strTmp},
					success: function (data) {
						console.log("테마를 추가했습니다");
		            },
                    error : function(e) {
                    	console.log("ajax error");
                    }
				});
			}else{
				console.log("false");
			}
		}
    </script>

    <jsp:include page="/WEB-INF/views/admin/common/tableJs.jsp" />
