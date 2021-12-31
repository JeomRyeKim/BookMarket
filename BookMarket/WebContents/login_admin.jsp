<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>백두도서</title>  
</head>
<body>
<%@ include file="/me.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>관리자 로그인</b></h2>
  <hr>
<pre>

</pre>
 <div class="container" align="center">
  <div class="col-md-4 col-md-offset-4" >
      <%
      	 String error = request.getParameter("error");
         if(error!=null){
        	 out.print("<div class='alert alert-danger'>");
        	 out.print("아이디와 비밀번호를 확인해주세요");
        	 out.print("</div>");
         }
      %>
      <form class="form-signin" action="j_security_check" method="post" >
          <div class="from-group">
             <label for="inputUserName" class="sr-only">User Name</label>
             <input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
          </div>
          <div class="form-group">
             <label for="inputPassword" class="sr-only">Password</label>
             <input type="password" class="form-control" placeholder="Password" name='j_password' required>
          </div>
          <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
      </form>
   </div>
  </div>
 
</div>
</div>
<div class="col-sm-1"></div>
</div>
<pre>

</pre>
<%@ include file="/fo.jsp" %>
</body>
</html>