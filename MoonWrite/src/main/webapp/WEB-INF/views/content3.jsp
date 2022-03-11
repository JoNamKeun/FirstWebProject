<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<link rel="stylesheet" href="resource/css/content3.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="icon" href="resource/img/diary.png">
</head>

<body>
<%@ include file="../include/sessionCheck.jsp"%>
<%@ include file="../include/menuBar.jsp" %>	

	<div class="content">
		<!-- 여기 영역이 내용이 나올 영역입니다.
        여기서 작업을 해주시면 됩니다. -->

		<div class="content3-title">
			<p>
				Another Moon <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 다른 <span class="span-moon">달</span>의 이야기
			</p>
		</div>


		<div class="content3-ddMenu">
			<form action="kindList.do">
				<select name="kind">
					<option value="a">전체</option>
					<option value="d">일기만 보기</option>
					<option value="b">한줄만 보기</option>
				</select>
				<button class="form-input">조회</button>
			</form>
		</div>

		<div class="content3-table">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>kind</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="list" items="${board_list}">
						<tr>
							<td>${list.bno}</td>
							<td><a href="boardView.do?bno=${list.bno}&page=${pagging.currentPageNo}">${list.title}</a></td>
							<td>${list.m_name}</td>
							<td>${list.regist_day}</td>
							<td>${list.b_count}</td>
							<td> 
								<c:if test="${list.b_kind eq 'b' }">글귀</c:if>
								<c:if test="${list.b_kind eq 'd' }">일기</c:if>
							
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

	<%@ include file="../include/pagging.jsp" %>	

	</div>
	
<script src="resource/js/content3.js"></script>
</body>
</html>

