<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.RecentProduct"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<title>백두도서</title>
</head>
<body>
<jsp:include page="me.jsp"/>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
	<div class="col-sm-10">
	     <h2><b>${category}</b></h2>  
	     <hr>
	     <pre>
	
		</pre>
	   <div class="row" align="center">   	
	      <c:forEach  var="book" items="${booklist}">
		      <div class="col-lg-3">
<!-- 				<img src="/Image/1-1.jfif"  style="width:100%"> -->
		        <img src="/Image/${book.filename}" style="width:50%">
		        <h3>${book.pname}</h3>
		        <p>${book.description}</p>
		        <p>${book.unitPrice}원</p>
		        <!-- 링크태그 이동은 get방식 이동 -->
		        <p><a href="./product.jsp?id=${book.productId}" 
		            class="btn btn-outline-success" role="button">상품정보 &raquo;</a>
		      </div>
	      </c:forEach>
	   </div>
</div>
<div class="col-sm-1"></div>
</div>
</div> 
<pre>

</pre>
<jsp:include page="fo.jsp"/>
</body>
</html>