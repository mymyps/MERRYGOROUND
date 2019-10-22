<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/util.css"> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/main.css">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/imageshs/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/iconic/css/material-design-iconic-font.min.css">
<section id="content">
	<div class="limiter">
		<div class="container-login100" >
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="${path}/member/membersignup.do" method="post">
					<span class="login100-form-title p-b-49">
						Sign up
					</span>

					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">ID</span>
						<input class="input100" type="text" id="id" name="id" placeholder="아이디">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" reauired>
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="pw" name="pw" reauired>
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">이름</span>
						<input class="input100" type="text" id ="memberName" name="memberName" placeholder="이름">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">생년월일</span>
						<input class="input100" type="text" id="birth" name="birth" placeholder="생년월일">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">성별</span><br>
						<input class="input101" type="radio" name="gender" value="M">남자
						<input class="input101" type="radio" name="gender" value="F">여자
						
						<br>
						<!-- <span class="focus-input100" data-symbol="&#xf206;"></span> -->
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">핸드폰</span>
						<input class="input100" type="tel" name="phone" placeholder="핸드폰">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">이메일</span>
						<input class="input100" type="email" name="email" placeholder="이메일">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<!-- <div class="login100-form-bgbtn"></div> -->
							<!-- <button type ="submit" class="login100-form-btn">
								Sign Up
							</button>  -->
								<input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
								<input type="reset" class="btn btn-outline-success" value="취소">
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>