<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp" />
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<!-- modal style -->
<style>
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 200;
  top: 0;
  width: 80%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.2); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
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
                                                        <th>M번호</th>
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
	                                            	<td class="fy${i.count }"><c:out value="${b['MEMBERNUM'] }"/></td>
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
                                                        <span class="badge badge-complete celti" id="fy${i.count }" >확 인</span>
                                                        <span class="badge badge-complete celti2" style="display:none">완 료</span>
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
    
    <!-- modal view -->
    <div id="myModal" class="modal">
    	<div class="modal-content">
    	
    	<section id="gallery" style="text-align: center;">
    	
    		
    	
    	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="${path }/resources/upload/supLv/default.png" alt="" style="height:404px;">
		    </div>
		    <div class="carousel-item">
		      <img src="${path }/resources/upload/supLv/default.png" alt="" style="height:404px;">
		    </div>
		    <div class="carousel-item">
		      <img src="${path }/resources/upload/supLv/default.png" alt="" style="height:404px;">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:#ff0000d1;"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true" style="background-color:#ff0000d1;"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		<br/>
		<div>
			<!-- 컨텐츠 내용 -->
			<span class="subCont"></span>
		</div>
		<br/>
    	
    	
    	
      	
    	<%-- 
    		<span class="close">&times;</span>
    		<!-- 디자인 작업 -->
    		<div class="row no-gutters">

	          <div class="col-lg-4 col-md-6">
	            <div class="gallery-item wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
	              <a href="${path }/resources/upload/supLv/default.png" class="gallery-popup">
	                <img src="${path }/resources/upload/supLv/default.png" alt="">
	              </a>
	            </div>
	          </div>

	          <div class="col-lg-4 col-md-6">
	            <div class="gallery-item wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
	              <a href="${path }/resources/upload/supLv/default.png" class="gallery-popup">
	                <img src="${path }/resources/upload/supLv/default.png" alt="">
	              </a>
	            </div>
	          </div>
	          <div class="col-lg-4 col-md-6">
	            <div class="gallery-item wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
	              <a href="${path }/resources/upload/supLv/default.png" class="gallery-popup">
	                <img src="${path }/resources/upload/supLv/default.png" alt="">
	              </a>
	            </div>
	          </div>

	          <div class="col-lg-4 col-md-6">
	            <div class="gallery-item wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
	              <a href="${path }/resources/upload/supLv/default.png" class="gallery-popup">
	                <img src="${path }/resources/upload/supLv/default.png" alt="">
	              </a>
	            </div>
	          </div>
	          <div class="col-lg-4 col-md-6">
	            <div class="gallery-item wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
	              <a href="${path }/resources/upload/supLv/default.png" class="gallery-popup">
	                <img src="${path }/resources/upload/supLv/default.png" alt="">
	              </a>
	            </div>
	          </div>
          </div>
    		 --%>
    		
    		
    		
    		
    		</section>
    		
    		
    		
    		
    		
    		<button class="btn btn-danger" type="button" onclick="celClick();">승 인</button>
    		<button class="btn btn-success" onclick="celClose();">승인 취소</button>
    	</div>
    
    </div>
    <!-- /#right-panel -->
    <script type="text/javascript">
    	
    	var memberNum = 0;
    	
    	function celClick() {
		    var cTest = confirm("승인 할까요?");
			if(cTest == true){
				//ajax
				console.log(memberNum);

				$.ajax({
					url: '${path }/admin/cletify.end',
					data: {'memberNum': memberNum},
					success: function (data) {
						//console.log(typeof(data));
						if(data=="true"){
							console.log("승인했습니다.");
							$(".celti").hide();
							$(".celti2").css('background-color', 'black').show();
							celClose();
						}else{
							alert("승인이 불가합니다");
						}
		            },
		            error : function(e) {
		            	console.log("ajax error");
		            }
				});
			}else{
				return false;
			}
		}
    	
	    $(function(){
	        $(".celti").on("click",function(e){
	        	
	        	memberNum = $('.'+this.id).text();
	        	console.log(memberNum);
	        	
	        	$.ajax({
	        		url: '${path}/admin/celtify.do',
	        		data: {'memberNum': memberNum},
	        		dataType:"JSON",
	        		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        		success: function (data) {
						console.log("승인관련 데이터조회 완료");
						$(".subCont").text(data['SUBLVCONTENT']);
						console.log(data);
						//모달뷰에 데이터를 출력
						
						modal.style.display = "block"; // 성공시 모달뷰 로드
					},
					error : function (e) {
						console.log("error" + e);
					}
				});
	        	
	        });
            
	    });
	    
	    /* modal view */
	    var modal = document.getElementById("myModal");
	    //var btn = document.getElementById("myBtn");
	    var span = document.getElementsByClassName("close")[0];
	    //btn.onclick = function () {
		//	modal.style.display = "block";
		//}
	    span.onclick = function () {
			modal.style.display = "none";
		}
	    window.onclick = function (e) {
			if(e.target == modal){
				modal.style.display = "none";
			}
		}
	    
	    function celClose() {
			modal.style.display = "none";
		}
	    
	</script>
	

    <jsp:include page="/WEB-INF/views/admin/common/tableJs.jsp" />