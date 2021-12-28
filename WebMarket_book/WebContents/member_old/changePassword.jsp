<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Change Password</title>
</head>
<body>
<jsp:include page="/menu.jsp" />
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">change Password</h1>
    </div>
  </div>
  <div class="container" align="center">
    <div class="col-md-4 col-md-offset-4">
      <h3 class="form-signin-heading">change Password</h3>
      <form class="form-signin" method="post" action="processChangePassword.jsp">
        <div class="form-group">
          <label for="inputUserName" class="sr-only">User Name</label>
          <input type="hidden" class="form-control" placeholder="ID" name="id" value="<%=sessionId %>" required autofocus>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-7">현재 비밀번호</label>
          <input type="password" class="form-control" placeholder="Password" name="currentPassword" required>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-7">새로운 비밀번호</label>
          <input type="password" class="form-control" placeholder="Password" name="newPassword" required>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="col-sm-7">비밀번호 확인</label>
          <input type="password" class="form-control" placeholder="Password" name="newPasswordConfirm" required>
        </div>
        <button class="btn btn btn-lg btn-success btn-block" type="submit">변경하기</button>
        <button class="btn btn btn-lg btn-secondary btn-block" type="reset">초기화</button>
        <button class="btn btn btn-lg btn-primary btn-block" type="button" 
        		onclick="window.close()">닫기</button>
      </form>
    </div>
  </div>
<jsp:include page="/footer.jsp" />
</body>
</html>