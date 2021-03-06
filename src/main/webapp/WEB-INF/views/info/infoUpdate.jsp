<%@ page language="java" contentType="text/html;charSet=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/js/post.js" charset="utf-8"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="INFOMATION"/>
</jsp:include>
<section id="content">
	<div class="container">
		<form name="infoForm"
			action="${pageContext.request.contextPath }/info/infoUpdateEnd.do?infoupNum=${info.INFOUPNUM}&id=${loginMember.id}"
			method="post"
			enctype="multipart/form-data" onsubmit="return checkNull();">
			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">INFOMATION ${info.INFOUPNUM }번 수정</a>
						</h1>
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div>
									<div class="infoFormSubFrame">이미지</div>
									<p class="infoForm1">
										<input type="file" name="infoupFile" id="infoupFile" />
										<img src="${path }/resources/upload/info/${infoImg.fileReName }" class="infoimg	"/>
										
									</p>
										<div id="imageInfo">
										</div>
								</div>

								<div>
									<div class="infoFormSubFrame">제목</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TITLE" name="infoupTitle" value="${info.INFOUPTITLE }" id="infoupTitle"/>
									</p>
								</div>
								
								<div>
									<div class="infoFormSubFrame">테마</div>
									<p class="infoForm1">
										<select id="mainThema" name="themaNum" class="mainThema">
											<c:forEach items="${themaList2 }" var="t">
												<c:if test="${info.THEMANUMREF ==t['THEMANUM']}">
													<option value="${t['THEMANUM'] }" selected>${t['THEMANAME'] }</option>
												</c:if>
											</c:forEach>
											<c:forEach items="${themaList2 }" var="t">
												<c:if test="${info.THEMANUM != t['THEMANUM']}">
													<c:if test="${info.THEMANUMREF != t['THEMANUM'] }">
														<option value="${t['THEMANUM'] }">${t['THEMANAME'] }</option>
													</c:if>
												</c:if>
											</c:forEach>
										</select>
										<select id="subThema" name="themaSubNum">
											<option value="${info.THEMANUM }" selected>${info.THEMANAME }</option>
										</select>
									</p>
								</div>
								<script>
                              $(function(){
                                 $("#mainThema").click(function(){
                                    var themaNumRef=$("#mainThema").val();
                                    $.ajax({
                                       url:"<%=request.getContextPath()%>/info/selectSubThema",
                                       type:"post",
                                       data:{"themaNumRef":themaNumRef},
                                       dataType:"JSON",
                                       success:function(data){
                                          console.log(data);
                                          $('#subThema').find("option").remove();
                                          for(var i=0;i<data.length;i++){
	                                          $('<option value="' + data[i].THEMANUM +'">' + data[i].THEMANAME + '</option>').appendTo('#subThema');
                                          }
                                       }
                                    });
                                 });
                              });
                           </script>
								
								<div>
									<div class="infoFormSubFrame">장소</div>
									<p class="infoForm1">
										<select id="" name="localNum" class="infoFormLocFrame">
											<option value="${info.LOCALNUM }" selected>${info.LOCALCITY}</option>
											<c:forEach items="${locationList }" var="l">
												<c:if test="${info.LOCALNUM != l['LOCALNUM'] }">
													<option value="${l['LOCALNUM'] }">${l['LOCALCITY'] }</option>
												</c:if>
											</c:forEach>
										</select>
										
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">가격</div>
									<p class="infoForm1">
										<input type="number" step="1000" name="infoupPayment" value="${info.INFOUPPAYMENT }" id="infoupPayment"/>
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">번호</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO PHONE" name="infoupPhone" value="${info.INFOUPPHONE }" id="infoupPhone"/>
									</p>
								</div>
								<div>
									<div class="infoFormSubFrame">시간</div>
									<p class="infoForm1">
										<input type="text" placeholder="INFO TIME" name="infoupTime" value="${info.INFOUPTIME }" id="infoupTime"/>
									</p>
								</div>
								<label for="address"  class="infoFormSubFrame">주소</label>
								<div class="infoForm1">
									<div class="input-group mb-1">
 										<!-- <input type="text" class="form-control start-postcode"
											name="post-number" placeholder="우 편 번 호"
											style="text-align: center" id="st-addr-post" readonly> -->
										<input type="text" class="form-control start-addr" name="infoAddr"
											placeholder="주소를 검색해주세요" onkeydown="JavaScript:Enter_Check(1);"
											id="st-addr" value="${info.INFOADDR }" readonly>
										<div class="input-group-append">
											<button class="btn btn-outline-secondary start-btn" type="button"
												id="button-addon1" onclick="execDaumPostcode(1)">주소 찾기</button>
										</div>
									</div>
								</div>
								<br>
								<br>
								<div>
									<button class="btn infoFormBtn" type="submit">INFO 수정</button>
									<input type="button" class="btn infoFormBtn" onClick="location.href='${pageContext.request.contextPath }/info/infoView.do?infoupNum=${info.INFOUPNUM }&id=${loginMember.id }'" value="INFO 수정 취소">
								</div>
							</div>

						</div>



					</div>
					<!-- Blog post end -->
				</div>
				<!--/ Content col end -->

			</div>
		</form>
	</div>
