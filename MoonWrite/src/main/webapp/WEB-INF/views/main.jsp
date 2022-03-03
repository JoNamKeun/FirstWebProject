<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="resource/css/main.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="/resource/js/main_scroll.js"></script>
<link rel="icon" href="/resource/img/diary.png">
<style type="text/css">
	
	
</style>
</head>
<body>
    <div class="logo_menu">
        <header>
            <img src="/resource/img/logo.png" alt="logo" id="header_logo">
            <div class="title">
                <h2>Moon Write</h2>
            </div>
        </header>
        <nav>
            <div class="header">
                <ul>
                    <li>아이디(닉네임)님<br><p>정보수정 / 로그아웃</p></li>
                    <li class="on" class="a"><a href=".content1">메인페이지</a></li>
                    <li><a href=".content2">My Diary</a></li>
                    <li><a href=".content3">사람들의 이야기</a></li>
                    <li><a href=".content4">책 추천</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content">
        <!-- 여기 영역이 내용이 나올 영역입니다.
        여기서 작업을 해주시면 됩니다. -->
        <h1>나의 발자취</h1>
        <div class="main_content">
        	<table>
        	<span class="count">내가 쓴 글 갯수 : <a href="#">60</a></span>
        	<span class="count">내가 쓴 댓글 수 : <a href="#">28</a></span>
        		<tr>
        			<th>번호</th>
        			<th>유형</th>
        			<th>작성자</th>
        			<th>제목</th>
        			<th>작성일</th>
        			<th>조회수</th>
        		</tr>
        	</table>
        	<form action="write.do">
        		<input type="button" value="글쓰기">
        	</form>
        </div>
    </div>
</body>
</html>