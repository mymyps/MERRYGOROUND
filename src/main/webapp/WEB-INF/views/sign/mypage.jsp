<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${path }/resources/login/csshs/main.css">
	<%-- <link rel="stylesheet" type="text/css" href="${path }/resources/login/csshs/util.css"> --%>
	<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap -->
	<%-- <link rel="stylesheet" href="${path }/resources/login/csshs/bootstrap.min.css"> --%>
	<!-- Template styles-->
	<%-- <link rel="stylesheet" href="${path }/resources/login/csshs/style.css">
	<!-- Responsive styles-->
	<link rel="stylesheet" href="${path }/resources/login/csshs/responsive.css">
	<!-- FontAwesome -->
	<link rel="stylesheet" href="${path }/resources/login/csshs/font-awesome.min.css">
	<!-- Animation -->
	<link rel="stylesheet" href="${path }/resources/resources/login/csshs/animate.css">
	<!-- Prettyphoto -->
	<link rel="stylesheet" href="${path }/resources/login/csshs/prettyPhoto.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${path }/resources/login/csshs/owl.carousel.css">
	<link rel="stylesheet" href="${path }/resources/login/csshs/owl.theme.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${path }/resources/login/csshs/flexslider.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${path }/resources/login/csshs/cd-hero.css">
	<!-- Style Swicther -->
	<link id="style-switch" href="${path }/resources/login/csshs/presets/preset3.css" media="screen" rel="stylesheet" type="text/css"> --%>
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
					  	<li class="active">
					  		<a class="animated fadeIn" href="#tab_a" data-toggle="tab">
					  			<!-- <span class="tab-icon"><i class="fa fa-info"></i></span> -->
								  <span class="tab-icon"><i class="fa fa-android"></i></span>
								
								  <div class="tab-info">
						  			<h3>개인정보수정</h3>
					  			</div>
					  		</a>
						  </li>
						  <li>
								<a class="animated fadeIn" href="#tab_c" data-toggle="tab">
									<span class="tab-icon"><i class="fa fa-android"></i></span>
									<div class="tab-info">
										<h3>내 작성글 보기</h3>
									</div>
								</a>
						  </li>
					  	<li>
						  	<a class="animated fadeIn" href="#tab_b" data-toggle="tab">
								  <!-- <span class="tab-icon"><i class="fa fa-briefcase"></i></span> -->
								  <span class="tab-icon"><i class="fa fa-support"></i></span>
					  			<div class="tab-info">
						  			<h3>커플요청</h3>
					  			</div>
						  	</a>
						</li>
					 
						<li>
						  	<a class="animated fadeIn" href="#tab_d" data-toggle="tab">
						  		<span class="tab-icon"><i class="fa fa-pagelines"></i></span>
					  			<div class="tab-info">
						  			<h3>비밀번호 변경</h3>
					  			</div>
						  	</a>
						</li>
						<!--<li>
						  	<a class="animated fadeIn" href="#tab_e" data-toggle="tab">
						  		<span class="tab-icon"><i class="fa fa-support"></i></span>
					  			<div class="tab-info">
						  			<h3>Dedicated Support</h3>
					  			</div>
						  	</a>
						</li> -->
					</ul>
					<div class="tab-content col-md-9 col-sm-7">
				        <div class="tab-pane active animated fadeInRight" id="tab_a">
				        	<!-- <i class="fa fa-trophy big"></i> -->
				            <h3>개인정보수정</h3> 
				            <form class="login100-form validate-form" action="${path}/member/update.do" onsubmit="return checkKey();">
								
								<input class="input100" type="hidden" name="memberNum" value=${members.memberNum }>
								
								<div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
									<span class="label-input100"></span>
									<input class="input100" type="text" name="id" value=${members.id }>
									<span class="focus-input100" data-symbol="&#xf206;"></span>
								</div>
								
								<!-- <div class="wrap-input100 validate-input" data-validate="Password is required">
									<span class="label-input100">Password</span>
									<input class="input100" type="password" name="member_pass" placeholder="기존비밀번호">
									<span class="focus-input100" data-symbol="&#xf190;"></span>
								</div>
								<div class="wrap-input100 validate-input" data-validate="Password is required">
									<span class="label-input100">Password </span>
									<input class="input100" type="password" name="member_pass" placeholder="변경할 비밀번호">
									<span class="focus-input100" data-symbol="&#xf190;"></span>
								</div> -->
								<div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
									<span class="label-input100">이름</span>
									<input class="input100" type="text" name="name" placeholder="이름" value=${members.name }>
									<span class="focus-input100" data-symbol="&#xf206;"></span>
								</div>
								<div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
									<span class="label-input100">생년월일</span>
									<input class="input100" type="text" name="birth" placeholder="생년월일" value=${members.birth }>
									<span class="focus-input100" data-symbol="&#xf206;"></span>
								</div>
								
								<div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
									<span class="label-input100">핸드폰</span>
									<input class="input100" type="text" name="phone" placeholder="핸드폰" value=${members.phone }>
									<span class="focus-input100" data-symbol="&#xf206;"></span>
								</div>
								<%-- <div class="wrap-input100 validate-input m-b-23 idname" data-validate = "Username is reauired">
									<span class="label-input100">이메일</span>
									<input class="input100" type="text" name="memberEmail" placeholder="이메일" value=${members.email }>
									<span class="focus-input100" data-symbol="&#xf206;"></span>
								</div> --%>
							<div class="wrap-input100 validate-input m-b-23 idname" reauired>
								<span class="label-input100">이메일</span> <input class="input100"
									type="email" name="email" placeholder="이메일"> <span
									class="focus-input100" data-symbol="&#xf206;"></span>
								<%-- <a href="${pageContext.request.contextPath }/emailAuth.do?email="+'$("input[name=email]").val()'>이메일인증</a> --%>
								<!-- <button type="button" onclick="connectEmailAuth();" name="btn_auth">이메일인증</button> -->
								<button onclick="btn_auth()">이메일인증</button>
							</div>
							<div class="wrap-input100 validate-input m-b-23 idname" reauired>
								<span class="label-input100">인증번호</span> <input class="input100"
									type="number" name="authkey" placeholder="인증번호"> <span
									class="focus-input100" data-symbol="&#xf206;"></span>
							</div>
							<div class="text-right p-t-8 p-b-31">
									
								</div>
			
								<div class="container-login100-form-btn">
									<div class="wrap-login100-form-btn">
										<div class="login100-form-bgbtn"></div>
										<!-- <button class="login100-form-btn" type="submit">
											수정하기
										</button> -->
										<input type="submit" class="btn btn-outline-success" value="가입" >
									</div>
								</div>
			
								<div class="txt1 text-center p-t-54 p-b-20">
									
								</div>
			
							</form>
				        </div>
				        <div class="tab-pane animated fadeInLeft" id="tab_b">
				        	
				            <h3>커플요청하기</h3> 
							<div>
								<form>
									<input type="text" name="cupleemail" placeholder="커플이메일입력">
									<input type="button" class="btn btn-outline-success" value="요청하기" >
								</form>	
							</div>							 
				        </div>
				        <div class="tab-pane animated fadeIn" id="tab_c">
				            
				            <h3>내 작성글 보기</h3> 
				            <div class="row">
									<div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-delay=".5s">
										<button onclick="detailView()">
										<div class="service-content">
											<span class="service-image"><img class="img-responsive" src="images/pages/service-1.jpg" alt="" /></span>
											<h3>제목Multipurpose Concept</h3>
											
										</div>
										</button>
									</div><!--/ End first service -->
					
									<div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-delay=".8s" >
											<button onclick="detailView()">
										<div class="service-content">
											<span class="service-image"><img class="img-responsive" src="images/pages/service-1.jpg" alt="" /></span>
											<h3>넣을Parallax Section</h3>
											
										</div>
										</button>
									</div><!--/ End Second features -->
									<div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-delay="1.1s">
										<button onclick="detailView()">
										<div class="service-content">
											<span class="service-image"><img class="img-responsive" src="images/pages/service-1.jpg" alt="" /></span>
											<h3>거임Light wight Performance</h3>
											
										</div>
									</button>
									</div>
									<!--/ End Third features -->
					
							</div>
				        </div>
				        <div class="tab-pane animated fadeIn" id="tab_d">
				            <i class="fa fa-pagelines big"></i>
				            <h3>비밀번호 변경</h3> 
				            <p>Over the year we have lots of experience in our field. In sit amet massa sapien. Vestibulum diam turpis, gravida in lobortis id, ornare a eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sagittis nulla non elit dignissim suscipit. Duis lorem nulla, eleifend.</p>
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
		if(memberemail != originale ){
		if(input_authkey== receiveKey){
			/* 인증키가 일치 했을때 */
			sessionStorage.removeItem("authkey");
			return true;
		}else{
			/* */
			alert("메일인증번호다름");
			return false;
			}
		}
		else{
			
			return true;
		}
		
	}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>