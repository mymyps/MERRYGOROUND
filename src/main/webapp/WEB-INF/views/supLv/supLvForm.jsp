<%@ page language="java" contentType="text/html;charSet=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="서포터즈" />
</jsp:include>
<section id="content">
	<div class="container">
		<form name="infoForm"
			action="${pageContext.request.contextPath }/supLv/supLvFormEnd.do?id=${loginMember.id}"
			method="post" enctype="multipart/form-data"  onsubmit="return checkNull();">
			<input type="hidden" value="${loginMember.id }" name="id" />
			<input type="hidden" value="${loginMember.memberNum }" name="memberNum" />
			<div class="row">
				<!-- Blog start -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- Blog post start -->
					<div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">신청</a>
						</h1>
						
						<div style="overflow:scroll; width:700px; height:400px; padding:10px;margin-left: 225px; ">
													제 1조 (목적 및 소개)
						<br>
						본 약관은 ‘MERRY-GO-ROUND’의 약관이며 MERRY-GO-ROUND의 별도의 회원가입 서비스를 제공하는데 있어, 필요한 제반사항을 규정하는데 있습니다.
						1.‘MERRY-GO-ROUND’은 상용차 전문 업체 정보 서비스를 주목적으로 하는 홈페이지입니다. 따라서 상용차 정보 업체와 관련된 분쟁 및 소송, 손해배상 또는 이의제기는 본 사이트와 아무 관련 및 책임이 없음을 알려드립니다.
						2.회원은 무료회원이며, 모든 서비스를 제공받을 수 있습니다.
						<br>
						<br>
						제 2조 (가입약관의 효력 및 변경)
						<br>
						1. 이 약관은 ‘MERRY-GO-ROUND’ 사이트 및 각 서비스 메뉴에 공시함으로써 효력을 발생합니다.
						2. ‘MERRY-GO-ROUND’은 별도의 통보 없이 본 약관을 변경할 수 있으며, 약관이 변경된 경우에 지체 없이 이를 공시합니다.
						<br><br>
						제 3조 (약관의 준용)<br>
						이 약관에 명시되지 아니한 사항에 대해서는 관계법령 및 서비스별 약관의 취지에 따라 적용할 수 있습니다.
						<br><br>
						제 4조 (용어의 정의)
<br>
						1.이용자 : 본 사이트의 회원가입 없는 불특정 다수의 사용자로써 인터넷 네트워크를 통해 상용자 전문 업체들의 컨텐츠 서비스를 이용한 자를 말합니다.
						<br><br>
						제 5조 (기타 용어의 정의)
						<br>
						이 약관에서 사용하는 용어의 정의는 제 4조에서 정하는 것을 제외하고는 관계법령 및 서비스별 약관에서 정하는 바에 의합니다.
						<br><br>
						제 6조 (서비스 이용시간)
<br>
						서비스의 이용은 연중무휴 1일 24시간으로 운영함을 원칙으로 합니다. 단, ‘MERRY-GO-ROUND’이 업무 또는 기술상의 사유로 서비스가 일시 중단 되거나 운영상 목적으 로 일시 중단할 수 있습니다.
						<br><br>
						제 7조 (회사의 의무)
	<br>
