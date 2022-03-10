<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Moon Write</title>

<link rel="stylesheet" href="resource/css/main.css">
<link rel="stylesheet" href="resource/css/board_view.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="icon" href="resource/img/diary.png">

<!-- 
공감버튼 ajax 코드 입니다. 
js 파일을 따로 빼려고 하니 js 코드 안에서 jstl 이 사용되지 않더라구요 ㅜㅜ
검색해보니 원래 안되는거라고 해서
부득이 jsp 파일 내부로 옮겨 왔습니다.
-->
<script>
	$(function() {

		$(".img-heart")
				.click(
						function() {

							let data = "bno=${requestScope.board.bno}&id=${sessionScope.member.m_id}";

							$
									.ajax({
										type : "get",
										url : "boardLike.do",
										data : data,
										datatype : "json",
										success : function(res) {

											let json = JSON.parse(res);

											if (json.result == 0) {
												alert("공감을 취소했어요.");
												$(".img-heart")
														.attr("src",
																"resource/img/emptyHeart.png");
											} else {
												alert("이 글에 공감합니다!");
												$(".img-heart")
														.attr("src",
																"resource/img/yellowHeart.png");
											}
											$(".blike").text(json.count);
										},
										error : function() {
											alert("통신 실패!!");
										}
									});
						});
		
		$("#chk_delete").click(function(){
	         let check =  confirm("이 글을 정말 삭제할까요?");
	         if(!check) return;
	         
	         let bno = "${requestScope.board.bno}";
	         let page = "${requestScope.page}";
	         
	         location.href = "deleteBoard.do?bno="+bno+"&page="+page;
	      });
		
		$("#btn_add_comment").click(function(){
			var data = "content="+$("#comment_area").val();
			$.ajax({
				url : "addComment.do",
				data : data,
				type : "get",
				dataType : "json",
				contentType: "application/json; charset=utf-8",
				success : function(r){
					var str = "";
					for(int i = 0; i < r.length; i++){
						str += "<p>작성자 : " + r[i].c_writer + "</p><br>";
						str += "<p>" + r[i].content + "</p>";
					}
					$(".text_box").html(str);
				},
				error : function({
					alert("통신 실패");
				})
			});
		});
		
	});
	
	
</script>

</head>

<body>
	<!--
로그인이 되어있지 않으면 login 화면으로 보내는 코드
href 부분을 원하는 페이지로 수정하면 아예 index 페이지로 보낼 수도 있음.
-->
	<c:if test="${sessionScope.member==null}">
		<script type="text/javascript">
			alert("로그인이 필요한 메뉴입니다.");
			location.href = 'loginView.do';
		</script>
	</c:if>

	<!-- 코드 간소화를 위해 menu 영역을 따로 분리해서 include 받았는데,
	문제가 된다면 수정할게요~    -->
	<%@ include file="../include/menuBar.jsp"%>


	<div class="content">
		<!-- 여기 영역이 내용이 나올 영역입니다. 여기서 작업을 해주시면 됩니다. -->
		<div class="content3-title">
			<p>
				Another Moon <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 다른 <span
					class="span-moon">달</span>의 이야기
			</p>
		</div>

		<h2 id="board-title">${board.title}</h2>
		<div class="view-area">
			<div class="board-info">
				<p class="img-p">NO.${board.bno}</p>
				<p class="img-p">글쓴이&nbsp;&nbsp;[${board.m_name}]</p>
				<p class="img-p">작성&nbsp;&nbsp;[${board.regist_day}]</p>
				<div class="img">
					<img alt="조회수" src="resource/img/eye.png" class="img-eye">&nbsp;
					&nbsp;
					<p class="img-p bLike">${board.b_count}</p>
				</div>

				<!-- 최초 글보기 화면에 왔을 때
내가 (로그인한 사용자) 이 게시글에 공감을 누른 상태면 노랑색 하트, 아니면 빈 하트-->
				<div class="img">
					<c:choose>
						<c:when test="${userLikeTrue>0}">
							<img alt="공감" src="resource/img/yellowHeart.png"
								class="img-heart">&nbsp; &nbsp;					
						</c:when>
						<c:otherwise>
							<img alt="공감" src="resource/img/emptyHeart.png" class="img-heart">&nbsp; &nbsp;	
						</c:otherwise>
					</c:choose>

					<p class="img-p blike">${bLike}</p>
				</div>

			</div>
			<textarea rows="10" cols="100" readonly> ${board.content}</textarea>
		</div>

		<div>
			<button>글쓰기</button>
			<button onclick="location.href='updateView.do?bno=${board.bno}'">수정하기</button>
			<button id="chk_delete">삭제하기</button>
		</div>
		
		<c:forEach var="txt" items="${c_list}">
			<div class="text_box">
				<p>작성자 : ${txt.m_name}</p><br>
				<p>${txt.content}</p>
			</div>
		</c:forEach>
		<div>
			<form action="commentAdd.do">
				<textarea rows="0" cols="0" id="comment_area" name="comment_area"></textarea><br>
				<input type="hidden" name="c_bno" value="${board.bno}">
				<button id="btn_add_comment">등록</button>
			</form>
		</div>



	</div>


</body>
</html>















