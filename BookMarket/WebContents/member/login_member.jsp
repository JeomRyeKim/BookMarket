<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>백두도서</title>
</head>
<body>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../me.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="login"><b>로그인</b></h2>
  <hr>
<pre>

</pre>
<div align="center">
     <div class="col-md-4 col-md-offset-4">
          <h3 class="form-signin-heading">로그인 하세요</h3>
          <%
          	 String error = request.getParameter("error");
              if(error!=null){
            	  out.print("<div class='alert alert-danger'>");
            	  out.print("아이디와 비밀번호를 확인해 주세요");
            	  out.print("</div>");
              }
          %> 
          <form class="form-signin" action="processLoginMember.jsp" method="post">
              <div class="form-group">
                  <label for="inputUserName" class="sr-only">아이디</label>
                  <input type="text" class="form-control" placeholder="아이디" name="id" required autofocus>
              </div>
              <div class="form-group">
                 <label class="sr-only" for="inputPassword">비밀번호</label>
                 <input type="password" class="form-control" placeholder="비밀번호" name="password" required>
              </div>
               <button class="btn btn-outline-primary" type="submit">로그인</button>
              <button class="btn btn-outline-secondary" type="button" 
                        onclick="location.href='addMember.jsp'">회원가입</button>  
          </form>
        </div>
</div>                           
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>

</pre>
<%@ include file="../fo.jsp" %>
</body>
</html>