<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="비밀번호찾기"/>
</jsp:include>
	<!-- hs boot -->
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/imageshs/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/util.css"> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/main.css">
<!--===============================================================================================--> 
<section id="content">
<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="${pageContext.request.contextPath}/member/searchpwend.do" method="post" onsubmit="return checkKey();">
<!-- 					<span class="login100-form-title p-b-49"> -->
<!-- 						<h3>비밀번호찾기</h3> -->
<!-- 					</span> -->
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="id" placeholder="아이디입력">
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">EMAIL</span>
						<input class="input100" type="email" name="email" placeholder="이메일입력">
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<button type="button" id="btn_auth">이메일인증받기</button>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">인증번호</span>
						<input class="input100" type="number" name="authkey" placeholder="인증번호입력">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
							<button class="btn btn-primary solid cd-btn" type ="submit">
								비밀번호 찾기
							</button>
					</div>

					<!-- <div class="txt1 text-center p-t-54 p-b-20" type="submit"> -->
						<span>
							Or Sign Up Using
						</span>
					</div>

				</form>
			</div>
		</div>
	</div>
</section>	
	<script>
	$("#btn_auth").click(function(){
		    $.ajax({
		        type:"POST",
		        url:"${path}/signauth.do",
		        data : {email : $("input[name=email]").val()},
		        success: function(data){
					sessionStorage.setItem("authkey",data);
		        }});
		    alert("인증번호를 발송했습니다.");
		});
	function checkKey(){
		var input_authkey = $("input[name=authkey]").val();
		var receiveKey = sessionStorage.getItem("authkey");
		
		if(input_authkey== receiveKey){
			/* 인증키가 일치 했을때 */
			sessionStorage.removeItem("authkey");
			return true;
		}else{
			/* */
			alert("불일치");
			return false;
		}
		
	}
	</script>
	<div id="dropDownSelect1"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>