‘MERRY-GO-ROUND’은 ‘MERRY-GO-ROUND’이 별도의 회원가입을 받지 있어 이용고객의 신상정보를 알수 없으며 혹여 수집 되었다 하여도 본인의 승낙 없이 제 3자에게 양도 또는 누설하지 않습니다.
단, 정보 통신 윤리 위원회 또는 정부관계기관의 수사 목적 등 관계 법령에서 정한 바에 따라 요청이 있을 경우에는 그러하지 않습니다.
‘MERRY-GO-ROUND’은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 지체 없이 이를 수리 또는 복구합니다.
다만, 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수 있습니다.
‘MERRY-GO-ROUND’은 회원의 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 팝업창 또는 공지사항, 이벤트 사항 등의 게시판으로 전달할 수 있습니다.
본 사이트의 업체를 광고, 홍보해주는 역할일 뿐, 업체 개인 간 거래로 인한 ‘MERRY-GO-ROUND’과의 문제는 제기를 할 수 없습니다. 다만 문제가 야기된 업체나 그런 업체에 대해 ‘MERRY-GO-ROUND’으로 통보 시 검토, 수정, 보완, 업체 삭제 등의 합당한 조치를 취할 것입니다.
<br><br>
제 8조 ( 이용 고객의 의무 )
<br>
1. ‘MERRY-GO-ROUND’의 이용고객은 이 약관 및 관계법령을 준수하여야 합니다.
2. ‘MERRY-GO-ROUND’의 이용자는 ‘MERRY-GO-ROUND’이 제공하는 서비스의 문제가 있다고 생각되거나 다른 의견에 대해 전화, 이메일, 질문과 답변 등으로 의견을 제시할 수 있습니다.
<br><br>
제 9조 (게시물의 관리)
<br>
‘MERRY-GO-ROUND’은 해당하는 게시물이나 자료는 임의로 삭제, 자료 이동을 임의적으로 변동 할 수 있습니다.
하지만 광고 계약서의 의한 배너의 위치나 자료 등은 계약자와 상의, 합의하에 변경 하도록 합니다.
<br><br>
제 10조 (서비스 내용의 추가 또는 변경)
<br>
‘MERRY-GO-ROUND’은 서비스 내용이 추가, 변경됨으로써 이용에 필요한 사항이 변경될 경우 ‘MERRY-GO-ROUND’이 정하여 서비스 안내에 게시하거나 또는 별도로 공지하는 내용에 따릅니다.
<br><br>
제 11조
<br>
(서비스 이용 책임) 온라인 서비스 이용고객은 ‘MERRY-GO-ROUND’에서 허용한 경우를 제외하고는 서비스를 이용하여 상품의 직접 판매 등 영업 활동을 할 수 없으며, 특히 해킹, 임의 광고, 음란사이트를 통한 상업행위, 상용 S/W 불법 배포 등을 할 수 없습니다.
이를 어기고 발생한 영업 활동의 결과 및 손실, 관계기관에 의한 구속 등의 ‘MERRY-GO-ROUND’과의 계약서 작성을 통하지 않은 이외에 영업 활동에 대하여 책임을 지지 않습니다.
<br><br>
제 12조 (계약해지)
<br>
1. 광고업체가 이용계약을 해지하고자 하는 때에는 계약자가 온라인 또는 오프라인을 통해 ‘MERRY-GO-ROUND’에 반드시 해지 신청을 하여야 합니다.
<br><br>
제 13 조 (손해배상)
<br>
1. ‘MERRY-GO-ROUND’은 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.
2. ‘MERRY-GO-ROUND’의 컨텐츠 중 ‘MERRY-GO-ROUND’의 자체 컨텐츠가 아닌 별도의 제공처가 표기된 컨텐츠에 대해서는 모든 법적 책임이 내용을 제공한 제공처에 있으며 ‘MERRY-GO-ROUND’의 해당 컨텐츠에 대한 법적 책임이 없습니다.
<br><br>
제 14 조 (면책조항)
<br>
1. ‘MERRY-GO-ROUND’은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제되며 이를 계약자에게 개별 통보 합니다.
2. ‘MERRY-GO-ROUND’은 계약자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
3. ‘MERRY-GO-ROUND’은 광고 계약자가 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
4. ‘MERRY-GO-ROUND’은 회원에게 제공하는 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
<br><br>
제 15조 (관할법원)
<br>
요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.
						</div>
						
						<input type="checkbox" id='check' name="check"/> 약관을 동의하십니까? (필수)
						
						
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div class="infoFormSubFrame">이미지1</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg1" id="supLvImg1" />

								</p>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지2</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg2"  id="supLvImg2"/>

								</p>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지3</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg3"  id="supLvImg3"/>

								</p>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지4</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg4"  id="supLvImg4"/>

								</p>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지5</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg5"  id="supLvImg5"/>

								</p>
							</div>
							<div>
								<div class="infoFormSubFrame">내용</div>
								<p class="infoForm1">
									<input type="text" class="subLvHeight" name="supLvContent" id="supLvContent"/>
								</p>
							</div>

							<br> <br>
							<div>
								<button class="btn infoFormBtn" type="submit">서포터즈 신청</button>
								<button class="btn infoFormBtn" type="reset">서포터즈 신청 취소</button>
							</div>
						</div>

					</div>



				</div>
			</div>
		</form>
	</div>
	
	<script>
	
	function checkNull(){
		var check=$('#check');
		var supLvImg1=$('#supLvImg1');
		var supLvImg2=$('#supLvImg2');
		var supLvImg3=$('#supLvImg3');
		var supLvImg4=$('#supLvImg4');
		var supLvImg5=$('#supLvImg5');
		var supLvContent=$('#supLvContent');
		
		if(check.is(':checked')==false){
        	alert('이용약관에 동의해주세요.');
        	return false;
        }
		
		if(supLvImg1.val()==""){
           alert('이미지1 등록해주세요.');
           supLvImg1.focus();
           return false;
		}
		
		if(supLvImg2.val()==""){
	           alert('이미지2 등록해주세요.');
	           supLvImg2.focus();
	           return false;
			}
		
		if(supLvImg3.val()==""){
	           alert('이미지3 등록해주세요.');
	           supLvImg3.focus();
	           return false;
			}
		
		if(supLvImg4.val()==""){
	           alert('이미지4 등록해주세요.');
	           supLvImg4.focus();
	           return false;
			}
		
		if(supLvImg5.val()==""){
	           alert('이미지5 등록해주세요.');
	           supLvImg5.focus();
	           return false;
			}
		
		if(supLvContent.val()==""){
	         alert('내용을 입력해주세요.');
	         
	         supLvContent.focus();
	         return false;
	      }

	}
	
	$(document).on("change","input[name='supLvImg1']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });

	$(document).on("change","input[name='supLvImg2']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
	
	$(document).on("change","input[name='supLvImg3']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
	$(document).on("change","input[name='supLvImg4']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
	$(document).on("change","input[name='supLvImg5']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
	
	</script>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />