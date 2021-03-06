<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value="마이페이지"/>
</jsp:include>
<style>
.inbtn-10{
   background-color: #EB9579;
}

/* input[type="file"] { 
 position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; } */

/* .filebox label  */
/* { display: inline-block;  */
/* padding: .5em .75em; color: #999;  */
/* font-size: inherit;  */
/* line-height: normal;  */
/* vertical-align: middle;  */
/* background-color: #fdfdfd;  */
/* cursor: pointer;  */
/* border: 1px solid #ebebeb;  */
/* border-bottom-color: #e2e2e2;  */
/* border-radius: .25em; } */


</style>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="${path }/resources/login/csshs/main.css">
   <%-- <link rel="stylesheet" type="text/css" href="${path }/resources/login/csshs/util.css"> --%>
   <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <!--  -->
   <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/imageshs/icons/favicon.ico"/>
   <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/font-awesome-4.7.0/css/font-awesome.min.css"> --%>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/iconic/css/material-design-iconic-font.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/util.css"> 
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/main.css">
<section id="content">
      <div class="container">

         <!-- Company Profile -->
         <div class="row">
            <div class="col-md-12 heading">
               <span class="title-icon classic pull-left"><i class="fa fa-suitcase"></i></span>
               <h2 class="title classic">My Page</h2>
            </div>
         </div><!-- Title row end -->

         <div class="row">
            <div class="landing-tab clearfix">
               <ul class="nav nav-tabs nav-stacked col-md-3 col-sm-5">
                    
                     <c:if test="${!empty list}">
                    <li class="active">
                        <a class="animated fadeIn" href="#tab_c" data-toggle="tab">
                           <span class="tab-icon"><i class="fa fa-user"></i></span>
                           <div class="tab-info">
                              <h3>내 작성글 보기</h3>
                           </div>
                        </a>
                    </li>
                  </c:if>
                  <li>
                       <a class="animated fadeIn" href="#tab_a" data-toggle="tab">
                          <!-- <span class="tab-icon"><i class="fa fa-info"></i></span> -->
                          <span class="tab-icon"><i class="fa fa-info"></i></span>
                        
                          <div class="tab-info">
                             <h3>개인정보수정</h3>
                          </div>
                       </a>
                    </li>
                    <c:if test="${loginMember.memberLevel != 0 }">
                    <li>
                       <a class="animated fadeIn" href="#tab_b" data-toggle="tab">
                          <!-- <span class="tab-icon"><i class="fa fa-briefcase"></i></span> -->
                          <span class="tab-icon"><i class="fa fa-university"></i></span>
                          <div class="tab-info">
                             <h3>커플요청</h3>
                          </div>
                       </a>
                  </li>
                 
                   <li>
                       <a class="animated fadeIn" href="#tab_g" data-toggle="tab">
                          <!-- <span class="tab-icon"><i class="fa fa-briefcase"></i></span> -->
                          <span class="tab-icon"><i class="fa fa-users"></i></span>
                          <div class="tab-info">
                             <h3>커플코드입력</h3>
                          </div>
                       </a>
                  </li>
                  </c:if>
                  <li>
                       <a class="animated fadeIn" href="#tab_d" data-toggle="tab">
                          <span class="tab-icon"><i class="fa fa-lock"></i></span>
                          <div class="tab-info">
                             <h3>비밀번호 변경</h3>
                          </div>
                       </a>
                  </li>
                  <c:if test="${loginMember.memberLevel != 0 }">
                  
                  <li>
                       <a class="animated fadeIn" href="#tab_r" data-toggle="tab">
                          <span class="tab-icon"><i class="fa fa-trophy"></i></span>
                          <div class="tab-info">
                             <h3>서포터즈 신청하기</h3>
                          </div>
                       </a>
                  </li>
                  
                  <li>
                       <a class="animated fadeIn" href="#tab_z" data-toggle="tab">
                          <span class="tab-icon"><i class="fa fa-trophy"></i></span>
                          <div class="tab-info">
                             <h3>회원 탈퇴</h3>
                          </div>
                       </a>
                  </li>
                  </c:if>
               </ul>
               <div class="tab-content col-md-9 col-sm-7" style="margin-top:-50px;">
               <c:if test="${empty list}">
                    <div class="tab-pane active animated fadeIn" id="tab_a">
                </c:if>
                <c:if test="${!empty list}">
                    <div class="tab-pane animated fadeIn" id="tab_a">
                </c:if>
                
                       <!-- <i class="fa fa-trophy big"></i> -->
                         <div class="row text-center"> 
                        <h3>개인정보수정</h3> 
                        </div>
                        <div class="gap-30"></div>
                        <form class="login100-form validate-form" method="post" action="${path}/member/update.do" onsubmit="return checkKey();" enctype="multipart/form-data">
                        
                        <input class="input100" type="hidden" name="memberNum" value=${members.memberNum }>
                        
                        <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100"><h4>아이디</h4> </span>
                           <input class="input100" type="text" name="id" value=${members.id }  readonly="readonly">
                           <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        
                      
                        <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100"><h4>이름</h4></span>
                           <input class="input100" type="text" name="name" placeholder="이름" value=${members.name }>
                           <span class="focus-i
                           nput100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100"><h4>생년월일</h4></span>
                           <input class="input100" type="text" name="birth" placeholder="생년월일" value=${members.birth }>
                           <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100"><h4>핸드폰</h4></span>
                           <input class="input100" type="text" name="phone" placeholder="핸드폰" value=${members.phone }>
                           <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <%-- <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100">이메일</span>
                           <input class="input100" type="text" name="memberEmail" placeholder="이메일" value=${members.email }>
                           <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div> --%>
                     <div class="wrap-input100 validate-input m-b-23 idname" reauired>
                        <span class="label-input100"><h4>이메일</h4></span> 
                        <div class="input-group subscribe">
                        <input class="input100"
                           type="email" name="email" placeholder="이메일" value=${members.email }> <span
                           class="focus-input100" data-symbol="&#xf206;"></span>
                           <span class="input-group-addon">
                        <button class="btn btn-primary solid cd-btn" type="button" onclick="btn_auth()">인증번호발송</button>
                        </span>
                        </div>
                     </div>
                     <div class="wrap-input100 validate-input m-b-23 idname" reauired>
                        <span class="label-input100"><h4>인증번호</h4></span> <input class="input100"
                           type="number" name="authkey" placeholder="인증번호"> <span
                           class="focus-input100" data-symbol="&#xf206;"></span>
                     </div>
                     <%-- <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
                           <span class="label-input100">프로필사진</span>
                           <input class="input100" type="text" name="proimg" placeholder="핸드폰" value=${members.proimg }>
                           <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div> --%>
                     <div class="input-group-prepend" style="padding: 0px;">
                        <span class="input-group-text"><h4>본인사진변경</h4></span>
                     </div>
                     <div class="filebox"> 
                     <!-- <label for="upFile" class="btn btn-primary whithe">파일업로드</label>  -->
                     <input type="file" name="upFile" id="upFile"></div>

                     <div class="text-right p-t-8 p-b-31">
                              
                        </div>
         
                <div style="margin-left:300px;">
                              <input type="submit" style=" width:150px;" class="btn btn-primary solid cd-btn" value="회원정보수정" >
                              </div>
                           <!-- </div> 
                        </div>-->
         
                        <div class="txt1 text-center p-t-54 p-b-20">
                           
                        </div>
         
                     </form>
                    </div>
                    <c:if test="${loginMember.cpid eq null}">
                    <div class="tab-pane animated fadeInLeft" id="tab_b">
                       
                        <h3>커플요청하기</h3> 
                     <div>
                     <!-- onsubmit="return checkKey1();" -->
                        <form class="login100-form validate-form" action="${path}/member/cupemail.do" >
                        <div class="wrap-input100 validate-input m-b-23 idname" reauired>
                        <span class="label-input100"></span>
                           <input class="input100" type="email" name="email"
                              placeholder="커플 이메일 입력"> <span class="focus-input100"
                              data-symbol="&#xf206;"></span>
                           <!-- <button onclick="btn_auth2()">이메일요청</button> -->
                        </div>
                        <input class="input100" type="hidden" name="email2" value=${members.email }>
                        <div style="margin-left:50px;">
                        <input type="submit" class="btn btn-primary solid cd-btn" value="요청" >
                        </div>
                     </form>   
                     </div>                      
                    </div>
                    </c:if>
                    <!--  -->
                    <c:if test="${loginMember.cpid != null}">
                    <div class="tab-pane animated fadeInLeft" id="tab_b">
                       
                        <h3>${loginMember.cpid }   님과 이미 커플 입니다.</h3> 
                     <div>
                     
                  </div>                      
                    </div>
                    </c:if>
                    <!--  -->
                    <c:if test="${!empty list}">
                       <div class="tab-pane active animated fadeInRight" id="tab_c">    
                    </c:if>
                    <c:if test="${empty list}">
                    <div class="tab-pane animated fadeInRight" id="tab_c">    
                    </c:if>
                    <div class="row text-center"> 
                        <h3>내 작성글 보기</h3> 
                        </div>
                        <div class="row" style="margin-top:100px;">
                             <c:forEach items="${list }" var="up" varStatus="i">
                           <div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                              <a href='${path }/info/infoView.do?infoupNum=${up["INFOUPNUM"]}&id=${loginMember.id }'>
                              <div class="service-content">
                                 <span class="service-image">
                                    <img class="img-supupload_img_f" src='${path}/resources/upload/info/${up["FILERENAME"] }' width="180px" height="200px" alt="이런!이미지준비중이에요.뿌잉 -현식-T^T"/>
                                 </span>
                                 
                                 <h3>${up["INFOUPTITLE"] }</h3>
                                 
                              </div>
                              </a>
                           </div>
                         </c:forEach>
                     </div>
                     <div style="position: relative;left:250px;top:100px;">
                  ${pageBar }  
                  </div>
                    </div>
                    <c:if test="${loginMember.cpid eq null }">
                    <div class="tab-pane animated fadeInLeft" id="tab_g">
                       
                        <h3>인증번호 입력</h3> 
                     <div>
                     <!-- onsubmit="return checkKey1();" -->
                        <form class="login100-form validate-form" action="${path}/member/cupemailcode.do" >
                        
                        <input class="input100" type="hidden" name="email2" value=${members.email }>
                        <div class="wrap-input100 validate-input m-b-23 idname" reauired>
                           <span class="label-input100"></span>
                           <input class="input100" type="hidden" name="email" value=${members.email }>
                           <input
                              class="input100" type="number" name="code"
                              placeholder="인증번호"> <span class="focus-input100"
                              data-symbol="&#xf206;"></span>
                        </div>
                        <div style="margin-left:50px;">
                        <input type="submit" class="btn btn-primary solid cd-btn" value="완료" >
                        </div>
                     </form>   
                     </div>                      
                    </div>
                    </c:if>
                    <c:if test="${loginMember.cpid != null}">
                    <div class="tab-pane animated fadeInLeft" id="tab_g">
                       
                        <h3>${loginMember.cpid }   님과 이미 커플 입니다.</h3> 
                     <div>
                     
                  </div>                      
                    </div>
                    </c:if>
                    <c:if test="${loginMember.supstatus == 0 }">
                    <div class="tab-pane animated fadeInLeft" id="tab_r">
                     <div class="post-content">
						<h1 class="post-title text-center">
							<a href="blog-item.html">신청</a>
						</h1>
						
						<div style="overflow:scroll; width:700px; height:400px; padding:10px;margin-left: 150px; ">
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
						
						<input type="checkbox" id='check' name="check" style="margin-left:150px;"/> 약관을 동의하십니까? (필수)
						
						
						<hr>
						<div class="entry-content">
							<div class="infoFormMainFrame">
								<div class="infoFormSubFrame">이미지1</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg1" id="supLvImg1" />

								</p>
								<div id="img1">
								</div>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지2</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg2"  id="supLvImg2"/>

								</p>
								<div id="img2">
								</div>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지3</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg3"  id="supLvImg3"/>

								</p>
								<div id="img3">
								</div>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지4</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg4"  id="supLvImg4"/>

								</p>
								<div id="img4">
								</div>
							</div>
							<div>
								<div class="infoFormSubFrame">이미지5</div>
								<p class="infoForm1">
									<input type="file" name="supLvImg5"  id="supLvImg5"/>

								</p>
								<div id="img5">
								</div>
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
               </c:if>
               <c:if test="${loginMember.supstatus == 1 }">
               <div class="tab-pane animated fadeInLeft" id="tab_r">
               		<h3>이미 서포터즈 신청했습니다.</h3> 
               		</div>
               </c:if>
               <c:if test="${loginMember.memberLevel == 2 }">
               <div class="tab-pane animated fadeInLeft" id="tab_r">
               		<h3>이미 서포터즈 입니다</h3> 
               		</div>
               </c:if>
               
                <div class="tab-pane animated fadeIn" id="tab_z">
                        <h3>회원 탈퇴</h3>
                  <form class="login100-form validate-form" action="${path}/member/deleteMember.do" onsubmit="return checkPw();">
                  <input type="hidden" value="${loginMember.id }" name="id" />
                  <input class="input100" type="hidden" name="memberNum" value=${members.memberNum }>
                  <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">변경할비밀번호</span> <input
                        class="input100" type="password" id="pw" name="pw" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div>
                  <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">변경할 비밀번호확인</span> <input
                        class="input100" type="password" id="pw" name="pw2" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div>
                  <!-- <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">Password</span> <input
                        class="input100" type="password" id="pw" name="pw" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div> -->
                  <div style="margin-left:50px;">
                  <input type="submit" class="btn btn-primary solid cd-btn" value="탈퇴" >
                  </div>
                  </form>
               </div>    
                <div class="tab-pane animated fadeIn" id="tab_d">
                        <h3>비밀번호 변경</h3>
                  <form class="login100-form validate-form" action="${path}/member/updatePw.do" onsubmit="return checkPw();">
                  <input class="input100" type="hidden" name="memberNum" value=${members.memberNum }>
                  <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">변경할비밀번호</span> <input
                        class="input100" type="password" id="pw" name="pw" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div>
                  <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">변경할 비밀번호확인</span> <input
                        class="input100" type="password" id="pw" name="pw2" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div>
                  <!-- <div class="wrap-input100 validate-input" reauired>
                     <span class="label-input100">Password</span> <input
                        class="input100" type="password" id="pw" name="pw" reauired>
                     <span class="focus-input100" data-symbol="&#xf190;"></span>
                  </div> -->
                  <div style="margin-left:50px;">
                  <input type="submit" class="btn btn-primary solid cd-btn" value="변경" >
                  </div>
                  </form>
               </div>
                    <div class="tab-pane animated fadeIn" id="tab_e">
                        <i class="fa fa-support big"></i>
                        <h3>24/7 Dedicated Support</h3> 
                        <p>Occupy selfies Tonx, +1 Truffaut beard organic normcore tilde flannel artisan squid cray single-origin coffee. Master cleanse vinyl Austin kogi, semiotics skateboard fap wayfarers health goth. Helvetica cray church-key hashtag Carles. Four dollar toast meggings seitan, Tonx pork belly VHS Bushwick. Chambray banh mi cornhole. Locavore messenger bag seitan.</p>
                    </div>
               </div><!-- tab content -->
             </div><!-- Overview tab end -->
         </div><!--/ Content row end -->

         <!-- Company Profile -->

      </div><!--/ 1st container end -->

         
      <div class="gap-60"></div>


      

      <div class="gap-60"></div>
   </section>
   <script>
   /* $("#btn_auth").click(function(){
       $.ajax({
           type:"POST",
           url:"${path}/signauth.do",
           data : {email : $("input[name=email]").val()},
           success: function(data){
            sessionStorage.setItem("authkey",data);
           },error : function(data){
              console.log(data);
           }
           
       
       });
       alert("인증번호를 발송했습니다.");
   }); */
   function btn_auth2(){
      /* var cupemail = $("input[name=emial]").val(); */
      $.ajax({
           type:"POST",
           url:"${path}/signauth2.do",
           data : {email : $("input[name=cpid]").val()},
           success: function(data){
            sessionStorage.setItem("authkey",data);
           },error : function(data){
              console.log(data);
           }
       });
       alert("인증번호를 발송했습니다.");
   }
   function btn_auth(){
      $.ajax({
           type:"POST",
           url:"${path}/signauth.do",
           data : {email : $("input[name=email]").val()},
           success: function(data){
            sessionStorage.setItem("authkey",data);
           },error : function(data){
              console.log(data);
           }
       });
       alert("인증번호를 발송했습니다.");
   }
   function checkKey(){
      var input_authkey = $("input[name=authkey]").val();
      var receiveKey = sessionStorage.getItem("authkey");
      var memberemail = $("input[name=email]").val();
      var originale =  '<c:out value="${members.email}"/>';
      var input_proimg = $("input[name=upFile]").val();
      
      
      if(memberemail != originale ){
      if(input_authkey== receiveKey){
         /* 인증키가 일치 했을때 */
         sessionStorage.removeItem("authkey");
         return true;
      }else{
         /* */
         alert("메일인증번호확인");
         return false;
         }
      }
      else{
         
         return true;
      }
      
   }
   function checkKey1(){
      var input_authkey = $("input[name=authkey]").val();
      var receiveKey = sessionStorage.getItem("authkey");
      var memberemail = $("input[name=email]").val();
      if(input_authkey== receiveKey){
         /* 인증키가 일치 했을때 */
         sessionStorage.removeItem("authkey");
         return true;
      }else{
         /* */
         alert("메일인증번호확인");
         return false;
         }
      }
   function checkPw(){
      var pw = $("input[name=pw]").val();
      var pw2 = $("input[name=pw2]").val();
      if(pw==pw2){
         return true;
      }else{
         alert("비밀번호가 다릅니다.");
         return false;
      }
   }
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
	
	//div 이미지 출력하기
   $('[name=supLvImg1]').change(function () {
       var reader = new FileReader();
       reader.onload = function (e) {
       	var img2 = $('<div class="infoFormSubFrame">이미지1 미리보기</div>&nbsp;');
           var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
           $('#img1').append(img2);
           $('#img1').append(img);
       }
       
    	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
   });
	
   $('[name=supLvImg2]').change(function () {
       var reader = new FileReader();
       reader.onload = function (e) {
       	var img2 = $('<div class="infoFormSubFrame">이미지2 미리보기</div>&nbsp;');
           var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
           $('#img2').append(img2);
           $('#img2').append(img);
       }
       
    	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
   });
   
   $('[name=supLvImg3]').change(function () {
       var reader = new FileReader();
       reader.onload = function (e) {
       	var img2 = $('<div class="infoFormSubFrame">이미지3 미리보기</div>&nbsp;');
           var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
           $('#img3').append(img2);
           $('#img3').append(img);
       }
       
    	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
   });
   
   $('[name=supLvImg4]').change(function () {
       var reader = new FileReader();
       reader.onload = function (e) {
       	var img2 = $('<div class="infoFormSubFrame">이미지4 미리보기</div>&nbsp;');
           var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
           $('#img4').append(img2);
           $('#img4').append(img);
       }
       
    	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
   });
   
   $('[name=supLvImg5]').change(function () {
       var reader = new FileReader();
       reader.onload = function (e) {
       	var img2 = $('<div class="infoFormSubFrame">이미지5 미리보기</div>&nbsp;');
           var img = $('<img>').attr('src', e.target.result).css({'width':"570", 'height':"570"}).addClass("infoForm1");
           $('#img5').append(img2);
           $('#img5').append(img);
       }
       
    	reader.readAsDataURL($(this)[0].files[0]); // 파일경로를 바꿈/=result
   });
   </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>