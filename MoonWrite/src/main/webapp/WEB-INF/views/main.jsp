<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Moon Write</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="resource/img/diary.png">
    <link rel="stylesheet" href="/resource/css/main.css">
<!--    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resource/js/main_scroll.js"></script>
        <script type="text/javascript">
    	function clickTop(){
    		window.scrollTo(0,0);
    	}
    </script>
</head>

<body>
    <%@ include file="../include/menuBar.jsp"%>
    <div class="content">
    	<input class="btn_up" type="button" value="Top" onclick="clickTop()">
        <div class="content1">
            <h1>Moon Write</h1>
            <p>연소를 끝마친 감정은 재만 남긴 채 사그라들기에<br>
                그 감정을 간직하기 위한 <span style="color:#ffe647;">Moon Write</span><br>
                <br>
                밤하늘 아래를 걸으면 달과 나 둘 뿐이었습니다.<br>
                때로는 절절한 사랑이되어 차마 전하지 못한 마음을 받아주었고<br>
                때로는 절친한 친구가되어 왈칵 속상한 마음을 들어주었으며<br>
                때로는 포근한 엄마가 되어 푸욱 꺼진 어깨를 안아줬습니다.<br>
                <span style="color:#ffe647;">Moon Write</span>은 그런 마음들을 달빛에 비추어 적어보는 공간입니다 :)
            </p>
        </div>
        <div class="content2">
            <div class="left_div">
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>메인 페이지</h2>
                <p>사이트 설명 및 사이트 사용법이 있습니다.</p>
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>My Diary</h2>
                <p>사용자가 활동한 내역들을 볼 수 있습니다.</p>
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>사람들의 이야기</h2>
                <p>다른 사용자들이 공유로 설정한 글들을 볼 수 있습니다.</p>
            </div>
            <div class="right_div">
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>List View</h2>
                <p>공유일기와 공유 글귀를 모아둔 게시판입니다.</p>
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>게시글 작성 및 보기</h2>
                <p>사용자의 이야기를 적고 볼 수 있는 페이지 입니다.</p>
                <img src="/resource/img/logo.png" alt="설명 이미지">
                <h2>정보 수정</h2>
                <p>비밀번호 변경 및 회원 탈퇴 등 개인정보와 관련된 페이지입니다.</p>
            </div>
        </div>
        <div class="content3">
            <h2>개발자들의 이야기</h2>
            <p>여러분들의 글이 다른 한 사람들의 희망이 될 수 있습니다.</p>
            <p>모두의 이야기를 보고 공감하는 SNS로 받아주시고 힘을 얻어가셨으면 합니다!</p>
            <p class="p_name">개발자 1</p>
        </div>
    </div>

</body>

</html>