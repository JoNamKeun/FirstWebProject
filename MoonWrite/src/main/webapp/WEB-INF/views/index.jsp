<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="resource/img/diary.png">
<link rel="stylesheet" href="resource/css/index.css">
</head>
<body>
	<div class="container">
		<div class="main">
			<img src="resource/img/logo.png" alt="logo" id="logo">
		</div>
		<table>
			<tr>
				<th>오늘의 한 문장</th>
			</tr>
			<tr>
				<td>오늘도 수고하셨습니다.오늘도 수고하셨습니다.</td>
			</tr>
		</table>
	</div>
	<div class="select_btn">
		<button class="btn_join">회원가입</button>
		<button class="btn_login">로그인</button>
		<button class="btn_main" onclick = "location.href='main.do'">메인화면</button>
	</div>
</body>
</html>