<script>

function checkNull(){
	var infoupFile=$('#infoupFile');
	var infoupTitle=$('#infoupTitle');
	var infoupPayment=$('#infoupPayment');
	var infoupPhone=$('#infoupPhone');
	var infoupTime=$('#infoupTime');
	var addr=$('#st-addr');
	var buttonAddr=$('#button-addon1');
	
	if(infoupFile.val()==""){
       alert('이미지를 등록해주세요.');
       infoupFile.focus();
       return false;
	}
	
	if(infoupTitle.val()==""){
		alert('제목을 입력해주세요.');
		
		infoupTitle.focus();
		return false;
	}
	
	if(infoupPayment.val()==""){
		alert('가격을 입력해주세요.');
		
		infoupPayment.focus();
		return false;
	}
	if(infoupPhone.val()==""){
		alert('번호를 입력해주세요.');
		infoupPhone.focus();
		return false;
	}
	if(infoupTime.val()==""){
		alert('시간을 입력해주세요.');
		
		infoupTime.focus();
		return false;
	}
	if(addr.val()==""){
		alert('주소를 입력해주세요.');
		
		buttonAddr.focus();
		return false;
	}
	
}

	function Enter_Check(pocode){
	    if(event.keyCode == 13){
	    	execDaumPostcode(pocode); 
	    }
	    
	}

	function execDaumPostcode(d) {
		var a = new daum.Postcode({
			oncomplete: function(data) {

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

				var addr = ""; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
//					document.getElementById("sample6_extraAddress").value = extraAddr;

				} 

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				if(d === 1 ){
					$(".start-postcode").val(data.zonecode);
					$(".start-addr").val(addr);
					$("#address").val("");
					$(".start-addr-detail").focus();
				}else{
					$(".end-postcode").val(data.zonecode);
					$(".end-addr").val(addr);
					$("#address2").val("");
					$(".end-addr-detail").focus();
				}
			}
		}).open();
	}
	
	var check = 0;
	
	$(document).on("change","input[name='infoupFile']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        check =0;
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           check = 1;
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           check = 1;
           return;
        }
     });
	
	//div 이미지 출력하기
    $('[name=infoupFile]').change(function () {
        var reader = new FileReader();
        reader.onload = function (e) {
        	if(check==0){
        	var img2 = $('<div class="infoFormSubFrame">변경할 이미지<br>미리보기</div>');
            var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
            $('#imageInfo').append(img2);
            $('#imageInfo').append(img);
        	}else{
        		return;
        	}
        }
        
     	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
    });
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>