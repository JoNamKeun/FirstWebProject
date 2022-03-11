<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<div class="pagging">

			<div class="pagging-search">
				<input type="text" class="keyword" placeholder="제목 또는 내용을 입력하세요.">
				<button class="pagging-btn-search">검색</button>
				<button class="pagging-btn-all" onclick="location.href='content3.do'">전체</button>
			</div>

			<div class="pagging-no">
				<c:if test="${pagging!=null}">

					<c:if test="${pagging.isPriviousPageGroup() }">
						<c:choose>
							<c:when test="${kind != null}">
								<a href="kindList.do?page=${ pagging.getStartPageOfPageGroup()-1}&kind=${kind}"> 이전 &nbsp; </a>
							</c:when>
							<c:when test="${keyword !=null}">
								<a href="boardSearch.do?keyword=${keyword}&page=${ pagging.getStartPageOfPageGroup()-1}"> 이전 &nbsp; </a>
							</c:when>
							<c:otherwise>
								<a href="content3.do?page=${ pagging.getStartPageOfPageGroup()-1}"> 이전 &nbsp; </a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:forEach var="i" begin="${pagging.getStartPageOfPageGroup()}" end="${pagging.getEndPageOfPageGroup() }">

						<c:choose>
							<c:when test="${i==pagging.currentPageNo }">
								<span class="selectPage">${i}&nbsp;</span>
							</c:when>

							<c:otherwise>
								<c:choose>
									<c:when test="${kind != null }">
										<a href="kindList.do?page=${i}&kind=${kind}">${i}</a>&nbsp;
								</c:when>
									<c:when test="${keyword !=null}">
										<a href="boardSearch.do?keyword=${keyword}&page=${i}">${i}</a>&nbsp;
								</c:when>
									<c:otherwise>
										<a href="content3.do?page=${i}">${i}</a>&nbsp;
								</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pagging.isNextPageGroup()}">
						<c:choose>
							<c:when test="${kind != null }">
								<a href="kindList.do?page=${pagging.getEndPageOfPageGroup()+1}&kind=${kind}">&nbsp;다음</a>
							</c:when>
							<c:when test="${keyword != null}">
								<a href="boardSearch.do?keyword=${keyword}&page=${pagging.getEndPageOfPageGroup()+1}">&nbsp;다음</a>
							</c:when>
							<c:otherwise>
								<a href="content3.do?page=${pagging.getEndPageOfPageGroup()+1}">&nbsp;다음</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:if>
			</div>
			<button type="button" class="pagging-btn-write">글쓰기</button>
		</div>