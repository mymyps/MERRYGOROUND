<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<style>
    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%; /* Could be more or less, depending on screen size */                          
	}
</style>

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
                                    <h1>공지 관리</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">공지 사항</a></li>
                                        <li class="active">공지 목록 테이블</li>
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
                                    <strong class="card-title">이용자</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>내용</th>
                                                <th>날짜</th>
                                                <th>수정/삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${list }" var="b" varStatus="i">
                                            <tr class="tr${b['NOTICENUM'] }">
                                            	<%-- <input type="text" value="<c:out value="${b['NOTICENUM'] }"/>" hidden> --%>
                                                <td><c:out value="${b['RNUM'] }"/></td>
                                                <td class="td${b['NOTICENUM'] }"><c:out value="${b['NOTICECONTENT'] }"/></td>
                                                <td><fmt:formatDate value="${b['NOTICEDATE'] }" pattern="yyyy.MM.dd"/></td>
                                                <td><button class="btn btn-success btn-sm" onclick="modif('${b['NOTICECONTENT'] }', ${b['NOTICENUM'] });">수정</button> <button class="btn btn-danger btn-sm" onclick="notiDel(${b['NOTICENUM'] });">삭제</button></td>
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
    
    <!-- The Modal -->
    <div id="myModal" class="modal">
 		<!-- Modal content -->
		<div class="modal-content">
		          <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
		          <textarea class="modalP" style="text-align: center; resize: none;" rows="5px" cols="20px"></textarea>
		          <!-- <p class="modalP"style="text-align: center; line-height: 1.5;"><br />내용 </p> -->
		          <p class="modalNum" hidden></p>
		         
		      <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="noti_mod();">
		          <span class="pop_bt" style="font-size: 13pt;" >
		               수정하기
		          </span>
		      </div> 
		      <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		          <span class="pop_bt" style="font-size: 13pt;" >
		               닫기
		          </span>
		      </div>
		</div>
 
    </div>
    <!--End Modal-->

   
    <jsp:include page="/WEB-INF/views/admin/common/tableJs.jsp" />
    
<script type="text/javascript">

	/* jQuery(document).ready(function() {
    	$('#myModal').show();
	}); */
	//팝업 Close 기능
	function modif(txtM, notiNum) {
		//console.log(notiNum);
		$(".modalNum").text(notiNum);
		$(".modalP").text(txtM);
		$('#myModal').show();
	}
	
	function close_pop(flag) {
 		$('#myModal').hide();
	};
	
	function noti_mod() {
		
		var moNum = $(".modalNum").text();
		var moTxt = $(".modalP").val();
		//console.log($(".modalNum").text());
		//console.log(moTxt);
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/admin/adminNotiMod',
			data: {
				'noNum': moNum,
				'noTxt':moTxt
				},
			success: function (data) {
				//console.log("sucees");
				if(data == 'true'){
					alert("공지사항이 수정되었습니다");
					var tdn = ".td"+moNum;
					$(tdn).text(moTxt);
					$('#myModal').hide();
				}else{
					console.log("공지삭제 실패");
				}
				
			},error: function(e) {
				console.log("ajax error");
            }
		});
 		
	};
	


	function notiDel(d) {
		//console.log(d);
		
		//console.log($(tmp));
		
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/admin/adminNotiDel',
			data: {'noticenum': d},
			success: function (data) {
				
				if(data == 'true'){
					tmp = ".tr"+d;
					$(tmp).remove();
					alert("공지사항이 삭제되었습니다");
					//console.log("공지사항이 삭제되었습니다");
				}else{
					console.log("공지삭제 실패");
				}
				
			},error: function(e) {
				console.log("ajax error");
            }
		});
		
	}

</script>
