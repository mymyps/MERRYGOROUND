<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
				<form class="login100-form validate-form" action="${pageContext.request.contextPath}/sign/updatepw" method="post" onsubmit="return checkPw();">
					<span class="login100-form-title p-b-49">
						비밀번호찾기
					</span>
					
						<input class="input100" type="hidden" name="id" value="${id }">
						

						<input class="input100" type="hidden" name="email" value="${email }">
						
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">변경할 비밀번호</span>
						<input class="input100" type="password" name="pw" placeholder="변경할 비밀번호">
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">변경할 비밀번호 확인</span>
						<input class="input100" type="password" name="pw2" placeholder="변경할 비밀번호 확인">
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20" type="submit">
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
	</script>
	<div id="dropDownSelect1"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>