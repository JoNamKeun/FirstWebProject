<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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