<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dto.RecentProduct"%><%@page import="dao.ProductRepository"%><%@page import="dto.Product"%><%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html><html><head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<title>백두서점</title>
<script>
function deleteConfirm(id){
	if(confirm("해당상품을 삭제합니다!!")){
		location.href="./deleteProduct.jsp?id="+id;
	}else
		return;
}
</script>
<%--
<script>
$(document).ready(function(){
	$('#deleteModal').click(function(){
		alert($('#pid').val());
		alert("클릭");
	});
	
});
</script> --%>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="me.jsp"/>
<div class="container mt-5" id="body">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<div class="container">
   <div class="row"  align="center">
<fmt:bundle basename="resourceBundle.message">
     <h2 class="text-left"><b></b><fmt:message key="deleteTitle"/></b></h2>
     <hr>
<pre>

</pre>
   <div class="text-right">
         <a href="?language=ko&edit=update">Korean</a> | <a href="?language=en&edit=update">English</a>
   		 <a href="logout.jsp" class="btn btn-sm btn-outline-success pull-right">logout</a>
   </div>
<pre>

</pre>
    <%@ include file="dbconnBook.jsp" %>
     <%  /* DB로 부터 상품 정보 리스트 얻기 */
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from bookmarketdb.product order by productId";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while(rs.next()){   
      %>
      <div class="col-lg-3">
        <img src="/Image/<%=rs.getString("fileName")%>"  style="width:100%">
        <h3><%=rs.getString("pname") %></h3>
        <p><%=rs.getString("description") %></p>
        <p>도서 번호 : <%=rs.getString("productId") %></p>
        <p><fmt:formatNumber value='<%=rs.getInt("unitPrice") %>'/>원</p>
        <!-- 수정페이지로 이동, 링크태그 이동은 get방식 이동 -->
        <p><a href="#" class="btn btn-outline-danger" role="button" onclick='deleteConfirm("<%=rs.getString("productId")%>")' 
              ><fmt:message key="buttonDelete"/> &raquo;</a>
            <input type="hidden" id="pid" value="<%=rs.getString("productId")%>">                 
        </p>
        </div>
       <%
        }/* while끝. */
         if(rs!=null) rs.close();
         if(pstmt!=null) pstmt.close();
         if(conn!=null) conn.close();
       %>
</fmt:bundle>
</div>
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