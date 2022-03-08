<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">

<link rel="stylesheet" href="resource/css/login.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">


</head>

<body>
<!-- login정보가 있으면 main 으로 이동 -->
	<c:if test="${sessionScope.member!=null}">
		<script type="text/javascript">
			location.href = 'main.do';
		</script>
	</c:if>
	
	<h1>Moon write</h1>
	<div class="login-form">
		<form action="login.do" method="post">
			<h2>Login</h2>
			<input type="text" name="id" class="text-field" placeholder="아이디"><br>
			<input type="password" name="password" class="text-field" placeholder="비밀번호"><br>
			<input type="submit" value="로그인" class="submit-btn">
		</form>

		<div class="links">
			<a href="#">아이디를 잊어버리셨나요?</a><br>
			<a href="#">비밀번호를 잊어버리셨나요?</a>
		</div>
	</div>
</body>
</html>


//=========================================================================

