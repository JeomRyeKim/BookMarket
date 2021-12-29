<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internal sever error</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
  <div class="container">
    <h2 class="alert alert-danger">서버 내부 오류 발생.</h2>
    <h2 class="alert alert-info">빠른 시간내 조치하겠습니다.</h2>
  </div>
</div>
<div class="container">
  <p><%=request.getRequestURL() %><!-- 요청페이지 경로명 -->
  <p><a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>