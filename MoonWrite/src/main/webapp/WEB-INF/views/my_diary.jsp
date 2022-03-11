<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="resource/css/my_diary.css">
<link rel="stylesheet" href="resource/css/menuBar.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <script src="/resource/js/main_scroll.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<link rel="icon" href="/resource/img/diary.png">
<style type="text/css">
	
	
</style>
</head>
<body>
    <%@ include file="../include/menuBar.jsp"%>
    <div class="content">
        <!-- 여기 영역이 내용이 나올 영역입니다.
        여기서 작업을 해주시면 됩니다. -->
        <h1>나의 발자취</h1>
        <div class="main_content">
        	<table>
        	<span class="count">내가 쓴 글 갯수 : <a href="#">${requestScope.b_count}</a></span>
        	<span class="count">내가 쓴 댓글 수 : <a href="viewComment.do">${requestScope.c_count}</a></span>
        		<tr>
        			<th>번호</th>
        			<th>유형</th>
        			<th>작성자</th>
        			<th>제목</th>
        			<th>작성일</th>
        			<th>공개여부</th>
        		</tr>
        		<c:forEach var="board" items="${requestScope.writer}">
        			<tr>
        				<td>${board.bno}</td>
        				<td>${board.b_kind}</td>
        				<td>${board.m_name}</td>
        				<td><a href="boardView.do?bno=${board.bno}&page=${pagging.currentPageNo}">${board.title}</a></td>
        				<td>${board.regist_day}</td>
        				<td>
        					<c:if test="${board.b_secret eq 's' }">
        						<img alt="" src="../resource/img/lock_icon.png" class="sec_img">
        					</c:if>
        					<c:if test="${board.b_secret eq 'o' }">
        						<img alt="" src="../resource/img/unlock_icon.png" class="sec_img">
        					</c:if>
        				</td>
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
		        <a href="writeForm.do">글쓰기</a>
        </div>
    </div>
</body>
</html>