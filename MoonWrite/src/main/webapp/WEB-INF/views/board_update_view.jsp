<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<link rel="icon" href="/resource/img/diary.png">
<link rel="stylesheet" href="/resource/css/board_write.css">
<link rel="stylesheet" href="/resource/css/menuBar.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resource/js/boardWrite.js"></script>

</head>

<body>
	<c:if test="${sessionScope.member==null}">
		<script type="text/javascript">
			alert("로그인이 필요한 메뉴입니다.");
			location.href = 'loginView.do';
		</script>
	</c:if>
	<%@ include file="../include/menuBar.jsp"%>

	<div class="content">
		<h2>글 수정 페이지</h2>


		<form id = "frm_boardWrite" action="updateBoard.do?bno=${board.bno}" onsubmit = "return confirm('글을 수정할까요?');">
				
				<input type="hidden" name="bno"  value="${board.bno}">
			<!-- form 영역 -->
			<div class="board_write">
				<!-- 글쓰기 영역 -->
				<div class="select_write">
					<!-- 유형 선택 -->
					
					<c:choose>
						<c:when test="${board.b_kind eq 'd'}">
							<input type="radio" id="chk_info_diary" name="chk_info" value="diary"  checked ><label for="chk_info_diary">오늘의 일기</label>
							<input type="radio" id="chk_info_book" name="chk_info" value="book" ><label for="chk_info_book">책속의 한 줄</label>
						</c:when>
						<c:otherwise>
							<input type="radio" id="chk_info_diary" name="chk_info" value="diary"  ><label for="chk_info_diary">오늘의 일기</label>
							<input type="radio" id="chk_info_book" name="chk_info" value="book" checked><label for="chk_info_book">책속의 한 줄</label>
						</c:otherwise>
					</c:choose>
					
				</div>
				
				<div class="select_secret">
					<!-- 공개 / 비공개 설정 -->
					<c:choose>
						<c:when test="${board.b_secret eq 'o'}">		
							<input type="radio" id="chk_secret_open" name="chk_secret" value="open" checked><label for="chk_secret_open">공개</label>
								<input type="radio" id="chk_secret_secret" name="chk_secret" value="secret" ><label for="chk_secret_secret">비공개</label>
						</c:when>
						<c:otherwise>
							<input type="radio" id="chk_secret_open" name="chk_secret" value="open" ><label for="chk_secret_open">공개</label>				
							<input type="radio" id="chk_secret_secret" name="chk_secret" value="secret" checked><label for="chk_secret_secret">비공개</label>
						</c:otherwise>
					</c:choose>
				</div>				
			</div>
			
			
			<div class="book_search">
				<!-- 도서 검색 -->
				<label>참고 도서</label> <input type="text"  value = "${board.book_name}" name="book_name">
				<button class="btn_search">검색</button>
			</div>
			<div class="board_title">
				<!-- 제목 영역 -->
				<input type="text" name="title" value = "${board.title}">
			</div>
			<div class="board_content">
				<!-- 내용 영역 -->
				<textarea name="content" id="b_content"  >${board.content}</textarea>
			</div>
			<div class="btn_group">
				<!-- 버튼 영역 -->
				<button class="btn_submit" type="button">저장</button>
				<button class="btn_cancel" type="button" onclick = "history.back();">취소</button>
			</div>
		</form>
		<!-- form 영역 종료 -->


	</div>
</body>
</html>