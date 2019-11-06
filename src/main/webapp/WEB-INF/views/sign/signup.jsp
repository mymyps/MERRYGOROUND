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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<section id="content">
		<div class="limiter">
			<div class="container-login100" >
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" name="f" action="${path}/member/membersignup.do" method="post" onsubmit="return checkKey();" enctype="multipart/form-data">
					<span class="login100-form-title p-b-49">
						Sign up
					</span>

					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">ID</span>
						<input class="input100" type="text" id="id" name="id" placeholder="아이디">
						<button type="button" id="check_id" >아이디 중복확인</button>
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" reauired>
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="pw" name="pw" placeholder="비밀번호">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">이름</span>
						<input class="input100" type="text" id ="name" name="name" placeholder="이름">
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
						<%-- <a href="${pageContext.request.contextPath }/emailAuth.do?email="+'$("input[name=email]").val()'>이메일인증</a> --%>
						<!-- <button type="button" onclick="connectEmailAuth();" name="btn_auth">이메일인증</button> -->
						<button type="button" id="btn_auth">이메일인증</button>
					</div>
					<div class="wrap-input100 validate-input m-b-23 idname" reauired>
						<span class="label-input100">인증번호</span>
						<input class="input100" type="number" name="authkey" placeholder="인증번호">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<!-- 사진 -->
					<div class="input-group-prepend" style="padding: 0px;">
						<span class="input-group-text">본인사진</span>
					</div>
					<div class="custom-file">
					<label class="custom-file-label" for="upFile1"></label>
						<input type="file" class="custom-file-input" name="upFile"
							id="upFile1"> 
							
					</div>
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<!-- <div class="wrap-login100-form-btn"> -->
							<!-- <div class="login100-form-bgbtn"></div> -->
							<!-- <button type ="submit" class="login100-form-btn">
								Sign Up
							</button>  -->
								<input type="submit" class="btn btn-primary solid cd-btn" value="가입" disabled="">&nbsp;
								<input type="reset" class="btn btn-primary solid cd-btn" value="취소">
						<!-- </div> -->
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

<script>
	function connectEmailAuth(){
		var email = $("input[name=email]").val();
		location.href='${path}/emailAuth.do?email='+email;
	}

	function windowopenPopup(){
		var email = $("input[name=email]").val();
		 window.open('${path}/emailAuth.do?email='+email, 'window팝업', 'width=300, height=300, menubar=no, status=no, toolbar=no');
	
	}
	$("#check_id").click(function(){
		$.ajax({
			type:"POST",
			url:"${path}/sign/checkId.do",
			data : {id:$("input[name=id]").val()},
			success:function(data){
				if(data=="true"){
				alert("가입가능");
				$btn_checkId = $('.btn_checkId').attr('disabled', false);
				}else{
					alert("아이디존재");
				$btn_checkId = $('.btn_checkId').attr('disabled', true);
				}
			}, error : function(e) {
            	console.log("error");
            }
		});
	});
	
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
		var input_id=$("input[name=id]").val();
		var input_pw=$("input[name=pw]").val();
		var input_authkey = $("input[name=authkey]").val();
		var receiveKey = sessionStorage.getItem("authkey");
		var jumin1 = document.f.birth.value.substr(0,6);
		
		if(input_id==""){
			alert("아이디입력");
			return false;
		}
		//아이디에 공백 
        if (document.f.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.f.id.focus();
            document.f.id.select()
            return false;
        }
		//id 4자이상 12자이하
		if (document.f.id.value.length<4 || document.f.id.value.length>12) {
            alert("아이디를 4~12자까지 입력")
            document.f.id.focus();
            document.f.id.select();
            return false;
        }
		//비밀번호입력해
		if(input_pw==""){
			alert("비밀번호 입력");
			return false;
		}
		//아이디비밀번호 동일할때
		if (f.pw.value == f.id.value) {
            alert("아이디와 비밀번호가 같습니다.변경해")
            document.f.pw.focus();
            return false;
        }
        //비밀번호 길이 체크(4~8자 까지 허용)
        if (document.f.pw.value.length<4 || document.f.pw.value.length>12) {
            alert("비밀번호를 4~12자까지 입력해주세요.")
            document.f.pw.focus();
            document.f.pw.select();
            return false;
        }
        //이름입력
        if(document.f.name.value==""){
        	alert("이름을 입력하세요.");
        	document.f.name.focus();
        	return false;
        }
        //생년월일 입력
        if(document.f.birth.value==""){
        	alert("생년월일을 입력하세요.");
        	document.f.birth.focus();
        	return false;
        }
         if (document.f.birth.value.length<6||document.f.birth.value.length>6) {
            alert("생년월일 길이가 맞지 않습니다.");
            document.f.birth.value = "";
            document.f.birth.focus();
            return false;
        }
        if (!$.isNumeric(jumin1)) {
            alert("주민번호는 숫자로 입력하세요.");
            document.f.birth.value = "";
            document.f.birth.focus();
            return false;
        }   
        //성별
        if(document.f.gender.value==""){
        	alert("성별을 선택해주세요");
        	return false;
        }
        //핸드폰번호입력
        if(document.f.phone.value==""){
        	alert("핸드폰번호을 입력하세요.");
        	document.f.phone.focus();
        	return false;
        }
        //이메일입력
        if (document.f.email.value == "") {
            alert("이메일을 입력하세요.")
            document.f.email.focus();
            return false;
        }
		if(input_authkey== receiveKey){
			/* 인증키가 일치 했을때 */
			sessionStorage.removeItem("authkey");
			return true;
		}else{
			/* */
			alert("인증번호확인해주세요");
			return false;
		}
		
	}
</script>



>>>>>>> origin/sik2
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>