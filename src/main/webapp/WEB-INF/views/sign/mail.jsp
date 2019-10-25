<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<section id="content">
	메일인증
	<div>
		<form method="post" name="authenform" onSubmit="return check()";>
			<input type="text" name="authnum"><br>
			<input type="submit" class="btn btn-info" value="Submit">
		</form>
	</div>
</section>
<script>
	function check(){
		var form=document.authenform;
		var authNum=${authNum};
		if(!form.authnum.value){
			alert("인증번호입력");
			return false;
		}
		if(form.authnum.value!=authNum){
			alert("틀린인증번호");
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum){
			alert("인증완료");
			opener.document.userinput.mailCheck.value="인증완료";
			window.close();
			
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>