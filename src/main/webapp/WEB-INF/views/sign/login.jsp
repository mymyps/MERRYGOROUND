<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<%-- <jsp:param name="pageTitle" value="로그인하기"/>
</jsp:include> --%>
   <!-- hs boot -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/imageshs/icons/favicon.ico"/>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/fontshs/iconic/css/material-design-iconic-font.min.css">
   
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/util.css"> 
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/csshs/main.css">
<section id="content">
<div class="limiter">
      <div class="container-login100" >
            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style="margin-top:-100px;">
            <form class="login100-form validate-form" action="${pageContext.request.contextPath}/sign/memberLogin.do" method="post">
               <span class="login100-form-title p-b-49">
                  로그인
               </span> 

               <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                  <span class="label-input100">ID</span>
                  <input class="input100" type="text" name="id" placeholder="아이디">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>

               <div class="wrap-input100 validate-input" data-validate="Password is required">
                  <span class="label-input100">Password</span>
                  <input class="input100" type="password" name="pw" placeholder="비밀번호입력">
                  <span class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               
               <div class="text-right p-t-8 p-b-31">
                  <a href="${pageContext.request.contextPath }/member/searchpw.do">
                     Forgot password?
                  </a>
               </div>
               
                      <div style="margin-left:135px;">
                     <button class="btn btn-primary solid cd-btn">
                        Login
                     </button>
                     </div>

               <div class="txt1 text-center p-t-54 p-b-20" type="submit">
                  <span>
                  </span>
               </div>

            </form>
         </div>
      </div>
   </div>
</section>   

   <div id="dropDownSelect1"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>