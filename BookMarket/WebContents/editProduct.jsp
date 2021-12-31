<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dto.RecentProduct"%><%@page import="dao.ProductRepository"%><%@page import="dto.Product"%><%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
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
<fmt:bundle basename="resourceBundle.message">
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
     <h2><b></b><fmt:message key="editTitle"/></b></h2>
     <hr>
<pre>

</pre>
<div class="container">
	<div class="text-right">
         <a href="?language=ko&edit=update">Korean</a> | <a href="?language=en&edit=update">English</a>
   </div>
   <div class="row" align="center">
    <%@ include file="dbconnBook.jsp" %>
     <%  /* DB로 부터 상품 정보 리스트 얻기 */
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from bookmarketdb.product order by productId";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while(rs.next()){   
      %>
      <div class="col-md-4">
        <img src="/Image/<%=rs.getString("fileName")%>"  style="width:100%">
        <h3><%=rs.getString("pname") %></h3>
        <p><%=rs.getString("description") %></p>
        <p><fmt:formatNumber value='<%=rs.getInt("unitPrice") %>'/>원</p>
        <!-- 수정페이지로 이동, 링크태그 이동은 get방식 이동 -->
        <p><%
        	  if(edit.equals("update")){
            %>
            <a href="./updateProduct.jsp?id=<%=rs.getString("productId") %>"
               class="btn btn-success" role="button"><fmt:message key="buttonEdit"/> &raquo;</a>		  
        </p>
        </div>	
        	<%
        	  } else if(edit.equals("delete")){
            %>
            <a href="#" class="btn btn-danger" role="button" 
               data-toggle="modal" data-target="#myModal"><fmt:message key="buttonDelete"/> &raquo;</a>
             <input type="hidden" id="pid" value="<%=rs.getString("productId")%>">                 
<div class="container">
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">상품 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          해당상품을 삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" id="deleteModal" data-dismiss="modal">아니오</button>
          <button type="button" class="btn btn-outline-danger" onclick='deleteConfirm("<%=rs.getString("productId")%>")'>예</button>
        </div>
        
      </div>
    </div>
  </div>
</div> 
      </div>
       <%
          }/*if else 끝.  */
        }/* while끝. */
         if(rs!=null) rs.close();
         if(pstmt!=null) pstmt.close();
         if(conn!=null) conn.close();
       %>
   </div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
</fmt:bundle>
<pre>

</pre>
<jsp:include page="fo.jsp"/>
</body>
</html>