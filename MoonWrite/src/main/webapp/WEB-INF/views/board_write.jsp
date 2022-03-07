<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="icon" href="/resource/img/diary.png">
<link rel="stylesheet" href="/resource/css/board_write.css">
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
					<li>AAA(aaa)님<br>
						<p>정보수정 / 로그아웃</p>
					</li>
					<li class="on" class="a"><a href="#">메인페이지</a></li>
					<li><a href="#">My Diary</a></li>
					<li><a href="#">사람들의 이야기</a></li>
					<li><a href="#">책 추천</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="content">
		<h2>게시판 글쓰기</h2>
		<form action="write.do"> <!-- form 영역 -->
			<div class="board_write"> <!-- 글쓰기 영역 -->
				<div class="select_write"> <!-- 유형 선택 -->
					<input type="radio" id="chk_info_diary" name="chk_info" value="diary"><label for="chk_info_diary">오늘의
						일기</label> <input type="radio" id="chk_info_message" name="chk_info" value="book"><label for="chk_info_message">책속의
						한 줄</label>
				</div>
				<div class="select_secret"> <!-- 공개 / 비공개 설정 -->
					<input type="radio" id="chk_secret_open" name="chk_secret" value="open"><label for="chk_secret_open">공개</label>
					<input type="radio" id="chk_secret_secret" name="chk_secret" value="secret"><label for="chk_secret_secret">비공개</label>
				</div>
			</div>
			<div class="book_search"> <!-- 도서 검색 -->
				<label>참고 도서</label> <input type="text" placeholder="책 이름을 검색해주세요.">
				<button class="btn_search">검색</button>
			</div>
			<div class="board_title"> <!-- 제목 영역 -->
				<input type="text" name="title" placeholder="제목을 입력하세요.">
			</div>
			<div class="board_content"> <!-- 내용 영역 -->
				<textarea name="content" id="b_content" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="btn_group"> <!-- 버튼 영역 -->
				<button class="btn_submit">저장</button>
				<button class="btn_cancel">취소</button>
			</div>
		</form> <!-- form 영역 종료 -->
	</div>
</body>
</html>