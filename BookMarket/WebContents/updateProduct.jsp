<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>백두서점</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="resourceBundle.message">
<%@ include file="dbconnBook.jsp"%>
<jsp:include page="me.jsp" />
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
	<h2><b><fmt:message key="updateTitle"/></b></h2>
    <hr>
<pre>

</pre>
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    String sql="";
    
	String productId = request.getParameter("id");

	sql = "select * from product where productId = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
		<div class="text-right">
		 <a href="?language=ko&id=<%=request.getParameter("id")%>">Korean</a>|<a href="?language=en&id=<%=request.getParameter("id")%>">English</a>
         <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
       </div>
			<div class="col-md-5">
				<img src="c:\\Image<%=rs.getString("filename")%>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서 번호</label>
						<div class="col-sm-10">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("productId")%>' disabled>
							<input type="hidden" id="productId" name="productId" value='<%=rs.getString("productId")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서 제목</label>
						<div class="col-sm-10">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("pname")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-10">
							<input type="text" id="pwriter" name="pwriter" class="form-control" value="<%=rs.getString("pwriter")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">판매가</label>
						<div class="col-sm-10">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("unitPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">카테고리</label>
						<div class="col-sm-10">
						  <input type="text" id="category" name="category" class="form-control"  value="<%=rs.getString("category")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-10">
						  <input type="text" id="publisher" name="publisher" class="form-control" value="<%=rs.getString("publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판일자</label>
						<div class="col-sm-10">
							<input type="text" id="publishDate" name="publishDate" class="form-control" value="<%=rs.getString("publishDate")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">한 줄 소개</label>
						<div class="col-sm-10">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-10">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-10">
						    <img style="width: 500px;" id="preview-image" >
							<input type="file" name="productImage" id="productImage" class="form-control" >
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="<fmt:message key="buttonEdit"/>">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-1"></div>
</div>
</div>

<pre>

</pre>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
</fmt:bundle>
<jsp:include page="fo.jsp" />	
</body>
</html>
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("productImage")
inputImage.addEventListener("change", e => {readImage(e.target)})
</script>