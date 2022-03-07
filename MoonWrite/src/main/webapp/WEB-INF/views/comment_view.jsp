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
        	<span class="count">내가 쓴 댓글 수 : <a href="viewComment.do">28</a></span>
        		<tr>
        			<th>글번호</th>
        			<th>작성자</th>
        			<th>내용</th>
        		</tr>
        		<c:forEach var="c_list" items="${requestScope.c_list}">
        			<tr>
        				<td>${c_list.bno}</td>
        				<td>${c_list.c_writer}</td>
        				<td><a href="boardView.do?bno=${c_list.bno}">${c_list.content}</a></td>
        			</tr>
        		</c:forEach>
        		<c:if test="${requestScope.pagging != null }">
		<tr>
			<td colspan="7">
			<c:if test="${requestScope.pagging.isPriviousPageGroup() }">
				<a href="main.do?page=${requestScope.pagging.getStartPageofPageGroup()-1 }"><<</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${requestScope.pagging.getStartPageofPageGroup() }" end="${requestScope.pagging.getEndPageOfPageGroup() }">
				<c:choose>
					<c:when test="${i==requestScope.pagging.currentPageNo }">
						${i}&nbsp;
					</c:when>
					<c:otherwise>
						<a href="main.do?page=${i }">${i }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.pagging.isNextPageGroup() }">
				<a href="main.do?page=${requestScope.pagging.getEndPageOfPageGroup()+1}">>></a>
			</c:if>
			</td>
		</tr>
		</c:if>
        	</table>
		        
        </div>
    </div>
</body>
</html>